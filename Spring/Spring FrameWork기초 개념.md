## 1\. Spring이란?

### Spring Framework란?

Spring Framework는 Java 기반의 엔터프라이즈 애플리케이션 개발을 위한 오픈소스 프레임워크로, 유연성(Flexibility), 확장성(Scalability), 모듈성(Modularity)이 주요 특징이다. Spring은 의존성 주입(DI), IoC 컨테이너, AOP, 트랜잭션 관리 등의 기능을 제공한다.

#### 주요 특징

- Java 기반의 강력한 애플리케이션 프레임워크
- Spring IoC 컨테이너를 통한 객체 관리
- Spring MVC를 활용한 웹 애플리케이션 개발 가능
- 트랜잭션 관리, 보안(Spring Security), 배치(Spring Batch) 등 다양한 기능 지원

### Spring과 NestJS 비교

Spring과 NestJS는 엔터프라이즈 애플리케이션을 위한 프레임워크로, 각각 Java와 TypeScript 기반이다. 구조적으로 유사한 개념이 많다.

| 비교 항목       | Spring Framework                        | NestJS                                  |
| --------------- | --------------------------------------- | --------------------------------------- |
| 프로그래밍 언어 | Java, Kotlin                            | TypeScript, JavaScript                  |
| 주요 개념       | IoC, DI, AOP                            | DI, 모듈 기반                           |
| 객체 관리       | IoC 컨테이너가 관리                     | NestJS 컨테이너가 관리                  |
| 모듈화 방식     | `@Component`, `@Service`, `@Repository` | `@Injectable`, `@Module`                |
| API 개발 방식   | Spring MVC (Controller, Service)        | Express 기반 (Controller, Service)      |
| 비동기 처리     | WebFlux (Reactor) 지원                  | 기본적으로 비동기 방식 (RxJS 사용 가능) |
| 보안 기능       | Spring Security 제공                    | 기본 제공 없음 (passport.js 사용)       |

- `NestJS의 @Injectable` ≈ `Spring의 @Component`
- `NestJS의 Module` ≈ `Spring의 DI 컨테이너 (ApplicationContext)`

---

## 2\. Spring의 핵심 개념

### 2.1 IoC (Inversion of Control, 제어의 역전)

IoC는 객체의 생성과 관리를 개발자가 직접 하지 않고, Spring IoC 컨테이너가 대신 관리하는 개념이다.

#### 전통적인 방식 (IoC 적용 전)

```
public class Car {
    private Engine engine;

    public Car() {
        this.engine = new Engine();  // 직접 객체 생성
    }
}
```

- `new Engine()`을 직접 호출하여 객체를 생성하면 객체 간의 강한 결합(Tight Coupling)이 발생한다.

#### Spring 방식 (IoC 적용 후)

```
@Component
public class Engine {
}

@Component
public class Car {
    private final Engine engine;

    @Autowired
    public Car(Engine engine) { // 의존성 주입
        this.engine = engine;
    }
}
```

- `@Component`를 사용하여 Bean을 생성하고, `@Autowired`를 사용하여 객체를 자동으로 주입(DI)한다.

---

### 2.2 DI (Dependency Injection, 의존성 주입)

DI는 객체 간의 관계를 Spring이 자동으로 설정해주는 기능이다.

#### `@Autowired`를 활용한 DI 예제

```
@Component
public class Engine {
    public void start() {
        System.out.println("엔진이 동작합니다!");
    }
}

@Component
public class Car {
    private final Engine engine;

    @Autowired
    public Car(Engine engine) {  // 의존성 주입
        this.engine = engine;
    }

    public void drive() {
        engine.start();
        System.out.println("자동차가 출발합니다!");
    }
}
```

- `Car` 객체가 생성될 때, `Engine` 객체가 자동으로 주입된다.

---

### 2.3 AOP (Aspect-Oriented Programming, 관점 지향 프로그래밍)

AOP는 공통 기능(로깅, 트랜잭션, 보안 등)을 분리하여 관리할 수 있도록 도와준다.

#### AOP 적용 전 (각 클래스에서 중복 코드 발생)

```
public class UserService {
    public void createUser() {
        System.out.println("로그 기록"); // 중복 발생
        System.out.println("사용자 생성");
    }
}

public class OrderService {
    public void createOrder() {
        System.out.println("로그 기록"); // 중복 발생
        System.out.println("주문 생성");
    }
}
```

#### AOP 적용 후 (중복 제거)

```
@Aspect
@Component
public class LoggingAspect {
    @Before("execution(* com.example..*(..))")
    public void logBefore(JoinPoint joinPoint) {
        System.out.println("로그 기록: " + joinPoint.getSignature().getName());
    }
}
```

- AOP를 사용하면 비즈니스 로직에서 공통 기능(로깅)을 분리할 수 있다.

---

## 3\. Spring Boot와 Spring Framework 차이점

Spring Framework는 XML 또는 Java Config를 직접 설정해야 하는 반면, Spring Boot는 이를 자동으로 설정해준다.

| 비교 항목 | Spring Framework                       | Spring Boot                    |
| --------- | -------------------------------------- | ------------------------------ |
| 설정 방식 | XML, Java Config 필요                  | 자동 설정 (Auto Configuration) |
| 서버 실행 | 수동으로 Tomcat 설정 필요              | 내장 Tomcat 제공               |
| 개발 속도 | 설정이 많아 상대적으로 느림            | 설정 없이 빠르게 개발 가능     |
| 사용 목적 | 기존 레거시 프로젝트, 세밀한 설정 필요 | 빠른 개발, 마이크로서비스      |

Spring Framework는 세밀한 설정이 가능하며 유연성이 높고, Spring Boot는 빠른 개발이 가능하다.

**이번 강의에서는 Spring Boot 없이 순수한 Spring Framework로 학습할 예정이다.**

---

## 4\. 오늘의 정리

### Spring이란?

- Java 기반의 강력한 엔터프라이즈 애플리케이션 프레임워크

### Spring의 핵심 개념

1.  **IoC (제어의 역전)**: 객체의 생성 및 관리를 Spring이 담당
2.  **DI (의존성 주입)**: `@Autowired`를 통해 객체를 자동으로 주입
3.  **AOP (관점 지향 프로그래밍)**: 공통 기능을 분리하여 관리

### Spring Framework vs Spring Boot

- **Spring Framework**: 설정을 직접 해야 하지만, 더 유연함
- **Spring Boot**: 설정을 자동으로 해주지만, 커스텀 설정이 어렵고 무겁다.
