%% Auto stitching via cross correlation works
% Adjusting the axes to get a mm scale on this new image is harder.
% 
% Auto stitching is currently done by taking the middle third of the target image (in each dimension) and cross correlating that with the full area of the canvas.  This ensures that the area being correlated contains data rather than non-representative areas.
% The middle third in these cases only shows one of the two sides of the jet stream.  This means that strong correlations happen at 2 points instead of 3.
% 
% Using current code the following will use autocorrelation to stitch an image together:

u = im7Load('OptTP4-2C-5Dy322x254-8normalmasked/TimeMeanQF_Scalar/B00004_abs(Avg V).im7');
v = im7Load('OptTP4-2C-5Dy322x381-8normalmasked/TimeMeanQF_Scalar/B00004_abs(Avg V).im7');
w = im7Load('OptTP4-2C-5Dy322x508-8normalmasked/TimeMeanQF_Scalar/B00004_abs(Avg V).im7');
[a b c d]= autostitch(u.w, v.w);
a(isnan(a))=0;
e = autostitch(a, w.w);
e = trimImage(e);
scaleX = getScale(v.Attributes, 'X');
scaleY = getScale(v.Attributes, 'Y');
x = 0:scaleX:size(e,1);
y = 0:scaleY:size(e,2);
imagesc(x,y,e);

%% The attached image shows the result.
% Correlation peak of 0.9958 for the Velocity.

u = im7Load('OptTP4-2C-5Dy322x254-8normalmasked/TimeMeanQF_Scalar/B00010_Turb kinetic E.im7');
v = im7Load('OptTP4-2C-5Dy322x381-8normalmasked/TimeMeanQF_Scalar/B00010_Turb kinetic E.im7');
w = im7Load('OptTP4-2C-5Dy322x508-8normalmasked/TimeMeanQF_Scalar/B00010_Turb kinetic E.im7');
[a b c d]= autostitch(u.w, v.w);
a(isnan(a))=0;
e = autostitch(a, w.w);
e = trimImage(e);
scaleX = getScale(v.Attributes, 'X');
scaleY = getScale(v.Attributes, 'Y');
x = 0:scaleX:size(e,1);
y = 0:scaleY:size(e,2);
imagesc(x,y,e);

%% The attached image shows the result.
% Correlation peak of 0.9851 for the TKE.

u = im7Load('OptTP4-2C-5Dy322x254-8normalmasked/TimeMeanQF_Scalar/B00009_abs(RMS V).im7');
v = im7Load('OptTP4-2C-5Dy322x381-8normalmasked/TimeMeanQF_Scalar/B00009_abs(RMS V).im7');
w = im7Load('OptTP4-2C-5Dy322x508-8normalmasked/TimeMeanQF_Scalar/B00009_abs(RMS V).im7');
[a b c d]= autostitch(u.w, v.w);
a(isnan(a))=0;
e = autostitch(a, w.w);
e = trimImage(e);
scaleX = getScale(v.Attributes, 'X');
scaleY = getScale(v.Attributes, 'Y');
x = 0:scaleX:size(e,1);
y = 0:scaleY:size(e,2);
imagesc(x,y,e);

%% The attached image shows the result.
% Correlation peak of 0.9792 for the RMS.

% Looking at correlation using the example code:
template = .2*ones(400); % Make light gray plus on dark gray background
template(100:150,1:400) = .6;   
template(250:300,1:400) = .6;   
BW = template > 0.5;      % Make white plus on black background
figure, imshow(BW), figure, imshow(template)
% Make new image that offsets the template
offsetTemplate = .2*ones(400); 
offset = [60 80];  % Shift by 3 rows, 5 columns
offsetTemplate( (1:size(template,1))+offset(1),...
                (1:size(template,2))+offset(2) ) = template;
figure, imshow(offsetTemplate)
cc = normxcorr2(BW,offsetTemplate);
figure, imshow(cc)



%% Comparing different correlation areas:

u = im7Load('OptTP4-2C-5Dy322x254-8normalmasked/TimeMeanQF_Scalar/B00004_abs(Avg V).im7');
v = im7Load('OptTP4-2C-5Dy322x381-8normalmasked/TimeMeanQF_Scalar/B00004_abs(Avg V).im7');
window ={
	[1/3,2/3;1/3,2/3],
	[1/5,3.5/5;2/5,3/5],
	[1/3,2/3;2/5,3/5],
	[1/5,3.5/5;12/25,13/25],
};
scaleX = getScale(u.Attributes, 'X');
scaleY = getScale(u.Attributes, 'Y');
for i=1:size(window,1)
	[a b c d e]= autostitch(u.w, v.w,window{i}(1,:),window{i}(2,:));
	a=trimImage(a);
	figure;
	subplot(4,2,[1,2]);
    imagesc(x,y,u.w);
	subplot(4,2,[3,4]);
    imagesc(x,y,v.w);
	subplot(4,2,[5,6]);
	x = 0:scaleX:size(a,1)*scaleX;
	y = 0:scaleY:size(a,2)*scaleY;
	imagesc(x,y,a);
	title(strcat(...
        rats(window{i}(1,1)),'-',...
        rats(window{i}(1,2)),',',...
        rats(window{i}(2,1)),'-',...
        rats(window{i}(2,2)),...
        ', correlation: ',num2str(max(max(d)))...
    ));
	subplot(4,2,7);
	imagesc(e);
	subplot(4,2,8);
	imagesc(d);
end


% Correlation can be found reasonably easily however this is in terms of pixels.  Finding it in terms of mm may seem as easy as multiplying by the scaling factor, and this does work for working out seperation of the two images.  For adding axes to the images however this is rather more complicated.