#!/bin/bash

# TODO: list must be kept in sync with the list of extensions.
exts=(
  BangPatterns
  BinaryLiterals
  BlockArguments
  ConstraintKinds
  DataKinds
  DefaultSignatures
  DeriveDataTypeable
  DeriveFoldable
  DeriveFunctor
  DeriveGeneric
  DeriveTraversable
  DerivingVia
  EmptyCase
  EmptyDataDecls
  ExistentialQuantification
  FlexibleContexts
  FlexibleInstances
  FunctionalDependencies
  GADTs
  GeneralizedNewtypeDeriving
  InstanceSigs
  KindSignatures
  LambdaCase
  MultiParamTypeClasses
  MultiWayIf
  NamedFieldPuns
  NoUnicodeSyntax
  NumericUnderscores
  OverloadedStrings
  PartialTypeSignatures
  PolyKinds
  RankNTypes
  ScopedTypeVariables
  StandaloneDeriving
  TupleSections
  TypeApplications
  TypeFamilies
  TypeSynonymInstances
)

sed_args=(-i)

for ext in ${exts[@]}
do
  sed_args=(${sed_args[@]} -e "/{-# LANGUAGE $ext #-}/d")
done

for dir in src exe test mains
do
  if [ -d "$dir" ]
  then
    for f in $(find "$dir" -name '*.hs')
    do
      echo Editing "$f" ...
      # Normalize extension formatting before we do any edits.
      fourmolu -i "$f"
      for ext in ${exts[@]}
      do
       sed -i "/{-# LANGUAGE $ext #-}/d" "$f"
      done
      # TODO: I'm too lazy to figure out how bash fuckery are supposed to work.
      # echo command sed "${sed_args[@]}" "$f"
      # Edit again, this time eliminates empty lines if any.
      fourmolu -i "$f"
    done
  fi
done
