module full_clip(){
    /* lower rectangle */
    translate([0,-0.2,-2.5]) cube([60,20,0.5], true);
    /* higher tilted rectangle minus the 2 windows */
    difference(){
        translate([0,-0.4,0]) rotate([-10,0,0]) cube([60,20.2,0.5], true);
        translate([-19.5,-1.2,3]) rotate([65,0,0]) cylinder(16,3.5,3.5,true);
        translate([19.5,-1.2,3]) rotate([65,0,0]) cylinder(16,3.5,3.5,true);
    /* connecting cylinder */
    }
    translate([0,0.5,0]) rotate([55.5,0,0])
    difference(){
        rotate([0,90,0]) cylinder(60,11,11,true);
        rotate([0,90,0]) cylinder(20,12,12,true);
        translate([0,1,0]) rotate([0,90,0]) cylinder(62,11.5,11.5,true);
        translate([0,0,-7.7]) cube([62,22,30], true);
    }
}

module pole(){
    translate([0,-9,-2.5]) cylinder(5,1.6,1.6,$fn=60);
    Dpole();
        color([1,0,0])
    translate([0,-8.9,57], $fn=60) sphere(2);
}
module Dpole(){
    color([0.4,1,0.7])
    difference(){
        translate([0,-9,-2.5]) cylinder(60,1,1,$fn=60);
        translate([-1,-10,22.49]) cube([2,0.5,37]);
    }
}
module spring(){
    rotate(a=5, v=[0,1,0])
    rotate_extrude(angle=180,$fn=100)
    translate([1.32,0,0])
    circle(r=0.3, $fn=50);
    
    translate([0,0,0.413])
    rotate(a=-13,v=[0,1,0])
    rotate_extrude(angle=180,$fn=100)
    translate([-1.32,0,0])
    circle(r=0.3,$fn=50);
    
    for (i=[1:52]) {
        translate([0,0,i*0.815])
        union(){
            rotate(a=5, v=[0,1,0])
            rotate_extrude(angle=180,$fn=100)
            translate([1.32,0,0])
            circle(r=0.3, $fn=50);
            
            translate([0,0,0.408])
            rotate(a=-13,v=[0,1,0])
            rotate_extrude(angle=180,$fn=100)
            translate([-1.32,0,0])
            circle(r=0.3,$fn=50);
        }
    }
}
module top(){
    difference(){
        color([1,0,0])
        translate([0,-12,46.8]) polygon(points=[[-10,0],[10,0],[10,7.5],[5,7.5],[5,22],[-5,22],[-5,7.5],[-10,7.5],[-10,0]], paths=[[0,1,2,3,4,5,6,7,8]]);
    Dpole();
    }
}

module knives(){
    translate([0,5,44.8]) cube([10,10,3],true);
}

difference(){
    color([0.4,0.4,0.4]) full_clip(); 
    translate([0,0,-0.1]) rotate([-10,0,0]) cube([18,22,0.6], true);
}
pole();
color([0,0.5,1])translate([0,-9,2.9]) spring();
top();
knives();
