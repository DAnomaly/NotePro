# DB TABLE 구성

## notepro

### members
| Name     | Type         | Null | PK | UQ | DEFAULT        | COMMENT    | FK |
|----------|--------------|------|----|----|----------------|------------|----|
| pid      | INT          | X    | O  |    | AUTO_INCREMENT |            |    |
| id       | VARCHAR(50)  | X    |    | O  |                | 아이디     |    |
| password | VARCHAR(256) | X    |    |    |                | 비밀번호   |    |
| name     | VARCHAR(50)  | O    |    |    | NULL           | 사용자이름 |    |
| regdate  | DATETIME     | O    |    |    | NULL           | 등록일     |    |
| editdate | DATETIME     | O    |    |    | NULL           | 정보수정일 |    |
| useyn    | CHAR(1)      | O    |    |    | NULL           | 사용여부   |    |

### projects
  


### issues