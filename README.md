# Network Stack

이 스택은 AWS 네트워크 인프라와 보안 리소스를 관리합니다.

## 포함된 리소스

- **VPC**: Virtual Private Cloud 및 서브넷
- **Security Groups**: SSH 접근을 위한 보안 그룹
- **Key Pair**: 기존 SSH 키 페어 참조

## 배포 순서

1. 먼저 이 네트워크 스택을 배포합니다
2. 배포 완료 후 출력값을 확인합니다
3. 출력값을 instance-stack의 deployments.tfdeploy.hcl에 입력합니다

## 출력값

- `vpc_ids`: 리전별 VPC ID
- `private_subnet_ids`: 리전별 프라이빗 서브넷 ID 목록
- `security_group_ids`: 리전별 보안 그룹 ID 목록
- `key_names`: 리전별 키 페어 이름# tf-stack-network_2510
