# 3. map(_:) VS compactMap(_:)

## Developer Documentation
map(_:)

Returns an array containing the results of mapping the given closure over the sequence’s elements.

<br> 

compactMap(_:)

Returns an array containing the non-nil results of calling the given transformation with each element of this sequence.

<br>

![mapVScompactMapEx01](./mapVScompactMapEx01.png)

[원문 바로가기](https://hyerios.tistory.com/83)

---
보고 생각하고 내린 결론.
map과 compactMap은 근본은 비슷하나 결과물이 다르다.

대개의 경우 같은 결과물을 리턴하지만, nil 값이 포함되는 경우가 있을 수 있다.

map 과정을 거치는데 String 이었던 녀석들을 Int 로 타입을 바꾸는 과정을 거친다면?

"1", "2" 는 괜찮겠지만 "asdfasf" 는? 후자의 경우에는 nil 값을 리턴하는 것이다.

따라서 map의 결과에 nil이 포함될 것인데,

이런 nil 값을 거르고 표현해주는 고계 함수가 compactMap인 것이다.