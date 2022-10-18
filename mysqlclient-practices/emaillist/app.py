#input()의 기본
#name = input('이름 : ')
#message = f'안녕하세요 {name}님'
#print(message)

from emaillist import model

def run_list() :
    results = model.findall()
    for index, result in enumerate(results):  # index를 쓰려면 enumerate()를 갖고와야함
        print(f'{index + 1} : {result["first_name"]}{result["last_name"]} : {result["email"]}')


def run_add() :
    # 입력
    firstname = input('first name : ')
    lastname = input('last name : ')
    email = input('email : ')

    # 처리
    model.insert(firstname, lastname, email)

    # 출력
    run_list()


def main() :
    while True :
        cmd = input('(l)ist, (a)dd, (d)elete, (q)uit > ')

        if cmd == 'l' :
            run_list()

        elif cmd == 'a' :
            run_add()

        elif cmd == 'd' :
            model.delete()

        elif cmd == 'q' :
            print("종료")
            break

        else :
            print("알 수없는 명령입니다.")



if __name__ == '__main__' :
    main()