Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRa0h-000652-QV
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 09:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0f-00063x-Fv
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:40:49 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0d-0005Pt-Ai
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:40:49 -0500
Received: by mail-pl1-x634.google.com with SMTP id v23so13716390plo.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 06:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YB4wqogtDPNCZYuObY/dN2oYhjeeY5+OLvSqUAg4TPc=;
 b=jcgDChFfv1Fqu4ytS7ccKnlPsnmdhN+lfe3l4OrpyC6bptesnGJjEqItD37UAl+KeJ
 MFyFt8Gw/n72MolkLXbdTyu/O5436bOcjcrkM6pjI/wBMbDeSd55NmxeCsMiRJQcWNq0
 OYFl4iM+OZ5wgLMlbJkK8eRcOIWdWtRvpZmYIORbIPJihLrIHfE4KjsH+JpUe9f/oztv
 jgRDptKW+RGE+qW2loydlrKvmNnOjc/ggbMqhaoD16Lk5uvt2Dbi2rA2N4+YvZu2awDj
 R8afnaqgDIOw04lN36tWVa7nd+ovLf0V8GVg/rdi93rxMiE6NRgxXgH2r1ADZ+u54dmr
 Auyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YB4wqogtDPNCZYuObY/dN2oYhjeeY5+OLvSqUAg4TPc=;
 b=ycO8WBamcOmJ/qoEQTpm+c36G14UgMSsX1pJnzdTRaKd8ZI50N9XBuQIzmqm+U+B5O
 t+42k6h1d6k0vaxMl9XaRfy9USM2W7IdOnWReu7JRp3Mowf4XaPSXjl+NcHp5dPuLYHI
 78Fkf9VTcPLLXdMJYJOIeiC9BH6JBZi84hf6uJd5mxbCoUz8dyKJFswW/SkWvrO9DExh
 Q4zolwWNoadV/1pW3/zzGDMbYzOi8LYNRHBWR64GDWX65j/+0zWiuk5kwWGpk1W1I7yL
 DmRnkocUaWoO9Zeni6HlSxNiCxhZ0sA4d1ClpAfUuMXVCfZd2sZULJAJ1hzQCLTfVtJr
 IQ2A==
X-Gm-Message-State: AO0yUKUhR/TA26cXde0ru/avVZhu+Rab6drgybFbX/rI2voxgrqX+zFM
 kk4r2gf+WVmZYtN7vdK6dP95mg==
X-Google-Smtp-Source: AK7set9JatX7ZnwhJk/gthQ/L7zorv5aVsmFMshc8nqt6ZgTHnSZ86etowQezEJ9q4LLtDI6vX7eaQ==
X-Received: by 2002:a17:903:3013:b0:19a:8316:6b4a with SMTP id
 o19-20020a170903301300b0019a83166b4amr6274902pla.26.1676299245254; 
 Mon, 13 Feb 2023 06:40:45 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:40:44 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V2 00/10] Add basic ACPI support for risc-v virt
Date: Mon, 13 Feb 2023 20:10:28 +0530
Message-Id: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Mon, 13 Feb 2023 14:40:49 -0000

This series adds the basic ACPI support for the RISC-V virt machine. 
Currently only INTC interrupt controller specification is approved by the
UEFI forum. External interrupt controller support in ACPI is in progress.

The basic infrastructure changes are mostly leveraged from ARM.

This adds support for INTC and RHCT tables as specified in below ECR links
which are approved by UEFI forum.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view

These changes are also available @
https://github.com/vlsunil/qemu/tree/acpi_b1_us_review_V2

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

Sunil V L (10):
  hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
  hw/riscv/virt: Add a switch to enable/disable ACPI
  hw/riscv/virt: Add memmap pointer to RiscVVirtState
  hw/riscv/virt: virt-acpi-build.c: Add basic ACPI tables
  hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
  hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
  hw/riscv: meson.build: Build virt-acpi-build.c
  hw/riscv/Kconfig: virt: Enable ACPI config option
  hw/riscv/virt.c: Initialize the ACPI tables
  MAINTAINERS: Add entry for RISC-V ACPI

 MAINTAINERS                |   6 +
 hw/riscv/Kconfig           |   1 +
 hw/riscv/meson.build       |   1 +
 hw/riscv/virt-acpi-build.c | 384 +++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c            |  45 +++++
 include/hw/riscv/virt.h    |   6 +
 6 files changed, 443 insertions(+)
 create mode 100644 hw/riscv/virt-acpi-build.c

-- 
2.34.1


