from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

def conn() :
    db = connect(
                user = 'bookmall',
                password = 'bookmall',
                host = '127.0.0.1',
                port = 3306,
                db = 'bookmall',
                charset = 'utf8')
    return db

def insert(book_number,member_nunber,amount) :
    try :
        # 1.연결
        db = conn()

        # 2. cursor 생성
        cursor = db.cursor()

        # 3. sql(insert문) 실행
        sql = 'insert into cart values(null,%s,%s,%s)'
        count = cursor.execute(sql, (book_number,member_nunber,amount))

        # 4. commit
        db.commit()

        # 5. 자원 정리
        cursor.close()
        db.close()

        return count == 1

    except OperationalError as e:
        print(f'에러 : {e}')

def findall() :
    try:
        # 1.연결
        db = conn()

        # 2. cursor 생성
        cursor = db.cursor(DictCursor)

        # 3. sql(insert문) 실행
        sql = 'select a.title, b.name , c.amount from book a, member b, cart c where a.no = c.book_no and b.no = c.member_no'
        cursor.execute(sql)

        # 4. 결과 받아오기
        results = cursor.fetchall()

        # 5. 자원 정리
        cursor.close()
        db.close()

        # 결과 확인
        return results

    except OperationalError as e:
        print(f'에러 : {e}')


def deletebyname(name):
    try:
            # 1.연결
            db = conn()

            # 2. cursor 생성
            cursor = db.cursor()

            # 3. sql(delete문) 실행
            sql = 'delete cart where name = %s'
            count = cursor.execute(sql, (name,))

            # 4. commit
            db.commit()

            # 5. 자원 정리
            cursor.close()
            db.close()

            # 결과 확인
            return count == 1

    except OperationalError as e:
            print(f'에러 : {e}')