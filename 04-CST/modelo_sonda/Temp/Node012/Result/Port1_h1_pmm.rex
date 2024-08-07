<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile version="20200629" creator="FE Port mode solver">
  <MetaGeometryFile filename="" lod="1"/>
  <SimulationProperties fieldname="Port1 h1" fieldtype="H-Field" frequency="0" encoded_unit="&amp;U:A^1.:m^-1" fieldscaling="PEAK" dB_Amplitude="20"/>
  <ResultDataType vector="1" complex="1" timedomain="0"/>
  <SimulationDomain min="0 0 0" max="0 0 0"/>
  <PlotSettings Plot="1" ignore_symmetry="0" deformation="0" enforce_culling="0" default_arrow_type="ARROWS">
    <Plane normal="2.68347963e-19 1.83697015e-16 1" distance="-60.5709991"/>
  </PlotSettings>
  <Source type="SOLVER"/>
  <SpecialMaterials>
    <Background type="NORMAL"/>
  </SpecialMaterials>
  <AuxGeometryFile/>
  <AuxResultFile/>
  <FieldFreeNodes/>
  <SurfaceFieldCoefficients/>
  <UnitCell/>
  <SubVolume/>
  <Units>
    <Quantity name="Length" unit="mm" factor="0.001"/>
    <Quantity name="Time" unit="ns" factor="1.0000000000000001e-09"/>
    <Quantity name="Frequency" unit="GHz" factor="1000000000"/>
    <Quantity name="Temperature" unit="K" factor="1"/>
  </Units>
  <ResultGroups num_steps="1" transformation="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1">
    <Frame index="0" characteristic="5">
      <FieldResultFile filename="Port1_h1[5].prt" type="prt" meshname="Port1_h1_pmm.slim"/>
    </Frame>
  </ResultGroups>
</MetaResultFile>
