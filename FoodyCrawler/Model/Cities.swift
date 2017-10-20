//
//  Cities.swift
//  FoodyCrawler
//
//  Created by Cole Doan on 10/18/17.
//  Copyright © 2017 Trong Cuong Doan. All rights reserved.
//

import Foundation
import Freddy

enum Cities: Int {
  case HCM = 217
  case HaNoi = 218
  case BinhDuong = 230
  case VungTau = 223
  case DaNang = 219
  case CanTho = 221
  case KhanhHoa = 248
  case HaiPhong = 220
  case BinhThuan = 233
  case LamDong = 254
  case DongNai = 222
  case QuangNinh = 265
  case Hue = 273
  case NinhThuan = 259
  case HaiDuong = 244
  case NamDinh = 256
  case TienGiang = 274
  case PhuQuoc = 460
  case KonTum = 250
  case QuangNam = 263
  case LaoCai = 253
  case NgheAn = 257
  case LongAn = 255
  case BinhDinh = 231
  case AnGiang = 224
  case CaMau = 234
  case DakLak = 236
  case ThanhHoa = 272
  case TayNinh = 269
  case BinhPhuoc = 232
  case QuangTri = 266
  case KienGiang = 249
  case SocTrang = 267
  case PhuYen = 261
  case VinhLong = 277
  case GiaLai = 240
  case QuangNgai = 264
  case QuangBinh = 262
  case BacNinh = 228
  case DongThap = 239
  case VinhPhuc = 278
  case ThaiNguyen = 271
  case HaTinh = 243
  case BenTre = 229
  case NinhBinh = 258
  case BacGiang = 227
  case TraVinh = 275
  case BacLieu = 225
  case ThaiBinh = 270
  case HauGiang = 245
  case PhuTho = 260
  case LangSon = 252
  case DakNong = 237
  case SonLa = 268
  case HoaBinh = 246
  case HungYen = 439
  case YenBai = 279
  case HaGiang = 241
  case TuyenQuang = 276
  case HaNam = 242
  case DienBien = 238
  case CaoBang = 235
  case BacKan = 226
  case LaiChau = 251

  var name: String {
    switch self {
    case .BinhDuong:
      return "Bình Dương"
    case .VungTau:
      return "Vũng Tàu"
    case .HCM:
      return "TP.HCM"
    case .HaNoi:
      return "Hà Nội"
    case .DaNang:
      return "Đà Nẵng"
    case .CanTho:
      return "Cần Thơ"
    case .KhanhHoa:
      return "Khánh Hòa"
    case .HaiPhong:
      return "Hải Phòng"
    case .BinhThuan:
      return "Bình Thuận"
    case .LamDong:
      return "Lâm Đồng"
    case .DongNai:
      return "Đồng Nai"
    case .QuangNinh:
      return "Quảng Ninh"
    case .Hue:
      return "Huế"
    case .NinhThuan:
      return "Ninh Thuận"
    case .HaiDuong:
      return "Hải Dương"
    case .NamDinh:
      return "Nam Định"
    case .TienGiang:
      return "Tiền Giang"
    case .PhuQuoc:
      return "Phú Quốc"
    case .KonTum:
      return "Kon Tum"
    case .QuangNam:
      return "Quảng Nam"
    case .LaoCai:
      return "Lào Cai"
    case .NgheAn:
      return "Nghệ An"
    case .LongAn:
      return "Long An"
    case .BinhDinh:
      return "Bình Định"
    case .AnGiang:
      return "An Giang"
    case .CaMau:
      return "Cà Mau"
    case .DakLak:
      return "Đắk Lắk"
    case .ThanhHoa:
      return "Thanh Hóa"
    case .TayNinh:
      return "Tây Ninh"
    case .BinhPhuoc:
      return "Bình Phước"
    case .QuangTri:
      return "Quảng Trị"
    case .KienGiang:
      return "Kiên Giang"
    case .SocTrang:
      return "Sóc Trăng"
    case .PhuYen:
      return "Phú Yên"
    case .VinhLong:
      return "Vĩnh Long"
    case .GiaLai:
      return "Gia Lai"
    case .QuangNgai:
      return "Quảng Ngãi"
    case .QuangBinh:
      return "Quảng Bình"
    case .BacNinh:
      return "Bắc Ninh"
    case .DongThap:
      return "Đồng Tháp"
    case .VinhPhuc:
      return "Vĩnh Phúc"
    case .ThaiNguyen:
      return "Thái Nguyên"
    case .HaTinh:
      return "Hà Tĩnh"
    case .BenTre:
      return "Bến Tre"
    case .NinhBinh:
      return "Ninh Bình"
    case .BacGiang:
      return "Bắc Giang"
    case .TraVinh:
      return "Trà Vinh"
    case .BacLieu:
      return "Bạc Liêu"
    case .ThaiBinh:
      return "Thái Bình"
    case .HauGiang:
      return "Hậu Giang"
    case .PhuTho:
      return "Phú Thọ"
    case .LangSon:
      return "Lạng Sơn"
    case .DakNong:
      return "Đắk Nông"
    case .SonLa:
      return "Sơn La"
    case .HoaBinh:
      return "Hòa Bình"
    case .HungYen:
      return "Hưng Yên"
    case .YenBai:
      return "Yên Bái"
    case .HaGiang:
      return "Hà Giang"
    case .TuyenQuang:
      return "Tuyên Quang"
    case .HaNam:
      return "Hà Nam"
    case .DienBien:
      return "Điện Biên"
    case .CaoBang:
      return "Cao Bằng"
    case .BacKan:
      return "Bắc Kạn"
    case .LaiChau:
      return "Lai Châu"
    }
  }

  static var allCities: [Cities] {
    return [.HCM,
    .HaNoi,
    .BinhDuong,
    .VungTau,
    .DaNang,
    .CanTho,
    .KhanhHoa,
    .HaiPhong,
    .BinhThuan,
    .LamDong,
    .DongNai,
    .QuangNinh,
    .Hue,
    .NinhThuan,
    .HaiDuong,
    .NamDinh,
    .TienGiang,
    .PhuQuoc,
    .KonTum,
    .QuangNam,
    .LaoCai,
    .NgheAn,
    .LongAn,
    .BinhDinh,
    .AnGiang,
    .CaMau,
    .DakLak,
    .ThanhHoa,
    .TayNinh,
    .BinhPhuoc,
    .QuangTri,
    .KienGiang,
    .SocTrang,
    .PhuYen,
    .VinhLong,
    .GiaLai,
    .QuangNgai,
    .QuangBinh,
    .BacNinh,
    .DongThap,
    .VinhPhuc,
    .ThaiNguyen,
    .HaTinh,
    .BenTre,
    .NinhBinh,
    .BacGiang,
    .TraVinh,
    .BacLieu,
    .ThaiBinh,
    .HauGiang,
    .PhuTho,
    .LangSon,
    .DakNong,
    .SonLa,
    .HoaBinh,
    .HungYen,
    .YenBai,
    .HaGiang,
    .TuyenQuang,
    .HaNam,
    .DienBien,
    .CaoBang,
    .BacKan,
    .LaiChau]
  }

  var displayName: String {
    return "\(name) - \(rawValue)"
  }
}
