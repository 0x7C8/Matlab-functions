function [] = nicegif(x,y,n,delay,filename)
% Function to make 2D gifs
% y is function of x and n, where n varies each frame

f = figure;
axis tight manual % this ensures that getframe() returns a consistent size
for i = 1:numel(n)
    plot(x,y(x,n(i)))
    drawnow
    % Capture the plot as an image
    frame = getframe(f);
    [X,map] = rgb2ind(frame2im(frame),256);
    % Write to the GIF File
    if i == 1
        imwrite(X,map,filename,'gif', 'Loopcount',inf, 'DelayTime',delay);
    else
        imwrite(X,map,filename,'gif','WriteMode','append', 'DelayTime',delay);
    end
end
end