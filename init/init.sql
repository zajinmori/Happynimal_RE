CREATE TABLE MEMBERGENERAL (
                               ID VARCHAR2(60) PRIMARY KEY,
                               PASSWORD VARCHAR2(200) not null,
                               NAME VARCHAR2(20) not null,
                               NICKNAME VARCHAR2(20) not null,
                               SSN VARCHAR2(14) not null,
                               TELEPHONE VARCHAR2(13) not null,
                               ADDRESS VARCHAR2(300) not null,
                               REGDATE DATE not null,
                               STATUS number(1) CHECK (STATUS = 1) not null,
                               EMAIL VARCHAR2(100) not null
);

CREATE TABLE MEMBERADMIN (
                             ID VARCHAR2(60) PRIMARY KEY,
                             PASSWORD VARCHAR2(200) not null,
                             NAME VARCHAR2(20) not null,
                             TELEPHONE VARCHAR2(30) not null,
                             ADDRESS VARCHAR2(150) not null,
                             nickname varchar2(30) not null,
                             REGDATE DATE not null,
                             STATUS number(1) CHECK (STATUS = 0) not null,
                             EMAIL VARCHAR2(100) not null,
                             SSN VARCHAR2(14) not null
);

CREATE TABLE SHELTER (
                         SEQ NUMBER PRIMARY KEY not null,
                         NAME VARCHAR2(150) not null,
                         TELEPHONE VARCHAR2(13) not null,
                         ADDRESS VARCHAR2(150) not null,
                         WEBADDRESS VARCHAR2(600),
                         LATITUDE NUMBER(20,14) not null,
                         LONGITUDE NUMBER(20,14) not null
);

CREATE TABLE PET2 (
                      ID NUMBER PRIMARY KEY,
                      PETINFO VARCHAR2(100) not null,
                      SEQSHELTERID NUMBER not null,
                      LOCATION VARCHAR2(300) not null,
                      NAME VARCHAR2(30) not null,
                      GENDER CHAR(1) not null,
                      NEUTERED CHAR(1) not null,
                      AGE NUMBER(2) not null,
                      WEIGHT NUMBER(4,1) not null,
                      DETAIL CLOB not null,
                      REGDATE DATE not null,
                      FOREIGN KEY (SEQSHELTERID) REFERENCES SHELTER(SEQ)
);

CREATE TABLE IMAGE (
                       SEQ NUMBER PRIMARY KEY not null,
                       IMAGE VARCHAR2(300) not null
);

CREATE TABLE PET_IMAGE (
                           SEQ NUMBER PRIMARY KEY not null,
                           SEQIMAGE NUMBER not null,
                           SEQPET NUMBER not null,
                           FOREIGN KEY (SEQIMAGE) REFERENCES IMAGE(SEQ),
                           FOREIGN KEY (SEQPET) REFERENCES PET2(ID)
);

CREATE TABLE ADOPTIONAPPLICATION (
                                     SEQ NUMBER PRIMARY KEY not null,
                                     IDMEMBER VARCHAR2(60) not null,
                                     REGDATE DATE not null,
                                     NAME VARCHAR2(20) not null,
                                     GENDER CHAR(1) not null,
                                     AGE NUMBER(2) not null,
                                     TELEPHONE VARCHAR2(13) not null,
                                     EMAIL VARCHAR2(100) not null,
                                     CALLTIME VARCHAR2(20) not null,
                                     region varchar2(50) not null,
                                     JOB VARCHAR2(20) not null,
                                     MARITALSTATUS NUMBER(1) not null,
                                     Q1 NUMBER(1) not null,
                                     q1memo varchar2(1000),
                                     Q2 NUMBER(1) not null,
                                     Q3adult number(1) not null,
                                     Q3minor number(1) not null,
                                     Q4 NUMBER(1) not null,
                                     Q5 NUMBER(1) not null,
                                     Q6memo VARCHAR2(1000) not null,
                                     Q7 NUMBER(1) not null,
                                     Q8 VARCHAR2(1000) not null,
                                     Q9 VARCHAR2(1000) not null,
                                     Q10 VARCHAR2(1000) not null,
                                     Q11 NUMBER(1) not null,
                                     Q12 NUMBER(1) not null,
                                     Q13 VARCHAR2(1000),
                                     SEQPET NUMBER not null,
                                     FOREIGN KEY (IDMEMBER) REFERENCES MEMBERGENERAL(ID),
                                     FOREIGN KEY (SEQPET) REFERENCES PET2(ID)
);

CREATE TABLE RESULT (
                        SEQ NUMBER PRIMARY KEY not null,
                        MEMBERCODE NUMBER not null,
                        MASSCORE NUMBER not null,
                        RESULT VARCHAR2(1000),
                        RECOMMENDED VARCHAR2(100) not null,
                        IMAGE VARCHAR2(255)
);

CREATE TABLE VOLUNTEERBOARD (
                                SEQ NUMBER PRIMARY KEY not null,
                                SHELTER_SEQ NUMBER not null,
                                TITLE VARCHAR2(100) not null,
                                CONTENT VARCHAR2(2000) not null,
                                DATEVOLUNTEERSTART DATE not null,
                                DATEVOLUNTEEREND DATE not null,
                                DATERECRUITSTART DATE not null,
                                DATERECRUITEND DATE not null,
                                REGDATE DATE not null,
                                PERSONNEL NUMBER not null,
                                FOREIGN KEY (SHELTER_SEQ) REFERENCES SHELTER(SEQ)
);


create sequence seqpet2;
create sequence seqPet_Image;
create sequence seqImage;
create sequence seqadoptionapplication;
create sequence seqvolunteerboard;
create sequence seqresult;
create sequence seqimage;
create sequence seqpet_image;
create sequence seqshelter;


INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,1,10,'조용하고 독립적인 성격을 가진 냐옹이를 소개합니다! 차분하고 독립적인 성격이 강하며, 혼자 있는 시간을 잘 보냅니다. 너무 시끄럽거나 요구가 많지 않아요. 주인과의 관계가 매우 안정적이며, 격렬한 활동보다는 평화로운 시간을 즐깁니다.','브리티시 쇼트헤어 (British Shorthair)','1ChatGPT Image 2025년 6월 8일 오후 11_42_08.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,1,10,'조용하고 독립적인 성격을 가진 냐옹이를 소개합니다! 독립적이며 때로는 조금 까칠할 수 있지만, 지나치게 시끄럽거나 집착적인 성격은 아닙니다. 평소에는 혼자서 놀거나 휴식을 취하는 것을 좋아합니다.','벵갈 (Bengal)','2ChatGPT Image 2025년 6월 8일 오후 11_43_36.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,1,10,'조용하고 독립적인 성격을 가진 냐옹이를 소개합니다! 내성적이고 조용한 성격을 가지고 있습니다. 낯선 사람보다는 친숙한 사람과의 관계를 선호하며, 혼자 있는 시간도 잘 견딥니다.','러시안 블루 (Russian Blue)','3ChatGPT Image 2025년 6월 8일 오후 11_44_53.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,1,10,'조용하고 독립적인 성격을 가진 댕댕이를 소개합니다! 독립적이고 고독을 좋아하는 성격입니다. 차우차우는 주인과 가까운 관계를 유지하되, 너무 자주 관심을 요구하지 않습니다. 자신만의 시간이 필요하며, 한 곳에 앉아서 여유롭게 시간을 보내는 것을 선호합니다.','차우차우 (Chow Chow)','4ChatGPT Image 2025년 6월 8일 오후 11_45_58.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,1,10,'조용하고 독립적인 성격을 가진 댕댕이를 소개합니다! 매우 독립적이고 자존심이 강한 강아지로, 주인의 지시를 따르기는 하지만 종종 자신만의 방식으로 행동하려고 합니다. 외출 시에는 활발하게 움직일 수 있지만, 집에서는 차분한 성격을 보입니다.','시바 이누 (Shiba Inu)','5ChatGPT Image 2025년 6월 8일 오후 11_47_24.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,1,10,'조용하고 독립적인 성격을 가진 댕댕이를 소개합니다! 활동적이지만, 독립적인 성격을 가집니다. 특히 주인과의 상호작용보다는 혼자서 시간을 보내는 것을 선호하는 경우가 많습니다. 훈련이 잘 되고, 조용한 성격을 가진 강아지입니다.','웰시 코기 (Welsh Corgi)','6ChatGPT Image 2025년 6월 8일 오후 11_48_39.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,11,20,'애정이 많고 잘 어울리는 냐옹이를 소개합니다! 매우 애정이 많고 사람을 좋아하는 고양이입니다. 주인과 밀접한 관계를 유지하며, 가족과의 상호작용을 즐깁니다. 애정 표현이 풍부하고, 사람과의 상호작용을 좋아합니다.','버먼 (Birman)','7ChatGPT Image 2025년 6월 8일 오후 11_49_39.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,11,20,'애정이 많고 잘 어울리는 냐옹이를 소개합니다! 매우 친근하고 애정이 많으며, 사람과 잘 어울립니다. 사람을 좋아하고, 평소에는 아주 다정한 성격을 보입니다. 또한 매우 고요하고 온순한 성격을 가지고 있어 가정에서 잘 지낼 수 있습니다.','스코티시 폴드 (Scottish Fold)','8ChatGPT Image 2025년 6월 8일 오후 11_50_41.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,11,20,'애정이 많고 잘 어울리는 냐옹이를 소개합니다! 매우 사교적이고 사람과의 상호작용을 좋아하는 고양이입니다. 적극적으로 주인에게 애정을 표현하며, 주인과의 대화와 상호작용을 즐깁니다. 매우 똑똑하고 친근한 성격을 가지고 있습니다.','샴 (Siamese)','9ChatGPT Image 2025년 6월 8일 오후 11_51_51.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,11,20,'애정이 많고 잘 어울리는 댕댕이를 소개합니다! 매우 애정이 많고 사람과 잘 어울리는 강아지입니다. 사람과의 상호작용을 좋아하고, 가족과 잘 지내며, 다소 활발하고 에너지가 넘칩니다. 주인에게 애정을 많이 표현하는 품종입니다.','비글 (Beagle)','10ChatGPT Image 2025년 6월 9일 오전 12_00_28.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,11,20,'애정이 많고 잘 어울리는 댕댕이를 소개합니다! 친근하고 애정이 많은 성격을 가진 중형 강아지입니다. 사람과의 상호작용을 즐기며, 사랑을 많이 표현합니다. 매우 온순하고 가정적이며, 가족과의 시간을 매우 소중하게 여깁니다.','코카 스파니엘 (Cocker Spaniel)','11ChatGPT Image 2025년 6월 9일 오전 12_01_34.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,11,20,'애정이 많고 잘 어울리는 댕댕이를 소개합니다! 매우 애정이 많고 사람을 좋아하는 성격을 가진 강아지입니다. 누구와도 잘 어울리며, 특히 가족들과의 상호작용에서 큰 즐거움을 느낍니다. 충성스럽고, 항상 사람과 함께 시간을 보내고 싶어 합니다.','골든 리트리버 (Golden Retriever)','12ChatGPT Image 2025년 6월 9일 오전 12_02_33.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,21,30,'에너지가 뿜뿜 넘치는 활발한 냐옹이를 소개합니다! 에너지가 넘치고 활동적인 고양이입니다. 사람과의 상호작용을 좋아하고, 호기심이 많아 항상 주인 옆에 붙어 있는 것을 좋아합니다. 놀이를 즐기고, 자주 뛰어다니며 에너지를 소모합니다.','스핑크스 (Sphynx)','13ChatGPT Image 2025년 6월 9일 오전 12_03_33.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,21,30,'에너지가 뿜뿜 넘치는 활발한 냐옹이를 소개합니다! 매우 활발하고 에너지가 넘치는 고양이입니다. 놀이와 탐험을 좋아하며, 사람과의 상호작용을 즐깁니다. 신속하게 움직이고 장난을 좋아하는 성격입니다.','로켓 (Oriental Shorthair)','14ChatGPT Image 2025년 6월 9일 오전 12_04_34.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,21,30,'에너지가 뿜뿜 넘치는 활발한 냐옹이를 소개합니다! 매우 활발하고 호기심이 많은 고양이입니다. 뛰어놀고 탐험하는 것을 좋아하며, 주인과의 상호작용을 즐깁니다. 활동적인 성격 때문에 장난감이나 높은 곳에서 뛰어내리기를 좋아합니다.','아비시니안 (Abyssinian)','15ChatGPT Image 2025년 6월 9일 오전 12_05_47.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,21,30,'에너지가 뿜뿜 넘치는 활발한 댕댕이를 소개합니다! 에너지가 넘치고 매우 지적이며 활동적인 강아지입니다. 꾸준한 운동과 자극을 필요로 하며, 놀이와 훈련을 좋아합니다. 매우 충성스럽고 가족과 함께 활동하는 것을 즐깁니다.','보더 콜리 (Border Collie)','16ChatGPT Image 2025년 6월 9일 오전 12_13_47.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,21,30,'에너지가 뿜뿜 넘치는 활발한 댕댕이를 소개합니다! 에너지가 넘치고 활동적인 성격을 가진 강아지입니다. 뛰어난 운동 능력과 함께 호기심이 많고 활발하게 움직입니다. 사람과의 상호작용을 좋아하고, 운동이 많은 환경에서 잘 지냅니다.','달마시안 (Dalmatian)','17ChatGPT Image 2025년 6월 9일 오전 12_15_02.png');
INSERT INTO Result(seq,minscore,maxscore,result,recommended,image)VALUES(seqResult.nextVal,21,30,'에너지가 뿜뿜 넘치는 활발한 댕댕이를 소개합니다! 매우 활발하고 지적인 강아지로, 운동을 좋아하며 다양한 활동을 즐깁니다. 훈련에 매우 적합하며, 보호자와 함께 일하는 것을 좋아합니다. 또한, 매우 충성스럽고 사람과의 상호작용을 즐깁니다.','저먼 셰퍼드 (German Shepherd)','18ChatGPT Image 2025년 6월 9일 오전 12_16_17.png');
