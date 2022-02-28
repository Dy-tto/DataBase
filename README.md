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


