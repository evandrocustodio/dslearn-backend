INSERT INTO tb_user (name, email, password) VALUES ('Alex Brown', 'alex@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');
INSERT INTO tb_user (name, email, password) VALUES ('Bob Brown', 'bob@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');
INSERT INTO tb_user (name, email, password) VALUES ('Maria Green', 'maria@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');

INSERT INTO tb_role (authority) VALUES ('ROLE_STUDENT');
INSERT INTO tb_role (authority) VALUES ('ROLE_INSTRUCTOR');
INSERT INTO tb_role (authority) VALUES ('ROLE_ADMIN');

INSERT INTO tb_user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 2);
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 2);
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 3);

INSERT INTO tb_course (name, img_uri, img_gray_uri) VALUES ('HTML','https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/online-3412473_1920_1.jpeg?tz.RfsTe_UTLHiDqxmpG7PY_nTIBjwF7','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc7DfkyjHlYFi0Cvir0-Su0I9AroMuZcBwPg&usqp=CAU');
INSERT INTO tb_course (name, img_uri, img_gray_uri) VALUES ('SPRINGBOOT','https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/online-3412473_1920_1.jpeg?tz.RfsTe_UTLHiDqxmpG7PY_nTIBjwF7','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc7DfkyjHlYFi0Cvir0-Su0I9AroMuZcBwPg&usqp=CAU');
INSERT INTO tb_course (name, img_uri, img_gray_uri) VALUES ('JAVA','https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/online-3412473_1920_1.jpeg?tz.RfsTe_UTLHiDqxmpG7PY_nTIBjwF7','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc7DfkyjHlYFi0Cvir0-Su0I9AroMuZcBwPg&usqp=CAU');

INSERT INTO tb_offer (edition, start_moment,end_moment, course_id) VALUES ('1.0', TIMESTAMP WITH TIME ZONE '2022-05-01T20:50:07.12345Z', TIMESTAMP WITH TIME ZONE '2022-06-30T20:50:07.12345Z', 1);
INSERT INTO tb_offer (edition, start_moment,end_moment, course_id) VALUES ('2.0', TIMESTAMP WITH TIME ZONE '2022-07-01T20:50:07.12345Z', TIMESTAMP WITH TIME ZONE '2022-10-30T20:50:07.12345Z', 1);
INSERT INTO tb_offer (edition, start_moment,end_moment, course_id) VALUES ('3.0', TIMESTAMP WITH TIME ZONE '2022-09-01T20:50:07.12345Z', TIMESTAMP WITH TIME ZONE '2022-12-30T20:50:07.12345Z', 1);

INSERT INTO tb_resource (title, description,position, img_uri, type, offer_id) VALUES ('TRILHA HTML', 'Trilha principal do curso',1,'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/online-3412473_1920_1.jpeg?tz.RfsTe_UTLHiDqxmpG7PY_nTIBjwF7', 1, 1);
INSERT INTO tb_resource (title, description,position, img_uri, type, offer_id) VALUES ('Forum HTML', 'Forum do curso',2,'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/online-3412473_1920_1.jpeg?tz.RfsTe_UTLHiDqxmpG7PY_nTIBjwF7', 2, 1);
INSERT INTO tb_resource (title, description,position, img_uri, type, offer_id) VALUES ('Lives HTML', 'Lives do curso',3,'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/online-3412473_1920_1.jpeg?tz.RfsTe_UTLHiDqxmpG7PY_nTIBjwF7', 3, 1);

INSERT INTO tb_session (title, description,position, img_uri, resource_id, prerequisite_id) VALUES ('CAPITULO 1', 'Neste capítulo vamos iniciar o curso',1,'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/online-3412473_1920_1.jpeg?tz.RfsTe_UTLHiDqxmpG7PY_nTIBjwF7', 1, null);
INSERT INTO tb_session (title, description,position, img_uri, resource_id, prerequisite_id) VALUES ('CAPITULO 2', 'Introdução ao HTML',2,'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/online-3412473_1920_1.jpeg?tz.RfsTe_UTLHiDqxmpG7PY_nTIBjwF7', 1, 1);
INSERT INTO tb_session (title, description,position, img_uri, resource_id, prerequisite_id) VALUES ('CAPITULO 3', 'Exemplos basicos de HTML',3,'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/online-3412473_1920_1.jpeg?tz.RfsTe_UTLHiDqxmpG7PY_nTIBjwF7', 1, 2);
