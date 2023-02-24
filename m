Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVTaC-0006zW-DJ
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 03:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTaB-0006z1-Gn
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 03:37:35 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTa9-0001B4-UI
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 03:37:35 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 132so7028256pgh.13
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 00:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ml2rM4dqXo0hSiYRMEpZG/lv3Bie4vk07D+iu+suuo=;
 b=A6MyS6sUIVztOCtk1OssjeyMAEAQgaYOecOIeILg7q4k9J5B5n0J1F7n9v3TQRoXLi
 iK/z5mTXJ5S0xNCf+l4orJRkQMXPSZvwWZedpXG2xIA5lywDgXpLu2dOc1suavIOZzd0
 XK2vxSnLglDLU2TaOICH3UNuKXoboz6bIiByo+sWujHA/fjpBVPpK6bsHDl2hyYYHWpM
 +qhMLpqgnBknRVc1cPgtHMw/wJLYAgrbCHKME7HuOLPh7mV0Tu9uwEmzEBsYzEsKN9tW
 iEC7oSXoY7HgWg2jeFB2P1XFBXaM1EyBRs7+iRGNbbCqWcZ5KvmmnLC9gVEkAWR5JtYY
 y4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Ml2rM4dqXo0hSiYRMEpZG/lv3Bie4vk07D+iu+suuo=;
 b=uJNrmHzGPCPJP+oZmbrhD1mjJqxFKa4BZpcMdMKXcF+6bxkplkPIEYKcwz2dx1m/lM
 lBFSrxs4SAPUGOD89r/WlxfU4pxVkXCTtozrX7QTFGdcY4V+pcSvpfiVeSPd5/rA0Fpx
 oHYws0N/Ajl3xZpQABkVMyCDHagLDaRDR+Rp5knnZ6bVc+i8r7ZF5BOlxHtVbQZfPm32
 ns0/ptdye6FNkuy/HoTALqtaR0dOAvTsjwNW7gPgMgCH1ohkzmvbsBR2sAedvPRydssp
 NbsDbX0/pMLwJh+lDDjPPUN5PxNbMB/w47Mcsdj2apatTKKisoJh03EUHyuKFAehAQVo
 EuaQ==
X-Gm-Message-State: AO0yUKX1dRwmiTVSx1xk06wgJHrW13Mk4K0CPL83G9Ux6B32dmbt77iO
 gJEoLs/yojVZ4Jd8PNe64QjD9w==
X-Google-Smtp-Source: AK7set+FdO/v4nuomgvGEXlnLsWmgixmGRUt+lHujVhGr3EzhR4J6g19O7g55LMLg1qHcY1q25Yn4A==
X-Received: by 2002:aa7:98da:0:b0:5de:a3dd:bc78 with SMTP id
 e26-20020aa798da000000b005dea3ddbc78mr3538500pfm.12.1677227853242; 
 Fri, 24 Feb 2023 00:37:33 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005dd98927cc5sm2507945pfn.76.2023.02.24.00.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:37:33 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V4 8/8] MAINTAINERS: Add entry for RISC-V ACPI
Date: Fri, 24 Feb 2023 14:07:01 +0530
Message-Id: <20230224083701.2657063-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 08:37:35 -0000

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
index 9adb628627..7a47c2c724 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -994,12 +994,6 @@ S: Maintained
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
@@ -1907,6 +1901,18 @@ F: hw/acpi/ghes.c
 F: include/hw/acpi/ghes.h
 F: docs/specs/acpi_hest_ghes.rst
 
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
 ppc4xx
 L: qemu-ppc@nongnu.org
 S: Orphan
-- 
2.34.1


