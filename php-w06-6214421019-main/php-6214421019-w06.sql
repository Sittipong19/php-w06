--1.แสดงข้อมูลอาจารย์ในคณะ
SELECT * FROM lecturer;

--2.เพิ่มข้อมูลนักศึกษา
INSERT INTO `student`( `std_id`,`std_sid`, `std_fname`, `std_lname`, `std_ttl_id`, `std_prg_id`) VALUES ('1',"6214421021","อโนชา","ปรุงแต่ง",1,2),('2',"6214421005","พชร","แซ่เตียว",1,2),('3',"6214421018","เรเน่","ชมิตท์",1,2),('4',"6214421002","ชาตรี","สุขสอาด",1,2),('5',"6214421028","หัสนัย","กิจเจริญ",1,2);

--3.เพิ่มข้อมูลโครงงานที่เชื่อมโยงกับข้อมูลนักศึกษา
INSERT INTO `project_student`(`pjs_prj_id`, `pjs_std_id`, `pjs_id`) VALUES (1,1,1),(1,2,2),(1,3,3),(2,4,4),(2,5,5);

--4.เพื่มข้อมูลโครงงานที่เชื่อมโยงกับสถานะโครงงาน ประเภทโครงาน และอาจารย์ที่ปรึกษา
INSERT INTO `project` ( `prj_id`,`prj_name_th`, `prj_name_en`, `prj_stt_id`, `prj_ppt_id`, `prj_lct_id`) VALUES (1,'ระบบโปรแกรมออกและตรวจข้อสอบ', NULL, '2', '2', '1'), (2,'ระบบบริหารจัดการข้อมูลผู้เรียนของโรงเรียน', NULL, '1', '2', '3');

--5.เพิ่มข้อมูลโครงงานกับข้อมูลอาจารย์ที่ทำหน้าที่กรรมการสอบ
INSERT INTO `project_lecturer`(`pjl_prj_id`, `pjl_lct_id`, `pjl_id`) VALUES (1,2,1),(1,3,2),(1,4,3),(2,1,4),(2,5,5),(2,2,6);
	
  --6. แสดงข้อมูลว่าอาจารย์แต่ละคนมีนักศึกษาที่ปรึกษากี่คน
SELECT A.prj_name_th,B.lct_fname,B.lct_lname,COUNT(*) FROM project_student as D LEFT OUTER JOIN project as A on D.pjs_prj_id=A.prj_id LEFT outer join lecturer as B on A.prj_lct_id=B.lct_id LEFT OUTER JOIN student as C on D.pjs_std_id=c.std_id GROUP BY D.pjs_prj_id;

--7.แสดงข้อมูลว่ามีนักศึกษาคนใดบ้างที่อยู่ในกระบวนการทำโครงงาน
SELECT D.pjs_id,A.std_fname,A.std_lname,C.prj_name_th,B.pst_name FROM project_student as D left outer join student as A on D.pjs_std_id=A.std_id left outer join project as C on D.pjs_prj_id=C.prj_id left outer join project_status as B on C.prj_stt_id=B.pst_id where B.pst_name="รอพิจารณาหัวข้อ";

--8.แสดงข้อมูลว่ามีนักศึกษาคนใดบ้างที่ที่ทำโครงงานเสร็จแล้ว
SELECT D.pjs_id,A.std_fname,A.std_lname,C.prj_name_th,B.pst_name FROM project_student as D left outer join student as A on D.pjs_std_id=A.std_id left outer join project as C on D.pjs_prj_id=C.prj_id left outer join project_status as B on C.prj_stt_id=B.pst_id where B.pst_name="ผ่านการพิจารณา";
  
