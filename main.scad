module P() {
    points = [[1, 1], [9, 1], [9, 11], [29, 11], [29, 29], [1, 29], [9, 19], [21, 19], [21, 21], [9, 21]];
    paths = [[0, 1, 2, 3, 4, 5], [6, 7, 8, 9]];
    polygon(points, paths);
}

module S() {
    points = [[1, 1], [29, 1], [29, 19], [9, 19], [9, 21], [29, 21], [29, 29], [1, 29], [1, 11], [21, 11], [21, 9], [1, 9]];
    paths = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]];
    polygon(points, paths);
}

module U() {
    points = [[1, 1], [29, 1], [29, 29], [21, 29], [21, 9], [9, 9], [9, 29], [1, 29]];
    paths = [[0, 1, 2, 3, 4, 5, 6, 7]];
    polygon(points, paths);
}

module A() {
    points = [[1, 1], [9, 1], [9, 11], [21, 11], [21, 1], [29, 1], [29, 29], [1, 29], [9, 19], [21, 19], [21, 21], [9, 21]];
    paths = [[0, 1, 2, 3, 4, 5, 6, 7], [8, 9, 10, 11]];
    polygon(points, paths);
}

module N() {
    translate([30, 30]) rotate(180) U();
}

module plate() {
    translate([0, 0, 0])difference() {
        linear_extrude(1) square(30);
        linear_extrude(2) children();
    }
    
}

projection()
rotate(-atan2(1, sqrt(2)/2), [1, 0, 0])
rotate(45, [0, 0, 1])
union() {
    translate([-30, 0, 0]) rotate(90, [1, 0, 0]) plate() P();
    rotate(120, [1, -1, -1]) plate() S();
    translate([-30, -30, 0]) plate() U();
    translate([-29, 0, -29]) rotate(120, [1, -1, -1]) plate() A();
    translate([-30, -29, -29]) rotate(90, [1, 0, 0]) plate() N();
}