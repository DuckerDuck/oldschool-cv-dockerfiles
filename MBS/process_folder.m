input_path = './input/';
output_path = './output/';

% MB
paramMB = getParam();
paramMB.use_backgroundness = false;
% MB+
paramMBplus = getParam();
paramMBplus.verbose = true; % to show run time for each step 

% Geodesic
paramGeo = getParam();
paramGeo.use_backgroundness = false;
paramGeo.use_geodesic = true;
paramMBD.use_backgroudness = true;  

images = dir([input_path '*.jpg']);
fprintf('Number of images found: %d \n', length(images));

for i=1:length(images)
    name = images(i).name;
    name = name(1:end-4);
    fprintf('Converting %s: ', name);

    full_path = strcat(input_path, name, '.jpg');
    I = imread(full_path);

    [pMap1, dMap1] = doMBS(I, paramMB);
    [pMapG, dMapG] = doMBS(I, paramGeo);
    [pMap2] = doMBS(I, paramMBplus); 
    
    imwrite(pMap1, [output_path name '_MB.png']);
    imwrite(pMapG, [output_path name '_Geo.png']);
    imwrite(pMap2, [output_path name '_MBplus.png']);

    fprintf('Done\n');

end

