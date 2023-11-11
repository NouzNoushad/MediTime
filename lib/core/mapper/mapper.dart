abstract class Mapper<M, E> {
  M fromEntity(E entity);
  E toEntity(M model);
}
