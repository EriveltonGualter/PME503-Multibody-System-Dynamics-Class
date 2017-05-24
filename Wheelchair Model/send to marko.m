% Erivelton %

% gif utilities
set(gcf,'color','w');   % set figure background to white
frame = getframe(1);    % 
im = frame2im(frame);   % Frame to Image
[imind,cm] = rgb2ind(im,256);  % Convert RGB image to indexed image
outfile = 'simulation.gif';    % GIF is he BEST

% On the first loop, create the file. In subsequent loops, append.
if first_frame
    imwrite(imind,cm,outfile,'gif','DelayTime',0,'loopcount',inf);
    first_frame = false;
else
    imwrite(imind,cm,outfile,'gif','DelayTime',0,'writemode','append');
end