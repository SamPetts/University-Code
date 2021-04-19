clear 
format shortG

info_fixed1=dicominfo('14_02_07-15_44_48-STD-SPECIALS_POLYTRAUM.CT.PRIVATE_MSC_LABS_(ADULT).0003.0019.2014.02.07.16.37.27.562500.40137226.IMA');
width=info_fixed1.Width; height=info_fixed1.Height; bitdepth=12; slicethickness=info_fixed1.SliceThickness;
PixelSpacing=0.8828;

image_list= dir('*.IMA');
i=numel(image_list);
A=zeros([width,height,i]);

for j=1:i
    A(:,:,j)=dicomread(image_list(j).name);
end
figure, histogram(A), title('A histogram showing the distribution of the none normalised DICOM data array'), xlabel('Array values'), ylabel('Frequency')

MaxVal= (2.^bitdepth)-1;

for j=1:i
    NormA(:,:,j)=A(:,:,j)./MaxVal; %Normalising 'A'
end 
figure, histogram(NormA), title('A histogram showing the distribution of the normalised DICOM data array'),xlabel('Array values'), ylabel('Frequency');



ReSumWidth=reshape((sum(NormA,[1])),[height,i]);
figure,imshow(ReSumWidth,[] ,'XData',[0 (slicethickness*i)],'YData',[0 (width*0.8828)]), title('Coronal slice of the CeIT phantom')

ReSumHeight=reshape((sum(NormA,[2])),[width,i]);
figure, imshow(ReSumHeight,[] ,'XData',[0 (slicethickness*i)],'YData',[0 (height*0.8828)]), title('Sagittal slice of the CeIT phantom')

ReSumI=reshape((sum(NormA,[3])),[width,height]); 
figure, imshow(ReSumI,[]), title('Transverse slice of the CeIT phantom');


%% Radon Function %%
R=radon(ReSumI);
figure, imshow(R,[]), title('Sinogram - Radon transformation for the transverse slice')
colormap(hot), colorbar
axis image;
 xlabel('\theta (degrees)'), ylabel('x')

RArray=zeros((size(radon(ReSumI),1)),(size(radon(ReSumI),2)),i); 

for j=1:i
    RArray(:,:,j)=radon(NormA(:,:,j),1:(size(radon(ReSumI),2)));
end

RArray2=RArray(:,1,:);
RR=reshape(RArray2,[729,i]);
figure, imshow(RR,[],'XData',[0 (slicethickness*i)],'YData',[0 (RR(1)*PixelSpacing)]), title('Radon transformation of 1 degree')


RArray3=RArray(:,90,:);
RR2=reshape(RArray3,[729,i]);
figure, imshow(RR2,[],'XData',[0 (slicethickness*i)],'YData',[0 (RR2(1)*PixelSpacing)]), title('Radon transformation of 90 degrees')

RArray4=RArray(:,180,:);
RR3=reshape(RArray4,[729,i]);
figure, imshow(RR3,[],'XData',[0 (slicethickness*i)],'YData',[0 (RR2(1)*PixelSpacing)]), title('Radon transformation of 180 degrees')

%Compare previous 3 images with first 3

%% FanBeam Function%%
DStD=info_fixed1.DistanceSourceToDetector; DisInPix=round(0.5*DStD*PixelSpacing);


FanBeam1=fanbeam(ReSumI,DisInPix,'FanSensorGeometry','line');
figure, imshow(FanBeam1,[]), title('Sinogram - Fan beam transformation for the transverse slice')
colormap(hot), colorbar
axis image;
 xlabel('\theta (degrees)'), ylabel('x')

SFB=size(FanBeam1);

FArray=zeros(SFB(1),SFB(2),i); 

for j=1:i
    FArray(:,:,j)=fanbeam(NormA(:,:,j),DisInPix,'FanSensorGeometry','line');
end
FA1=FArray(:,1,:);
RFF = reshape(FA1,[SFB(1),i]);
figure, imshow(RFF,[],'XData',[0 (slicethickness*i)],'YData',[0 (RFF(1)*PixelSpacing)]), title('Fan beam transformation of 1 degrees')

FA2=FArray(:,90,:);
RFF1=reshape(FA2,[SFB(1),i]);
figure, imshow(RFF1,[],'XData',[0 (slicethickness*i)],'YData',[0 (RFF1(1)*PixelSpacing)]), title('Fan beam transformation of 90 degrees')

FA3=FArray(:,180,:);
RFF2=reshape(FA3,[SFB(1),i]);
figure, imshow(RFF2,[],'XData',[0 (slicethickness*i)],'YData',[0 (RFF2(1)*PixelSpacing)]), title('Fan beam transformation of 180 degrees')

%% Image Reconstruction %%
NFanBeam=(0.9+rand([(size(FanBeam1,1)),size(FanBeam1,2)])*0.2).*FanBeam1;
IFanBeam=ifanbeam(NFanBeam,DisInPix,'FanSensorGeometry','line');

figure, imshow(IFanBeam,[]), title('Addition of noise to the projection')
colormap(gray),colorbar

R=radon(ReSumI);

IR=iradon(R,0:179);
figure, imshow(IR,[]), title('Filtered backprojection');
colormap(gray),colorbar

NoFIR=iradon(R,0:179,'linear','none');
figure, imshow(NoFIR,[]), title('Unfiltered backprojection');
colormap(gray),colorbar

