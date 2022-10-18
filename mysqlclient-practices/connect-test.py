from MySQLdb import connect, OperationalError


try :
    #연결
    db = connect(
            user = 'webdb',
            password = 'webdb',
            host = '127.0.0.1', #'localhost'
            port = 3306,
            db = 'webdb',
            charset = 'utf8') #MySQL에서는 'utf-8'로 쓰면 오류
    print("success")
except OperationalError as e:
    print('error!!!!')

print('end!!!')

#cursor 생성
#cursor = db.cursor()