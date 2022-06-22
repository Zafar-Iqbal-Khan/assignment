class GeneralNews {
  GeneralNews({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  factory GeneralNews.fromJson(Map<String, dynamic> json) => GeneralNews(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class Datum {
  Datum({
    this.id,
    this.categoryId,
    this.categoryName,
    this.title,
    this.description,
    this.featuredImage,
    this.isNotificationSent,
    this.views,
    this.createdByUserId,
    this.lastUpdatedByUserId,
    this.approvedByUserId,
    this.reporterName,
    this.reporterAvatar,
    this.isApproved,
    this.status,
    this.createDate,
    this.createTime,
    this.updateDate,
    this.updateTime,
    this.createdAt,
    this.updatedAt,
    this.shortUrl,
    this.longUrl,
  });

  int? id;
  int? categoryId;
  String? categoryName;
  String? title;
  String? description;
  String? featuredImage;
  int? isNotificationSent;
  int? views;
  int? createdByUserId;
  int? lastUpdatedByUserId;
  int? approvedByUserId;
  String? reporterName;
  dynamic? reporterAvatar;
  int? isApproved;
  int? status;
  String? createDate;
  String? createTime;
  String? updateDate;
  String? updateTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? shortUrl;
  String? longUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryId: json["category_id"],
        categoryName: json["categoryName"],
        title: json["title"],
        description: json["description"],
        featuredImage: json["featured_image"],
        isNotificationSent: json["is_notification_sent"],
        views: json["views"],
        createdByUserId: json["created_by_user_id"],
        lastUpdatedByUserId: json["last_updated_by_user_id"] == null
            ? null
            : json["last_updated_by_user_id"],
        approvedByUserId: json["approved_by_user_id"],
        reporterName: json["reporterName"],
        reporterAvatar: json["reporterAvatar"],
        isApproved: json["is_approved"],
        status: json["status"],
        createDate: json["createDate"],
        createTime: json["createTime"],
        updateDate: json["updateDate"],
        updateTime: json["updateTime"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shortUrl: json["short_url"] == null ? null : json["short_url"],
        longUrl: json["long_url"] == null ? null : json["long_url"],
      );
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );
}
