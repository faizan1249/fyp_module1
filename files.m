clear;
clear all;
clc;
pkg load image;
##! 'py C:/Users/Aimen/AppData/Local/Programs/Python/Python39/python.exe d:/FYP/Code/cropped.py';

function retval=count_dots (filename,type,v)
  val = v;
  path=strcat('images/',type,'/',filename);
  I = imread(path);
  gray = rgb2gray(I);
  binaryImage = gray > val;
  [labeledImage, warp] = bwlabeln(binaryImage);
  retval= warp;
endfunction

function retval= process(type,v)
  path=strcat('images/',type,'/');
  myFolder = path;
  if ~isfolder(myFolder)
    errorMessage = sprintf('Errxor: The following folder does not exist:\n%s', myFolder);
    uiwait(warndlg(errorMessage));
    return;
  end
  filePattern = fullfile(myFolder, '*.jpg');
  jpegFiles = dir(filePattern);
  warp=0;
  for k = 1:length(jpegFiles)
    filename = jpegFiles(k).name;
    value=count_dots(filename,type,v);
    warp=warp+value;
  end
  retval=ceil(warp/length(jpegFiles));
endfunction

warp=process('width',123)
weft=process('height',122)

disp(warp+weft);