# DB 테이블 명세서

## notepro

### member_info
| Name        | Type          | Null | PK | UQ | DEFAULT        | COMMENT     | FK               |
|-------------|---------------|:----:|:--:|:--:|----------------|-------------|------------------|
| pid         | INT           | X    | O  |    | AUTO_INCREMENT |             |                  |
| oid         | VARCHAR(16)   | X    |    | O  |                | 노출키      |                  |
| id          | VARCHAR(50)   | X    |    | O  |                | 아이디      |                  |
| name        | VARCHAR(50)   | O    |    |    | NULL           | 사용자이름  |                  |
| regdate     | DATETIME      | O    |    |    | NULL           | 등록일      |                  |
| editdate    | DATETIME      | O    |    |    | NULL           | 정보수정일  |                  |
| useyn       | CHAR(1)       | O    |    |    | NULL           | 사용여부    |                  |

### memeber_security
| Name        | Type          | Null | PK | UQ | DEFAULT        | COMMENT     | FK               |
|-------------|---------------|:----:|:--:|:--:|----------------|-------------|------------------|
| pid         | INT           | X    | O  |    | AUTO_INCREMENT |             |                  |
| member_pid  | INT           | X    |    | O  |                | 회원PID     | member_info.pid  |
| password    | VARCHAR(256)  | X    |    |    |                | 비밀번호    |                  |
| regdate     | DATETIME      | O    |    |    | NULL           | 등록일      |                  |

### member_access_log
| Name        | Type          | Null | PK | UQ | DEFAULT        | COMMENT     | FK               |
|-------------|---------------|:----:|:--:|:--:|----------------|-------------|------------------|
| pid         | INT           | X    | O  |    | AUTO_INCREMENT |             |                  |
| member_pid  | INT           | X    |    |    |                | 회원PID     | member_info.pid  |
| access_ip   | VARCHAR(16)   | X    |    |    |                | 비밀번호    |                  |
| type        | INT(2)        | X    |    |    |                | 작업Type    |                  |
| regdate     | DATETIME      | O    |    |    | NULL           | 등록일      |                  |

### project_info
| Name        | Type          | Null | PK | UQ | DEFAULT        | COMMENT     | FK               |
|-------------|---------------|:----:|:--:|:--:|----------------|-------------|------------------|
| pid         | INT           | X    | O  |    | AUTO_INCREMENT |             |                  |
| oid         | VARCHAR(16)   | X    |    | O  |                | 노출키      |                  |
| title       | VARCHAR(200)  | X    |    |    |                | 제목        |                  |
| description | VARCHAR(500)  | O    |    |    | NULL           | 설명        |                  |
| regdate     | DATETIME      | O    |    |    | NULL           | 등록일      |                  |
| editdate    | DATETIME      | O    |    |    | NULL           | 정보수정일  |                  |
| openyn      | CHAR(1)       | O    |    |    | NULL           | 개봉여부    |                  |
| useyn       | CHAR(1)       | O    |    |    | NULL           | 사용여부    |                  |

### project_access
| Name        | Type          | Null | PK | UQ | DEFAULT        | COMMENT     | FK               |
|-------------|---------------|:----:|:--:|:--:|----------------|-------------|------------------|
| pid         | INT           | X    | O  |    | AUTO_INCREMENT |             |                  |
| project_pid | INT           | X    |    |    |                | 프로젝트PID | project_info.pid |
| member_pid  | INT           | X    |    |    |                | 회원PID     | member_info.pid  |
| type        | INT(2)        | X    |    |    |                | 접속Type    |                  |
| regdate     | DATETIME      | O    |    |    | NULL           | 등록일      |                  |

### issue_info
| Name        | Type          | Null | PK | UQ | DEFAULT        | COMMENT     | FK               |
|-------------|---------------|:----:|:--:|:--:|----------------|-------------|------------------|
| pid         | INT           | X    | O  |    | AUTO_INCREMENT |             |                  |
| project_pid | INT           | X    |    |    |                | 프로젝트PID | project_info.pid |
| index       | INT           | X    |    |    |                | issue순번   |                  |
| title       | VARCHAR(200)  | X    |    |    |                | 제목        |                  |
| description | VARCHAR(4000) | O    |    |    | NULL           | 설명        |                  |
| repository  | VARCHAR(400)  | O    |    |    | NULL           | repository  |                  |
| writer      | INT           | X    |    |    |                | 작성자      | member_info.pid  |
| editer      | INT           | O    |    |    | NULL           | 최근수정자  | member_info.pid  |
| regdate     | DATETIME      | O    |    |    | NULL           | 등록일      |                  |
| editdate    | DATETIME      | O    |    |    | NULL           | 수정일      |                  |

### tag_info
| Name        | Type          | Null | PK | UQ | DEFAULT        | COMMENT     | FK               |
|-------------|---------------|:----:|:--:|:--:|----------------|-------------|------------------|
| pid         | INT           | X    | O  |    | AUTO_INCREMENT |             |                  |
| title       | VARCHAR(60)   | X    |    |    |                | 이름        |                  |
| description | VARCHAR(200)  | X    |    |    |                | 설명        |                  |
| project_pid | INT           | X    |    |    |                | 프로젝트PID | project_info.pid |
| regdate     | DATETIME      | O    |    |    | NULL           | 등록일      |                  |
| editdate    | DATETIME      | O    |    |    | NULL           | 수정일      |                  |

### issue_tag
| Name        | Type          | Null | PK | UQ | DEFAULT        | COMMENT     | FK               |
|-------------|---------------|:----:|:--:|:--:|----------------|-------------|------------------|
| pid         | INT           | X    | O  |    | AUTO_INCREMENT |             |                  |
| issue_pid   | INT           | X    |    |    |                | 프로젝트PID | issue_info.pid   |
| project_pid | INT           | X    |    |    |                | 프로젝트PID | tag_info.pid     |
| regdate     | DATETIME      | O    |    |    | NULL           | 등록일      |                  |