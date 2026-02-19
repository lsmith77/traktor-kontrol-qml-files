import CSI 1.0

Module
{
  id: module
  property bool cancelMultiSelection: false
  property int currentlySelectedFx: SelectedChannelFX.None
  property string surface: ""

  readonly property string surfacePrefix: surface + ".mixer.channel_fx"
  property bool momentaryButtons: false

  // Mixer Effects Color Scheme
  readonly property variant colorScheme: [
    Color.LightOrange,  // Filter
    Color.Red,          // FX1
    Color.Green,        // FX2
    Color.Blue,         // FX3
    Color.Yellow        // FX4
  ]

   // Channel FX selection
  ChannelFX
  {
    id: channel1
    active: true
    name: "channel1"
    surface_mixer_channel: module.surface + ".mixer.channels.1"
    index: 1
    onFxChanged : { module.cancelMultiSelection = true; }
    channelFxSelectorVal: module.currentlySelectedFx
    momentary: module.momentaryButtons
  }

  ChannelFX
  {
    id: channel2
    active: true
    name: "channel2"
    surface_mixer_channel: module.surface + ".mixer.channels.2"
    index: 2
    onFxChanged : { module.cancelMultiSelection = true; }
    channelFxSelectorVal: module.currentlySelectedFx
    momentary: module.momentaryButtons
  }

  ChannelFX
  {
    id: channel3
    active: true
    name: "channel3"
    surface_mixer_channel: module.surface + ".mixer.channels.3"
    index: 3
    onFxChanged : { module.cancelMultiSelection = true; }
    channelFxSelectorVal: module.currentlySelectedFx
    momentary: module.momentaryButtons
  }

  ChannelFX
  {
    id: channel4
    active: true
    name: "channel4"
    surface_mixer_channel: module.surface + ".mixer.channels.4"
    index: 4
    onFxChanged : { module.cancelMultiSelection = true; }
    channelFxSelectorVal: module.currentlySelectedFx
    momentary: module.momentaryButtons
  }

  function onFxSelectReleased(fxSelection)
  {
    if (!module.cancelMultiSelection)
    {
      channel1.selectedFx.value = fxSelection;
      channel2.selectedFx.value = fxSelection;
      channel3.selectedFx.value = fxSelection;
      channel4.selectedFx.value = fxSelection;
    }
    if (module.currentlySelectedFx == fxSelection)
      module.currentlySelectedFx = SelectedChannelFX.None;
  }

  function onFxSelectPressed(fxSelection)
  {
    module.cancelMultiSelection = (module.currentlySelectedFx != SelectedChannelFX.None);
    module.currentlySelectedFx = fxSelection;
  }

  function isFxUsed(index)
  {
    return channel1.selectedFx.value == index ||
           channel2.selectedFx.value == index ||
           channel3.selectedFx.value == index ||
           channel4.selectedFx.value == index;
  }

  function ledBrightness(on)
  {
    return on ? 1.0 : 0.0;
  }

  Wire
  {
    from: surfacePrefix + ".filter";
    to: ButtonScriptAdapter
    {
      onPress :
      {
        onFxSelectPressed(SelectedChannelFX.Filter)
      }
      onRelease :
      {
        onFxSelectReleased(SelectedChannelFX.Filter);
      }
      color: module.colorScheme[0]
      brightness: ledBrightness(isFxUsed(SelectedChannelFX.Filter))
    }
  }
  Wire
  {
    from: surfacePrefix + ".fx1";
    to: ButtonScriptAdapter
    {
      onPress :
      {
        onFxSelectPressed(SelectedChannelFX.FX1)
      }
      onRelease :
      {
        onFxSelectReleased(SelectedChannelFX.FX1);
      }
      color: module.colorScheme[1]
      brightness: ledBrightness(isFxUsed(SelectedChannelFX.FX1))
    }
  }
  Wire
  {
    from: surfacePrefix + ".fx2";
    to: ButtonScriptAdapter
    {
      onPress :
      {
        onFxSelectPressed(SelectedChannelFX.FX2)
      }
      onRelease :
      {
        onFxSelectReleased(SelectedChannelFX.FX2);
      }
      color: module.colorScheme[2]
      brightness: ledBrightness(isFxUsed(SelectedChannelFX.FX2))
    }
  }
  Wire
  {
    from: surfacePrefix + ".fx3";
    to: ButtonScriptAdapter
    {
      onPress :
      {
        onFxSelectPressed(SelectedChannelFX.FX3)
      }
      onRelease :
      {
        onFxSelectReleased(SelectedChannelFX.FX3);
      }
      color: module.colorScheme[3]
      brightness: ledBrightness(isFxUsed(SelectedChannelFX.FX3))
    }
  }
  Wire
  {
    from: surfacePrefix + ".fx4";
    to: ButtonScriptAdapter
    {
      onPress :
      {
        onFxSelectPressed(SelectedChannelFX.FX4)
      }
      onRelease :
      {
        onFxSelectReleased(SelectedChannelFX.FX4);
      }
      color: module.colorScheme[4]
      brightness: ledBrightness(isFxUsed(SelectedChannelFX.FX4))
    }
  }

  // Channel FX Amount
  Wire { from: module.surface + ".mixer.channels.1.channel_fx.amount"; to: DirectPropertyAdapter { path: "app.traktor.mixer.channels.1.fx.adjust" } }
  Wire { from: module.surface + ".mixer.channels.2.channel_fx.amount"; to: DirectPropertyAdapter { path: "app.traktor.mixer.channels.2.fx.adjust" } }
  Wire { from: module.surface + ".mixer.channels.3.channel_fx.amount"; to: DirectPropertyAdapter { path: "app.traktor.mixer.channels.3.fx.adjust" } }
  Wire { from: module.surface + ".mixer.channels.4.channel_fx.amount"; to: DirectPropertyAdapter { path: "app.traktor.mixer.channels.4.fx.adjust" } }
}
