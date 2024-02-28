<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile version="20200629" creator="FD-Control">
  <MetaGeometryFile filename="model.gex" lod="1"/>
  <SimulationProperties fieldname="e-field (f=7.55) [1]" fieldtype="E-Field" frequency="7.5499999999999998" encoded_unit="&amp;U:V^1.:m^-1" fieldscaling="PEAK" dB_Amplitude="20"/>
  <ResultDataType vector="1" complex="1" timedomain="0"/>
  <SimulationDomain min="-10 -10 -70.4979019" max="10 10 20"/>
  <PlotSettings Plot="4" ignore_symmetry="0" deformation="0" enforce_culling="0" default_arrow_type="ARROWS"/>
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
      <FieldResultFile filename="e-field (#0001)_1(1).m3t" type="m3t"/>
    </Frame>
  </ResultGroups>
</MetaResultFile>
