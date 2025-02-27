function [accels, impactTimes, minRanges, headings] = animate(simData)

v = VideoWriter('Figures/Anim.mp4', 'MPEG-4');
v.FrameRate = 7.5;
open(v);


    for i = 1:length(simData)
        accels(i) = (i-1)*0.75;
        impactTimes(i) = simData{i}.tImpact;
        minRanges(i) = simData{i}.minR;
        headings(i) = simData{i}.mthATminR;

        figure;
        plot(simData{1, i}.x(:,2), simData{1, i}.x(:,3))
        hold on
        plot(simData{1, i}.x(:,6),simData{1, i}.x(:,7))
        hold on;
        xlabel('X Position [m]')
        ylabel('Y Position [m]')
        title('Flight Profile')
        legend('Target Position', 'Missile Position');

        drawnow;
        frame = getframe(gcf);
        writeVideo(v, frame);
    end 
    close(v);
    close all

end

