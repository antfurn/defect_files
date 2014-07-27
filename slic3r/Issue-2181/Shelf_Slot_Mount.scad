$fa= 1;
$fs= 1;


hook_t = 3;
hook_h = 16;
hook_l_h = 10;
hook_l_d = 3;
hook_d = 6;

slot_h = 18;
slot_w = 4;
slot_t = 2.2;
slot_sp_v = 13;
slot_sp_h = 6.5;
slot_sp_v_c2c = slot_sp_v+slot_h;
slot_sp_h_c2c = 15-4;
bar_w = 25;



rotate([0,-90,0])
hook_plate();

difference() {
	translate([0,-6,0])
	cylinder( r=6, h=15 );
	
	translate([0,-6,-1])
	cylinder( r=4, h=17 );
	translate([-8,-12,-1])
	cube([6,10,17]);
	translate([-6,-8,-1])
	cube([6,6,17]);
}




module hook_plate()
{	
	//translate([-15/2,0,0])
	hook_set();
	//translate([-bar_w/2,-3,0])
	translate([0,-2,0])
	cube([15,2,58]);
}


module hook_set()
{	
	// make sure overlap
	translate([0,-0,01,0])
	{
	
	hook();
	translate([slot_sp_h_c2c,0,0])
	hook();
	translate([0,0,slot_sp_v_c2c])
	hook();
	translate([slot_sp_h_c2c,0,slot_sp_v_c2c])
	hook();

	}
}

module hook()
{
	difference()
	{
		cube([hook_t,hook_d,hook_h]);
	
		translate([-1,-1,-1])
		cube([hook_t+2,hook_l_d+1,1+hook_l_h]);
	
		*translate([-1,0,hook_l_h-hook_l_d])
		rotate([0,90,0])
		#cylinder( r = hook_l_d, h = hook_t+2);
	
	} // end diff


}

