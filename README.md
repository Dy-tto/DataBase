DataBase
========
Database 요약 정리
----------------

# 1. SELECT
## 1-1. SELECT 문의 기본 문법
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

## 1-2. WHERE 조건 절을 활용한 데이터 검색
### WHERE 절의 주요 특징
* WHERE 절을 사용하여 조회하려는 조건을 지정할 수 있다.
* WHERE 절은 FROM 절 다음에 위치한다.
* 수행될 조건 절에는 다음을 쓸 수 있다.
  - 비교 연선자
  - SQL 연산자
  - 논리 연산자
  - 열 이름
  - 표현식
  - 숫자
  - 문자
  - etc...
<img width="349" alt="스크린샷 2022-02-28 오후 3 27 01" src="https://user-images.githubusercontent.com/59719632/155934935-13a0d244-8b51-4d2a-bfb9-91d81e4eaf81.png">
<img width="443" alt="스크린샷 2022-02-28 오후 3 21 20" src="https://user-images.githubusercontent.com/59719632/155934241-dfdf0a56-2aeb-409a-98ca-0d109b1e6e20.png">
<img width="625" alt="스크린샷 2022-02-28 오후 3 28 43" src="https://user-images.githubusercontent.com/59719632/155935031-8d124157-f24f-4b06-b6f6-13c470016bfa.png">

연산자의 우선순위는 다음과 같다.
* 괄호 > 부정 연산 > 비교 연산 > SQL 연산 순으로 처리
* 논리 연산자는 NOT, AND, OR 순으로 처리
연산자의 순서는 데이터 조회 속도에 영향을 줄 수 있다.

### 비교 연산자 : 비교 조회 조건 주기
<img width="621" alt="스크린샷 2022-02-28 오후 3 30 05" src="https://user-images.githubusercontent.com/59719632/155935173-e01ac039-558b-47b4-91b9-8b2d13816aa1.png">

### SQL 연산자 : 조회 조건 확장하기

<img width="627" alt="스크린샷 2022-02-28 오후 3 30 59" src="https://user-images.githubusercontent.com/59719632/155935273-4cea8c5c-898f-4849-8861-03233cf8f8a0.png">

* BETWEEN
```mysql
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000; # salary가 10,000 이상이고 20,000 이하인 정보 출력
```
* IN
```mysql
SELECT *
FROM employees
WHERE salary IN (10000, 17000, 24000); # 리스트 (10000, 17000, 24000) 안에 있는 값과 같은 값을 가진 정보 출력
```
* LIKE
  - LIKE 연산자는 %와 _ 같은 기호 연산자(wild card)와 함께 사용한다.
  - 조건에는 문자나 숫자를 포함할 수 있다.
  - %는 '모든 문자'라는 의미고, \_는 '한 글자'라는 의미이다.
```mysql
SELECT *
FROM employees
WHERE job_id LIKE 'AD%'; # AD라는 문자로 시작하면서 그 뒤로 모든 문자(%)를 포함하는 데이터 출력
```
<img width="625" alt="스크린샷 2022-02-28 오후 3 39 46" src="https://user-images.githubusercontent.com/59719632/155936198-9cde1f9e-615f-4be1-9337-371d91844dc6.png">

* IS NULL
IS NULL 연산자는 데이터 값이 null인 경우를 조회하고자 할 때 사용한다.
```mysql
SELECT *
FROM employees
WHERE manager_id IS NULL; # manager_id가 null 값인 정보 출력
```
### 논리 연산자 : 조건 논리를 계속 연결하기
* 논리 연산자의 종류
  - AND
  - OR
  - NOT
```mysql
SELECT *
FROM employees
WHERE salary > 4000
      AND job_id='IT_PROG'
      OR  job_id='FI_ACCOUNT';
```

# 2. Function
