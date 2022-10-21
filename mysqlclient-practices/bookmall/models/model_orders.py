from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

def conn() :
    db = connect(
                db='bookmall',
                user = 'bookmall',
                password = 'bookmall',
                host = '127.0.0.1',
                port = 3306,
                charset = 'utf8')
    return db



def insert(member_no,totalprice,address) :
    try :
        # 1.연결
        db = conn()

        # 2. cursor 생성
        cursor = db.cursor()

        # 3. sql(insert문) 실행
        sql = 'insert into orders values(null,%s,%s,%s)'
        count = cursor.execute(sql, (member_no,totalprice,address))

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
        sql = 'select b.name, a.totalprice, a.address from orders a, member b'
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



# def deletebyname(name):   #외래키로 참조되고 있는 상태라서 기본적으로는 못씀 참고용으로 적어놓음
#     try:
#             # 1.연결
#             db = conn()
#
#             # 2. cursor 생성
#             cursor = db.cursor()
#
#             # 3. sql(delete문) 실행
#             sql = 'delete orders where name = %s'
#             count = cursor.execute(sql, (name,))
#
#             # 4. commit
#             db.commit()
#
#             # 5. 자원 정리
#             cursor.close()
#             db.close()
#
#             # 결과 확인
#             return count == 1
#
#     except OperationalError as e:
#             print(f'에러 : {e}')



def orderbookinsert(orders_no,book_no) :
    try :
        # 1.연결
        db = conn()

        # 2. cursor 생성
        cursor = db.cursor()

        # 3. sql(insert문) 실행
        sql = 'insert into orders_book values(null,%s,%s)'
        count = cursor.execute(sql, (orders_no,book_no))

        # 4. commit
        db.commit()

        # 5. 자원 정리
        cursor.close()
        db.close()

        return count == 1

    except OperationalError as e:
        print(f'에러 : {e}')



def orderbookfindall() :
    try:
        # 1.연결
        db = conn()

        # 2. cursor 생성
        cursor = db.cursor(DictCursor)

        # 3. sql(insert문) 실행
        sql = 'select c.title, b.amount, b.amount from orders_book a, cart b, book c where a.book_no = b.book_no and a.book_no = c.no'
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