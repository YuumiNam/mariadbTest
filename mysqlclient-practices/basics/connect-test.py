from MySQLdb import connect, OperationalError

#연결
try :
    db = connect(
            db='webdb',
            user = 'webdb',
            password = 'webdb',
            host = '127.0.0.1', #'localhost'
            port = 3306,
            charset = 'utf8') #MySQL에서는 'utf-8'로 쓰면 오류
    print("연결성공")
except OperationalError as e:
    print(f'에러 : {e}')

