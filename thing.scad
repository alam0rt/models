include <BOSL2/std.scad>


// main shell
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
intersection() {
    width = 32.5;
    length = 59.5;

    edge_height = 5.75;
    edge_thickness = 2.0;

    cuboid(size=[width,length,1], chamfer=5, edges=[LEFT+BACK, RIGHT+FRONT, LEFT+FRONT, RIGHT+BACK], anchor=BOTTOM) {
        position(TOP+BACK) tube(od=35.0, wall=edge_thickness, h=edge_height, anchor=BACK+BOTTOM);
        position(TOP+FRONT) {
            cuboid(size=[edge_thickness, 25, edge_height], anchor=FRONT+BOTTOM);
            cuboid(size=[30, edge_thickness, edge_height], anchor=FRONT+BOTTOM);
        };
    };
};
