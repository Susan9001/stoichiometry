function [] = problem4()
    S = load('chemomexamdata_2.mat');
    X = S.X;
    [C, S, res] = iskss(X);

    csvwrite("C.csv", C);
    csvwrite("S.csv", S);
end