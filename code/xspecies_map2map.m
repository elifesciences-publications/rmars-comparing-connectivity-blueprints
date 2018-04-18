%%
% This script takes a map from one species and transforms it onto another
%
% written by S.Jbabdi 04/2018
%% 0. Load necessary files
%

% replace the following with path to the bundled data
datadir='/vols/Scratch/saad/rogier_autoPtx/Bundle_for_eLife';
addpath([datadir '/code'])

% replace the following with path to GIFTI library
% (https://www.artefact.tk/software/matlab/gifti/)
giftidir='/home/fs0/saad/matlab/gifti';
addpath(giftidir)

% Hemisphere ('L' or 'R')
h='R';

% Blueprints
load([datadir '/hum_' h '_blueprint.mat'],'hum_bp');
load([datadir '/mac_' h '_blueprint.mat'],'mac_bp');

% Surface lookups (to go 32k->10k)
load([datadir '/surface_lookup_' h '.mat']);


%% (hum -> mac)

% in this example we transform human myeling map 
% the human myelin map comes from the HCP Workbench tutorial data v1.0
% (see www.humanconnectome.org)
fname   = [datadir '/Human_MyelinMap_BC.' h '.32k_fs_LR.func.gii'];
outname = [datadir '/myelinmap_human_macaque_' h '.func.gii']; 

gii=gifti(fname);


% human myelin map at 10k
N=10001;
hmap = accumarray(ihum',double(gii.cdata),[N,1],@mean,0);

% compute KL divergence
MH = calc_KL(mac_bp,hum_bp);

% use KL for interpolation on the macaque brain
% exponent for interpolation
gamma = -4;
% interpolation - careful with division by zero etc.
n     = size(MH,2);
D     = MH .* repmat(~~hmap',n,1);
D     = D.^gamma;  D(isnan(D))=0; D(isinf(D))=0;
W     = D ./ repmat(sum(D,2)+~sum(D,2),1,n);

% do the interpolation as a matrix multiplication
mmap= W*hmap;

% save results
maps = [hmap;mmap];
gii.cdata = maps;
save(gii,outname);

% Load output using the command:
% wb_view L.both.inflated.surf.gii <outname>
%%


