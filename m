Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXezH-0003nU-AX
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezF-0003n6-GM
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:29 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezD-0004RU-MX
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:29 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so2161678pjg.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 01:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=48+hgz9/Juk6w/2pKOwPQmeW67lTY993JS5TzWJoJ1A=;
 b=GoPWestVzEEtdFJP7IYjGIN6CyYOUHfrWRqJO/Npzn8DPGGydGcKBcbGyofrtg5gPr
 mJPfqX1EbkLn6Zuq4nZ6sslX2//OXziaxW8+QB+NgKD+YgXfqTzWp1AS3z5zPishK8sS
 xjTJjaX6jpKtXMuqZncmpehFVd+rnZTDHvBoyzoLtSSt+meGbLwGAp+J02Bt21+uHCNL
 vAPUOAiHKRIEhNGAnVZ38aKgH3vv95TL3ZLvjlB2gUM/K/LwDKVNeCanSg8GKXXYiVID
 5cIX+9h8DYwR3+WaJoaGAT23B/czWUhPcu3NOKZZ8UQHEIvmIG4/dwhOtQqHu5fHcFUL
 uDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48+hgz9/Juk6w/2pKOwPQmeW67lTY993JS5TzWJoJ1A=;
 b=Qgcwiyjc4gGqfMijMVa4c4LJR6ZTgsBg9HuCuiVeacvzTqrx4R3ieplkkLz6eHrv7L
 LWIKuiraITezLWG+Ce008uxIObsXLoFSpY77cZcUlPdd2PbCEnij//fvSgi6ABFrMl7r
 I4Ms3cmtegvDgjpodd3MOGs2v/Zar1Y8XutO15Grux1dQ19iRtTDMlSh+vXypfSw3WKK
 4b8RbqFPlL4SRk/kH1VsYu1HPj3B19ZL33Kz7FHTLgryC5fne7jJOBkzzCsC6IWelwM3
 znuA4Qb1wmlLZpNadnMVJ8AsRYIXUzDH+tyG4+qB6FmlU0K6oRkQ19Wexsw3lWwORlwu
 pP6Q==
X-Gm-Message-State: AO0yUKWkGjisKJqNaICh+roDHXOrwE+0PILC11SxpJDCzIkj+FyClIzI
 lyVNUnFJIstcVQrFf5dPDJSat/C10oCi+/DT
X-Google-Smtp-Source: AK7set8F/7iSk0bIJsQ7w3yfVAih+AjBIsj1TKJpjsk67fHY3FPOvSRUtZzp0CNkr8tcTqbSGm2qdQ==
X-Received: by 2002:a17:902:728b:b0:19a:9831:c8d6 with SMTP id
 d11-20020a170902728b00b0019a9831c8d6mr7586137pll.50.1677748345344; 
 Thu, 02 Mar 2023 01:12:25 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:24 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V5 0/8] Add basic ACPI support for risc-v virt
Date: Thu,  2 Mar 2023 14:42:04 +0530
Message-Id: <20230302091212.999767-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Mar 2023 09:12:29 -0000

This series adds the basic ACPI support for the RISC-V virt machine. 
Currently only RINTC interrupt controller specification is approved by the
UEFI forum. External interrupt controller support in ACPI is in progress.

This adds support for RINTC and RHCT tables as specified in below ECR links
which are approved by UEFI forum.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view

These changes are also available @
https://github.com/vlsunil/qemu/tree/acpi_b1_us_review_V5

Changes since V4:
	1) Used possible_cpus to create cpu topology in DSDT, MADT and RHCT as
           per Igor's feedback.
        2) Moved MAINTAINER entries below ACPI/SMBIOS entry as per Drew's
           feedback
Changes since V3:
	1) Added back acpi_align_size() wrapper as per Drew's feedback
	2) Updated RB tags

Changes since V2:
	1) Squashed commits and updated commit message as per feedback from Daniel.
	2) Addressed comments from Drew.
	3) Updated tags.

Changes since V1:
	1) Addressed comments from Bin Meng.
	2) Made acpi switch default AUTO similar to other architectures.
	3) Re-based and added RB and ACKs.

The series is tested using SBI HVC console and initrd.

Test instructions:
1) Build Qemu with ACPI support (this series)

2) Build EDK2 as per instructions in
https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support

3) Build Linux with ACPI support using below branch
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V2
after enabling SBI HVC and SBI earlycon options.

CONFIG_RISCV_SBI_V01=y
CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
CONFIG_HVC_RISCV_SBI=y

4) Build buildroot.

Run with below command.
qemu-system-riscv64   -nographic \
-drive file=Build/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \
-machine virt -smp 16 -m 2G \
-kernel arch/riscv/boot/Image \
-initrd buildroot/output/images/rootfs.cpio \
-append "root=/dev/ram ro console=hvc0 earlycon=sbi"


Sunil V L (8):
  hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
  hw/riscv/virt: Add a switch to disable ACPI
  hw/riscv/virt: Add memmap pointer to RiscVVirtState
  hw/riscv/virt: Enable basic ACPI infrastructure
  hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
  hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
  hw/riscv/virt.c: Initialize the ACPI tables
  MAINTAINERS: Add entry for RISC-V ACPI

 MAINTAINERS                |  18 +-
 hw/riscv/Kconfig           |   1 +
 hw/riscv/meson.build       |   1 +
 hw/riscv/virt-acpi-build.c | 416 +++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c            |  40 ++++
 include/hw/riscv/virt.h    |   6 +
 6 files changed, 476 insertions(+), 6 deletions(-)
 create mode 100644 hw/riscv/virt-acpi-build.c

-- 
2.34.1


