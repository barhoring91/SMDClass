CREATE TABLE Admins (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
password VARCHAR(30) NOT NULL,
image_link VARCHAR(250),
token VARCHAR(250) NOT NULL,
created_at TIMESTAMP
);

CREATE TABLE Subjects (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
age INT(3) NOT NULL,
gender VARCHAR(1),
right_handed BOOLEAN,
height_cm INT(3),
weight_kg INT(3),
arm_length_cm INT(3),
address VARCHAR(50),
telephone VARCHAR(30),
created_at TIMESTAMP
);

CREATE TABLE Electrodes (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
created_at TIMESTAMP
);

CREATE TABLE Modalities (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
created_at TIMESTAMP
);

CREATE TABLE ClassificationMethods (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
weka_link VARCHAR(500),
created_at TIMESTAMP
);

CREATE TABLE Protocols (
id INT(6) UNSIGNED AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
erp BOOLEAN NOT NULL,
open_eyes BOOLEAN NOT NULL,
modality_id INT UNSIGNED NOT NULL,
created_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (modality_id) REFERENCES Modalities(id)
);

CREATE TABLE FirstOrderFeatureType (
id INT(6) UNSIGNED AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
electrode1_id INT UNSIGNED,
electrode2_id INT UNSIGNED,
start_point INT UNSIGNED,
end_point INT UNSIGNED,
interval_length INT UNSIGNED,
created_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (electrode1_id) REFERENCES Electrodes(id),
FOREIGN KEY (electrode2_id) REFERENCES Electrodes(id)
);

CREATE TABLE SecondOrderFeatureType (
id INT(6) UNSIGNED AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
FO_feature_type1_id INT UNSIGNED,
FO_feature_type2_id INT UNSIGNED,
created_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (FO_feature_type1_id) REFERENCES FirstOrderFeatureType(id),
FOREIGN KEY (FO_feature_type2_id) REFERENCES FirstOrderFeatureType(id)
);

CREATE TABLE ERPFeatures (
id INT(6) UNSIGNED AUTO_INCREMENT,
electrode_id INT UNSIGNED,
FO_feature_type_id INT UNSIGNED,
SO_feature_type_id INT UNSIGNED,
protocol_id INT UNSIGNED,
mean_in_healthy_population VARCHAR(5000),
std_in_healthy_population VARCHAR(5000),
mean_in_smd_population VARCHAR(5000),
std_in_smd_population VARCHAR(5000),
created_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (electrode_id) REFERENCES Electrodes(id),
FOREIGN KEY (FO_feature_type_id) REFERENCES FirstOrderFeatureType(id),
FOREIGN KEY (SO_feature_type_id) REFERENCES SecondOrderFeatureType(id),
FOREIGN KEY (protocol_id) REFERENCES Protocols(id)
);

CREATE TABLE REEGFeatures (
id INT(6) UNSIGNED AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
FO_feature_type_id INT UNSIGNED,
SO_feature_type_id INT UNSIGNED,
mean_in_healthy_population VARCHAR(5000),
std_in_healthy_population VARCHAR(5000),
mean_in_smd_population VARCHAR(5000),
std_in_smd_population VARCHAR(5000),
protocol_id INT UNSIGNED,
created_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (protocol_id) REFERENCES Protocols(id),
FOREIGN KEY (FO_feature_type_id) REFERENCES FirstOrderFeatureType(id),
FOREIGN KEY (SO_feature_type_id) REFERENCES SecondOrderFeatureType(id)
);

CREATE TABLE Models (
id INT(6) UNSIGNED AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
classification_method_id INT UNSIGNED,
patient_IDs VARCHAR(5000),
erp_feature1_id INT UNSIGNED,
erp_feature1_value VARCHAR(500),
erp_feature2_id INT UNSIGNED,
erp_feature2_value VARCHAR(500),
erp_feature3_id INT UNSIGNED,
erp_feature3_value VARCHAR(500),
erp_feature4_id INT UNSIGNED,
erp_feature4_value VARCHAR(500),
erp_feature5_id INT UNSIGNED,
erp_feature5_value VARCHAR(500),
erp_feature6_id INT UNSIGNED,
erp_feature6_value VARCHAR(500),
erp_feature7_id INT UNSIGNED,
erp_feature7_value VARCHAR(500),
erp_feature8_id INT UNSIGNED,
erp_feature8_value VARCHAR(500),
erp_feature9_id INT UNSIGNED,
erp_feature9_value VARCHAR(500),
erp_feature10_id INT UNSIGNED,
erp_feature10_value VARCHAR(500),
matlab_file_link VARCHAR(500),
created_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (classification_method_id) REFERENCES ClassificationMethods(id),
FOREIGN KEY (erp_feature1_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature2_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature3_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature4_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature5_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature6_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature7_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature8_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature9_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature10_id) REFERENCES ERPFeatures(id)
);

CREATE TABLE Evaluations (
id INT(6) UNSIGNED AUTO_INCREMENT,
subject_id INT UNSIGNED NOT NULL,
QOL_score INT,
SRQ_score1 FLOAT,
SRQ_score2 FLOAT,
h1_id INT UNSIGNED,
h1_value FLOAT,
h2_id INT UNSIGNED,
h2_value FLOAT,
h3_id INT UNSIGNED,
h3_value FLOAT,
h4_id INT UNSIGNED,
h4_value FLOAT,
h5_id INT UNSIGNED,
h5_value FLOAT,
h6_id INT UNSIGNED,
h6_value FLOAT,
h7_id INT UNSIGNED,
h7_value FLOAT,
h8_id INT UNSIGNED,
h8_value FLOAT,
h9_id INT UNSIGNED,
h9_value FLOAT,
h10_id INT UNSIGNED,
h10_value FLOAT,
H_value FLOAT,
researchers_name VARCHAR(30),
learning_group BOOLEAN NOT NULL,
smd BOOLEAN NOT NULL,
erp_curry7_raw_data1_link VARCHAR(1000),
erp_curry7_raw_data2_link VARCHAR(1000),
reeg_curry7_raw_data1_link VARCHAR(1000),
reeg_curry7_raw_data2_link VARCHAR(1000),


erp_feature1_id INT UNSIGNED,
erp_feature1_value FLOAT,
erp_feature1_z FLOAT,
erp_feature2_id INT UNSIGNED,
erp_feature2_value FLOAT,
erp_feature2_z FLOAT,
erp_feature3_id INT UNSIGNED,
erp_feature3_value FLOAT,
erp_feature3_z FLOAT,
erp_feature4_id INT UNSIGNED,
erp_feature4_value FLOAT,
erp_feature4_z FLOAT,
erp_feature5_id INT UNSIGNED,
erp_feature5_value FLOAT,
erp_feature5_z FLOAT,
erp_feature6_id INT UNSIGNED,
erp_feature6_value FLOAT,
erp_feature6_z FLOAT,
erp_feature7_id INT UNSIGNED,
erp_feature7_value FLOAT,
erp_feature7_z FLOAT,
erp_feature8_id INT UNSIGNED,
erp_feature8_value FLOAT,
erp_feature8_z FLOAT,
erp_feature9_id INT UNSIGNED,
erp_feature9_value FLOAT,
erp_feature9_z FLOAT,
erp_feature10_id INT UNSIGNED,
erp_feature10_value FLOAT,
erp_feature10_z FLOAT,


reeg_feature1_id INT UNSIGNED,
reeg_feature1_value FLOAT,
reeg_feature2_id INT UNSIGNED,
reeg_feature2_value FLOAT,
reeg_feature3_id INT UNSIGNED,
reeg_feature3_value FLOAT,
reeg_feature4_id INT UNSIGNED,
reeg_feature4_value FLOAT,
reeg_feature5_id INT UNSIGNED,
reeg_feature5_value FLOAT,
reeg_feature6_id INT UNSIGNED,
reeg_feature6_value FLOAT,
reeg_feature7_id INT UNSIGNED,
reeg_feature7_value FLOAT,
reeg_feature8_id INT UNSIGNED,
reeg_feature8_value FLOAT,
reeg_feature9_id INT UNSIGNED,
reeg_feature9_value FLOAT,
reeg_feature10_id INT UNSIGNED,
reeg_feature10_value FLOAT,

comments VARCHAR(255),
created_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (subject_id) REFERENCES Subjects(id),
FOREIGN KEY (h1_id) REFERENCES Models(id),
FOREIGN KEY (h2_id) REFERENCES Models(id),
FOREIGN KEY (h3_id) REFERENCES Models(id),
FOREIGN KEY (h4_id) REFERENCES Models(id),
FOREIGN KEY (h5_id) REFERENCES Models(id),
FOREIGN KEY (h6_id) REFERENCES Models(id),
FOREIGN KEY (h7_id) REFERENCES Models(id),
FOREIGN KEY (h8_id) REFERENCES Models(id),
FOREIGN KEY (h9_id) REFERENCES Models(id),
FOREIGN KEY (h10_id) REFERENCES Models(id),

FOREIGN KEY (erp_feature1_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature2_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature3_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature4_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature5_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature6_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature7_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature8_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature9_id) REFERENCES ERPFeatures(id),
FOREIGN KEY (erp_feature10_id) REFERENCES ERPFeatures(id),

FOREIGN KEY (reeg_feature1_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature2_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature3_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature4_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature5_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature6_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature7_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature8_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature9_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature10_id) REFERENCES REEGFeatures(id)
);

CREATE TABLE Treatments (
id INT(6) UNSIGNED AUTO_INCREMENT,
subject_id INT UNSIGNED NOT NULL,
baseline_level VARCHAR(5000),
nf_param_recording_link VARCHAR(5000),
treatment_score VARCHAR(5000),
stage_in_nf_game VARCHAR(10),
eeg_curry7_raw_data1_link VARCHAR(1000),
eeg_curry7_raw_data2_link VARCHAR(1000),
eeg_curry7_raw_data3_link VARCHAR(1000),
operator_name VARCHAR(255),
modality_id INT UNSIGNED,
tolerances VARCHAR(5000),
researchers_name VARCHAR(30),
reeg_feature1_id INT UNSIGNED,
reeg_feature1_value FLOAT,
reeg_feature2_id INT UNSIGNED,
reeg_feature2_value FLOAT,
reeg_feature3_id INT UNSIGNED,
reeg_feature3_value FLOAT,
reeg_feature4_id INT UNSIGNED,
reeg_feature4_value FLOAT,
reeg_feature5_id INT UNSIGNED,
reeg_feature5_value FLOAT,
reeg_feature6_id INT UNSIGNED,
reeg_feature6_value FLOAT,
reeg_feature7_id INT UNSIGNED,
reeg_feature7_value FLOAT,
reeg_feature8_id INT UNSIGNED,
reeg_feature8_value FLOAT,
reeg_feature9_id INT UNSIGNED,
reeg_feature9_value FLOAT,
reeg_feature10_id INT UNSIGNED,
reeg_feature10_value FLOAT,
reeg_feature11_id INT UNSIGNED,
reeg_feature11_value FLOAT,
reeg_feature12_id INT UNSIGNED,
reeg_feature12_value FLOAT,
reeg_feature13_id INT UNSIGNED,
reeg_feature13_value FLOAT,
reeg_feature14_id INT UNSIGNED,
reeg_feature14_value FLOAT,
reeg_feature15_id INT UNSIGNED,
reeg_feature15_value FLOAT,
reeg_feature16_id INT UNSIGNED,
reeg_feature16_value FLOAT,
reeg_feature17_id INT UNSIGNED,
reeg_feature17_value FLOAT,
reeg_feature18_id INT UNSIGNED,
reeg_feature18_value FLOAT,
reeg_feature19_id INT UNSIGNED,
reeg_feature19_value FLOAT,
reeg_feature20_id INT UNSIGNED,
reeg_feature20_value FLOAT,
comments VARCHAR(255),
created_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (subject_id) REFERENCES Subjects(id),
FOREIGN KEY (modality_id) REFERENCES Modalities(id),
FOREIGN KEY (reeg_feature1_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature2_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature3_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature4_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature5_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature6_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature7_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature8_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature9_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature10_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature11_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature12_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature13_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature14_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature15_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature16_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature17_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature18_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature19_id) REFERENCES REEGFeatures(id),
FOREIGN KEY (reeg_feature20_id) REFERENCES REEGFeatures(id)
);
