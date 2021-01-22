function [] = problem3()
        
    S = load('chemomexamdata_1.mat');
    x = flipud(S.x(2:end));
    rt = flipud(S.rt(2:end));

    sf = 30; % ѡ��������Ŀ
    [x_denoise] = fftdenoising(x, sf);
%     [x_detrend] = airPLS(x);
    [x_detrend] = detrend(x);
    
    % ��������
    denoise_result = table(rt, x, x_denoise, x_detrend);
    writetable(denoise_result, "denoise_result.csv")
end

