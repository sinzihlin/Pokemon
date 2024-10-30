# Pokemon
成為神奇寶貝大師

#專案結構
Pokemon/
├── Pokemon/
│   ├── PokemonApp.swift (入口點)
│   ├── ContentView.swift
│   ├── Pokemon.swift (模型)
│   ├── PokemonViewModel.swift
│   └── View/
│       ├── PokemonDetailsView.swift
│       ├── PokemonInfoView.swift
│       ├── PokemonTypeView.swift
│       └── PokemonImageView.swift
├── PokemonTests/
│   └── PokemonTests.swift
└── PokemonUITests/
    ├── PokemonUITests.swift
    └── PokemonUITestsLaunchTests.swift

##資料流向
PokemonViewModel 從 API 獲取資料
資料透過 @Published 屬性更新
ContentView 觀察資料變化並更新 UI
子視圖組件接收資料並顯示特定內容


