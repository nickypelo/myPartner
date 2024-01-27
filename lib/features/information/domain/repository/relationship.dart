import '../../../authentication/domain/entities/relationship_entity.dart';

abstract class Relationship{
  Stream<RelationshipEntity> getCouple(String email);
}