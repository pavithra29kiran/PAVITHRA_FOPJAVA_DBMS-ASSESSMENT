CREATE TABLE IF NOT EXISTS rating(
RAT_ID INT NOT NULL AUTO_INCREMENT,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY(ORD_ID) references `order` (ORD_ID)
);