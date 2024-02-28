function varargout = ProbandoGUI_1(varargin)
% PROBANDOGUI_1 MATLAB code for ProbandoGUI_1.fig
%      PROBANDOGUI_1, by itself, creates a new PROBANDOGUI_1 or raises the existing
%      singleton*.

%
%      H = PROBANDOGUI_1 returns the handle to a new PROBANDOGUI_1 or the handle to
%      the existing singleton*.
%
%      PROBANDOGUI_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROBANDOGUI_1.M with the given input arguments.
%
%      PROBANDOGUI_1('Property','Value',...) creates a new PROBANDOGUI_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProbandoGUI_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProbandoGUI_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProbandoGUI_1

% Last Modified by GUIDE v2.5 05-Oct-2019 14:10:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProbandoGUI_1_OpeningFcn, ...
                   'gui_OutputFcn',  @ProbandoGUI_1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before ProbandoGUI_1 is made visible.
function ProbandoGUI_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProbandoGUI_1 (see VARARGIN)

% Choose default command line output for ProbandoGUI_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes2)
xlim([100e6 10e9])

global FRECUENCIA S11_ABIERTO S11_CORTO S11_AGUA S11_ISOPROPILICO;

warning ('off','all')

S=load('patrones_expo2.mat','FRECUENCIA','S11_ABIERTO','S11_CORTO','S11_AGUA','S11_ISOPROPILICO');

FRECUENCIA=S.FRECUENCIA;
S11_ABIERTO=S.S11_ABIERTO;
S11_CORTO=S.S11_CORTO;
S11_AGUA=S.S11_AGUA;
S11_ISOPROPILICO=S.S11_ISOPROPILICO;

% voy a cargar en el workspace las variables que necesito:
global CONT SELECT SELECT_PATRONES ER_PATRONES F_PATRONES;
CONT=0;
SELECT=0;
SELECT_PATRONES=0;

%% cargo los valores de patrones
F_PATRONES=[100000000
199000000
298000000
397000000
496000000
595000000
694000000
793000000
892000000
991000000
1090000000
1189000000
1288000000
1387000000
1486000000
1585000000
1684000000
1783000000
1882000000
1981000000
2080000000
2179000000
2278000000
2377000000
2476000000
2575000000
2674000000
2773000000
2872000000
2971000000
3070000000
3169000000
3268000000
3367000000
3466000000
3565000000
3664000000
3763000000
3862000000
3961000000
4060000000
4159000000
4258000000
4357000000
4456000000
4555000000
4654000000
4753000000
4852000000
4951000000
5050000000
5149000000
5248000000
5347000000
5446000000
5545000000
5644000000
5743000000
5842000000
5941000000
6040000000
6139000000
6238000000
6337000000
6436000000
6535000000
6634000000
6733000000
6832000000
6931000000
7030000000
7129000000
7228000000
7327000000
7426000000
7525000000
7624000000
7723000000
7822000000
7921000000
8020000000
8119000000
8218000000
8317000000
8416000000
8515000000
8614000000
8713000000
8812000000
8911000000
9010000000
9109000000
9208000000
9307000000
9406000000
9505000000
9604000000
9703000000
9802000000
9901000000
10000000000
];
ER_PATRONES(1,:)=real(Patron_agua_destilada(F_PATRONES))-1j*imag(Patron_agua_destilada(F_PATRONES));
ER_PATRONES(2,:)=real(Patron_isopropilico100(F_PATRONES))-1j*imag(Patron_isopropilico100(F_PATRONES));
ER_PATRONES(3,:)=Patron_etilico(F_PATRONES);


ER_PATRONES(4,:)=[6.0741+6.52419081j
5.74+3.4371694j
5.6354+2.385013988j
5.5811+1.85962252j
5.5456+1.54833152j
5.5192+1.34502904j
5.4978+1.20374331j
5.4795+1.101324705j
5.4632+1.024787056j
5.4483+0.966310488j
5.4345+0.920984715j
5.4214+0.885423048j
5.4088+0.857348888j
5.3967+0.835031391j
5.385+0.81738915j
5.3735+0.80344572j
5.3623+0.792494317j
5.3513+0.784072476j
5.3404+0.777669048j
5.3296+0.772951888j
5.319+0.7696593j
5.3085+0.7676091j
5.2981+0.76663507j
5.2877+0.766452115j
5.2774+0.76707009j
5.2672+0.768326464j
5.257+0.7701505j
5.2469+0.772448618j
5.2368+0.775151136j
5.2268+0.778218252j
5.2168+0.781580976j
5.2069+0.78520052j
5.197+0.78906051j
5.1871+0.79310759j
5.1773+0.7973042j
5.1675+0.80168595j
5.1577+0.806096933j
5.148+0.81070704j
5.1383+0.815345444j
5.1287+0.82007913j
5.119+0.82482447j
5.1094+0.829613278j
5.0999+0.834445638j
5.0903+0.839288664j
5.0808+0.84417492j
5.0713+0.849037046j
5.0619+0.853891911j
5.0525+0.858773425j
5.0431+0.863630875j
5.0338+0.868431176j
5.0244+0.87324072j
5.0152+0.878011064j
5.0059+0.882740406j
4.9967+0.887463887j
4.9875+0.892114125j
4.9783+0.896741179j
4.9692+0.901313496j
4.9601+0.905863063j
4.9511+0.910358757j
4.942+0.91481362j
4.933+0.91921522j
4.9241+0.923564196j
4.9152+0.927891456j
4.9063+0.932147937j
4.8974+0.936333906j
4.8886+0.940468868j
4.8798+0.944534088j
4.8711+0.948598014j
4.8623+0.952573193j
4.8537+0.956518659j
4.845+0.9603759j
4.8364+0.964184704j
4.8278+0.967925622j
4.8193+0.971667266j
4.8108+0.975341592j
4.8023+0.978900832j
4.7939+0.982461866j
4.7855+0.985956565j
4.7771+0.989385181j
4.7688+0.992768784j
4.7605+0.99608702j
4.7522+0.999340138j
4.744+1.00259696j
4.7358+1.005741846j
4.7277+1.00889118j
4.7196+1.011929436j
4.7115+1.01495133j
4.7035+1.01793147j
4.6955+1.020848655j
4.6875+1.02365625j
4.6796+1.026517056j
4.6717+1.029268944j
4.6638+1.031959026j
4.656+1.03460976j
4.6482+1.03724583j
4.6405+1.039796835j
4.6328+1.042333672j
4.6251+1.04481009j
4.6175+1.047249j
4.6098+1.049605362j
4.6023+1.051947711j
];

ER_PATRONES(5,:)=[ 65.972+127.194016j
60.258+67.097283j
58.229+46.44636185j
57.154+36.02073696j
56.468+29.76767088j
55.981+25.63146066j
55.607+22.71768378j
55.305+20.57401305j
55.051+18.94745318j
54.83+17.6837716j
54.633+16.68601086j
54.453+15.88720728j
54.287+15.24270386j
54.131+14.71876021j
53.983+14.29091959j
53.842+13.9423859j
53.705+13.65771855j
53.572+13.42621464j
53.442+13.23972108j
53.314+13.0912527j
53.189+12.97545655j
53.064+12.8865924j
52.941+12.82178079j
52.819+12.77797248j
52.698+12.75186204j
52.576+12.7417936j
52.456+12.74523432j
52.335+12.76084305j
52.214+12.7872086j
52.093+12.82269195j
51.972+12.86722776j
51.851+12.91867665j
51.73+12.9769878j
51.608+13.04082552j
51.486+13.10988018j
51.364+13.18411152j
51.241+13.26219562j
51.118+13.34384272j
50.994+13.42825002j
50.87+13.516159j
50.745+13.60625685j
50.62+13.6987844j
50.495+13.7932142j
50.369+13.88925175j
50.243+13.98714877j
50.116+14.08610412j
49.988+14.18559464j
49.861+14.28667233j
49.732+14.38846224j
49.604+14.49081652j
49.475+14.59364075j
49.345+14.69642135j
49.215+14.7999348j
49.085+14.9031877j
48.955+15.00715525j
48.824+15.111028j
48.692+15.2138154j
48.561+15.31759623j
48.429+15.42076218j
48.296+15.52330032j
48.164+15.62584652j
48.031+15.72775095j
47.898+15.82933104j
47.764+15.93024928j
47.631+16.03068936j
47.497+16.13045617j
47.363+16.22987921j
47.228+16.32813644j
47.094+16.4263872j
46.959+16.52346333j
46.824+16.61971056j
46.689+16.71512889j
46.554+16.81018386j
46.419+16.90440723j
46.283+16.99743175j
46.148+17.08998884j
46.012+17.18134092j
45.877+17.27223173j
45.741+17.36191137j
45.605+17.45075325j
45.469+17.53875737j
45.334+17.6258592j
45.198+17.71219224j
45.062+17.7972369j
44.926+17.88144652j
44.79+17.9648211j
44.655+18.04731825j
44.519+18.12858199j
44.383+18.20901341j
44.248+18.28902584j
44.112+18.36735456j
43.977+18.44527311j
43.842+18.52192974j
43.706+18.59734006j
43.571+18.67191634j
43.436+18.74567452j
43.301+18.8186146j
43.167+18.89074254j
43.032+18.96162048j
42.898+19.0316977j
42.764+19.10096824j
];

ER_PATRONES(6,:)=[80.14+100.567686j
65.143+57.63982926j
60.09+41.7072672j
57.495+33.3333012j
55.885+28.1749816j
54.771+24.69405306j
53.942+22.2025272j
53.293+20.34566861j
52.764+18.92011512j
52.319+17.80258613j
51.936+16.91140032j
51.6+16.193112j
51.298+15.60792948j
51.025+15.12942275j
50.773+14.73534006j
50.54+14.4119864j
50.321+14.1452331j
50.114+13.92718174j
49.917+13.74913848j
49.728+13.6055808j
49.546+13.4913758j
49.37+13.4029676j
49.199+13.33588094j
49.032+13.287672j
48.869+13.25669363j
48.709+13.23959329j
48.552+13.23576072j
48.397+13.24287111j
48.244+13.26034584j
48.093+13.28617218j
47.943+13.32000369j
47.795+13.36109225j
47.647+13.4078658j
47.501+13.46035837j
47.355+13.51748475j
47.21+13.5790123j
47.066+13.6444334j
46.922+13.7129545j
46.779+13.78530351j
46.636+13.85975284j
46.493+13.93627675j
46.351+14.01561538j
46.209+14.09605545j
46.067+14.17850126j
45.925+14.26200875j
45.783+14.34701871j
45.641+14.43259702j
45.5+14.519505j
45.358+14.60663674j
45.217+14.69462066j
45.075+14.782797j
44.934+14.87135664j
44.792+14.96008008j
44.651+15.04872653j
44.51+15.137851j
44.368+15.22621024j
44.227+15.31492556j
44.086+15.4036484j
43.944+15.49157832j
43.803+15.57941301j
43.662+15.66679884j
43.52+15.7533696j
43.379+15.83984185j
43.238+15.92585254j
43.097+16.01096647j
42.956+16.0956132j
42.815+16.1797885j
42.674+16.2630614j
42.533+16.3454319j
42.392+16.42732392j
42.251+16.50831072j
42.11+16.5888134j
41.97+16.6683855j
41.829+16.74707673j
41.689+16.82484662j
41.549+16.9021332j
41.409+16.97810409j
41.269+17.05358887j
41.129+17.12776076j
40.99+17.2018634j
40.85+17.2742395j
40.711+17.34573577j
40.572+17.41674816j
40.433+17.48646384j
40.295+17.5557256j
40.156+17.62366528j
40.018+17.69075726j
39.88+17.7569688j
39.743+17.82235092j
39.605+17.8864101j
39.468+17.9500464j
39.331+18.01241807j
39.194+18.07392116j
39.058+18.1346294j
38.922+18.1940889j
38.786+18.2526916j
38.651+18.31091125j
38.516+18.36789524j
38.381+18.42364762j
38.246+18.4785549j
38.112+18.53272224j
];

ER_PATRONES(7,:)=[56.801+58.2494255j
47.113+34.00380775j
43.821+24.89383368j
42.112+20.0916352j
41.039+17.13337211j
40.289+15.14020331j
39.725+13.717837j
39.279+12.66197844j
38.913+11.85640197j
38.603+11.22884064j
38.335+10.73341665j
38.097+10.33762095j
37.884+10.01956032j
37.689+9.76295856j
37.509+9.55616793j
37.342+9.39001932j
37.185+9.25720575j
37.036+9.15270668j
36.894+9.07112778j
36.757+9.00950827j
36.626+8.96531228j
36.498+8.93544036j
36.375+8.91878625j
36.254+8.91232082j
36.136+8.91583528j
36.02+8.9279172j
35.906+8.94669802j
35.794+8.97248198j
35.683+9.00353456j
35.573+9.03981076j
35.465+9.0804586j
35.357+9.12458099j
35.25+9.1724025j
35.144+9.2235428j
35.039+9.27727603j
34.934+9.33296744j
34.83+9.3912129j
34.726+9.45102816j
34.622+9.51204828j
34.519+9.57488022j
34.415+9.63860905j
34.313+9.7037164j
34.21+9.7693497j
34.107+9.83577666j
34.005+9.9029361j
33.902+9.9705782j
33.8+10.0386j
33.698+10.10670416j
33.596+10.17522052j
33.494+10.24380496j
33.392+10.31245136j
33.29+10.3808207j
33.188+10.4492418j
33.087+10.51802643j
32.985+10.58587605j
32.883+10.65376317j
32.781+10.72135386j
32.68+10.7889752j
32.578+10.85564116j
32.476+10.92200356j
32.375+10.98839875j
32.273+11.05382523j
32.172+11.11928664j
32.07+11.1837711j
31.969+11.24797296j
31.867+11.31119165j
31.766+11.37445162j
31.665+11.4367647j
31.563+11.4984009j
31.462+11.55945342j
31.361+11.62019133j
31.26+11.6799864j
31.159+11.73946484j
31.059+11.79838233j
30.958+11.85598526j
30.857+11.91327056j
30.757+11.97000926j
30.657+12.02612796j
30.557+12.08132109j
30.456+12.13549776j
30.357+12.18954978j
30.257+12.24258734j
30.157+12.2950089j
30.058+12.34692466j
29.958+12.39751914j
29.859+12.44791851j
29.76+12.4974144j
29.661+12.54630639j
29.563+12.59472489j
29.464+12.64182384j
29.366+12.68875494j
29.268+12.73479948j
29.17+12.7802521j
29.072+12.82453136j
28.975+12.86866675j
28.878+12.91222014j
28.781+12.95461591j
28.684+12.99643356j
28.588+13.03784328j
28.491+13.07793882j
28.395+13.1179221j   
];

ER_PATRONES(8,:)=[ 72.929+88.3024332j
55.804+52.53555972j
49.902+38.62814016j
46.856+31.09551584j
44.976+26.34199344j
43.689+23.06298621j
42.747+20.66689209j
42.023+18.8431132j
41.447+17.41312811j
40.975+16.26666525j
40.58+15.3315298j
40.242+14.5575435j
39.95+13.91059j
39.693+13.36542696j
39.464+12.90196552j
39.258+12.50642106j
39.071+12.16788153j
38.9+11.876948j
38.742+11.6264742j
38.595+11.4109977j
38.457+11.2255983j
38.328+11.06682672j
38.206+10.9307366j
38.089+10.81499066j
37.978+10.7173916j
37.871+10.63569164j
37.768+10.56786408j
37.668+10.5131388j
37.572+10.47018924j
37.477+10.43696973j
37.386+10.41349644j
37.295+10.39821895j
37.207+10.39079889j
37.12+10.3902592j
37.035+10.3964652j
36.95+10.408076j
36.866+10.42496748j
36.783+10.44710766j
36.701+10.47373138j
36.619+10.50416015j
36.538+10.53865534j
36.457+10.57654027j
36.376+10.61742688j
36.296+10.66158704j
36.215+10.7080512j
36.135+10.7573895j
36.055+10.80892845j
35.974+10.8623493j
35.894+10.91787798j
35.813+10.97489385j
35.733+11.03399307j
35.652+11.09418936j
35.571+11.15613273j
35.489+11.21878268j
35.408+11.28311328j
35.326+11.34812424j
35.244+11.41412184j
35.161+11.48076972j
35.079+11.54870838j
34.995+11.61659025j
34.912+11.68574464j
34.828+11.75514656j
34.744+11.82477296j
34.659+11.8949688j
34.575+11.965716j
34.489+12.03631611j
34.404+12.10745568j
34.318+12.17877184j
34.231+12.24990566j
34.144+12.32120384j
34.057+12.39266116j
33.97+12.4642724j
33.882+12.53566236j
33.793+12.60647865j
33.705+12.67813575j
33.616+12.748868j
33.526+12.81967188j
33.437+12.89063224j
33.347+12.96097849j
33.256+13.03069848j
33.165+13.10050665j
33.074+13.1700668j
32.983+13.2393762j
32.891+13.30802751j
32.799+13.37641617j
32.707+13.44453942j
32.614+13.5119802j
32.521+13.57914355j
32.428+13.6457024j
32.334+13.71187938j
32.241+13.77786894j
32.147+13.84314114j
32.052+13.9073628j
31.958+13.97171802j
31.863+14.03533287j
31.768+14.09832072j
31.673+14.1609983j
31.578+14.22304698j
31.482+14.28432786j
31.386+14.3449713j
31.29+14.4052902j
];

ER_PATRONES(9,:)=[65.969+94.0454064j
55.72+52.8910956j
51.957+37.99875195j
49.943+30.23898821j
48.663+25.47897354j
47.764+22.27378612j
47.086+19.98141496j
46.551+18.27359505j
46.113+16.96266705j
45.742+15.93331086j
45.421+15.11202091j
45.138+14.44822242j
44.884+13.90640972j
44.653+13.46198644j
44.44+13.0951348j
44.242+12.79213188j
44.056+12.54186208j
43.88+12.3351068j
43.712+12.16548672j
43.551+12.02704416j
43.395+11.9153991j
43.245+11.82707505j
43.099+11.75870017j
42.956+11.7076578j
42.816+11.6716416j
42.679+11.64880626j
42.544+11.6379112j
42.411+11.63715429j
42.28+11.6456032j
42.15+11.662062j
42.021+11.68561989j
41.894+11.71607604j
41.767+11.75156312j
41.641+11.79231479j
41.516+11.83787224j
41.391+11.88708129j
41.267+11.93978111j
41.143+11.99565308j
41.019+12.05425353j
40.896+12.11544j
40.773+12.1788951j
40.65+12.244593j
40.527+12.31129206j
40.405+12.380092j
40.283+12.45026681j
40.16+12.5210848j
40.038+12.59315214j
39.916+12.66614512j
39.794+12.73965116j
39.671+12.81333629j
39.549+12.88783263j
39.427+12.96280906j
39.305+13.03786155j
39.183+13.11298278j
39.061+13.18816543j
38.939+13.26379157j
38.817+13.33907388j
38.695+13.4140087j
38.572+13.4886284j
38.45+13.5632375j
38.328+13.63748568j
38.206+13.71136928j
38.084+13.78526548j
37.962+13.85840772j
37.84+13.9311744j
37.718+14.00318468j
37.596+14.07481452j
37.474+14.14606026j
37.352+14.21654472j
37.231+14.28665163j
37.109+14.35598774j
36.987+14.42419026j
36.866+14.49239326j
36.744+14.55981j
36.623+14.62649374j
36.502+14.69242002j
36.381+14.75758884j
36.26+14.8220002j
36.139+14.8856541j
36.018+14.94855054j
35.897+15.01068952j
35.777+15.07213456j
35.657+15.13318737j
35.537+15.19313361j
35.417+15.25197688j
35.297+15.31042672j
35.178+15.36786108j
35.058+15.42446826j
34.939+15.48042273j
34.82+15.5356394j
34.702+15.59022052j
34.583+15.64362005j
34.465+15.69639495j
34.347+15.74844297j
34.229+15.79942182j
34.112+15.8501408j
33.995+15.89980145j
33.878+15.94840728j
33.761+15.99629941j
33.645+16.04361825j
33.528+16.08975192j
];

ER_PATRONES(10,:)=[49.902+38.62814016j
49.943+30.23898821j
49.902+38.62814016j
49.943+30.23898821j
44.976+26.34199344j
47.764+22.27378612j
42.747+20.66689209j
46.551+18.27359505j
41.447+17.41312811j
45.742+15.93331086j
40.58+15.3315298j
45.138+14.44822242j
39.95+13.91059j
44.653+13.46198644j
39.464+12.90196552j
44.242+12.79213188j
39.071+12.16788153j
43.88+12.3351068j
38.742+11.6264742j
43.551+12.02704416j
38.457+11.2255983j
43.245+11.82707505j
38.206+10.9307366j
42.956+11.7076578j
37.978+10.7173916j
42.679+11.64880626j
37.768+10.56786408j
42.411+11.63715429j
37.572+10.47018924j
42.15+11.662062j
37.386+10.41349644j
41.894+11.71607604j
37.207+10.39079889j
41.641+11.79231479j
37.035+10.3964652j
41.391+11.88708129j
36.866+10.42496748j
41.143+11.99565308j
36.701+10.47373138j
40.896+12.11544j
36.538+10.53865534j
40.65+12.244593j
36.376+10.61742688j
40.405+12.380092j
36.215+10.7080512j
40.16+12.5210848j
36.055+10.80892845j
39.916+12.66614512j
35.894+10.91787798j
39.671+12.81333629j
35.733+11.03399307j
39.427+12.96280906j
35.571+11.15613273j
39.183+13.11298278j
35.408+11.28311328j
38.939+13.26379157j
35.244+11.41412184j
38.695+13.4140087j
35.079+11.54870838j
38.45+13.5632375j
34.912+11.68574464j
38.206+13.71136928j
34.744+11.82477296j
37.962+13.85840772j
34.575+11.965716j
37.718+14.00318468j
34.404+12.10745568j
37.474+14.14606026j
34.231+12.24990566j
37.231+14.28665163j
34.057+12.39266116j
36.987+14.42419026j
33.882+12.53566236j
36.744+14.55981j
33.705+12.67813575j
36.502+14.69242002j
33.526+12.81967188j
36.26+14.8220002j
33.347+12.96097849j
36.018+14.94855054j
33.165+13.10050665j
35.777+15.07213456j
32.983+13.2393762j
35.537+15.19313361j
32.799+13.37641617j
35.297+15.31042672j
32.614+13.5119802j
35.058+15.42446826j
32.428+13.6457024j
34.82+15.5356394j
32.241+13.77786894j
34.583+15.64362005j
32.052+13.9073628j
34.347+15.74844297j
31.863+14.03533287j
34.112+15.8501408j
31.673+14.1609983j
33.878+15.94840728j
31.482+14.28432786j
33.645+16.04361825j
31.29+14.4052902j
];

ER_PATRONES(11,:)=[76.818+221.6429754j
68.516+115.6070468j
65.689+79.3457431j
64.217+61.06266096j
63.288+50.08549032j
62.631+42.80327802j
62.13+37.65078j
61.726+33.83757594j
61.386+30.92196978j
61.09+28.6365484j
60.827+26.81132506j
60.586+25.33161246j
60.364+24.11783256j
60.155+23.1127541j
59.956+22.27545268j
59.766+21.57313536j
59.582+20.98299294j
59.402+20.4847797j
59.227+20.06433079j
59.055+19.70960625j
58.885+19.4108514j
58.717+19.16053144j
58.551+18.95178768j
58.385+18.77836755j
58.22+18.6368042j
58.056+18.52218624j
57.892+18.43223388j
57.729+18.36417219j
57.565+18.31430475j
57.401+18.28107048j
57.237+18.26260959j
57.073+18.2576527j
56.908+18.26405352j
56.743+18.28145974j
56.577+18.30775143j
56.412+18.34292592j
56.245+18.3853656j
56.078+18.43452094j
55.911+18.4897677j
55.743+18.55071297j
55.574+18.61617852j
55.406+18.68622756j
55.236+18.75925032j
55.066+18.83642662j
54.896+18.91661264j
54.725+18.9994255j
54.553+19.08427599j
54.381+19.17147774j
54.209+19.2604577j
54.036+19.35083196j
53.863+19.44238848j
53.689+19.53527954j
53.515+19.629302j
53.341+19.72390157j
53.166+19.81922148j
52.991+19.91454771j
52.816+20.01092608j
52.64+20.1069008j
52.465+20.2032222j
52.289+20.29963558j
52.112+20.39559456j
51.936+20.49186816j
51.759+20.58714225j
51.583+20.68271968j
51.406+20.77779114j
51.229+20.87171918j
51.052+20.96603536j
50.874+21.05878356j
50.697+21.15129537j
50.52+21.2431548j
50.343+21.33435654j
50.166+21.42439362j
49.989+21.51426582j
49.811+21.60253259j
49.634+21.690058j
49.457+21.77690624j
49.281+21.86302284j
49.104+21.94752384j
48.927+22.03133883j
48.751+22.11442862j
48.575+22.19634625j
48.399+22.27709172j
48.223+22.35666503j
48.047+22.43506618j
47.872+22.51324416j
47.697+22.58977617j
47.522+22.66514268j
47.347+22.73887022j
47.173+22.81239107j
46.999+22.88428309j
46.825+22.955488j
46.652+23.02556112j
46.479+23.09402073j
46.306+23.16133508j
46.134+23.22800766j
45.962+23.2935416j
45.791+23.3579891j
45.62+23.421308j
45.449+23.48304381j
45.279+23.54417442j
45.109+23.60373534j   
];

ER_PATRONES(12,:)=[59.78+83.00453j
51.131+45.91205883j
48.357+32.36340582j
47.034+25.39083456j
46.254+21.18618216j
45.731+18.40901405j
45.346+16.46241184j
45.043+15.04256028j
44.794+13.97751976j
44.579+13.16239554j
44.389+12.52923914j
44.217+12.03409872j
44.058+11.64408882j
43.908+11.3370456j
43.765+11.0961781j
43.628+10.9091814j
43.495+10.76544745j
43.365+10.6582497j
43.238+10.58163574j
43.113+10.52991912j
42.988+10.499819j
42.865+10.4882082j
42.743+10.49255164j
42.621+10.5103386j
42.499+10.53932701j
42.378+10.57882014j
42.256+10.62653888j
42.135+10.68248655j
42.013+10.74440462j
41.891+10.81248601j
41.768+10.88515848j
41.645+10.9617969j
41.522+11.0427759j
41.398+11.12654046j
41.274+11.21332032j
41.15+11.3026705j
41.025+11.39387325j
40.899+11.48648415j
40.773+11.58075519j
40.647+11.67625722j
40.52+11.7722756j
40.393+11.86948305j
40.265+11.96716065j
40.137+12.0651822j
40.008+12.16323216j
39.879+12.26159613j
39.75+12.359865j
39.62+12.4577166j
39.49+12.5558455j
39.36+12.6534528j
39.229+12.75060187j
39.098+12.84721182j
38.967+12.94366839j
38.835+13.03885125j
38.704+13.13381536j
38.572+13.2282674j
38.44+13.321382j
38.307+13.41396219j
38.175+13.5055515j
38.042+13.5962108j
37.909+13.68628627j
37.776+13.7750184j
37.643+13.86316404j
37.51+13.949969j
37.377+14.03618481j
37.244+14.1210626j
37.111+14.20497747j
36.978+14.28792942j
36.845+14.36991845j
36.712+14.45057744j
36.578+14.52987894j
36.445+14.60824935j
36.312+14.68566216j
36.18+14.7621636j
36.047+14.83730567j
35.914+14.91113366j
35.782+14.98442814j
35.649+15.05599866j
35.517+15.1266903j
35.385+15.19608825j
35.253+15.264549j
35.122+15.33215788j
34.99+15.3980493j
34.859+15.4634524j
34.728+15.52723608j
34.597+15.59010014j
34.467+15.65215404j
34.337+15.71295457j
34.207+15.77250563j
34.077+15.83081112j
33.948+15.88834296j
33.819+15.94498212j
33.69+16.0000548j
33.562+16.05471832j
33.434+16.10783252j
33.306+16.1600712j
33.179+16.2112594j
33.052+16.261584j
32.925+16.3103865j
32.799+16.35882924j
32.673+16.40576676j
];

ER_PATRONES(13,:)=[5.6903+5.385527532j
5.5847+2.817760385j
5.5425+1.97124555j
5.5156+1.561962764j
5.4945+1.3285701j
5.476+1.18325408j
5.4587+1.088082671j
5.4421+1.024148799j
5.4257+0.980749532j
5.4094+0.951621648j
5.3929+0.932648126j
5.3764+0.921138612j
5.3596+0.915205296j
5.3426+0.9135846j
5.3254+0.91516999j
5.3079+0.91932828j
5.2902+0.925467588j
5.2723+0.933144377j
5.2542+0.942025518j
5.2359+0.951834261j
5.2173+0.962330985j
5.1987+0.973456575j
5.1798+0.984887172j
5.1608+0.996653696j
5.1416+1.008576256j
5.1224+1.020586976j
5.103+1.03264308j
5.0835+1.04465925j
5.064+1.0566036j
5.0443+1.06838274j
5.0247+1.080109512j
5.005+1.0915905j
4.9852+1.102875796j
4.9654+1.113937836j
4.9457+1.124800551j
4.9259+1.135370691j
4.9061+1.145672472j
4.8864+1.155780192j
4.8667+1.165525983j
4.847+1.17505821j
4.8274+1.184257768j
4.8079+1.193224622j
4.7884+1.201840516j
4.769+1.21022913j
4.7496+1.2182724j
4.7304+1.226072376j
4.7112+1.233580608j
4.6921+1.240778924j
4.6732+1.2477444j
4.6543+1.254380393j
4.6356+1.260790488j
4.6169+1.266923529j
4.5984+1.272791136j
4.58+1.2783696j
4.5618+1.283736138j
4.5436+1.288837576j
4.5256+1.293688016j
4.5078+1.298336556j
4.4901+1.302712713j
4.4725+1.3068645j
4.455+1.3107501j
4.4378+1.31447636j
4.4206+1.317957684j
4.4036+1.321256144j
4.3868+1.324331052j
4.3701+1.32719937j
4.3535+1.329863645j
4.3371+1.33235712j
4.3209+1.334682801j
4.3048+1.336812592j
4.2889+1.338737246j
4.2731+1.340514201j
4.2574+1.342102776j
4.242+1.34361108j
4.2267+1.344893673j
4.2115+1.346037515j
4.1965+1.347034535j
4.1816+1.347855128j
4.1669+1.348575516j
4.1524+1.349156284j
4.138+1.3496087j
4.1237+1.349893195j
4.1096+1.350085792j
4.0957+1.350188462j
4.0819+1.350129244j
4.0682+1.349950806j
4.0547+1.349687989j
4.0413+1.349309244j
4.0281+1.348849566j
4.015+1.34827715j
4.0021+1.347587112j
3.9893+1.346827573j
3.9767+1.345993649j
3.9642+1.34505306j
3.9518+1.34400718j
3.9396+1.342930848j
3.9275+1.341751825j
3.9155+1.340471425j
3.9037+1.339164285j
3.892+1.33775824j
3.8804+1.336254544j
];
    
ER_PATRONES(14,:)=[55.757+85.30821j
49.196+46.71307788j
46.808+33.28657304j
45.5+26.50557j
44.634+22.46518488j
43.994+19.8236964j
43.483+17.99196091j
43.055+16.6717571j
42.681+15.6938037j
42.346+14.9566072j
42.038+14.39423158j
41.75+13.962035j
41.478+13.6296708j
41.218+13.375241j
40.967+13.18195159j
40.724+13.0377886j
40.486+12.93284784j
40.254+12.861153j
40.026+12.81552468j
39.802+12.7923628j
39.58+12.7871106j
39.36+12.7967232j
39.143+12.8193325j
38.928+12.85246848j
38.714+12.89447198j
38.502+12.94360236j
38.291+12.99902868j
38.082+13.05946026j
37.873+13.12375196j
37.666+13.19176318j
37.459+13.26198436j
37.254+13.3350693j
37.05+13.4095065j
36.846+13.48489908j
36.644+13.56121152j
36.442+13.63805408j
36.241+13.71468163j
36.042+13.79219214j
35.843+13.86873199j
35.645+13.9450369j
35.448+14.02074744j
35.252+14.0955122j
35.057+14.16968883j
34.862+14.24217286j
34.669+14.31448341j
34.477+14.38518348j
34.286+14.4549776j
34.095+14.5231062j
33.906+14.59009086j
33.718+14.65586588j
33.531+14.720109j
33.345+14.78283885j
33.16+14.844074j
32.976+14.90383296j
32.793+14.96213418j
32.611+15.01899605j
32.431+15.07457742j
32.251+15.12797657j
32.073+15.18079236j
31.896+15.23161584j
31.72+15.28111j
31.545+15.3289773j
31.371+15.37524081j
31.198+15.41992348j
31.027+15.4638568j
30.856+15.50544856j
30.687+15.5460342j
30.519+15.58544292j
30.353+15.62359969j
30.187+15.65980812j
30.022+15.69460094j
29.859+15.72852684j
29.697+15.76108881j
29.536+15.79230848j
29.377+15.8224522j
29.218+15.85105718j
29.061+15.87863979j
28.904+15.904426j
28.75+15.9298j
28.596+15.9537084j
28.443+15.97614867j
28.292+15.99799432j
28.141+16.0178572j
27.992+16.03745656j
27.844+16.05568572j
27.697+16.07284607j
27.552+16.08926592j
27.407+16.1043532j
27.264+16.11874944j
27.121+16.1315708j
26.98+16.1440226j
26.84+16.1552644j
26.701+16.16558643j
26.564+16.17561652j
26.427+16.18415907j
26.291+16.19183817j
26.157+16.1990301j
26.024+16.20540504j
25.891+16.2103551j
25.76+16.2151472j
25.63+16.2189203j
];

%% --- Outputs from this function are returned to the command line.
function varargout = ProbandoGUI_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_end.
function pushbutton_end_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global VNA;

if(isempty(VNA))
     set(handles.edit2,'String','No hay VNA conectado.');
     set(handles.edit2,'ForegroundColor',[0.7 0.0 0.0]);
else
    EndVNA(VNA);
     set(handles.edit2,'String',' Desconexion exitosa ');
     set(handles.edit2,'ForegroundColor',[0.0 0.7 0.0]);
end

% --- Executes on button press in pushbutton_init.
function pushbutton_init_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global VNA;

set(handles.edit2,'String','Inicializando...');
set(handles.edit2,'ForegroundColor',[0.0 0.7 0.0]);

VNA=InitVNA();
if(isempty(VNA))
    set(handles.edit2,'String','No se pudo iniciar el VNA, verifique conexi�n.');
    set(handles.edit2,'ForegroundColor',[0.7 0.0 0.0]);
else
    set(handles.edit2,'String','Inicializaci�n exitosa.');
    set(handles.edit2,'ForegroundColor',[0.0 0.7 0.0]);
end
    
%set(handles.pushbutton_init, 'UserData',VNA);

% --- Executes on button press in pushbutton_calib.
function pushbutton_calib_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_calib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%VNA=get(handles.pushbutton_init, 'UserData');
global VNA FRECUENCIA S11_ABIERTO S11_CORTO S11_AGUA S11_ISOPROPILICO;

if(isempty(VNA))
    set(handles.edit2,'String','No calibro porque no hay VNA.');
    set(handles.edit2,'ForegroundColor',[0.7 0.0 0.0]);
else
    [S11_AGUA,S11_ABIERTO,S11_ISOPROPILICO,S11_CORTO,FRECUENCIA]=Calib_manual(VNA);
    set(handles.edit2,'String','Calibraci�n exitosa.');
    set(handles.edit2,'ForegroundColor',[0.0 0.7 0.0]);
    save('patrones_expo2.mat');
end
%s11_data_facai=vertcat(frecuencia,s11_abierto,s11_corto,s11_agua,s11_isopropilico);
%set(handles.pushbutton_calib, 'UserData', s11_data_facai);


% --- Executes on button press in pushbutton_medir_er.
function pushbutton_medir_er_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_medir_er (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global VNA FRECUENCIA S11_ABIERTO S11_CORTO S11_AGUA S11_ISOPROPILICO;
global CONT ER_MEDIDO;
global ER_PATRONES SELECT_PATRONES F_PATRONES;

if(isempty(VNA))
    set(handles.edit2,'String','No voy a medir nada porque no hay VNA.');
    set(handles.edit2,'ForegroundColor',[0.7 0.0 0.0]);
else
    CONT=CONT+1;
    prompt={'Nombre del material'};
    dlg_title='Medir un material nuevo';
    respuesta=inputdlg(prompt,dlg_title);

    [ER_MEDIDO(CONT,:),FRECUENCIA] = MedirEr(VNA, S11_AGUA, S11_ABIERTO, S11_ISOPROPILICO, S11_CORTO);
    
    set(handles.edit2,'String','Medici�n completa.');
    set(handles.edit2,'ForegroundColor',[0.0 0.7 0.0]);
    
    t=get(handles.listbox1,'String');
    if ischar(t);t=cellstr(t);end
    nuevo=[t;respuesta];
    set(handles.listbox1,'String',nuevo);

end



% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)

global ER_MEDIDO FRECUENCIA SELECT;

% outputFileName = 'LaPermitividadDeTuBrazo.jpg';
% fpath='Figuritas';
% fignew = figure('Visible','off'); % Invisible figure
% newAxes = copyobj(handles.axes2,fignew); % Copy the appropriate axes
% set(newAxes,'Position',get(groot,'DefaultAxesPosition')); % The original position is copied too, so adjust it.
% set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')'); % Make it visible upon loading
% saveas(fignew,fullfile(fpath,outputFileName));
% delete(fignew);

%%
 if (SELECT==0) %aca tengo que poner cual guarda 
     
    string='No ha seleccionado ningun material para guardar!!';
    set(handles.edit2,'ForegroundColor',[0.7 0.0 0.0]);
    set(handles.edit2,'String',string);
    
 else

%% mail

%             prompt={'Mail'};
%             dlg_title='Mail';
%             respuesta=inputdlg(prompt,dlg_title);
% 
%             if isempty(respuesta) 
%             else
% 
%                 mail_destino=respuesta;
% 
%                 mail_usuario='deteccioncancerUTN@gmail.com';
%                 user_name='deteccioncancerUTN@gmail.com';
%                 user_password='medidas2';
%                 
%                 descripcion=sprintf('La permitividad diel�ctrica se compone de una parte real y una parte imaginaria:\n\t*La parte real (en azul), se conoce como constante diel�ctrica. Es una medida de la cantidad de energ�a almacenada en el material, producto de un campo el�ctrico externo.\n\t*La parte imaginaria (en rojo), se conoce como factor de p�rdida.Es una medida de la cantidad de energ�a disipada.');
%                 descripcion='Adjunto se encuentra la permitividad eletrica de su brazo';
% 
% 
%                 setpref('Internet','SMTP_Server','smtp.gmail.com');
%                 setpref('Internet','E_mail',mail_usuario);
%                 setpref('Internet','SMTP_Username',user_name);
%                 setpref('Internet','SMTP_Password',user_password);
% 
%                 props = java.lang.System.getProperties;
%                 props.setProperty('mail.smtp.auth','true');
%                 props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
%                 props.setProperty('mail.smtp.socketFactory.port','465');
%                 sendmail(mail_destino,'Permitividad electrica de tu piel',descripcion,{'\Figuritas\LaPermitividadDeTuBrazo.jpg'}); 
%             end   
    
    formatos = {'*.s1p','S1P (*.s1p)'}; 
    [nomb,ruta] = uiputfile(formatos,'Guardar material medido'); 
    if nomb==0, return, end 
    fName = fullfile(ruta,nomb); 

     for n = 1:length(FRECUENCIA)
           A(1,1,n)=ER_MEDIDO(SELECT,n);
     end

     S50 = sparameters(A,(FRECUENCIA.'));

    data = S50.Parameters;
    freq = S50.Frequencies;

    rfwrite(data, freq, fName)
    set(handles.edit2,'ForegroundColor',[0.0 0.7 0.0]);
    string=strcat("Se guard� correctamente como ", nomb, ".s1p");
    set(handles.edit2,'String',string);
 end




% --- Executes on selection change in listbox1.


function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

global ER_MEDIDO FRECUENCIA SELECT;
global SELECT_PATRONES ER_PATRONES F_PATRONES;

listValue = get(handles.listbox1,'Value');

SELECT=listValue-1;

if(listValue==1)
    %subplot(1,1,1);
    %xlim([100e6 10e9]);
    cla;
    if (SELECT_PATRONES > 0)
        PlotCart2(F_PATRONES,real(ER_PATRONES(SELECT_PATRONES,:)),(imag(ER_PATRONES(SELECT_PATRONES,:))),'*');
    end
else
     cla;
     PlotCart(FRECUENCIA,real(ER_MEDIDO(SELECT,:)),(-1*imag(ER_MEDIDO(SELECT,:))));
     if (SELECT_PATRONES > 0)
         hold on;
         PlotCart2(F_PATRONES,real(ER_PATRONES(SELECT_PATRONES,:)),(imag(ER_PATRONES(SELECT_PATRONES,:))),'*');
         hold off;
         legend('Parte real','Parte imaginaria','Parte real','Parte imaginaria');
     end
     set(handles.edit2,'String','Mostrando permitividad del material seleccionado');
     set(handles.edit2,'ForegroundColor',[0.0 0.7 0.0]);
end




% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, ~, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume();
set(handles.pushbutton5,'Enable','off');

% --- Executes on selection change in patrones.
function patrones_Callback(hObject, eventdata, handles)
% hObject    handle to patrones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns patrones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from patrones
global ER_PATRONES SELECT_PATRONES;

listPatron = get(handles.patrones,'Value');

SELECT_PATRONES=listPatron-1;

%grafico la lista de la izq
global ER_MEDIDO FRECUENCIA SELECT F_PATRONES;
if(SELECT==0)
    cla;
    xlim([100e6 10e9]);
else
    %hold on; %ver si anda estoo!!!
    legend('-DynamicLegend');
    PlotCart(FRECUENCIA,real(ER_MEDIDO(SELECT,:)),(-1*imag(ER_MEDIDO(SELECT,:))));
    %hold off;
    set(handles.edit2,'String','Mostrando permitividad del material seleccionado');
    set(handles.edit2,'ForegroundColor',[0.0 0.7 0.0]);
end
% ya grafiqu� lo medido

if(SELECT_PATRONES==0)
   cla;
   xlim([100e6 10e9]);
   if(SELECT==0)
    cla;
    xlim([100e6 10e9]);
   else
    PlotCart(FRECUENCIA,real(ER_MEDIDO(SELECT,:)),(-1*imag(ER_MEDIDO(SELECT,:))));
   end
else
    hold on;
    PlotCart2(F_PATRONES,real(ER_PATRONES(SELECT_PATRONES,:)),(imag(ER_PATRONES(SELECT_PATRONES,:))),'*');
    set(handles.edit2,'String','Superponiendo permitividad del patr�n seleccionado');
    legend('Parte real','Parte imaginaria','Parte real','Parte imaginaria'); % funciona esto? S�
    set(handles.edit2,'ForegroundColor',[0.0 0.7 0.0]);
    hold off;
end



% --- Executes during object creation, after setting all properties.
function patrones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to patrones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
