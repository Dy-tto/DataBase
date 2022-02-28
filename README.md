DataBase
========
Database 요약 정리
----------------

# SELECT
## SELECT 문의 기본 문법
### SQL문 작성 규칙
  1. 대소문자를 구별하지 않는다.
  2. 한 줄 또는 여러 줄로 작성할 수 있다.
  3. 들여쓰기로 가독성을 높인다.
  4. 명령어를 대문자로 작성하고 나머지를 소문자로 작성해서 가독성을 높인다.

* SQL문 작성 규칙
<img width="374" alt="스크린샷 2022-02-28 오후 2 37 18" src="https://user-images.githubusercontent.com/59719632/155930154-9253354f-0bf2-4c56-9f78-ba31bd824492.png">

### 전체 데이터 조회하기
```mysql
SELECT *
FROM employees;
```

### 원하는 열만 조회하고 정렬하기
```mysql
SELECT employee_id, first_name, last_name
FROM employees;
```
* ORDER BY
ORDER BY 명령문을 사용하면 행에 대해 정렬 순서를 지정할 수 있다.

<img width="616" alt="스크린샷 2022-02-28 오후 2 48 03" src="https://user-images.githubusercontent.com/59719632/155930912-b775d019-921d-47e5-9c4d-d33b5591d839.png">

```mysql
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;
```
### 중복된 출력 값 제거하기
SQL 연산이나 보고서를 작성할 때 데이터 값의 행이 중복되었다면 중복된 데이터를 제거해야 한다.
이 때 DISTINCT 명령어를 사용한다.
* DISTINCT
```mysql
SELECT DISTINCT job_id
FROM employees;
```

### SQL문을 효율적으로 작성하기 위해 별칭(Alias) 사용하기
원래 명명된 열 이름 외에 열 이름으로 임의로 바꿔 쓰고자 할 때 별칭을 사용한다.
* AS
  - AS는 열 이름을 임시로 변경하는데 사용한다.
  - AS 접속사는 생략할 수 있다.
  - 별칭에 공백, 특수문자, 대소문자 등을 사용하려면 "Emp Id" 처럼 큰따옴표 ""로 묶어서 사용한다.

```mysql
SELECT employee_id AS eid, first_name AS fn, last_name AS ln
FROM employees;
```

### 데이터 값 연결하기
각 열에 따로 담겨 있는 데이터 값을 하나로 붙이거나 추가 수식을 붙여 출력할 때 || 연산자를 사용한다.
* 연결 연산자 ||
<img width="251" alt="스크린샷 2022-02-28 오후 3 07 02" src="https://user-images.githubusercontent.com/59719632/155932824-3466effa-a29d-48cb-a798-d39ddb7c7c9f.png">

```mysql
SELECT employee_id,
       first_name || ' ' || last_name,
       email || '@' || 'company.com'
FROM employees;
```
<img width="509" alt="스크린샷 2022-02-28 오후 3 11 00" src="https://user-images.githubusercontent.com/59719632/155933237-b3a650f3-f49c-4ac3-b34f-676e430b5f83.png">

### 산술 처리하기 : 데이터 값끼리 계산
* 산술 연산자
  - \+
  - \-
  - \*
  - /
```mysql
SELECT employee_id, salary, salary+500, salary-100, (salary*1.1)/2
FROM employees;
```
<img width="441" alt="스크린샷 2022-02-28 오후 3 15 00" src="https://user-images.githubusercontent.com/59719632/155933584-af61a84b-91dd-45f6-8aeb-a3dc9a7dd34d.png">


