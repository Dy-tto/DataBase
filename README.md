DataBase
========
Database 요약 정리
----------------

# 1. SELECT
## 1-1. SELECT 문의 기본 문법
### 1) SQL문 작성 규칙
  1. 대소문자를 구별하지 않는다.
  2. 한 줄 또는 여러 줄로 작성할 수 있다.
  3. 들여쓰기로 가독성을 높인다.
  4. 명령어를 대문자로 작성하고 나머지를 소문자로 작성해서 가독성을 높인다.

* SQL문 작성 규칙
<img width="374" alt="스크린샷 2022-02-28 오후 2 37 18" src="https://user-images.githubusercontent.com/59719632/155930154-9253354f-0bf2-4c56-9f78-ba31bd824492.png">

### 2) 전체 데이터 조회하기
```mysql
SELECT *
FROM employees;
```

### 3) 원하는 열만 조회하고 정렬하기
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
### 4) 중복된 출력 값 제거하기
SQL 연산이나 보고서를 작성할 때 데이터 값의 행이 중복되었다면 중복된 데이터를 제거해야 한다.
이 때 DISTINCT 명령어를 사용한다.
* DISTINCT
```mysql
SELECT DISTINCT job_id
FROM employees;
```

### 5) SQL문을 효율적으로 작성하기 위해 별칭(Alias) 사용하기
원래 명명된 열 이름 외에 열 이름으로 임의로 바꿔 쓰고자 할 때 별칭을 사용한다.
* AS
  - AS는 열 이름을 임시로 변경하는데 사용한다.
  - AS 접속사는 생략할 수 있다.
  - 별칭에 공백, 특수문자, 대소문자 등을 사용하려면 "Emp Id" 처럼 큰따옴표 ""로 묶어서 사용한다.

```mysql
SELECT employee_id AS eid, first_name AS fn, last_name AS ln
FROM employees;
```

### 6) 데이터 값 연결하기
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

### 7) 산술 처리하기 : 데이터 값끼리 계산
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
### 1) WHERE 절의 주요 특징
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

### 2) 비교 연산자 : 비교 조회 조건 주기
<img width="621" alt="스크린샷 2022-02-28 오후 3 30 05" src="https://user-images.githubusercontent.com/59719632/155935173-e01ac039-558b-47b4-91b9-8b2d13816aa1.png">

### 3) SQL 연산자 : 조회 조건 확장하기

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
### 4) 논리 연산자 : 조건 논리를 계속 연결하기
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
## 2-1. 함수란?
* 함수를 사용하는 목적
  - 데이터 값을 계산하거나 조작한다.(단일 행 함수)
  - 행의 그룹에 대해 계산하거나 요약한다.(그룹 함수)
  - 열의 데이터 타입을 변환한다.

함수에는 단일 행 함수와 그룹 함수가 있는데 차이점은 다음과 같다.
<img width="628" alt="스크린샷 2022-02-28 오후 3 53 26" src="https://user-images.githubusercontent.com/59719632/155937758-005eda1e-a8e5-4749-9877-62b7369e89df.png">
* 단일 행 함수는 한 번에 하나의 데이터를 처리한다.
* 그룹 함수는 여러 건의 데이터를 동시에 처리한다.

## 2-2. 단일 행 함수
테이블의 열은 한 가지 데이터 타입으로 지정되어 있으며 지정된 데이터 타입과 일치하는 데이터 값만 저장할 수 있다.
<img width="624" alt="스크린샷 2022-02-28 오후 3 56 20" src="https://user-images.githubusercontent.com/59719632/155938063-14feb0f9-cc00-4808-beee-072c9a364675.png">

단일 행 함수란 테이블에 존재하는 많은 행이 한 번에 하나씩 함수에 입력되어 하나씩 처리되는 함수이다.
* 단일 행 함수의 특징은 다음과 같다.
  - 각 행에 대해 수행한다.
  - 데이터 타입에 맞는 함수를 사용해야 한다.
  - 행별로 하나의 결과를 반환한다.
  - SELECT, WHERE, ORDER BY 절 등에서 사용할 수 있다.
  - 함수 속의 함수처럼 중첩해서 사용할 수 있다.
  - 중첩해서 사용할 경우 가장 안쪽 단계에서 바깥쪽 단계순으로 처리된다.

### 1) 문자 타입 함수
문자나 문자열 데이터는 작은따옴표('')로 묶어서 문자 타입으로 표현한다.

* LOWER, UPPER, INITCAP : 데이터 값을 대소문자로 변환
  - LOWER : 데이터 값을 소문자로 변환
  - UPPER : 데이터 값을 대문자로 변환
  - INITCAP : 데이터 값의 첫 번째 문자만 대문자로 변환

<img width="614" alt="스크린샷 2022-02-28 오후 4 01 40" src="https://user-images.githubusercontent.com/59719632/155938622-5d9e5abe-bf7a-426d-8da0-620b91607773.png">

```mysql
SELECT last_name,
       LOWER(last_name) AS LOWER적용,
       UPPER(last_name) AS UPPER적용,
       email,
       INITCAP(email) AS INITCAP적용
FROM employees;
```
<img width="503" alt="스크린샷 2022-02-28 오후 4 05 03" src="https://user-images.githubusercontent.com/59719632/155938995-aadde574-abe8-4b93-b554-2d3ec1c1a731.png">

* SUBSTR : 지정한 길이만큼 문자열 추출하기
  - 일부 문자열을 잘라내 가공해야할 때 사용한다. 특정 부분의 위치와 길이를 지정하여 추출할 수 있다.
<img width="608" alt="스크린샷 2022-02-28 오후 4 05 33" src="https://user-images.githubusercontent.com/59719632/155939051-aab52dd3-e311-41ae-a535-300a20855068.png">

```mysql
SELECT job_id, SUBSTR(job_id, 1, 2) AS 적용결과
FROM employees;
```
<img width="253" alt="스크린샷 2022-02-28 오후 4 06 44" src="https://user-images.githubusercontent.com/59719632/155939215-31011105-4088-445b-946b-5269ccf1e3e8.png">

* REPLACE : 특정 문자를 찾아 바꾸기
  - REPLACE는 특정 문자열을 찾아 바꾸는 함수이다. 
<img width="606" alt="스크린샷 2022-02-28 오후 4 08 10" src="https://user-images.githubusercontent.com/59719632/155939366-14452072-eb8c-4761-ab09-e527e3bea13e.png">

```mysql
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') AS 적용결과
FROM employees;
```
<img width="254" alt="스크린샷 2022-02-28 오후 4 09 32" src="https://user-images.githubusercontent.com/59719632/155939553-b474fd5e-971c-459a-b279-04d811178967.png">

* LPAD, RPAD : 특정 문자로 자릿수 채우기
  - LPAD는 왼쪽부터 특정 문자로 자릿수를 채우는 함수이고, RPAD는 오른쪽부터 특정 문자로 자릿수를 채우는 함수이다.
  - 데이터 값의 자릿수를 맞추어야 할 때 유용하다.
<img width="554" alt="스크린샷 2022-02-28 오후 4 18 12" src="https://user-images.githubusercontent.com/59719632/155940600-a7b83bb7-360b-44f1-9f17-ca829c105b29.png">

```mysql
SELECT first_name, LPAD(first_name, 12, '*') AS LPAD적용결과
FROM employees;
```
<img width="260" alt="스크린샷 2022-02-28 오후 4 19 23" src="https://user-images.githubusercontent.com/59719632/155940746-d6ad5ca0-465c-41cd-8370-182960a90d62.png">

* LTRIM, RTRIM : 특정 문자 삭제하기
  - LTRIM은 왼쪽부터, RTRIM은 오른쪽부터 지정한 문자를 지우는 함수이다.
<img width="583" alt="스크린샷 2022-02-28 오후 4 20 57" src="https://user-images.githubusercontent.com/59719632/155940938-d6830156-7d43-4417-a8e9-ac0a6cbcf8be.png">

```mysql
SELECT job_id,
       LTRIM(job_id, 'F') AS LTRIM적용결과,
       RTRIM(job_id, 'T') AS RTRIM적용결과
FROM employees;
```
<img width="317" alt="스크린샷 2022-02-28 오후 4 21 06" src="https://user-images.githubusercontent.com/59719632/155941085-68187a97-3f2d-48ba-8ab1-d51cc4132283.png">

* TRIM : 공백 제거하기
  - TRIM 함수는 공백을 제거할 때 사용한다. 단, 문자열 중간에 있는 공백은 제거할 수 없다.
  - TRIM('문자열' or 열 이름)

### 2) 숫자 타입 함수
* ROUND : 숫자 반올림하기
<img width="624" alt="스크린샷 2022-02-28 오후 4 26 06" src="https://user-images.githubusercontent.com/59719632/155941566-fdba80d3-b3db-47a7-9d7a-856e048edb82.png">

* TRUNC : 숫자 버림하기
<img width="610" alt="스크린샷 2022-02-28 오후 4 28 10" src="https://user-images.githubusercontent.com/59719632/155941707-38aa646a-414a-4613-905b-69ad6ffb465f.png">

### 3) 날짜 타입 함수
* 날짜 연산 규칙
  - 날짜에 숫자를 더하거나 빼면 날짜 결과를 출력한다.
  - 날짜에서 날짜를 빼면 두 날짜 사이의 일수를 출력한다.
  - 날짜에 시간을 더하거나 빼려면 시간을 24로 나누어서 더하거나 뺀다.

* MONTHS_BETWEEN : 두 날짜 사이의 개월 수 계산하기
  - MONTHS_BETWEEN(날짜, 날짜)

* ADD_MONTHS : 월에 날짜 더하기
  - ADD_MONTHS(날짜, 숫자)
  - 결과는 날짜 타입으로 출력된다.

* NEXT_DAY : 돌아오는 요일의 날짜 계산하기
  - NEXT_DAY(날짜, '요일' or '숫자')

* LAST_DAY : 돌아오는 월의 마지막 날짜 계산하기
  - LAST_DAY(날짜)

* ROUND, TRUNC : 날짜를 반올림하거나 버림하기
  - ROUND or TRUNC(날짜, 지정 값)

```mysql
SELECT hire_data,
       ROUND(hire_data, 'MONTH') AS 적용결과_ROUND_M,
       ROUND(hire_data, 'YEAR') AS 적용결과_ROUND_Y,
       TRUNC(hire_data, 'MONTH') AS 적용결과_TRUNC_M,
       TRUNC(hire_data, 'YEAR') AS 적용결과_TRUNC_Y
FROM employees
WHERE employee_id BETWEEN 100 AND 106;
```
<img width="628" alt="스크린샷 2022-02-28 오후 4 42 03" src="https://user-images.githubusercontent.com/59719632/155943499-7d3ec3b3-f94f-4779-80eb-13ecc76886c3.png">

### 4) 변환 함수
