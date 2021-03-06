CREATE TABLE T_TINYINT (
  RID INTEGER DEFAULT '0' NOT NULL,
  DUMMY TINYINT DEFAULT NULL,  
  PRIMARY KEY (RID)
);

CREATE TABLE T_SMALLINT (
  RID INTEGER DEFAULT '0' NOT NULL,
  DUMMY SMALLINT DEFAULT NULL,  
  PRIMARY KEY (RID)
);

CREATE TABLE T_INTEGER (
  RID INTEGER DEFAULT '0' NOT NULL,
  DUMMY INTEGER DEFAULT NULL,  
  PRIMARY KEY (RID)
);

CREATE TABLE T_BIGINT (
  RID INTEGER DEFAULT '0' NOT NULL,
  DUMMY BIGINT DEFAULT NULL,  
  PRIMARY KEY (RID)
);

CREATE TABLE T_FLOAT (
  RID INTEGER DEFAULT '0' NOT NULL,
  DUMMY FLOAT DEFAULT NULL,  
  PRIMARY KEY (RID)
);

CREATE TABLE T_DECIMAL (
  RID INTEGER DEFAULT '0' NOT NULL,
  DUMMY DECIMAL DEFAULT NULL,  
  PRIMARY KEY (RID)
);

CREATE TABLE T_STRING (
  RID INTEGER DEFAULT '0' NOT NULL,
  DUMMY VARCHAR(1000) DEFAULT NULL,  
  PRIMARY KEY (RID)
);

CREATE TABLE T_TIMESTAMP (
  RID INTEGER DEFAULT '0' NOT NULL,
  DUMMY TIMESTAMP DEFAULT NULL,  
  PRIMARY KEY (RID)
);

