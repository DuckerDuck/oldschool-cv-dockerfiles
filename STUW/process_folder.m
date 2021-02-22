addpath(genpath('./static_smap/'));
addpath(genpath('./motion_smap/'));

input_path = './input/';
output_path = './output/';

images = dir([input_path '*.jpg']);
fprintf('Number of images found: %d \n', length(images));

for i=2:length(images)
    name_first = images(i - 1).name;
    name_first = name_first(1:end-4);
    name_second = images(i).name;
    name_second = name_second(1:end-4);
    fprintf('Converting %s -> %s: ', name_first, name_second);

    full_path_first = strcat(input_path, name_first, '.jpg');
    full_path_second = strcat(input_path, name_second, '.jpg');
    image_first = imread(full_path_first);
    image_second = imread(full_path_second);
    image_original = rgb2gray(image_second);

    m_smap = Motion_Smap(image_first, image_second);
    s_smap = Static_Smap(image_second);
    s_weighting_map = addition_uncertainty_weighting(s_smap);
    
    global_motion = 0;
    m_weighting_map = motion_uncertianty_weighting(image_original, global_motion, m_smap);

    %spatio_temporal_smap = s_smap.*m_weighting_map + m_smap.*s_weighting_map;
    %spatio_temporal_smap = mat2gray(spatio_temporal_smap);
    %spatio_temporal_smap = norm_operation(spatio_temporal_smap);

    spatio_temporal_smap_enhance = s_smap.*m_weighting_map + m_smap.*s_weighting_map + s_smap.*m_smap;
    spatio_temporal_smap_enhance = mat2gray(spatio_temporal_smap_enhance);
    spatio_temporal_smap_enhance = norm_operation(spatio_temporal_smap_enhance);

    imwrite(spatio_temporal_smap_enhance, [output_path name_first '.png']);

    fprintf('Done\n');

end

