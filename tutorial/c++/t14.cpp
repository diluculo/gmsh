// This file reimplements gmsh/tutorial/t14.geo in Python.

// Homology computation in Gmsh finds representative chains of (relative)
// (co)homology space bases using a mesh of a model.  The representative basis
// chains are stored in the mesh as physical groups of Gmsh, one for each chain.

#include <gmsh.h>
#include <math.h>
#include <algorithm>

namespace factory = gmsh::model::geo;

int main(int argc, char **argv)
{
  gmsh::initialize(argc, argv);
  gmsh::option::setNumber("General.Terminal", 1);

  gmsh::model::add("t14");

  double m = 0.5; // mesh characteristic length
  double h = 2; // geometry height in the z-direction

  gmsh::model::geo::addPoint(0, 0, 0, m, 1);
  gmsh::model::geo::addPoint(10, 0, 0, m, 2);
  gmsh::model::geo::addPoint(10, 10, 0, m, 3);
  gmsh::model::geo::addPoint(0, 10, 0, m, 4);

  gmsh::model::geo::addPoint(4, 4, 0, m, 5);
  gmsh::model::geo::addPoint(6, 4, 0, m, 6);
  gmsh::model::geo::addPoint(6, 6, 0, m, 7);
  gmsh::model::geo::addPoint(4, 6, 0, m, 8);

  gmsh::model::geo::addPoint(2, 0, 0, m, 9);
  gmsh::model::geo::addPoint(8, 0, 0, m, 10);
  gmsh::model::geo::addPoint(2, 10, 0, m, 11);
  gmsh::model::geo::addPoint(8, 10, 0, m, 12);

  gmsh::model::geo::addLine(1, 9, 1);
  gmsh::model::geo::addLine(9, 10, 2);
  gmsh::model::geo::addLine(10, 2, 3);

  gmsh::model::geo::addLine(2, 3, 4);
  gmsh::model::geo::addLine(3, 12, 5);
  gmsh::model::geo::addLine(12, 11, 6);

  gmsh::model::geo::addLine(11, 4, 7);
  gmsh::model::geo::addLine(4, 1, 8);
  gmsh::model::geo::addLine(5, 6, 9);

  gmsh::model::geo::addLine(6, 7, 10);
  gmsh::model::geo::addLine(7, 8, 11);
  gmsh::model::geo::addLine(8, 5, 12);

  gmsh::model::geo::addCurveLoop({6, 7, 8, 1, 2, 3, 4, 5}, 13);
  gmsh::model::geo::addCurveLoop({11, 12, 9, 10}, 14);
  gmsh::model::geo::addPlaneSurface({13, 14}, 15);

  std::vector<std::pair<int, int> > ext_tags;
  gmsh::model::geo::extrude({{2,15}}, 0, 0, h, ext_tags);

  // Create physical groups, which are used to define the domain of the
  // (co);homology computation and the subdomain of the relative (co);homology
  // computation.

  // Whole domain
  int domain_tag = 1;
  int domain_physical_tag = 1001;
  gmsh::model::addPhysicalGroup(3,{domain_tag}, domain_physical_tag);
  gmsh::model::setPhysicalName(3, domain_physical_tag, "Whole domain");

  // Four "terminals" of the model
  std::vector<int> terminal_tags = {36, 44, 52, 60};
  int terminals_physical_tag = 2001;
  gmsh::model::addPhysicalGroup(2, terminal_tags, terminals_physical_tag);
  gmsh::model::setPhysicalName(2, terminals_physical_tag, "Terminals");

  // Find domain boundary tags
  std::vector<std::pair<int, int> > boundary_dimtags;
  gmsh::model::getBoundary({{3, domain_tag}}, boundary_dimtags, false, false);

  std::vector<int> boundary_tags, complement_tags;
  for(auto it = boundary_dimtags.begin(); it != boundary_dimtags.end(); ++it) {
    complement_tags.push_back(it->second);
    boundary_tags.push_back(it->second);
  }
  for(auto it = terminal_tags.begin(); it != terminal_tags.end(); ++it) {
    auto it2 = std::find(complement_tags.begin(), complement_tags.end(), *it);
    if(it2 != complement_tags.end()) complement_tags.erase(it2);
  }

  // Whole domain surface
  int boundary_physical_tag = 2002;
  gmsh::model::addPhysicalGroup(2, boundary_tags, boundary_physical_tag);
  gmsh::model::setPhysicalName(2, boundary_physical_tag, "Boundary");

  // Complement of the domain surface respect to the four terminals
  int complement_physical_tag = 2003;
  gmsh::model::addPhysicalGroup(2, complement_tags, complement_physical_tag);
  gmsh::model::setPhysicalName(2, complement_physical_tag, "Complement");

  gmsh::model::geo::synchronize();

  // Find bases for relative homology spaces of the domain modulo the four
  // terminals
  gmsh::model::mesh::computeHomology({domain_physical_tag},
                                     {terminals_physical_tag},
                                     {0,1,2,3});

  // Find homology space bases isomorphic to the previous bases: homology spaces
  // modulo the non-terminal domain surface, a.k.a the thin cuts
  gmsh::model::mesh::computeHomology({domain_physical_tag},
                                     {complement_physical_tag},
                                     {0,1,2,3});

  // Find cohomology space bases isomorphic to the previous bases: cohomology
  // spaces of the domain modulo the four terminals, a.k.a the thick cuts
  gmsh::model::mesh::computeCohomology({domain_physical_tag},
                                       {terminals_physical_tag},
                                       {0,1,2,3});

  // More examples:
  // gmsh::model::mesh::computeHomology();
  // gmsh::model::mesh::computeHomology({domain_physical_tag});
  // gmsh::model::mesh::computeHomology({domain_physical_tag},
  //                                    {boundary_physical_tag},
  //                                     {0,1,2,3});

  // Generate the mesh and perform the requested homology computations
  gmsh::model::mesh::generate(3);

  gmsh::fltk::run();
  gmsh::finalize();
  return 0;
}
