clear
format short g

addpath(genpath( 'C:\Users\sampe\Documents\University\Masters\2nd Semester\MATLAB\pmpm11\DICOM RT'));

%% CT Scan
I ='CT1.3.6.1.4.1.2452.6.2940381419.1112065053.2033732512.1877029011.dcm';
B = dicomread(I);
figure()
imshow(B,[]);
title('A Single transverse CT slice of the phantom')
xlabel('X Plane')
ylabel('Y Plane')
%% Section1
%For Organ Structues
Structuresinfo = dicominfo('RS1.3.6.1.4.1.2452.6.2566414897.1130985339.2662755763.1068286568.dcm');
Structures = Structuresinfo.StructureSetROISequence;
ROIExternal = Structuresinfo.StructureSetROISequence.Item_1.ROIName; %change item no. for different roi %ROI Structures

% For Beam Set-ups
Prescription = dicominfo('RP1.3.6.1.4.1.2452.6.3837944452.1117336039.689484688.2776557279.dcm');
Beams = Prescription.BeamSequence; %Beam Setup
IsocentrePositionBeam = Beams.Item_1.ControlPointSequence.Item_1; %mm %35 for squeezing


DoseInfo1 = dicomread('RD1.3.6.1.4.1.2452.6.1223932967.1157921013.424013484.2200659475.dcm');
DoseInfo2 = dicominfo('RD1.3.6.1.4.1.2452.6.1223932967.1157921013.424013484.2200659475.dcm');

%Converting the dose distrbutions so can use for imshow/contour
A = dir('*.dcm');
a=length(A);
DoseArray = zeros(68,122,99,a);
% i=1:a;
% ii=4;
%iii=setdiff(i,ii);

ii=[1 2 3 5 6 7];
%%%%%%%%%%WHEN RUNNING ENSURE IN MULTIBLOCK PB FILE%%%%%%%%%%
for i=ii
    DoseArray(:,:,:,i) = dicomread(A(i).name);
end

q=DoseArray(:,:,:,1);
w=DoseArray(:,:,:,2);
e=DoseArray(:,:,:,3);
r=DoseArray(:,:,:,4);
t=DoseArray(:,:,:,5);
y=DoseArray(:,:,:,6);
u=DoseArray(:,:,:,7);

sq=squeeze(q);
ssq=squeeze(sq(:,:,35));
sw=squeeze(w);
ssw=squeeze(sw(:,:,35));
se=squeeze(e);
sse=squeeze(se(:,:,35));
% sr=squeeze(DoseArray(:,:,:,4));
% ssr=squeeze(sr(:,:,35));
% figure()
% contour(ssr)
st=squeeze(t);
sst=squeeze(st(:,:,35));
sy=squeeze(y);
ssy=squeeze(sy(:,:,35));
su=squeeze(u);
ssu=squeeze(su(:,:,35));

%DRR Cartoon
figure()
sgtitle('Digitally reconstructed radiograph for all beams', 'fontsize', 16, 'fontweight', 'bold');
subplot(3,2,1)
imshow(ssq,[]);
title('Beam 1')
xlabel('X Plane')
ylabel('Y Plane')
subplot(3,2,2)
imshow(ssw,[]);
title('Beam 2')
xlabel('X Plane')
ylabel('Y Plane')
subplot(3,2,3)
imshow(sse,[]);
title('Beam 3')
xlabel('X Plane')
ylabel('Y Plane')
subplot(3,2,4)
imshow(sst,[]);
title('Beam 5')
xlabel('X Plane')
ylabel('Y Plane')
subplot(3,2,5)
imshow(ssy,[]);
title('Beam 6')
xlabel('X Plane')
ylabel('Y Plane')
subplot(3,2,6)
imshow(ssu,[]);
title('Beam 7')
xlabel('X Plane')
ylabel('Y Plane')


%Contour plots for all beams
figure()
sgtitle('Contour plots of dose distributions viewed using a transverse slice', 'fontsize', 16, 'fontweight', 'bold');
subplot(3,2,1)
contour(ssq,100)
colorbar
title('Beam 1')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')
subplot(3,2,2)
contour(ssw,100)
colorbar
title('Beam 2')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')
subplot(3,2,3)
contour(sse,100)
colorbar
title('Beam 3')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')
subplot(3,2,4)
contour(sst,100)
colorbar
title('Beam 5')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')
subplot(3,2,5)
contour(ssy,100)
colorbar
title('Beam 6')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')
subplot(3,2,6)
contour(ssu,100)
colorbar
title('Beam 7')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')

%DDR Cartoon and Contour for sum of beams
DRsum = DoseArray(:,:,:,1) + DoseArray(:,:,:,2) + DoseArray(:,:,:,3) + DoseArray(:,:,:,4) + DoseArray(:,:,:,5) + DoseArray(:,:,:,6); %Doses summed
SDRsum = squeeze(DRsum(:,:,35));

figure()
imshow(SDRsum,[])
title('Digitally reconstructed radiograph for all beams')
xlabel('X Plane')
ylabel('Y Plane')


figure()
contour(SDRsum, 100);
colorbar
title('Contour plot of the dose distribution for all beams')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')
%% Dose and Histogram
% CERR Stuff
global planC
index = planC{end};
planCDose = planC{index.dose};
n=[1:3,4:7];
array = zeros(1,length(n));

% Loading Doses from CERR
% for i=n
%     array(:,i) = planC{index.dose}(i).doseScale;
%     Dose = sum(array);
% end
% X = ['Total Dose = ', num2str(Dose), ' Gy'];
% disp(X)

for i = [1 2 3 5 6 7]
    DoseArray(:,:,:,i) = planC{index.dose}(i).doseArray;
end

Dosesum=DoseArray(:,:,:,1)+DoseArray(:,:,:,2)+DoseArray(:,:,:,3)+DoseArray(:,:,:,5)+DoseArray(:,:,:,6)+DoseArray(:,:,:,7);
Dosesum2 = rot90(squeeze(Dosesum(:,61,:)),1);
Dosesum3 = rot90(squeeze(Dosesum(34,:,:)),1);

figure()
contour(Dosesum(:,:,35), 1000);
title('Contour plot in the Transverse of the Dose Distributions for all beams')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')

figure()
contour(Dosesum2, 1000);
title('Contour plot in the Coronal of the Dose Distributions for all beams')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')

figure()
contour(Dosesum3, 1000);
title('Contour plot in the Sagittal of the Dose Distributions for all beams')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')

%Histograms
i=planC{1, 10}(1).DVHMatrix;
figure()
sgtitle('Planning Target Volume Histograms')
subplot(1,2,1)
histogram(i)
title('Differential Sum Histogram')
ylabel('Counts')
xlim([0 90]);
set(gca, 'TickDir', 'out','box','off')
cumPTV = cumsum(i);
subplot(1,2,2)
histogram(cumPTV)
title('Cumulative Sum Histogram')
ylabel('Counts')
xlim([0 17000]);
set(gca, 'TickDir', 'out','box','off')

ii=planC{1, 10}(2).DVHMatrix;
figure()
sgtitle('Rectum Histograms')
subplot(1,2,1)
histogram(ii)
title('Differential Sum Histogram')
ylabel('Counts')
xlim([0 90]);
set(gca, 'TickDir', 'out','box','off')
cumE = cumsum(ii);
subplot(1,2,2)
histogram(cumE)
title('Cumulative Sum Histogram')
ylabel('Counts')
xlim([0 14000]);
set(gca, 'TickDir', 'out','box','off')
%% ROI
ptv = planC{index.structures}(5).rasterSegments;
[mask,~]=rasterToMask(ptv,1,planC);
external=planC{index.structures}(1).rasterSegments;


%Fill3 for whole structures
figure()
x1 = cat(1,ptv(:,3),ptv(:,4));
y1 = cat(1,ptv(:,2),ptv(:,2));
z1 = cat(1,ptv(:,1),ptv(:,1)) ;
c1 = planC{index.structures}(5).structureColor;
x2 = cat(1,external(:,3),external(:,4));
y2 = cat(1,external(:,2),external(:,2));
z2 = cat(1,external(:,1),external(:,1)) ;
c2 = planC{index.structures}(1).structureColor;
fill3(x1,y1,z1,c1,x2,y2,z2,c2);
title('3D Polygon Data for External and PTV Regions of Interest')
xlabel('X Plane')
ylabel('Y Plane')
zlabel('Z Plane')

%Fill3 for isocenter/ one slice
figure()
x1 = cat(1,ptv(321:347,3),ptv(321:347,4));
y1 = cat(1,ptv(321:347,2),ptv(321:347,2));
z1 = cat(1,ptv(321:347,1),ptv(321:347,1)) ;
c1 = planC{index.structures}(5).structureColor;
x2 = cat(1,external(3365:3463,3),external(3365:3463,4));
y2 = cat(1,external(3365:3463,2),external(3365:3463,2));
z2 = cat(1,external(3365:3463,1),external(3365:3463,1)) ;
c2 = planC{index.structures}(1).structureColor;
fill3(x1,y1,z1,c1,x2,y2,z2,c2);
title('2D Polygon Data for External and PTV Regions of Interest')
xlabel('X Plane')
ylabel('Y Plane')


% Scroller
[mask,~]=rasterToMask(ptv,1,planC);
[mask1,sliceValues]=rasterToMask(external,1,planC);
array1=zeros(192,192,22);
array2=zeros(192,192,52);
mask3 = cat(3,array1,mask);
mask4 = cat(3,mask3,array2);
mask5 = (mask4+mask1);
c3=[0 0 0; c2; c1];

figure()
sliceViewer(mask5);
colormap(gca,c3);
colorbar('Ticks',[0.35,1,1.65],'TickLabels',{'Air','External','PTV'});
%% Gamma Factor

g=planC{index.dose}
DoseArray= planC{index.dose}(18).doseArray;
DA1=squeeze(DoseArray);
DDA1=squeeze(DA1(:,:,35));
figure()
contour(DDA1,1000)
title('Dose Distribution for Combined Pencil Beam and Collapsed Cone Algorithm')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Y Plane')
set(gca, 'TickDir', 'out','box','off')


Gammabeam = planC{index.dose}(17).doseArray;,
gb1 = squeeze(Gammabeam);
gbb1 = squeeze(gb1(:,:,35));
gb2 = squeeze(Gammabeam);
gbb2 = squeeze(gb2(34,:,:));
gb3 = squeeze(Gammabeam);
gbb3 = squeeze(gb3(:,61,:));
% figure()
% contour(gbb1,1000)
% title('Transverse')
figure()
subplot(2,1,1)
contour(rot90(gbb2,1), 1000);
title('Coronal')
xlabel('Slice number in the X Plane')
ylabel('Slice number in the Z Plane')
ylim([30 100]);
set(gca, 'TickDir', 'out','box','off')
subplot(2,1,2)
contour(rot90(gbb3,1), 1000);
title('Saggital')
xlabel('Slice number in the Y Plane')
ylabel('Slice number in the Z Plane')
ylim([30 100]);
set(gca, 'TickDir', 'out','box','off')