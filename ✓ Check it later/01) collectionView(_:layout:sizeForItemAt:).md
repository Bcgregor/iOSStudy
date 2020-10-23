# 1. collectionView(_:layout:sizeForItemAt:)
Asks the delegate for the size of the specified item’s cell.
Language.

<br>

◼️ Return Value

The width and height of the specified item. Both values must be greater than 0.

<br>

◼️ Discussion ✓

The flow layout does not crop a cell’s bounds to make it fit into the grid. Therefore, the values you return must allow for the item to be displayed fully in the collection view. For example, in a vertically scrolling grid, the width of a single item must not exceed the width of the collection view (minus any section insets) itself. However, in the scrolling direction, items can be larger than the collection view because the remaining content can always be scrolled into view.

--- 
(이 Discussion 부분은 읽어도 이해가 안됨. 번역은 되는데 말이 이해가 안감.)

<br>

◼️ Discussion 번역본

흐름 레이아웃은 그리드에 맞추기 위해 셀의 경계를 자르지 않습니다. 따라서 반환하는 값은 항목이 컬렉션보기에 완전히 표시되도록 허용해야합니다. 예를 들어, 수직으로 스크롤되는 격자에서 단일 항목의 너비는 컬렉션보기의 너비 (섹션 삽입 제외) 자체를 초과해서는 안됩니다. 그러나 스크롤 방향에서는 나머지 콘텐츠를 항상보기로 스크롤 할 수 있으므로 항목이 컬렉션보기보다 클 수 있습니다.