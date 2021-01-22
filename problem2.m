function [] = problem2()

    S = load('chemomexamdata_1.mat');
    x = flipud(S.x(2:end));

    nRow = size(x,1);
    all_exch_days = 1:nRow;

    figure(1),clf('reset');
    plot(all_exch_days, x);

    sf = 30;    % 选择保留的数目
    [x_new] = fftdenoising(x, sf);

    figure(1),clf('reset');
    subplot(211)
    plot(all_exch_days, x);

    subplot(212)
    plot(all_exch_days, x_new);
  
end
  
  