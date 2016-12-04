% findsdru
% probesdru
rx = comm.SDRuReceiver('Platform','B210','SerialNum','30C62D1');
rx.Gain = 64;
rx.CenterFrequency = 137.9e6;
rx_log = dsp.SignalSink;

for counter = 1:20
data = rx;
rx_log;
end
% Array for


dlmwrite('data.csv', [], 'delimiter', ',');
while 1
    y = step(rx);
    dlmwrite('data.csv', y, 'delimiter', ',', '-append');
end
