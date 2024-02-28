<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile version="20200629" creator="FD-Control">
  <MetaGeometryFile filename="model.gex" lod="1"/>
  <SimulationProperties fieldname="surface current (f=0.1) [1]" fieldtype="Surface current" frequency="0.10000000000000001" encoded_unit="&amp;U:A^1.:m^-1" fieldscaling="PEAK" dB_Amplitude="20"/>
  <ResultDataType vector="1" complex="1" timedomain="0"/>
  <SimulationDomain min="-10 -10 -70.4979019" max="10 10 20"/>
  <PlotSettings Plot="2" ignore_symmetry="0" deformation="0" enforce_culling="0" default_arrow_type="ARROWS"/>
  <Source type="SOLVER"/>
  <SpecialMaterials>
    <Background type="NORMAL"/>
    <Material name="PEC" type="FIELDFREE"/>
  </SpecialMaterials>
  <Symmetries>
    <SymmetryX type="inverted mirror mirror" offset="0 0 0"/>
    <SymmetryY type="inverted mirror inverted" offset="0 0 0"/>
  </Symmetries>
  <AuxGeometryFile/>
  <AuxResultFile/>
  <FieldFreeNodes/>
  <SurfaceFieldCoefficients/>
  <UnitCell/>
  <SubVolume/>
  <Units/>
  <ResultGroups num_steps="1" transformation="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1">
    <Frame index="0">
      <FieldResultFile filename="h-field (#0004)_1(1).sct" type="sct"/>
    </Frame>
  </ResultGroups>
</MetaResultFile>
