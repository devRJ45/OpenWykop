class ApiModel {
  ApiModel ();

  Map<String, dynamic> toJson () {
    return Map();
  }
  
  factory ApiModel.fromJson (Map<String, dynamic> json){
    return ApiModel(); 
  }
}