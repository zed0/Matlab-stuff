## Requirements

Some Matlab libraries are needed for some of the projects:
* pivmat: available at: http://www.fast.u-psud.fr/pivmat/
* readimx:
	* avaliable for Windows 32-bit at: http://www.fast.u-psud.fr/pivmat/readimx4matlab_v1.5R1_2009.zip
	* available for Windows 64-bit at: http://www.fast.u-psud.fr/pivmat/readimx4matlab_v1.5R1_2009_64.zip
* saveppt2: available at: https://github.com/jedediahfrey/Jedediah-Frey-s-MATLABCentral-Projects/tree/master/saveppt2

Some functions also require Powerpoint to be installed on the machine.

## Usage

Before using make sure that the setting at the top of the file symphonySettings.m is correct.  This is important as it tells the functions things such as which D value they should use and what the physical offsets are.

### Basics

Load an .im7 file:
```matlab
>> v = im7Load('17May2C-TP4-5Dy322-3c6mus2c6mus0.8msX635mm/B00004*.im7')
v = 

                 x: [1x518 double]
                 y: [1x518 double]
                 w: [518x518 double]
             unitx: 'mm'
             unity: 'mm'
             namex: 'z'
             namey: 'x'
             unitw: 'm/s'
             namew: 'Length of Avg V'
    pivmat_version: '2.10'
             ysign: 'Y axis upward'
        Attributes: [1x668 char]
              name: 'B00004_abs(Avg V).im7'
           setname: '17May2C-TP4-5Dy322-3c6mus2c6mus0.8msX635mm'
           history: {3x1 cell}
            source: 'Davis 70'
             index: 4
```

The resulting structure of the file is the same as pivMat uses, briefly the attributes are as follows:
* x: x positions of the data
* y: y positions of the data
* w: data corresponding to the xy grid defined above
* unitx: units for the x axis
* unity: units for the y axis
* namex: name of the x axis
* namey: name of the y axis
* unitw: units of the data
* namew: name of the w axis
* pivmat_version: version number of pivMat that was used to load the im7 file
* ysign: direction of the yaxis (this is left over from pivMat loading the file and should not be used)
* Attributes: attributes associated with the file such as scale and offsets.  This should not be accessed directly but using the getScale function (see below)
* name: filename
* setname: name of the set (this is found by pivMat and is the folder name so keep the folder names in this format)
* history: contains the history of processes that pivMat has performed on the file
* source: name of the software used to generate the im7 file
* index: file index, this corresponds to the number of the file
	* e.g. B00004_abs(Avg V).im7 would be index 4
	* these indexes are used a lot, look at the bottom of [symphonySettings.m](https://github.com/zed0/Matlab-stuff/blob/master/symphonySettings.m) to find out which indexes correspond to the value you want.

Now the file is loaded you can plot it with the following:
```matlab
v = im7Load(filename);
showf(v);
setPlotFormatting(v);
```
showf() is pivMat's inbuilt show function, setPlotFormatting is ours and standardises how the plot is shown.

### Crossplots

There are 2 crossplotting functions:
* crossplot()
* spatialCrossplot()

These do as the names suggest and each take the same input arguments:
```matlab
index = 4; %index of the property we want. (4 corresponds with Velocity on 3C plots)
%get all the files and folders ending in 'us' in the current directory:
folderList=dir('*us');
folders={folderList.name}.';
%create a crossplot from them:
figure();
crossplot(folders, index);
%create a spatial crossplot from them:
figure();
spatialCrossplot(folders, index);
```

### Powerpoint creation

The basic function of Powerpoint file creation is the figs2ppt() function which can be called as follows:
```matlab
%quickly produce several sample figures and plot a line to them:
for i=1:20
	figs[i] = figure(i);
	plot(1);
end
%create a powerpoint file from them:
figs2ppt('output.ppt', figs, [3 2]);
```
The above will create a powerpoint file called output.ppt with the 20 dummy figures plotted to it in a 3x2 grid.
You may also find it helpful to call the following set command to prevent the figures popping up on the screen while plotting to a Powerpoint file:
```matlab
		a = figure();
		set(a,'visible','off');
```

As doing the above every time can get a bit cumbersome there are some shortcut functions:
* im72ppt(): creates a Powerpoint file from a folder of im7files:
```matlab
foldername = '29Sept3C-TP7-1.5Dy212-3c12mus';
im72ppt(foldername);
```

* pptPropertyComparison(): creates a Powerpoint file from a list of folders comparing a single value:
```matlab
outputfile = 'TurbKE_4_5_6'; %output filename
index = 10; %index for Turbulent Kinetic Energy
folders={ %list of folders to use
	'Optitheck-TP4';
	'Optitheck-TP5';
	'Optitheck-TP6';
}
%create a Powerpoint file:
pptPropertyComparison(folders, outputfile, index);
```

### Helper scripts

These are various scripts that are helpful to have but you are unlikely to need.
* Renamer script:
Renames folders so that they adhere to the naming standard.  This works by taking the values by several known incorrect naming schemes and moving them to the correct one.
```matlab
folderList=dir('*');
folders={folderList.name}.';
rename(folders);
```
* Reference plot:
Creates a 3D reference plot including a model of the wing and jet.
```matlab
drawWingModel();
```

* 3d plot:
Creates a 3D reference plot including a model of the wing and jet.
```matlab
folderList = dir('*us');
folders = {folderList.name}.'
im73DPlot(folders);
drawWingModel();
```

* Compare 2 plots of different sizes:
Takes the file names for 2 plots and compares them.
```matlab
%%random bits for Peter
% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = 'H:\23rdAugust\SilTP10-3D-16GPU-fullmask\B00004*.im7';
file2 = 'H:\23rdAugust\SilTP10-3D-16normal-fullmask\B00004*.im7';
%index to compare (this should match the im7 number above):
index = 4;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'absAvgVDiff8','fig');
saveas(t,'absAvgVDiff8','tiff');
%close the figure:
close all;
```