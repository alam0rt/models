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
      edges=[TOP],
      $fn=24
    );
    down(panel_thickness) cuboid(size=[width-wall_thickness_narrow, length-wall_thickness_thicker, full_thickness + 0.1],
        rounding=5,
        edges=[LEFT+BACK, RIGHT+FRONT, LEFT+FRONT, RIGHT+BACK]
    );
};

difference() {
    width = 32.5;
    length = 59.5;
    raised_edge_height = 5.75;
    thickness = 0.865;
    edge_thickness = 3.45;
    cuboid(size=[edge_thickness,60,raised_edge_height]);
    cuboid(size=[width,length,1], chamfer=5, edges=[LEFT+BACK, RIGHT+FRONT, LEFT+FRONT, RIGHT+BACK], anchor=BOTTOM);
};