# Closure

- 클로저는 이름 없는 펑션(메소드)이다.
- 펑션에서 클로저를 파라미터로 받을 수 있다.

- 클로저는 First Class Type이다.
    - First Class Type?
        - 변수에 할당할 수 있음
        - 메소드에서 인자로 받을 수 있음
        - 리턴할 수 있음
    - 사실, 위 3가지 조건을 만족하면 First Class Citizen(1급 객체)라고 할 수 있다

- 자주 쓰이는 형태
    - Completion Block
        어떤 함수가 끝났을 때 실행되어야 하는 코드 블럭에 클로저를 자주 사용한다는 뜻
    - High Order Functions (고계 함수)
        - Input 으로 함수를 받을 수 있는 유형의 함수
        - 함수를 인자로 넘길 때 클로저를 사용한다
        - 콜렉션에서 주로 확인하게 되는 맵, 필터, 미지수(?)라던지. 이런 게 High Order Function이다.



![ha](./operation1.png)

![ha](./haha.png)


