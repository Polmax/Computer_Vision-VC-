function [i_noised,param] = noising(imagem,im_noise)


switch im_noise
    case 'salt_pepper'
        % Salt and pepper
        sp_density = input('Type the filter density (0 to 1): ');
        if sp_density < 0 && sp_density > 1
            fprintf('Error: Input is out of bounds\nTerminating program...\n');
            return;
        end
        i_noised = imnoise(imagem,'salt & pepper',sp_density);
        param = sp_density;
        %imshow(i_noised)
    case 'gaussian'
        % Gaussian
        fprintf('Which parameters do you want to specify?\n');
        g_params = input('(1) None\n(2) Mean\n(3) Mean and variance\n','s');
        param = g_params;
        switch g_params
            case '1'
               i_noised = imnoise(imagem,'gaussian');
               param = g_params;
            case '2'
                g_mean = input('Type the mean of Gaussian noise (0 to 1): ');
                if g_mean < 0 && g_mean > 1
                    fprintf('Error: Input is out of bounds\nTerminating program...\n');
                    return;
                end
                i_noised = imnoise(imagem,'gaussian',g_mean);
                param = "mean_"+g_mean;
            case '3'
                g_mean = input('Type the mean of Gaussian noise (0 to 1): ');
                if g_mean < 0 && g_mean > 1
                    fprintf('Error: Input is out of bounds\nTerminating program...\n');
                    return;
                end
                g_var = input('Type the variance of Gaussian noise (0 to 1): ');
                if g_var < 0 && g_var > 1
                    fprintf('Error: Input is out of bounds\nTerminating program...\n');
                    return;
                end
                i_noised = imnoise(imagem,'gaussian',g_mean,g_var);
                param = "mean_variance_"+g_mean+"_"+g_var;
            otherwise
                fprintf('Not a valid input. Terminating program...\n')
                return
        end
        %imshow(i_noised)
    otherwise
        fprintf('Not a valid input. Terminating program...\n')
        return
end

end