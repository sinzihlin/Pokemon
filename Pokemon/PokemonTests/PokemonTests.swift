//
//  PokemonTests.swift
//  PokemonTests
//
//  Created by SinZih. XS Liou on 2024/10/15.
//

import Testing
@testable import Pokemon

struct PokemonTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    // 測試基本的 mock 數據
      @Test func testPokemonMockData() throws {
          let mockPokemon = Pokemon.mock()
          
          #expect(mockPokemon.id == 1)
          #expect(mockPokemon.name == "Pikachu")
          #expect(mockPokemon.height == 4)
          #expect(mockPokemon.weight == 60)
          #expect(mockPokemon.types.count == 3)
          #expect(mockPokemon.types[0].type.name == "electric")
      }
      
      // 測試 Pokemon 類型
      @Test func testPokemonTypes() throws {
          let mockPokemon = Pokemon.mock()
          let types = mockPokemon.types.map { $0.type.name }
          
          #expect(types.contains("electric"))
          #expect(types.contains("fire"))
          #expect(types.contains("water"))
      }
      
      // 測試 Pokemon 圖片 URL
      @Test func testPokemonImageURL() throws {
          let mockPokemon = Pokemon.mock()
          let imageURL = mockPokemon.sprites.other.home.frontDefault
          
          #expect(imageURL == "https://example.com/pikachu.png")
      }
      
      // 測試 Pokemon 資料格式化
      @Test func testPokemonDataFormatting() throws {
          let mockPokemon = Pokemon.mock()
          let formattedID = String(format: "%03d", mockPokemon.id)
          let heightInMeters = Double(mockPokemon.height) / 10
          let weightInKg = Double(mockPokemon.weight) / 10
          
          #expect(formattedID == "001")
          #expect(heightInMeters == 0.4)
          #expect(weightInKg == 6.0)
      }

}
