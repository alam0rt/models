include <BOSL2/std.scad>


// main shell
module shell() {
    width = 40;
    length = 69;
    full_thickness = 11;
    panel_thickness = 0.865;
    wall_thickness_narrow = 3.6;
    wall_thickness_thicker = 4.3;
    edge_height = 5.75 + 20;
    edge_thickness = 2.0;

    tag("shell") difference() {
        cuboid(size=[width, length, full_thickness], rounding=2,edges=[BOTTOM],$fn=24);
        up(panel_thickness) cuboid(size=[width-wall_thickness_narrow, length-wall_thickness_thicker, full_thickness + 0.1],
            rounding=5,
            edges=[LEFT+BACK, RIGHT+FRONT, LEFT+FRONT, RIGHT+BACK]
        );
    };

    // circle bit
    diff(remove="cutout")
    tag("supports") back(13) down((full_thickness/2)-0.1) tube(id=30.45, wall=edge_thickness, h=edge_height, anchor=BOTTOM) {
        align(TOP,overlap=1) back(14) tag("cutout") cuboid(size=[16.5, 10, 10]);
        align(LEFT,shiftout=-2,inside=true) fwd(3) tag("hole")  tube(id=2.7, wall=2, h=edge_height);
        align(RIGHT,shiftout=-2,inside=true) fwd(3) tag("hole")  tube(id=2.7, wall=2, h=edge_height);
        attach(FRONT,BOTTOM,overlap=0.1) tag("support") cuboid(size=[edge_thickness, edge_height, 25-edge_thickness], anchor=FRONT)
        align(TOP,overlap=0.1) tag("support") cuboid(size=[25, edge_height, edge_thickness], anchor=FRONT)
            attach(TOP) back(edge_height/2) tag("cutout") xrot(-100) cuboid(size=[40, 10, 2]);
    };
};

shell();
