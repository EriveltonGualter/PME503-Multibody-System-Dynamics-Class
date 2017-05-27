% BASTA COLOCAR ESTE TRECHO DO CO'DIGO DENTRO DO LOOP % 

% gif utilities
set(gcf,'color','w');   % set figure background to white
frame = getframe(1);    % get desired frame
im = frame2im(frame);   % Transform frame to image
[imind,cm] = rgb2ind(im,256);  % Convert RGB image to indexed image
outfile = 'simulation.gif';    % GIF is the BEST. However, you can modify the extensions.

% On the first loop, create the file. In subsequent loops, append.
if first_frame
    imwrite(imind,cm,outfile,'gif','DelayTime',0,'loopcount',inf); 
    first_frame = false;
else
    imwrite(imind,cm,outfile,'gif','DelayTime',0,'writemode','append');
end