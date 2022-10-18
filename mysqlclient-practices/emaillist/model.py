from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor


def conn():
    db = connect(
        db='webdb',
        user='webdb',
        password='webdb',
        host='127.0.0.1',  # 'localhost'
        port=3306,
        charset='utf8')   # MySQL에서는 'utf-8'로 쓰면 오류

    return db


def findall() :
    try:
        # 1.연결
        db = conn()

        # 2. cursor 생성
        cursor = db.cursor(DictCursor)

        # 3. sql(insert문) 실행
        sql = 'select first_name, last_name, email from emaillist order by no desc'
        cursor.execute(sql)

        # 4. 결과 받아오기
        results = cursor.fetchall()

        # 5. 자원 정리
        cursor.close()
        db.close()

        #6. 결과
        return results

    except OperationalError as e:
        print(f'에러 : {e}')


def insert(first_name, last_name, email) :
    try:
        # 1.연결
        db = conn()

        # 2. cursor 생성
        cursor = db.cursor()

        # 3. sql(insert문) 실행
        # sql = f'insert into emaillist values(null,"{first_name}","{last_name}","{email}")'
        # count = cursor.execute(sql)

        sql = 'insert into emaillist values(null,%s,%s,%s)'
        count = cursor.execute(sql, (first_name, last_name, email))

        # 4. commit
        db.commit()

        # 5. 자원 정리
        cursor.close()
        db.close()

        # 6. 결과
        return count == 1

    except OperationalError as e:
        print(f'에러 : {e}')


def deletebyemail(email) :
    try:
        # 1.연결
        db = conn()

        # 2. cursor 생성
        cursor = db.cursor()

        # 3. sql(delete문) 실행
        sql = 'delete from emaillist where email = %s'
        count = cursor.execute(sql, (email,))

        # 4. commit
        db.commit()

        # 5. 자원 정리
        cursor.close()
        db.close()

        # 결과 확인
        return count == 1

    except OperationalError as e:
        print(f'에러 : {e}')
