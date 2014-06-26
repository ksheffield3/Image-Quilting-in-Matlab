% **************************************************************************
% (C) 2001 Mitsubishi Electric Research Laboratories, all rights reserved.
% This program in source or executable form may be used for research only.
% Commercial use of this program in source or executable form is strictly
% prohibited. If copied, this copyright notice must appear with the
% program.
% **************************************************************************


echo on

% synthesize things
%tile = im2double(imread('btile.tif'));
%out = synthfun(tile,30,1);
%pause;

%bricks = im2double(imread('col-br.tif'));
%out = synthfun(bricks,40,1);
%pause;


% Bill in rice
bill = im2double(imresize(imread('butterDest2.jpg'),2,'bilinear'));

rice = im2double(imread('rice.jpg'));
%orig
out = simplexferfun(rice,bill,20,3);
%out = simplexferfun(rice,bill,40,2);
%pause;

% Potato in orange
%potato = im2double(imread('newpotato.jpg'));
%orange = im2double(imread('neworange.jpg'));
%potato_mask = rgb2gray(potato)<0.05;
%orange_mask = rgb2gray(orange)<0.1;
%orig
%out = simplexferfun(orange,potato,30,3,orange_mask,potato_mask);


echo off

