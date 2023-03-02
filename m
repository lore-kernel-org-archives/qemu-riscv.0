Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXezm-0004MO-9A
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezk-0004Ia-An
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:13:00 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezi-0006Pl-6g
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:13:00 -0500
Received: by mail-pl1-x629.google.com with SMTP id a9so6735558plh.11
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 01:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRPPbttll/DWnQNdAzlT2kSuA8zqc53TPKgPf1dqdsw=;
 b=EJH6gK33ll8t+AbipM2m3dzIXSCE+Er3MeBSBhvirFV4lw731gEnN35B/m+2IqSvyo
 rurYZkf8LYdi2t4sPNz0wqlV3AFe5wlSUTZiKCWaGmVE0Vy9ITjCI/gISO8WhJXW1wYT
 hgLVBzq2unDoyYU9DPo88Uvo/yBGup9eGt03ge3HpphQwCsRsXbGOrBHd7gbg/s80RJu
 MTpdyTQwiS4zfEotbkv877ni11o9tzhOPj4YJDjrnuzFcjE5u6Hnr+wCXATGxT0tQrUv
 GCdoiIxeFHECYs4o1POpzqMGxkCtHTLQKxDnEZUQS/rwaQXiK1zZ29CdfAvYBoJQKpzF
 C3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRPPbttll/DWnQNdAzlT2kSuA8zqc53TPKgPf1dqdsw=;
 b=6MSinW2KHQShW1n0uqJOtCIbIig4T+rLGDB6pid2VntGvkK8bPXqyfIM9AEEMyx78c
 twW0dg3E+zWdpnAfI7ozmcSLC/hjbJNkSJ+kMAo9yUasIP/9tJHljlJoghAkCbpB9Hsy
 bAEGD+d+/rpd57BXadeXuj3XMGInUPxNORiCwWSJM57SZPnBgGDSyUloTc2/lZCb13FB
 lKCiF5jmq4jtrH2Bwtb+b4rH0C6ZDE/hh75ofQQuwUhGQvtsOjbTBQvtLj8SPk4z7D4M
 LfUH3US1+G8FFI4DbHV72JON0L+T/VIWWmEr6pX5bB0TkG68Ju3+wrXeRETWu+aQ/qx5
 P/Mg==
X-Gm-Message-State: AO0yUKXGgQ8+9hpozwzPp0cvRMF2kJzz/XtjsFFPzM6h75HAuqHpyCVr
 rMzviqo7nfFMuZdqouLRUvBHx2kCV06Q/SN3
X-Google-Smtp-Source: AK7set/fmJMItSMT2xZ2VOrN22B+NmgjPd+JVgyeBemFEEMtExTwFl+H4y3p5+kz3d/V39NpCcn1pg==
X-Received: by 2002:a17:902:6b03:b0:19e:700c:b6e0 with SMTP id
 o3-20020a1709026b0300b0019e700cb6e0mr1059537plk.35.1677748376242; 
 Thu, 02 Mar 2023 01:12:56 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:55 -0800 (PST)
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
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V5 8/8] MAINTAINERS: Add entry for RISC-V ACPI
Date: Thu,  2 Mar 2023 14:42:12 +0530
Message-Id: <20230302091212.999767-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
References: <20230302091212.999767-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 09:13:00 -0000

RISC-V ACPI related functionality for virt machine is added in
virt-acpi-build.c. Add the maintainer entry after moving the
ARM ACPI entry under the main ACPI entry.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 MAINTAINERS | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e96e9dbfe6..3b840fa700 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -999,12 +999,6 @@ S: Maintained
 F: hw/ssi/xlnx-versal-ospi.c
 F: include/hw/ssi/xlnx-versal-ospi.h
 
-ARM ACPI Subsystem
-M: Shannon Zhao <shannon.zhaosl@gmail.com>
-L: qemu-arm@nongnu.org
-S: Maintained
-F: hw/arm/virt-acpi-build.c
-
 STM32F100
 M: Alexandre Iooss <erdnaxe@crans.org>
 L: qemu-arm@nongnu.org
@@ -1892,6 +1886,18 @@ F: docs/specs/acpi_nvdimm.rst
 F: docs/specs/acpi_pci_hotplug.rst
 F: docs/specs/acpi_hw_reduced_hotplug.rst
 
+ARM ACPI Subsystem
+M: Shannon Zhao <shannon.zhaosl@gmail.com>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/virt-acpi-build.c
+
+RISC-V ACPI Subsystem
+M: Sunil V L <sunilvl@ventanamicro.com>
+L: qemu-riscv@nongnu.org
+S: Maintained
+F: hw/riscv/virt-acpi-build.c
+
 ACPI/VIOT
 M: Jean-Philippe Brucker <jean-philippe@linaro.org>
 S: Supported
-- 
2.34.1


