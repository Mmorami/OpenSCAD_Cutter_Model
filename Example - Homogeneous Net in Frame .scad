module line(start, end, thickness = 0.1) {
    hull() {
        translate(start) sphere(thickness);
        translate(end) sphere(thickness);
    }
}

difference(){
    minkowski(){
        square(27, true);
        circle(1);
    }

    minkowski(){
        square(23, true);
        circle(1);
    }
}

module onesidenet() {
    st = -12;
    color([0,0,1]) line([-25/2,st,0], [25/2,st,0]);
    for(i=[st:1:-st]){
        translate([0,i,0]) color([0,0,1]) line([-25/2,0,0], [25/2,0,0]);
    }
}

onesidenet();
rotate([0,0,90]) onesidenet();

