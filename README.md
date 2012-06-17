## Requirements

Some Matlab libraries are needed for some of the projects:
pivmat:
	available at: http://www.fast.u-psud.fr/pivmat/
readimx:
	avaliable for Windows 32-bit at: http://www.fast.u-psud.fr/pivmat/readimx4matlab_v1.5R1_2009.zip
	available for Windows 64-bit at: http://www.fast.u-psud.fr/pivmat/readimx4matlab_v1.5R1_2009_64.zip
saveppt2:
	available at: https://github.com/jedediahfrey/Jedediah-Frey-s-MATLABCentral-Projects/tree/master/saveppt2

Some functions also require Powerpoint to be installed on the machine.

## Usage

Before using make sure that the setting at the top of the file symphonySettings.m is correct.
This is important as it tells the functions things such as which D value they should use and what the physical offsets are.

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
* index: file index, this corresponds to the number of the file, e.g. B00004_abs(Avg V).im7 would be index 4

Now the file is loaded you can plot it with the following:
```matlab
showf(v);
setPlotFormatting(v);
```
showf() is pivMat's inbuilt show function, setPlotFormatting is ours and standardises how the plot is shown.
