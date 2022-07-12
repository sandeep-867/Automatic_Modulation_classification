clear
clc
%% init
j = sqrt(-1);
NTrain = 700;
EsNoLow = -5;
EsNoHigh = 30;
range = EsNoHigh - EsNoLow;
L = 100;
NClass = 6;
train_data = zeros(NClass * NTrain, L);
train_label = zeros(NClass * NTrain, 1);
%% get train data


% psk4
disp('psk4 begin');
signal_data = zeros(NTrain, L);
mod = comm.PSKModulator('ModulationOrder',4,'PhaseOffset',0);
x = constellation(mod);
xN = length(x);
for row = 1:NTrain
    EsNo = (EsNoHigh - EsNoLow)*rand + EsNoLow;
    P = 10^(EsNo/10);
    for col = 1:L
        s = x(unidrnd(xN));
        signal_data(row, col) = sqrt(P)*s + sqrt(1/2)*(randn+j*randn);
    end
end
for row = 1:NTrain
    train_data(row  , :) = signal_data(row, :);
    train_label(row , 1) = 0;
end



% psk8
disp('psk8 begin');
signal_data = zeros(NTrain, L);
mod = comm.PSKModulator('ModulationOrder',8,'PhaseOffset',0);
x = constellation(mod);
xN = length(x);
for row = 1:NTrain
    EsNo = (EsNoHigh - EsNoLow)*rand + EsNoLow;
    P = 10^(EsNo/10);
    for col = 1:L
        s = x(unidrnd(xN));
        signal_data(row, col) = sqrt(P)*s + sqrt(1/2)*(randn+j*randn);
    end
end
for row = 1:NTrain
    train_data(row + 1*NTrain, :) = signal_data(row, :);
    train_label(row + 1*NTrain, 1) = 1;
end

% qam8
disp('qam8 begin');
signal_data = zeros(NTrain, L);
mod = comm.RectangularQAMModulator('ModulationOrder',8,...
        'NormalizationMethod','Average power','AveragePower',1);
x = constellation(mod);
xN = length(x);
for row = 1:NTrain
    EsNo = (EsNoHigh - EsNoLow)*rand + EsNoLow;
    P = 10^(EsNo/10);
    for col = 1:L
        s = x(unidrnd(xN));
        signal_data(row, col) = sqrt(P)*s + sqrt(1/2)*(randn+j*randn);
    end
end
for row = 1:NTrain
    train_data(row + 2*NTrain, :) = signal_data(row, :);
    train_label(row + 2*NTrain, 1) = 2;
end

% qam16
disp('qam16 begin');
signal_data = zeros(NTrain, L);
mod = comm.RectangularQAMModulator('ModulationOrder',16,...
        'NormalizationMethod','Average power','AveragePower',1);
x = constellation(mod);
xN = length(x);
for row = 1:NTrain
    EsNo = (EsNoHigh - EsNoLow)*rand + EsNoLow;
    P = 10^(EsNo/10);
    for col = 1:L
        s = x(unidrnd(xN));
        signal_data(row, col) = sqrt(P)*s + sqrt(1/2)*(randn+j*randn);
    end
end
for row = 1:NTrain
    train_data(row + 3*NTrain, :) = signal_data(row, :);
    train_label(row + 3*NTrain, 1) = 3;
end

% qam32
disp('qam32 begin');
signal_data = zeros(NTrain, L);
mod = comm.RectangularQAMModulator('ModulationOrder',32,...
        'NormalizationMethod','Average power','AveragePower',1);
x = constellation(mod);
xN = length(x);
for row = 1:NTrain
    EsNo = (EsNoHigh - EsNoLow)*rand + EsNoLow;
    P = 10^(EsNo/10);
    for col = 1:L
        s = x(unidrnd(xN));
        signal_data(row, col) = sqrt(P)*s + sqrt(1/2)*(randn+j*randn);
        %noise_data(row, col) = sqrt(1/2)*(randn+j*randn);
    end
end
for row = 1:NTrain
    train_data(row + 4*NTrain, :) = signal_data(row, :);
    train_label(row + 4*NTrain, 1) = 4;
end


% qam64
disp('qam64 begin');
signal_data = zeros(NTrain, L);
mod = comm.RectangularQAMModulator('ModulationOrder',64,...
        'NormalizationMethod','Average power','AveragePower',1);
x = constellation(mod);
xN = length(x);
for row = 1:NTrain
    EsNo = (EsNoHigh - EsNoLow)*rand + EsNoLow;
    P = 10^(EsNo/10);
    for col = 1:L
        s = x(unidrnd(xN));
        signal_data(row, col) = sqrt(P)*s + sqrt(1/2)*(randn+j*randn);
    end
end
for row = 1:NTrain
    train_data(row + 5*NTrain, :) = signal_data(row, :);
    train_label(row + 5*NTrain, 1) = 5;
end

save('./train_data.mat', 'train_data', '-mat');
%save('./train_label.mat', 'train_label', '-mat');
