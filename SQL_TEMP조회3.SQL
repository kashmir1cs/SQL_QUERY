--오라클 내장 COLUMN인 ROWNUM 활용
--월별 평균 일교차 값 구하기
SELECT A.MON
	  ,A.DAILY_DIFF --일교차 정의
FROM
(
	SELECT
		   SUBSTR(A.STD_DE,5,2) AS MON --날짜데이터에서 월만 추출
		  ,ROUND(AVG(MAX_TEMPER-MIN_TEMPER),2) AS DAILY_DIFF  --최대온도와 최저온도차이의 평균을 DAILY_DIFF로 정의, FILED 이름만 입력하여도 가능
	  FROM TB_TEMPER A
	 WHERE A.AREA_CD ='108'
	 GROUP BY SUBSTR(A.STD_DE,5,2)
	 ORDER BY DAILY_DIFF DESC
) A
WHERE ROWNUM <=1; --내림차순정렬 후 가장 첫행을 출력하면 가장 큰 값만 출력해주게 된다.
