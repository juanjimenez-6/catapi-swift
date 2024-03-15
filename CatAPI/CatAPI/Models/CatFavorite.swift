//
//  CatFavorite.swift
//  CatAPI
//
//  Created by J on 13/3/24.
//

struct CatFavorite: Identifiable, Decodable {
    let id: Int32
    let userId: String
    let imageId: String
    let subId: String
    let createdAt: String
    let image: CatImage? 

    enum CodingKeys: String, CodingKey {
        case id, userId = "user_id", imageId = "image_id", subId = "sub_id", createdAt = "created_at", image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int32.self, forKey: .id)
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? "Unknown"
        imageId = try container.decodeIfPresent(String.self, forKey: .imageId) ?? "Unknown"
        subId = try container.decodeIfPresent(String.self, forKey: .subId) ?? "Unknown"
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? "Unknown"
        
        // Decode CatImage if possible, handle empty objects by setting to nil
        if let imageContainer = try? container.nestedContainer(keyedBy: CatImage.CodingKeys.self, forKey: .image),
           let id = try imageContainer.decodeIfPresent(String.self, forKey: .id),
           let url = try imageContainer.decodeIfPresent(String.self, forKey: .url) {
            // Only initialize CatImage if we successfully retrieved both id and url
            image = CatImage(id: id, url: url)
        } else {
            // Handle empty image objects or missing fields by setting image to nil
            image = nil
        }
    }
    
    init(id: Int32, userId: String, imageId: String, subId: String, createdAt: String, image: CatImage?) {
        self.id = id
        self.userId = userId
        self.imageId = imageId
        self.subId = subId
        self.createdAt = createdAt
        self.image = image
    }
            
}
