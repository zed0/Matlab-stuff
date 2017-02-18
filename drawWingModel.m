function [] = drawWingModel()
%DRAWWINGMODEL Summary of this function goes here
%   Draw a diagram of the jet and wing from a .obj file
run('symphonySettings');

% hold off;
[V,F] = readObj('Symphony23.obj');
V(:,1:3) = V(:,1:3) .* 1000;
V(:,1) = V(:,1) -2013;
V(:,2) = V(:,2).*-1;
V(:,3) = V(:,3).*-1;
V(:,3) = V(:,3) -2737;

%trisurf(F,V(:,1),V(:,2),V(:,3),'FaceColor',[0.5,0.5,0.5 ],'EdgeColor','none');
trisurf(F,V(:,2),V(:,1)/D,V(:,3),'FaceColor',[0.5,0.5,0.5 ],'EdgeColor','none');
light('Position',[-1.0,-1.0,100.0],'Style','infinite');
lighting phong;
%axis equal;
xl = xlabel('x (mm)');
yl = ylabel('z (D)');
zl = zlabel('y (mm)');
set(gca,'FontSize',12);
set(xl,'FontSize',15);
set(yl,'FontSize',15);
set(zl,'FontSize',15);
axis([-1000 1000 -6 10 -1000 1000]);
set(gca,'XDir','Reverse')
xPlotRange = [-6 10];
%ticks = -6*D:D:xPlotRange(2);
ticks = -6:xPlotRange(2);
set(gca,'YTick',ticks)
set(gca,'YTickLabel',ticks)
hold all;
plot3([-1000 2000],[0 0],[0 0],'Color', 'blue', 'LineWidth', 2);
plot3([0 0],[-1000 1000],[0 0],'Color', 'red', 'LineWidth', 2);
plot3([0 0],[0 0],[-1000 1000],'Color', 'green', 'LineWidth', 2);
alpha(0.8)

end

