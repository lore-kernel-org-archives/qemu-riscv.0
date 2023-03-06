Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIx4-0007cR-9y
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIx2-0007QC-IK
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:05:00 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIws-0006rs-Gk
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:53 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso10067281pjs.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140289;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47W96iQ+SkG3dvh8kZCFx6LTiVa4sba31wGpFSZ1JEg=;
 b=u2sT4RhWeHNcuok2Zaibp/0qEyvYi7pzcJLdZVYtTF4tNyoXTcSFGHliuJypI8WhhO
 tJFxalLLF2T+xf6sYZY5OqCs7bezCexXIX4TS0UMd8N0uncUnBqT61OMV86RBjpxLxq4
 i//OdDPLeWePHeUfbpuMtOl6FTzKkSw8GCp9KzoBnctK00lI+cfo9/r67FYi485Mc1nr
 Dq3ge4rhNuAUZgfqkm57UZFjvebtTLECx9BO8id/g7p93QGuuJFQEVG21baS7hHJq+/Y
 U96hrz/fDHi1Ci7gOc7TcJmoZWvFPw38qZVORs7Kw+9/Hj8fCyww47R/DhZxSSDQxNTo
 ElKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140289;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=47W96iQ+SkG3dvh8kZCFx6LTiVa4sba31wGpFSZ1JEg=;
 b=4cLPBH/Uvkr6GGPrZstaBKEUgybHXjHQ5aJAOdNYZMyyLLn0PjsCeF+V2jWwwPbAk0
 K+qrXbXTibp1U4cdwsgHoCCuj844WBIYwtP0o/z68UBSsV/+vsJsDDaOCBQwdI1kqCQv
 iDnbWbtY9ydMqYHxzlyUWbtamouKtY1E7RUn8Qn2b07Oh4hJ0uxKYNdxs4mGlAlhlXtW
 9zx7FrySg158HCcje/Ay07gYOeHg5a7L8xWcAFgl9QaQhtAyTse546UpE+TowiJ0I8ZB
 Qrz4oFa3m88yxxdvtO3wRHokvFuTwwsTmw0iRSgzgKpeGCbeuARuzRf/xu9xnjoyma5J
 iwmQ==
X-Gm-Message-State: AO0yUKUgpA8t3neH1B4mUvzbAN7+HdRA/eQ1J0p0KkEgRGpY/xqoDftt
 5VvDjK7+7a1ShEJCQcWEarjpqJO4vDf+33+D/g0=
X-Google-Smtp-Source: AK7set8rFf0x6ITod2sUsRYquKxHVbqXN3JqwpRDRBo1fL+SESiG/HEbG/wjs+wRa8InsBzFPekD6w==
X-Received: by 2002:a17:903:32cf:b0:19d:1d32:fbe with SMTP id
 i15-20020a17090332cf00b0019d1d320fbemr14890417plr.20.1678140289558; 
 Mon, 06 Mar 2023 14:04:49 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170902e88e00b0019e88d9bed3sm7142069plg.210.2023.03.06.14.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:49 -0800 (PST)
Subject: [PULL 22/22] MAINTAINERS: Add entry for RISC-V ACPI
Date: Mon,  6 Mar 2023 14:02:59 -0800
Message-Id: <20230306220259.7748-23-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 22:05:00 -0000

From: Sunil V L <sunilvl@ventanamicro.com>

RISC-V ACPI related functionality for virt machine is added in
virt-acpi-build.c. Add the maintainer entry after moving the
ARM ACPI entry under the main ACPI entry.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230302091212.999767-9-sunilvl@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 MAINTAINERS | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 011fd85a09..26bf14b57b 100644
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
2.39.2


