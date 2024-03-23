abstract class UIMapper<T, S> {
  S mapFromUIModel(T type) => Object as S;

  T mapToUIModel(S type) => Object as T;
}