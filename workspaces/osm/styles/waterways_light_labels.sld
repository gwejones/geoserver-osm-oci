<?xml version="1.0" encoding="UTF-8"?><sld:StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:sld="http://www.opengis.net/sld" xmlns:gml="http://www.opengis.net/gml" xmlns:ogc="http://www.opengis.net/ogc" version="1.0.0">
  <sld:NamedLayer>
    <sld:Name>Default Styler</sld:Name>
    <sld:UserStyle>
      <sld:Name>Default Styler</sld:Name>
      <sld:FeatureTypeStyle>
        <sld:Rule>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>type</ogc:PropertyName>
              <ogc:Literal>river</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:MaxScaleDenominator>150000.0</sld:MaxScaleDenominator>
          <sld:TextSymbolizer>
            <sld:Label>
              <ogc:PropertyName>name</ogc:PropertyName>
            </sld:Label>
            <sld:Font>
              <sld:CssParameter name="font-family">Noto Sans Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Adlam Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Adlam Unjoined Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Armenian Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Balinese Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Bamum Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Batak Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Bengali UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Buginese Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Buhid Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Canadian Aboriginal Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Chakma Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Cham Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Cherokee Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Coptic Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Devanagari UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Ethiopic Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Georgian Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Gujarati UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Gurmukhi UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Hanunoo Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Hebrew Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Javanese Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Kannada UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Kayah Li Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Khmer UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Lao UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Lepcha Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Limbu Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Lisu Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Malayalam UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Mandaic Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Mongolian Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Myanmar UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans New Tai Lue Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans NKo Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Ol Chiki Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Oriya UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Osage Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Osmanya Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Samaritan Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Saurashtra Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Shavian Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Sinhala UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Sinhala Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Sundanese Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Symbols Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Symbols2 Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Syriac Eastern Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Tagalog Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Tagbanwa Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Tai Le Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Tai Tham Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Tai Viet Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Tamil UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Telugu UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Thaana Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Thai UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Tibetan</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Tifinagh Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Vai Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Yi Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Sans Arabic UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Emoji Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Noto Naskh Arabic UI Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">DejaVu Sans Book</sld:CssParameter>
              <sld:CssParameter name="font-family">HanaMinA Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">HanaMinB Regular</sld:CssParameter>
              <sld:CssParameter name="font-family">Unifont Medium</sld:CssParameter>
              <sld:CssParameter name="font-family">unifont Medium</sld:CssParameter>
              <sld:CssParameter name="font-family">Unifont Upper Medium</sld:CssParameter>
              <sld:CssParameter name="font-size">12</sld:CssParameter>
              <sld:CssParameter name="font-style">italic</sld:CssParameter>
              <sld:CssParameter name="font-weight">normal</sld:CssParameter>
            </sld:Font>
            <sld:Halo>
              <sld:Radius>1.5</sld:Radius>
              <sld:Fill>
                <sld:CssParameter name="fill">#F2F2F0</sld:CssParameter>
                <sld:CssParameter name="fill-opacity">0.7</sld:CssParameter>
              </sld:Fill>
            </sld:Halo>
            <sld:Fill>
              <sld:CssParameter name="fill">
                <ogc:Function name="darken">
                  <ogc:Literal>#CAD2D3</ogc:Literal>
                  <ogc:Literal>0.4</ogc:Literal>
                </ogc:Function>
              </sld:CssParameter>
            </sld:Fill>
            <sld:Priority>2400</sld:Priority>
            <sld:VendorOption name="followLine">true</sld:VendorOption>
            <sld:VendorOption name="repeat">400</sld:VendorOption>
            <sld:VendorOption name="group">true</sld:VendorOption>
            <sld:VendorOption name="labelAllGroup">true</sld:VendorOption>
          </sld:TextSymbolizer>
        </sld:Rule>
      </sld:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</sld:StyledLayerDescriptor>

