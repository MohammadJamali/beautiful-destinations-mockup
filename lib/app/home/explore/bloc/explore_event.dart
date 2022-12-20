part of 'explore_bloc.dart';

@immutable
abstract class ExploreEvent extends Equatable {}

class ExplorePopularFetched extends ExploreEvent {
  @override
  List<Object?> get props => [];
}

class ExploreFeatureFetched extends ExploreEvent {
  @override
  List<Object?> get props => [];
}

class ExploreCategoriesFetched extends ExploreEvent {
  @override
  List<Object?> get props => [];
}
