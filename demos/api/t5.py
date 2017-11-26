# This file reimplements gmsh/tutorial/t5.geo in Python.

import gmsh
import math

model = gmsh.model
factory = model.geo

gmsh.initialize([]) #FIXME default args
gmsh.option.setNumber("General.Terminal", 1)

model.add("t5")

lcar1 = .1
lcar2 = .0005
lcar3 = .055

factory.addPoint(0.5,0.5,0.5, lcar2, 1)
factory.addPoint(0.5,0.5,0, lcar1, 2)
factory.addPoint(0,0.5,0.5, lcar1, 3)
factory.addPoint(0,0,0.5, lcar1, 4)
factory.addPoint(0.5,0,0.5, lcar1, 5)
factory.addPoint(0.5,0,0, lcar1, 6)
factory.addPoint(0,0.5,0, lcar1, 7)
factory.addPoint(0,1,0, lcar1, 8)
factory.addPoint(1,1,0, lcar1, 9)
factory.addPoint(0,0,1, lcar1, 10)
factory.addPoint(0,1,1, lcar1, 11)
factory.addPoint(1,1,1, lcar1, 12)
factory.addPoint(1,0,1, lcar1, 13)
factory.addPoint(1,0,0, lcar1, 14)

factory.addLine(8,9, 1);   factory.addLine(9,12, 2)
factory.addLine(12,11, 3); factory.addLine(11,8, 4)
factory.addLine(9,14, 5);  factory.addLine(14,13, 6)
factory.addLine(13,12, 7); factory.addLine(11,10, 8)
factory.addLine(10,13, 9); factory.addLine(10,4, 10)
factory.addLine(4,5, 11);  factory.addLine(5,6, 12)
factory.addLine(6,2, 13);  factory.addLine(2,1, 14)
factory.addLine(1,3, 15);  factory.addLine(3,7, 16)
factory.addLine(7,2, 17);  factory.addLine(3,4, 18)
factory.addLine(5,1, 19);  factory.addLine(7,8, 20)
factory.addLine(6,14, 21); 

factory.addLineLoop([-11,-19,-15,-18], 22)
factory.addPlaneSurface([22], 23)
factory.addLineLoop([16,17,14,15], 24)
factory.addPlaneSurface([24], 25)
factory.addLineLoop([-17,20,1,5,-21,13], 26)
factory.addPlaneSurface([26], 27)
factory.addLineLoop([-4,-1,-2,-3], 28)
factory.addPlaneSurface([28], 29)
factory.addLineLoop([-7,2,-5,-6], 30)
factory.addPlaneSurface([30], 31)
factory.addLineLoop([6,-9,10,11,12,21], 32)
factory.addPlaneSurface([32], 33)
factory.addLineLoop([7,3,8,9], 34)
factory.addPlaneSurface([34], 35)
factory.addLineLoop([-10,18,-16,-20,4,-8], 36)
factory.addPlaneSurface([36], 37)
factory.addLineLoop([-14,-13,-12,19], 38)
factory.addPlaneSurface([38], 39)

shells = []

# When the tag is not specified, a new one is automatically provided
sl = factory.addSurfaceLoop([35,31,29,37,33,23,39,25,27], -1) #FIXME default args
shells.append(sl)

def cheeseHole(x, y, z, r, lc, shells):
    p1 = factory.addPoint(x,  y,  z,   lc, -1) #FIXME default args
    p2 = factory.addPoint(x+r,y,  z,   lc, -1) #FIXME default args
    p3 = factory.addPoint(x,  y+r,z,   lc, -1) #FIXME default args
    p4 = factory.addPoint(x,  y,  z+r, lc, -1) #FIXME default args
    p5 = factory.addPoint(x-r,y,  z,   lc, -1) #FIXME default args
    p6 = factory.addPoint(x,  y-r,z,   lc, -1) #FIXME default args
    p7 = factory.addPoint(x,  y,  z-r, lc, -1) #FIXME default args

    c1 = factory.addCircleArc(p2,p1,p7, -1,0,0,0) #FIXME default args
    c2 = factory.addCircleArc(p7,p1,p5, -1,0,0,0) #FIXME default args
    c3 = factory.addCircleArc(p5,p1,p4, -1,0,0,0) #FIXME default args
    c4 = factory.addCircleArc(p4,p1,p2, -1,0,0,0) #FIXME default args
    c5 = factory.addCircleArc(p2,p1,p3, -1,0,0,0) #FIXME default args
    c6 = factory.addCircleArc(p3,p1,p5, -1,0,0,0) #FIXME default args
    c7 = factory.addCircleArc(p5,p1,p6, -1,0,0,0) #FIXME default args
    c8 = factory.addCircleArc(p6,p1,p2, -1,0,0,0) #FIXME default args
    c9 = factory.addCircleArc(p7,p1,p3, -1,0,0,0) #FIXME default args
    c10 = factory.addCircleArc(p3,p1,p4, -1,0,0,0) #FIXME default args
    c11 = factory.addCircleArc(p4,p1,p6, -1,0,0,0) #FIXME default args
    c12 = factory.addCircleArc(p6,p1,p7, -1,0,0,0) #FIXME default args
    
    l1 = factory.addLineLoop([c5,c10,c4], -1) #FIXME default args
    l2 = factory.addLineLoop([c9,-c5,c1], -1) #FIXME default args
    l3 = factory.addLineLoop([c12,-c8,-c1], -1) #FIXME default args
    l4 = factory.addLineLoop([c8,-c4,c11], -1) #FIXME default args
    l5 = factory.addLineLoop([-c10,c6,c3], -1) #FIXME default args
    l6 = factory.addLineLoop([-c11,-c3,c7], -1) #FIXME default args
    l7 = factory.addLineLoop([-c2,-c7,-c12], -1) #FIXME default args
    l8 = factory.addLineLoop([-c6,-c9,c2], -1) #FIXME default args
    
    s1 = factory.addSurfaceFilling([l1], -1,-1) #FIXME default args
    s2 = factory.addSurfaceFilling([l2], -1,-1) #FIXME default args
    s3 = factory.addSurfaceFilling([l3], -1,-1) #FIXME default args
    s4 = factory.addSurfaceFilling([l4], -1,-1) #FIXME default args
    s5 = factory.addSurfaceFilling([l5], -1,-1) #FIXME default args
    s6 = factory.addSurfaceFilling([l6], -1,-1) #FIXME default args
    s7 = factory.addSurfaceFilling([l7], -1,-1) #FIXME default args
    s8 = factory.addSurfaceFilling([l8], -1,-1) #FIXME default args
    
    sl = factory.addSurfaceLoop([s1, s2, s3, s4, s5, s6, s7, s8], -1) #FIXME default args
    v = factory.addVolume([sl], -1) #FIXME default args
    shells.append(sl)
    return v

x = 0; y = 0.75; z = 0; r = 0.09
for t in range(1, 6):
    x += 0.166 ;
    z += 0.166 ;
    v = cheeseHole(x, y, z, r, lcar3, shells);
    model.addPhysicalGroup(3, [v], t);

factory.addVolume(shells, 186);
      
model.addPhysicalGroup(3, [186], 10);
factory.synchronize()
model.mesh.generate(3)
gmsh.write("t5.msh")

gmsh.finalize()