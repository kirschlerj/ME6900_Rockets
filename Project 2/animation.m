close all
rocketPos = out.pos;
time = rocketPos(:,1);
dt = diff(time);
altitude = rocketPos(:,3) * -1;
horDist = rocketPos(:,2);

figure
videoFile = VideoWriter('Figures/rktAnim.avi');
videoFile.FrameRate = 9.7;
open(videoFile);

for i =1:length(time)-1
   
    title('Rocket Launch Position Animation', FontWeight='bold');
    xlabel('Horizontal Position (m)', FontWeight='bold');
    ylabel('Altitude (m)', FontWeight='bold');
    axis equal
    xlim([min(horDist)-1000, 400000]);
    ylim([min(altitude), max(altitude)])
    plot(horDist(1:i+1), altitude(1:i+1), 'b--', 'LineWidth', 2)
    hold on
    plot(horDist(1:i+1), altitude(1:i+1), 'ro', 'MarkerSize', 3.5, 'MarkerFaceColor', 'r')
    pause(dt(i)/18);
    frame = getframe(gcf);
    writeVideo(videoFile, frame);
    
end 

close(videoFile);