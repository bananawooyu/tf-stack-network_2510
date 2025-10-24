# tf-stack-network_2510

AWS 네트워크 인프라를 구성하는 Terraform Stack입니다.

## 개요

이 스택은 AWS에서 VPC, 서브넷, 보안 그룹, 키 페어 등의 네트워크 리소스를 생성하고 관리합니다. 다른 스택(인스턴스 스택)에서 이 네트워크 리소스들을 참조하여 사용할 수 있도록 출력값을 제공합니다.

## 구성 요소

### 컴포넌트
- **VPC**: Virtual Private Cloud 및 관련 네트워크 리소스
- **Key Pair**: EC2 인스턴스 접근을 위한 키 페어

### 생성되는 리소스
- VPC (Virtual Private Cloud)
- 프라이빗 서브넷
- 보안 그룹 (SSH 접근용)
- EC2 키 페어

## 출력값

다른 스택에서 사용할 수 있는 출력값들:

- `vpc_ids`: 리전별 VPC ID
- `private_subnet_ids`: 리전별 프라이빗 서브넷 ID 목록
- `security_group_ids`: 리전별 보안 그룹 ID 목록
- `key_names`: 리전별 키 페어 이름

## 배포 환경

- **Development**: `tf-stack-network_2510-development`
- **Production**: `tf-stack-network_2510-production`

## 배포 순서

1. 이 네트워크 스택을 먼저 배포
2. 인스턴스 스택에서 이 스택의 출력값을 참조하여 배포

## 사용법

```bash
# 초기화
terraform init

# 계획 확인
terraform plan

# 배포
terraform apply
```

## 태그

모든 리소스에는 다음 태그가 적용됩니다:
- `Stack`: tf-stack-network_2510
- `Environment`: dev/prod (환경에 따라)

## 연관 스택

- [tf-stack-instance_2510](https://github.com/bananawooyu/tf-stack-instance_2510.git): 이 네트워크 스택의 출력값을 사용하는 인스턴스 스택