class RelationshipEntity{
  String? boyfriend;
  String? girlfriend;

  RelationshipEntity(
    {
      this.boyfriend,
      this.girlfriend
    }
  );
  Map<String, dynamic> relationshipMap(){
    return {
      'boyfriend': boyfriend,
      'girlfriend': girlfriend,
    };
  }
}