from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

def findall() :
    try:
        # 1.연결
        db = connect(
            user='webdb',
            password='webdb',
            host='127.0.0.1',  # 'localhost'
            port=3306,
            db='webdb',
            charset='utf8')  # MySQL에서는 'utf-8'로 쓰면 오류

        # 2. cursor 생성
        cursor = db.cursor(DictCursor)

        # 3. sql(insert문) 실행
        sql = 'select first_name, last_name, email from emaillist order by no desc'
        count = cursor.execute(sql)

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
        db = connect(
            user='webdb',
            password='webdb',
            host='127.0.0.1',  # 'localhost'
            port=3306,
            db='webdb',
            charset='utf8')  # MySQL에서는 'utf-8'로 쓰면 오류

        # 2. cursor 생성
        cursor = db.cursor()

        # 3. sql(insert문) 실행
        sql = f'insert into emaillist values(null,"{first_name}","{last_name}","{email}")'
        count = cursor.execute(sql)

        # 4. commit
        db.commit()

        # 5. 자원 정리
        cursor.close()
        db.close()

        # 6. 결과
        return count == 1

    except OperationalError as e:
        print(f'에러 : {e}')


def delete() :
    print("delete 처리")