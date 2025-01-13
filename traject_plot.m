%% INFO
%%%%%%%%%%%%%% Author:  Mohamed Eid %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Version: 1.0         %%%%%%%%%%%%%%%%

axis([-25 15 -15 20 0 5])
grid on
k = plot3(Data.X.Data(1),Data.Y.Data(1),Data.Z.Data(1),'r:','LineWidth',2);
hold on

for ii = 51:50:length(Data.X.Data)
    delete(k)
    % Draw path
    axis([-20 20 -20 20 0 45])
    grid on
    k = plot3(Data.X.Data(1:ii),Data.Y.Data(1:ii),Data.Z.Data(1:ii),'r:','LineWidth',2);
    hold on
    drawnow
    pause(0.005)
end