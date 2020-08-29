card_size = 90;
cards_height = 24;
wall_thin = 2;

//top();
bottom();

module top()
{
    difference() 
    {
        top_part();
        
        my_text(-43,15,"github.com/");
        my_text(-43,-5,"format37/");
        my_text(-43,-25,"Spot-It");
    }
}

module my_text(x,y,text)
{
    translate([x,y,2]) 
    linear_extrude(4)
    text(text,12);
}

module top_part()
{
    outer(card_size+wall_thin*2,wall_thin);
    for (i=[0:1])
    {
        rotate([0,0,i*45])
        inner(card_size-1,wall_thin);
    }
}

module bottom()
{
    difference()
    {
        outer(card_size+wall_thin*2,cards_height+wall_thin*2);
        for (i=[0:1])
        {
            rotate([0,0,i*45])
            inner(card_size,cards_height);
        }
    }
}

module outer(s,h)
{
    for (i=[0:1])
    {
        rotate([0,0,i*45])
        cube([s,s,h],center = true);
    }
}

module inner(s,h)
{
    translate([0,0,wall_thin])
    cube([s,s,h],center = true);
}