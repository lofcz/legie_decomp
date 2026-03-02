object Form1: TForm1
  Left = 353
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Legie'
  ClientHeight = 502
  ClientWidth = 724
  Color = 2697513
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnMouseUp = FormMouseUp
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 724
    Height = 502
    Cursor = -1
    Camera = kamera
    Buffer.FogEnvironment.FogStart = 10
    Buffer.FogEnvironment.FogEnd = 1000
    Buffer.FogEnvironment.FogMode = fmExp
    Buffer.FogEnvironment.FogDistance = fdEyeRadial
    Buffer.BackgroundColor = clBlack
    Buffer.FogEnable = True
    Buffer.AntiAliasing = aaNone
    Buffer.DepthPrecision = dp16bits
    Buffer.ShadeModel = smSmooth
    FieldOfView = 142.583129882813
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    OnMouseUp = GLSceneViewer1MouseUp
  end
  object GLScene1: TGLScene
    VisibilityCulling = vcObjectBased
    Left = 8
    Top = 48
    object GLskybox1: TGLSkyBox
      Direction.Coordinates = {00000000000080BF0000000000000000}
      Up.Coordinates = {00000000000000000000803F00000000}
      MaterialLibrary = Materialy
      MatNameTop = 'nebe4'
      MatNameLeft = 'nebe2'
      MatNameRight = 'nebe3'
      MatNameFront = 'nebe0'
      MatNameBack = 'nebe1'
      CloudsPlaneOffset = 0.200000002980232
      CloudsPlaneSize = 15
    end
    object DummyCube1: TGLDummyCube
      CubeSize = 1
      object GLhrac: TGLDummyCube
        Direction.Coordinates = {0000803F000000000000000000000000}
        Position.Coordinates = {0000000000000000000000400000803F}
        TurnAngle = 90
        Up.Coordinates = {00000080000000000000803F00000000}
        CubeSize = 1
        object HracSvetlo: TGLLightSource
          ConstAttenuation = 1
          Position.Coordinates = {000000006666A63FCDCCCC3E0000803F}
          LightStyle = lsOmni
          Specular.Color = {0000803F0000803F0000803F0000803F}
          SpotCutOff = 180
        end
        object HracPitch: TGLDummyCube
          CubeSize = 1
          object stit: TGLActor
            Material.Texture.Disabled = False
            Material.TextureEx = <
              item
                TextureIndex = 0
              end>
            VisibilityCulling = vcHierarchical
            Direction.Coordinates = {000000000000803F0000000000000000}
            Up.Coordinates = {0000803F000000800000000000000000}
            AnimationMode = aamBounceBackward
            Interval = 100
          end
          object zbran: TGLActor
            Material.BlendingMode = bmTransparency
            Material.Texture.Disabled = False
            Direction.Coordinates = {000000000000803F0000000000000000}
            Up.Coordinates = {0000803F000000800000000000000000}
            Interval = 100
            MaterialLibrary = Materialy
          end
          object kamera: TGLCamera
            DepthOfView = 40
            FocalLength = 85
            Position.Coordinates = {0000000000000000000000400000803F}
          end
        end
        object statuskamera: TGLCamera
          DepthOfView = 10
          FocalLength = 50
          TargetObject = GLhrac
          Position.Coordinates = {00000040000040C0000080BF0000803F}
          Direction.Coordinates = {000000000000803F0000008000000000}
          Up.Coordinates = {00000000000000000000803F00000000}
        end
      end
      object GLLightSource3: TGLLightSource
        Ambient.Color = {0000803E0000803E0000803E0000803F}
        ConstAttenuation = 0.5
        LightStyle = lsOmni
        Specular.Color = {0000803F0000803F0000803F0000803F}
        SpotCutOff = 180
        SpotDirection.Coordinates = {000000000000803F0000000000000000}
      end
      object GLLightSource2: TGLLightSource
        Ambient.Color = {0000803E0000803E0000803E0000803F}
        ConstAttenuation = 0.5
        LightStyle = lsOmni
        Specular.Color = {0000803F0000803F0000803F0000803F}
        SpotCutOff = 180
        SpotDirection.Coordinates = {000000000000803F0000000000000000}
      end
      object GLLightSource1: TGLLightSource
        Ambient.Color = {0000803E0000803E0000803E0000803F}
        ConstAttenuation = 1
        LightStyle = lsOmni
        Specular.Color = {0000803F0000803F0000803F0000803F}
        SpotCutOff = 180
      end
      object RozhovorSleduj: TGLDummyCube
        Visible = False
        CubeSize = 1
      end
    end
    object DummyCube2: TGLDummyCube
      CubeSize = 1
    end
    object DummyCube3: TGLDummyCube
      CubeSize = 1
    end
    object HUD: TGLDummyCube
      CubeSize = 1
    end
    object HUD2: TGLDummyCube
      CubeSize = 1
    end
    object HUD3: TGLDummyCube
      CubeSize = 1
    end
    object HUD4: TGLDummyCube
      CubeSize = 1
      object denikl: TGLHUDText
        Position.Coordinates = {0000B44200009643000000000000803F}
        Visible = False
        Rotation = 1.5
        Alignment = taLeftJustify
        Layout = tlTop
        ModulateColor.Color = {23DBF93D1283403DA69B443C6666663F}
      end
      object denikp: TGLHUDText
        Position.Coordinates = {0000B44200009643000000000000803F}
        Visible = False
        Rotation = -0.200000002980232
        Alignment = taLeftJustify
        Layout = tlTop
        ModulateColor.Color = {23DBF93D1283403DA69B443C6666663F}
      end
    end
    object HUDInv2: TGLDummyCube
      CubeSize = 1
    end
    object HUDText: TGLDummyCube
      CubeSize = 1
      object kurzorStr: TGLHUDSprite
        Material.BlendingMode = bmTransparency
        Material.MaterialOptions = [moIgnoreFog, moNoLighting]
        Material.Texture.MinFilter = miLinear
        Material.Texture.TextureMode = tmReplace
        Material.Texture.FilteringQuality = tfAnisotropic
        Material.Texture.Disabled = False
        Material.MaterialLibrary = Materialy
        Width = 32
        Height = 32
        NoZWrite = False
        MirrorU = False
        MirrorV = False
      end
    end
    object fadeCube: TGLDummyCube
      CubeSize = 1
    end
    object HUDkurzor: TGLDummyCube
      CubeSize = 1
      object kurzor: TGLHUDSprite
        Material.BlendingMode = bmTransparency
        Material.MaterialOptions = [moIgnoreFog, moNoLighting]
        Material.Texture.TextureMode = tmReplace
        Material.Texture.Disabled = False
        Width = 32
        Height = 32
        NoZWrite = False
        MirrorU = False
        MirrorV = False
      end
    end
    object KameraRozhovor: TGLCamera
      DepthOfView = 100
      FocalLength = 50
      TargetObject = RozhovorSleduj
      Direction.Coordinates = {000000000000803F0000008000000000}
      Up.Coordinates = {00000000000000000000803F00000000}
    end
  end
  object Timer: TGLCadencer
    Scene = GLScene1
    Enabled = False
    SleepLength = 1
    OnProgress = TimerProgress
    Left = 40
    Top = 48
  end
  object Materialy: TGLMaterialLibrary
    Materials = <
      item
        Name = 'LibMaterial'
        Tag = 0
      end>
    Left = 40
    Top = 112
  end
  object MaterialyStaticke: TGLMaterialLibrary
    Left = 72
    Top = 112
  end
  object pak: TGLVfsPAK
    Left = 152
    Top = 112
  end
end
