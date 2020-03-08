byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

travel(X, Y) :- byCar(X, Y).
travel(X, Y) :- byTrain(X, Y).
travel(X, Y) :- byPlane(X, Y).

travel(X, Y) :- byCar(X, Z),
                    travel(Z, Y).
travel(X, Y) :- byTrain(X, Z),
                    travel(Z, Y).
travel(X, Y) :- byPlane(X, Z),
                    travel(Z, Y).


travel(X, Y, car(X, Y)) :- byCar(X, Y).
travel(X, Y, train(X, Y)) :- byTrain(X, Y).
travel(X, Y, plane(X, Y)) :- byPlane(X, Y).

travel(X, Y, car(X, Z, W)) :- byCar(X, Z),
                                travel(Z, Y, W).
travel(X, Y, train(X, Z, W)) :- byTrain(X, Z),
                                travel(Z, Y, W).
travel(X, Y, plane(X, Z, W)) :- byPlane(X, Z),
                                travel(Z, Y, W).