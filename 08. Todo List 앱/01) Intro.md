# 앱 개요
1. Todo List 중에 Any.do 라는 녀석이 있는데, 이 Any.do의 스타일을 채용한 앱을 만들어볼 예정.
2. Tab Bar Controller로 구성, 각 탭은 Task & Setting.
    + Navigation Controller 와 다름
    + Navigation 은 점진적으로 들어가는 형식이고
    + Tab Bar 는 하단에 탭이 나뉘어져있다. 탭을 누르더라도 화면 전환이 일어나지 않고서 탭과 탭을 이동한다.
3. Task 페이지에서는 해야 할 일들을 관리한다. 각 할 일들은 추가/편집/삭제가 가능하다. 
4. 추가할 때는 input textfield를 통해서(키보드로를 이용해서 값을 입력받음) 할 일을 추가하고, 삭제 및 업데이트(수정)은 각 셀에서 이루어진다.
5. 데이터를 어떻게 앱에 저장할지에 대한 것이 포인트다.

![Intro01](./Intro01.png)

<br><br>

# 데이터 저장 방법
1. NSCoding
2. Property List
3. Serialization
4. Core Data
5. Realm(써드 파티)
...

- 많고(수천개 이상) 복잡한 데이터를 다루기에는 Core Data, Realm이 좋다. 
특히 Core Data는 구현하고 관리하는데에 난이도가 꽤 있기 때문에 초보자들이 사용하려고 할 때 어려움을 많이 겪는다.

- 좀 더(수천개 이하) 적고 덜 복잡한 데이터를 다루기에는 NSCoindg, Property List가 좋다.
NSCoding 같은 경우는 Core Data에 비해 난이도가 낮으나, 여전히 복잡한 구석이 있다.

- Swift4부터 Codable이 나왔는데, NSCoding처럼 데이터의 양이 적고, 데이터가 비교적 간단할 때 적합하다. IT 업계에서 표준처럼 쓰이는 데이터 형태가 JSON인데 이 JSON을 편리하게 다룰 수 있도록 해주는 게 Codable이다.

> 결국은 파일을 관리하는 것이 목적이다.
>
> 앱 내의 데이터를 파일의 형태로 디스크에 저장하고, 이 데이터가 유실되지 않도록 디스크에서 유지하고 관리하는 방법에 대한 것이다.
