include <BOSL2/std.scad>


// main shell
color("red")
difference() {
    width = 40;
    length = 69;
    full_thickness = 11;
    panel_thickness = 0.865;
    wall_thickness_narrow = 3.6;
    wall_thickness_thicker = 4.3;

    cuboid(size=[width, length, full_thickness], rounding=2,
      edges=[BOTTOM],
      $fn=24
    );
    up(panel_thickness) cuboid(size=[width-wall_thickness_narrow, length-wall_thickness_thicker, full_thickness + 0.1],
        rounding=5,
        edges=[LEFT+BACK, RIGHT+FRONT, LEFT+FRONT, RIGHT+BACK]
    );
};



color("brown")
union() {
    width = 32.5;
    length = 59.5;

    edge_height = 5.75;
    edge_thickness = 2.0;

    //cuboid(size=[width,length,20], chamfer=5, edges=[LEFT+BACK, RIGHT+FRONT, LEFT+FRONT, RIGHT+BACK], anchor=BOTTOM)
    cuboid(size=[width,length,1], anchor=BOTTOM) {
        // circle bit
        diff(remove="cutout")
        tag("supports") position(TOP+BACK) tube(id=30.45, wall=edge_thickness, h=edge_height, anchor=BACK+BOTTOM) {
            attach([TOP]) {
                tag("cutout") back(15) down(1) cuboid(size=[16.5, 10, 10], anchor=BOTTOM);
            };
            position(LEFT) right(4) fwd(2) tag("hole")  tube(id=2.7, wall=1, h=edge_height);
            position(RIGHT) left(4) fwd(2) tag("hole")  tube(id=2.7, wall=1, h=edge_height);
        };
        // supports
        diff(remove="cutout")
        tag("supports") position(TOP+FRONT) {
            cuboid(size=[edge_thickness, 25, edge_height], anchor=FRONT+BOTTOM);
            cuboid(size=[30, edge_thickness, edge_height], anchor=FRONT+BOTTOM)
                attach([TOP]) {
                    tag("cutout") xrot(-6) cuboid(size=[40, 5, 1]);
                };
        };
    };
};
