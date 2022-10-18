from MySQLdb import connect, OperationalError


try :
    # 1.연결
    db = connect(
            db='webdb',
            user = 'webdb',
            password = 'webdb',
            host = '127.0.0.1', #'localhost'
            port = 3306,
            charset = 'utf8') #MySQL에서는 'utf-8'로 쓰면 오류

    # 2. cursor 생성
    cursor = db.cursor()

    # 3. sql(insert문) 실행
    sql = 'insert into pet values("초코","이선무","puppy","F","2022-06-18",null)'
    count = cursor.execute(sql)

    # 4. commit
    db.commit()

    # 5. 자원 정리
    cursor.close()
    db.close()

    # 결과 확인
    if count >= 1 :
        print('실행결과 : 성공')
    else :
        print('실행결과 : 실패')
    # print(f'실행결과 : {"성공" if count >= 1 else "실패"}')

except OperationalError as e:
    print(f'에러 : {e}')