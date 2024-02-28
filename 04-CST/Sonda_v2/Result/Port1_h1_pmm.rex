<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile version="20200629" creator="FE Port mode solver">
  <MetaGeometryFile filename="" lod="1"/>
  <SimulationProperties fieldname="Port1 h1" fieldtype="H-Field" frequency="0" encoded_unit="&amp;U:A^1.:m^-1" quantity="h-field" fieldscaling="PEAK" dB_Amplitude="20"/>
  <ResultDataType vector="1" complex="1" timedomain="0"/>
  <SimulationDomain min="0 0 0" max="0 0 0"/>
  <PlotSettings Plot="1" ignore_symmetry="0" deformation="0" enforce_culling="0" default_arrow_type="ARROWS">
    <Plane normal="0 0 1" distance="-60.5709991"/>
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
  <ResultGroups num_steps="13" transformation="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1">
    <Frame index="0" characteristic="15">
      <FieldResultFile filename="Port1_h1(#0000).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="1" characteristic="7.5499999999999998">
      <FieldResultFile filename="Port1_h1(#0001).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="2" characteristic="11.275">
      <FieldResultFile filename="Port1_h1(#0002).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="3" characteristic="3.8250000000000002">
      <FieldResultFile filename="Port1_h1(#0003).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="4" characteristic="0.10000000000000001">
      <FieldResultFile filename="Port1_h1(#0004).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="5" characteristic="11.543200000000001">
      <FieldResultFile filename="Port1_h1(#0005).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="6" characteristic="10.5449">
      <FieldResultFile filename="Port1_h1(#0006).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="7" characteristic="14.523200000000003">
      <FieldResultFile filename="Port1_h1(#0007).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="8" characteristic="1.6645000000000001">
      <FieldResultFile filename="Port1_h1(#0008).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="9" characteristic="14.8361">
      <FieldResultFile filename="Port1_h1(#0009).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="10" characteristic="13.957000000000001">
      <FieldResultFile filename="Port1_h1(#0010).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="11" characteristic="5.5832000000000006">
      <FieldResultFile filename="Port1_h1(#0011).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
    <Frame index="12" characteristic="2.782">
      <FieldResultFile filename="Port1_h1(#0012).sct" type="sct" meshname="Port1.slim"/>
    </Frame>
  </ResultGroups>
</MetaResultFile>
