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

module skew(s=1) {
    multmatrix([
        [cos(30), 0, 0, 0],
        [s*sin(30), 1, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1]
    ]) children();
}

module shape() {
    polygon([
        [0, 30 + 30 * sin(30)],
        [30 * cos(30), 30],
        [30 * cos(30), -30],
        [0, -30 - 30 * sin(30)],
        [-30 * cos(30), -30],
        [-30 * cos(30), 30],
    ]);
}

difference() {
    shape();
    translate([-30 * cos(30), 0]) skew() P();
    translate([0, 30 * sin(30)]) skew(-1) S();
    translate([0, -30 * sin(30)]) rotate(60) skew(-1) U();
    translate([-30 * cos(30), -60 * sin(30)]) skew(-1) A();
    translate([0, -90 * sin(30)]) skew() N();
}
