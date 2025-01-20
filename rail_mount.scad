length = 20;
slot_width = 6.4;
rail_width = 8.8;


module rail_holder(){
    union(){
        
        cube([slot_width,length,6.1]);
        
        translate([0-((20-slot_width)/2),0,6.1]){
            cube([20,length,6]);
        }
        //side piece
        translate([0-((20-slot_width)/2)-3,0,-10]){
            cube([3,length,22.1]);
        }
        //side piece
        translate([20-((20-slot_width)/2),0,-10]){
            cube([3,length,22.1]);
        }
        //rail holder
        union(){
            translate([0-((20-slot_width)/2)-3,2.5,9.1]){
                 difference(){
                    cube([20,15,15]);
                        translate([3,(15-rail_width)/2,8]){
                            cube([20,rail_width,10]);
                        }
                    
                }
            }
            translate([0-((20-slot_width)/2),2.5+(15-rail_width)/2,22.1]){
                cube([17,1,1]);
            }
            translate([0-((20-slot_width)/2),13.4,22.1]){
                cube([17,1,1]);
            }
        }
    }    
}

module slope(){
    linear_extrude(36){
        polygon(points=[[0,0],[0,10],[6,0]]);
    }
}

module bearing_block(){
    difference(){    
            cube([36,26,11]);
            translate([3,3,0]){
                cube([29.8,19.8,3]);
            }
    }
}

module plate_holder(){
    difference(){
        cube([140,30,5]);
        translate([10,10,0]){
            cylinder(5,3.5,3.5);
        }
        translate([70,10,0]){
            cylinder(5,3.5,3.5);
        }
        translate([130,10,0]){
            cylinder(5,3.5,3.5);
        }
    }
    //translate([0,30,-6]){
    //    bearing_block();
    //}
    translate([0,30,-6]){
        bearing_block();
    }
    translate([36,30,0]){
        rotate([180,90,0]){
            slope();
        }
    }
    
    translate([104,30,-6]){
        bearing_block();
    }
    translate([140,30,0]){
        rotate([180,90,0]){
            slope();
        }
    }
    
    
}

//you need 2 of these
plate_holder();

//and 4 of these
//bearing_block();
   
    
