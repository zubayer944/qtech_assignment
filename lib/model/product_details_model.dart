class ProductDetailsModel {
  int? id;
  int? maximumOrder;
  List<CategoryList>? categoryList;
  String? productName;
  String? sku;
  String? slug;
  String? buisnessName;
  int? sellerId;
  String? sellerSlug;
  bool? willShowEmi;
  Brand? brand;
  String? note;
  int? stock;
  bool? preOrder;
  var bookingPrice;
  var productPrice;
  var discountCharge;
  String? image;
  List<String>? detailsImages;
  bool? isEvent;
  var eventId;
  bool? highlight;
  var highlightId;
  bool? groupping;
  var grouppingId;
  var campaignSectionId;
  bool? campaignSection;
  var message;
  bool? seo;
  String? metaKeyword;
  String? metaDescription;
  var variation;
  String? bannerImage;
  String? bannerImageLink;
  var attributeValue;
  var iconSpecification;
  int? productReviewAvg;

  ProductDetailsModel(
      {this.id,
      this.maximumOrder,
      this.categoryList,
      this.productName,
      this.sku,
      this.slug,
      this.buisnessName,
      this.sellerId,
      this.sellerSlug,
      this.willShowEmi,
      this.brand,
      this.note,
      this.stock,
      this.preOrder,
      this.bookingPrice,
      this.productPrice,
      this.discountCharge,
      this.image,
      this.detailsImages,
      this.isEvent,
      this.eventId,
      this.highlight,
      this.highlightId,
      this.groupping,
      this.grouppingId,
      this.campaignSectionId,
      this.campaignSection,
      this.message,
      this.seo,
      this.metaKeyword,
      this.metaDescription,
      this.variation,
      this.bannerImage,
      this.bannerImageLink,
      this.attributeValue,
      this.iconSpecification,
      this.productReviewAvg});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maximumOrder = json['maximum_order'];
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
    productName = json['product_name'];
    sku = json['sku'];
    slug = json['slug'];
    buisnessName = json['buisness_name'];
    sellerId = json['seller_id'];
    sellerSlug = json['seller_slug'];
    willShowEmi = json['will_show_emi'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    note = json['note'];
    stock = json['stock'];
    preOrder = json['pre_order'];
    bookingPrice = json['booking_price'];
    productPrice = json['product_price'];
    discountCharge = json['discount_charge'];
    image = json['image'];
    detailsImages = json['details_images'].cast<String>();
    isEvent = json['is_event'];
    eventId = json['event_id'];
    highlight = json['highlight'];
    highlightId = json['highlight_id'];
    groupping = json['groupping'];
    grouppingId = json['groupping_id'];
    campaignSectionId = json['campaign_section_id'];
    campaignSection = json['campaign_section'];
    message = json['message'];
    seo = json['seo'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    variation = json['variation'];
    bannerImage = json['banner_image'];
    bannerImageLink = json['banner_image_link'];
    attributeValue = json['attribute_value'];
    iconSpecification = json['icon_specification'];
    productReviewAvg = json['product_review_avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maximum_order'] = this.maximumOrder;
    if (this.categoryList != null) {
      data['category_list'] =
          this.categoryList!.map((v) => v.toJson()).toList();
    }
    data['product_name'] = this.productName;
    data['sku'] = this.sku;
    data['slug'] = this.slug;
    data['buisness_name'] = this.buisnessName;
    data['seller_id'] = this.sellerId;
    data['seller_slug'] = this.sellerSlug;
    data['will_show_emi'] = this.willShowEmi;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['note'] = this.note;
    data['stock'] = this.stock;
    data['pre_order'] = this.preOrder;
    data['booking_price'] = this.bookingPrice;
    data['product_price'] = this.productPrice;
    data['discount_charge'] = this.discountCharge;
    data['image'] = this.image;
    data['details_images'] = this.detailsImages;
    data['is_event'] = this.isEvent;
    data['event_id'] = this.eventId;
    data['highlight'] = this.highlight;
    data['highlight_id'] = this.highlightId;
    data['groupping'] = this.groupping;
    data['groupping_id'] = this.grouppingId;
    data['campaign_section_id'] = this.campaignSectionId;
    data['campaign_section'] = this.campaignSection;
    data['message'] = this.message;
    data['seo'] = this.seo;
    data['meta_keyword'] = this.metaKeyword;
    data['meta_description'] = this.metaDescription;
    data['variation'] = this.variation;
    data['banner_image'] = this.bannerImage;
    data['banner_image_link'] = this.bannerImageLink;
    data['attribute_value'] = this.attributeValue;
    data['icon_specification'] = this.iconSpecification;
    data['product_review_avg'] = this.productReviewAvg;
    return data;
  }
}

class CategoryList {
  int? id;
  String? categoryName;
  String? slug;
  bool? isInactive;
  String? image;
  String? categoryIcon;
  String? parent;
  String? parentSlug;

  CategoryList(
      {this.id,
      this.categoryName,
      this.slug,
      this.isInactive,
      this.image,
      this.categoryIcon,
      this.parent,
      this.parentSlug});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    slug = json['slug'];
    isInactive = json['is_inactive'];
    image = json['image'];
    categoryIcon = json['category_icon'];
    parent = json['parent'];
    parentSlug = json['parent_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['slug'] = this.slug;
    data['is_inactive'] = this.isInactive;
    data['image'] = this.image;
    data['category_icon'] = this.categoryIcon;
    data['parent'] = this.parent;
    data['parent_slug'] = this.parentSlug;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? slug;
  String? image;

  Brand({this.id, this.name, this.slug, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    return data;
  }
}
