--SQL 작성 : DBeaver 활용 (ORACLE DB)
--SQL 작성시 빈줄이 없도록 할 것 -에러 발생
--TABLE이름이 길 경우 약어를 지칭하여 간편하게 사용 가능 

SELECT 
	 B.AREA_CD
	,B.STD_DE
	,B.MIN_TEMPER
	,B.MAX_TEMPER
-- SUBSTR : VBA의 MID 함수와 동일한 기능 (TEXT, 추출위치, 추출개수)
FROM
	(
	   SELECT SUBSTR(A.STD_DE,5,4) AS MMDD --날짜 DATA에서 월일에 해당하는 글자 추출하기 
		    , MIN(A.MIN_TEMPER) AS MIN_TEMPER 
			, MAX(A.MAX_TEMPER) AS MAX_TEMPER 
		 FROM TB_TEMPER A
		WHERE A.AREA_CD ='108' --지역코드 조회
	      AND A.STD_DE LIKE '____0612'
		GROUP BY SUBSTR(A.STD_DE,5,4)
	) A
	, TB_TEMPER B
WHERE (SUBSTR(B.STD_DE,5,4)=A.MMDD AND B.MIN_TEMPER=A.MIN_TEMPER)
   OR (SUBSTR(B.STD_DE,5,4)=A.MMDD AND B.MAX_TEMPER=A.MAX_TEMPER);

--샘플 연습
--06월12일 DATA 출력
SELECT *
  FROM TB_TEMPER A
 WHERE A.AREA_CD ='108' --지역코드 조회
   AND A.STD_DE LIKE '____0612';

  --06월12일 DATA 데이터 갯수 출력
SELECT COUNT(*) CNT
  FROM TB_TEMPER A
 WHERE A.AREA_CD ='108' --지역코드 조회
   AND A.STD_DE LIKE '____0612';

  --06월12일의 기온중 최저기온 15도이상 최고기온 29도이하 이었던 날 출력
  SELECT *
  FROM TB_TEMPER A
 WHERE A.AREA_CD ='108' --지역코드 조회
   AND A.STD_DE LIKE '____0612'
   AND (A.MIN_TEMPER >=15 AND A.MAX_TEMPER <=29);
