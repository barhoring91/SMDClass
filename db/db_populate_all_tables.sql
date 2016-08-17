INSERT INTO Admins (name, password, token) VALUES ('Bar Horing', '12345', 'z17Gs');

SELECT * FROM Admins;

INSERT INTO Subjects 
(name, age, gender, right_handed, height_cm, weight_kg, arm_length_cm, address, telephone) VALUES 
('David Cohen', 30, 'm', 1, 178, 73, 38, '40 Shenkin st. Tel-Aviv', '054-5407404');

SELECT * FROM Subjects;

INSERT INTO Electrodes (name) VALUES ('cz');

SELECT * FROM Electrodes;

INSERT INTO Modalities (name) VALUES ('auditory');

SELECT * FROM Modalities;

INSERT INTO ClassificationMethods (name) VALUES ('LDA');

SELECT * FROM ClassificationMethods;

INSERT INTO Protocols (name, erp, open_eyes, modality_id) VALUES
("Tami's protocol", 1, 1, 1);

SELECT * FROM Protocols;

INSERT INTO Treatments(subject_id, baseline_level,
nf_param_recording_link, treatment_score, stage_in_nf_game,
eeg_curry7_raw_data1_link, eeg_curry7_raw_data2_link,
eeg_curry7_raw_data3_link, operator_name,
modality_id, tolerances, researchers_name,
reeg_feature1_id, reeg_feature1_value, comments
) 

VALUES (1 , 'baseline_level', 'nf_link', 'score', 'stage',
'eeg_link1', 'eeg_link2', 'eeg_link3', 'Bar-Operator', 1, 'tolerances', 'Tami',
 1, 'value', 'a comment'
);

SELECT * FROM Treatments;

INSERT INTO FirstOrderFeatureType(name, electrode1_id) 
VALUES ('AUC Theta', 1);

SELECT * FROM FirstOrderFeatureType;

INSERT INTO SecondOrderFeatureType(name, FO_feature_type1_id, FO_feature_type2_id) 
VALUES ('AUC Theta/AUC Theta', 1, 1);

SELECT * FROM SecondOrderFeatureType;

INSERT INTO ERPFeatures(electrode_id, FO_feature_type_id, SO_feature_type_id,
protocol_id, mean_in_healthy_population, std_in_healthy_population, 
mean_in_smd_population, std_in_smd_population
) 

VALUES (1,1,1, 1,'mean_h', 'std_h', 'mean_smd', 'std_smd');

SELECT * FROM REEGFeatures;

INSERT INTO REEGFeatures(name, FO_feature_type_id, SO_feature_type_id, mean_in_healthy_population, std_in_healthy_population,
mean_in_smd_population, std_in_smd_population, protocol_id) 

VALUES ('a feature',1, 1, 'mean_h', 'std_h', 'mean_smd', 'std_smd', 1);

SELECT * FROM REEGFeatures;

INSERT INTO Models(name, classification_method_id, erp_feature1_id, 
erp_feature2_id, erp_feature3_id, erp_feature4_id, erp_feature5_id, erp_feature6_id,
 erp_feature7_id, erp_feature8_id, erp_feature9_id, erp_feature10_id
)
VALUES ("Gil's model",1, 1, 1, 1,1,1,1,1,1, 1, 1);

SELECT * FROM Models;

INSERT INTO Evaluations(subject_id, QOL_score,
SRQ_score1, SRQ_score2, h1_id,
h1_value, h2_id, h2_value,
h3_id, h3_value, H_value,
researchers_name, erp_curry7_raw_data1_link, erp_curry7_raw_data2_link,
reeg_curry7_raw_data1_link, reeg_curry7_raw_data2_link, erp_feature1_id,
erp_feature1_value, erp_feature10_id, erp_feature10_value,
reeg_feature1_id, reeg_feature1_value, reeg_feature10_id, reeg_feature10_value,
comments
) 

VALUES (1 , 11, 3.9, 7.5, 1, 5.5, 1 , 2.2, 1, 9.6, 23, "Tami",
'e_link1', 'e_link2', 'r_link1', 'r_link2', 1, 5, 1, 9, 1 ,8 , 1, 6, "comment"
);

SELECT * FROM Evaluations;


