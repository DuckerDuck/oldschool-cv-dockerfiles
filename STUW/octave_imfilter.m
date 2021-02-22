%% Wrapper around imfilter (for octave) that allows images with two dimensions

function retval = octave_imfilter(im, f, varargin)

[w, h, c] = size(im);

if c == 2
    tmp = im;
    tmp(:,:,3) = 0;
    extra_dim = imfilter(tmp, f, varargin{:});
    retval = extra_dim(:,:,1:2);
else
    retval = imfilter(im, f, varargin{:});
end

end

