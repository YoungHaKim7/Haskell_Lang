#  프로젝트 init

```bash
$ mkdir 내가 만들고 싶은 폴더명

To start a new haskell project in the current directory, run:
$ cabal init --interactive
  
# 실행
$ cabal run
```

# justfile

```justfile
r:
    rm -rf target
    mkdir target
    ghc --make src/Main
    mv src/*.o src/*.hi src/Main target
    target/Main
```

# 1. Core Principles of Functional Programming (FP)

- Functional programming is based on mathematical functions, not procedures.

- Key ideas (in simple terms)
  - 1. Pure functions
    - Same input → same output
    - No side effects

  - 2. Immutability
    - Values never change
    - “Modify” means “create a new value”

  - 3. Functions are values
    - Can be passed, returned, stored

  - 4. Higher-order functions
    - Functions that take other functions

  - 5. Referential transparency
    - An expression can be replaced by its value

  - 6. Composition over mutation
    - Build programs by combining small functions

  - 7. Lazy evaluation
    - Compute only when needed

- Haskell enforces these ideas by design, which makes it the ideal teaching language.

- 기능 프로그래밍은 절차가 아닌 수학적 기능을 기반으로 합니다.

- 주요 아이디어 (간단한 용어로)
  - 1. 순수 함수
    - 동일한 입력 → 동일한 출력
    - 부작용 없음

  - 2. 불변성
    - 가치는 변하지 않는다
    - "수정"은 "새로운 가치 창출"을 의미합니다

  - 3. 함수는 가치입니다
    - 통과, 반환, 저장 가능

  - 4. 고차 함수
    - 다른 함수를 취하는 함수

  - 5. 참조 투명성
    - 표현식은 그 값으로 대체할 수 있습니다

  - 6. 돌연변이에 대한 구성
    - 작은 함수들을 결합하여 프로그램을 구축하세요

  - 7. 게으른 평가
    - 필요할 때만 계산

- 해스켈은 이러한 아이디어를 디자인으로 구현하여 이상적인 교육 언어로 만듭니다.
