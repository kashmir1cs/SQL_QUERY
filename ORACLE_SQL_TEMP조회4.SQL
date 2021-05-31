--가장 일교차가 큰 일자 구하기
--Oracle 내장상수 활용 (ROWNUM)
SELECT A.STD_DE
     , A.DAILY_DIFF
     , A.MAX_TEMPER
     , A.MIN_TEMPER
  FROM
     (
       SELECT A.STD_DE
            , A.MAX_TEMPER-A.MIN_TEMPER AS DAILY_DIFF -- 새로운  변수 정의 : 최고온도 - 최저온도를 일교차로 계산하여 입력
            , A.MAX_TEMPER
            , A.MIN_TEMPER
         FROM TB_TEMPER A --TABLE 약어 정의 
        WHERE A.AREA_CD ='108' 
          AND MAX_TEMPER IS NOT NULL --NULL 값은 제외
          AND MIN_TEMPER IS NOT NULL --NULL 값은 제외
        ORDER BY DAILY_DIFF DESC --내림차순으로 정렬
     ) A
WHERE ROWNUM <=1;

--일부만 연습

   SELECT A.STD_DE
        , A.MAX_TEMPER-A.MIN_TEMPER AS DAILY_DIFF -- 새로운  변수 정의 : 최고온도 - 최저온도를 일교차로 계산하여 입력
        , A.MAX_TEMPER
        , A.MIN_TEMPER
     FROM TB_TEMPER A --TABLE 약어 정의 
    WHERE A.AREA_CD ='108' 
      AND MAX_TEMPER IS NOT NULL --NULL 값은 제외
      AND MIN_TEMPER IS NOT NULL --NULL 값은 제외
    ORDER BY DAILY_DIFF DESC;
    
--NULL값 포함하여 쿼리 실행
--NULL값은 가장 큰 값으로 판별 (ORACLE의 특징)
   SELECT A.STD_DE
        , A.MAX_TEMPER-A.MIN_TEMPER AS DAILY_DIFF -- 새로운  변수 정의 : 최고온도 - 최저온도를 일교차로 계산하여 입력
        , A.MAX_TEMPER
        , A.MIN_TEMPER
     FROM TB_TEMPER A --TABLE 약어 정의 
    WHERE A.AREA_CD ='108' 
    ORDER BY DAILY_DIFF DESC;
