Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3917C001DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 02:35:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMJTn-0005Ca-CP; Wed, 19 Jul 2023 22:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1qMJTm-000593-76
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 22:33:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1qMJTh-0002JQ-JX
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 22:33:21 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-66872d4a141so184018b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Jul 2023 19:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689820396; x=1690425196; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QX0UhZb38bubzf/D9jy8IdJc3iA149BbyBkKP78pa78=;
 b=WM+MaPa92nQVOYhWfD59L6pWcNee0MCXM5DRlysd4uO4/5DpGwnJSMHWQ4E8xQJ+KU
 OR4LnpYHiaID8kOkIp7MVyneCCjMHzDJe/RwTDg950QdD+ZzeDRPpV5m3zRKcS935Yke
 6NaKE+nqP6+8g2kiGavTsHewTPSaTgUYJSc0hvEpSVwtsvlkyLl+/LooRsAjr+ehfSkm
 EupZRCWeNUHx2OS7Im9S5mivNp02XXiRvI1Sczjss4fTRQ+2mBpMaJ7gx0JNmtH3kH1j
 IteCjK7vJk5lJPN0g2eBEM1IO6e5IpaqJNFW8jRB3JEi5rThjCFMnUVGoww3oIqOMwC3
 aLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689820396; x=1690425196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QX0UhZb38bubzf/D9jy8IdJc3iA149BbyBkKP78pa78=;
 b=T1JlZ9/1uwMp/PT2aPFp7O4bQKFU70QOW1kf0iF2759Quq+Ae0mhNOy/LgdX89wJ6R
 +t8d9A3RtOjmN/YmYWrzFpLao+PaAFzkasQH/nv2JU5zq/bj8N1565M8QZBfFJP8XjlS
 HkhBu9ezCKF6XRsPgbaiz+rzSerKNwzDdXamyutO87000TnIQnwjNZgV4CjWHbOn6A7M
 aAskOUkqKq7g3iUPdV2Ng7UhpdOWP3VOMoiXrOpfpoaXsnWkXXgycgM8qxT0KbCX5ACM
 7xK9moI+855FP6LbnQkXOSOwCvn4DxU+URPSOSbeM7atCLlPTeayVTMtBmQ1/dqxCcH3
 STCA==
X-Gm-Message-State: ABy/qLaKL9e6mMzi9fp7fNGfSoJ4foLmRRwcP+cKQyYtcZkc1NOCtew/
 Yu7WPFFA7Tkm6mRZVgVR1dtiFtSAOSGCfYD54krCag==
X-Google-Smtp-Source: APBJJlFaMtL+orYpRAWDCzDaQlz27HPx8VeGBAdUhlPglVIdQPDpONpCIwJ8caXAWEXV5t/cwWCezw==
X-Received: by 2002:a05:6a21:9987:b0:137:68c3:c86f with SMTP id
 ve7-20020a056a21998700b0013768c3c86fmr2576278pzb.55.1689820395317; 
 Wed, 19 Jul 2023 19:33:15 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a1709029a8500b001b9e9f191f2sm4692032plp.15.2023.07.19.19.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 19:33:14 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, linux@rivosinc.com,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Sebastien Boeuf <seb@rivosinc.com>
Subject: [PATCH 1/5] hw/riscv: Introduction of RISC-V IOMMU device
Date: Wed, 19 Jul 2023 19:32:54 -0700
Message-Id: <16cf403dcaa44903c6148c5027b18bd9b6bff6a2.1689819031.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689819031.git.tjeznach@rivosinc.com>
References: <cover.1689819031.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=tjeznach@rivosinc.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The RISC-V IOMMU specification is now ratified as-per the RISC-V international
process [1]. The latest frozen specifcation can be found at:
https://github.com/riscv-non-isa/riscv-iommu/releases/download/v1.0/riscv-iommu.pdf

The patch add device emulation for RISC-V IOMMU which supports device and process
context lookups, command and fault queue interfaces, two stage address translation
logic with Sv32, Sv39, Sv48, Sv57 addressing modes, address translation cache,
MSI remapping with FLAT/MRIF modes, initial ATS and PRI interfaces, debug capabilities,
hardware performance counters. Platform and PCIe device instantiation is supported,
with wire-signaled and message-signaled interrupt capabilities.

Hardware interface definition file is shared with Linux kernel driver implementation,
available in the maintainer's branch riscv_iommu_v1 at https://github.com/tjeznach/linux.

Co-developed-by: Sebastien Boeuf <seb@rivosinc.com>
Signed-off-by: Sebastien Boeuf <seb@rivosinc.com>
Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 hw/riscv/Kconfig            |    3 +
 hw/riscv/meson.build        |    1 +
 hw/riscv/riscv-iommu-bits.h |  749 +++++++++++
 hw/riscv/riscv-iommu-pci.c  |  181 +++
 hw/riscv/riscv-iommu-sys.c  |  123 ++
 hw/riscv/riscv-iommu.c      | 2539 +++++++++++++++++++++++++++++++++++
 hw/riscv/riscv-iommu.h      |  152 +++
 hw/riscv/trace-events       |   14 +
 hw/riscv/trace.h            |    2 +
 include/hw/riscv/iommu.h    |   40 +
 meson.build                 |    1 +
 11 files changed, 3805 insertions(+)
 create mode 100644 hw/riscv/riscv-iommu-bits.h
 create mode 100644 hw/riscv/riscv-iommu-pci.c
 create mode 100644 hw/riscv/riscv-iommu-sys.c
 create mode 100644 hw/riscv/riscv-iommu.c
 create mode 100644 hw/riscv/riscv-iommu.h
 create mode 100644 hw/riscv/trace-events
 create mode 100644 hw/riscv/trace.h
 create mode 100644 include/hw/riscv/iommu.h

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index b6a5eb4452..617a509f1b 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,3 +1,6 @@
+config RISCV_IOMMU
+    bool
+
 config RISCV_NUMA
     bool
 
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 2f7ee81be3..e37c5d78e2 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -10,5 +10,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
 riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_IOMMU', if_true: files('riscv-iommu.c', 'riscv-iommu-pci.c', 'riscv-iommu-sys.c'))
 
 hw_arch += {'riscv': riscv_ss}
diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
new file mode 100644
index 0000000000..9ce713361f
--- /dev/null
+++ b/hw/riscv/riscv-iommu-bits.h
@@ -0,0 +1,749 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2022-2023 Rivos Inc.
+ * Copyright © 2023 FORTH-ICS/CARV
+ * Copyright © 2023 RISC-V IOMMU Task Group
+ *
+ * RISC-V Ziommu - Register Layout and Data Structures.
+ *
+ * Based on the 'RISC-V IOMMU Architecture Specification', Version 1.0
+ * Published at  https://github.com/riscv-non-isa/riscv-iommu
+ *
+ */
+
+#ifndef HW_RISCV_IOMMU_BITS_H
+#define HW_RISCV_IOMMU_BITS_H
+
+/*
+ * This file is based on Linux RISC-V IOMMU file
+ * located at 'drivers/iommu/riscv/iommu-bits.h'
+ */
+
+#include "qemu/osdep.h"
+
+#define RISCV_IOMMU_SPEC_DOT_VER 0x010
+
+#ifndef GENMASK_ULL
+#define GENMASK_ULL(h, l) (((~0ULL) >> (63 - (h) + (l))) << (l))
+#endif
+
+/*
+ * Chapter 5: Memory Mapped register interface
+ */
+
+/* Common field positions */
+#define RISCV_IOMMU_PPN_FIELD           GENMASK_ULL(53, 10)
+#define RISCV_IOMMU_QUEUE_LOGSZ_FIELD   GENMASK_ULL(4, 0)
+#define RISCV_IOMMU_QUEUE_INDEX_FIELD   GENMASK_ULL(31, 0)
+#define RISCV_IOMMU_QUEUE_ENABLE        BIT(0)
+#define RISCV_IOMMU_QUEUE_INTR_ENABLE   BIT(1)
+#define RISCV_IOMMU_QUEUE_MEM_FAULT     BIT(8)
+#define RISCV_IOMMU_QUEUE_OVERFLOW      BIT(9)
+#define RISCV_IOMMU_QUEUE_ACTIVE        BIT(16)
+#define RISCV_IOMMU_QUEUE_BUSY          BIT(17)
+#define RISCV_IOMMU_ATP_PPN_FIELD       GENMASK_ULL(43, 0)
+#define RISCV_IOMMU_ATP_MODE_FIELD      GENMASK_ULL(63, 60)
+
+/* 5.3 IOMMU Capabilities (64bits) */
+#define RISCV_IOMMU_REG_CAP             0x0000
+#define RISCV_IOMMU_CAP_VERSION         GENMASK_ULL(7, 0)
+#define RISCV_IOMMU_CAP_S_SV32          BIT_ULL(8)
+#define RISCV_IOMMU_CAP_S_SV39          BIT_ULL(9)
+#define RISCV_IOMMU_CAP_S_SV48          BIT_ULL(10)
+#define RISCV_IOMMU_CAP_S_SV57          BIT_ULL(11)
+#define RISCV_IOMMU_CAP_SVPBMT          BIT_ULL(15)
+#define RISCV_IOMMU_CAP_G_SV32          BIT_ULL(16)
+#define RISCV_IOMMU_CAP_G_SV39          BIT_ULL(17)
+#define RISCV_IOMMU_CAP_G_SV48          BIT_ULL(18)
+#define RISCV_IOMMU_CAP_G_SV57          BIT_ULL(19)
+#define RISCV_IOMMU_CAP_MSI_FLAT        BIT_ULL(22)
+#define RISCV_IOMMU_CAP_MSI_MRIF        BIT_ULL(23)
+#define RISCV_IOMMU_CAP_AMO             BIT_ULL(24)
+#define RISCV_IOMMU_CAP_ATS             BIT_ULL(25)
+#define RISCV_IOMMU_CAP_T2GPA           BIT_ULL(26)
+#define RISCV_IOMMU_CAP_END             BIT_ULL(27)
+#define RISCV_IOMMU_CAP_IGS             GENMASK_ULL(29, 28)
+#define RISCV_IOMMU_CAP_HPM             BIT_ULL(30)
+#define RISCV_IOMMU_CAP_DBG             BIT_ULL(31)
+#define RISCV_IOMMU_CAP_PAS             GENMASK_ULL(37, 32)
+#define RISCV_IOMMU_CAP_PD8             BIT_ULL(38)
+#define RISCV_IOMMU_CAP_PD17            BIT_ULL(39)
+#define RISCV_IOMMU_CAP_PD20            BIT_ULL(40)
+
+#define RISCV_IOMMU_CAP_VERSION_VER_MASK      0xF0
+#define RISCV_IOMMU_CAP_VERSION_REV_MASK      0x0F
+
+/**
+ * enum riscv_iommu_igs_settings - Interrupt Generation Support Settings
+ * @RISCV_IOMMU_CAP_IGS_MSI: I/O MMU supports only MSI generation
+ * @RISCV_IOMMU_CAP_IGS_WSI: I/O MMU supports only Wired-Signaled interrupt
+ * @RISCV_IOMMU_CAP_IGS_BOTH: I/O MMU supports both MSI and WSI generation
+ * @RISCV_IOMMU_CAP_IGS_RSRV: Reserved for standard use
+ */
+enum riscv_iommu_igs_settings {
+      RISCV_IOMMU_CAP_IGS_MSI  = 0,
+      RISCV_IOMMU_CAP_IGS_WSI  = 1,
+      RISCV_IOMMU_CAP_IGS_BOTH = 2,
+      RISCV_IOMMU_CAP_IGS_RSRV = 3
+};
+
+
+/* 5.4 Features control register (32bits) */
+#define RISCV_IOMMU_REG_FCTL            0x0008
+#define RISCV_IOMMU_FCTL_BE             BIT(0)
+#define RISCV_IOMMU_FCTL_WSI            BIT(1)
+#define RISCV_IOMMU_FCTL_GXL            BIT(2)
+
+
+/* 5.5 Device-directory-table pointer (64bits) */
+#define RISCV_IOMMU_REG_DDTP            0x0010
+#define RISCV_IOMMU_DDTP_MODE           GENMASK_ULL(3, 0)
+#define RISCV_IOMMU_DDTP_BUSY           BIT_ULL(4)
+#define RISCV_IOMMU_DDTP_PPN            RISCV_IOMMU_PPN_FIELD
+
+/**
+ * enum riscv_iommu_ddtp_modes - I/O MMU translation modes
+ * @RISCV_IOMMU_DDTP_MODE_OFF: No inbound transactions allowed
+ * @RISCV_IOMMU_DDTP_MODE_BARE: Pass-through mode
+ * @RISCV_IOMMU_DDTP_MODE_1LVL: One-level DDT
+ * @RISCV_IOMMU_DDTP_MODE_2LVL: Two-level DDT
+ * @RISCV_IOMMU_DDTP_MODE_3LVL: Three-level DDT
+ */
+enum riscv_iommu_ddtp_modes {
+      RISCV_IOMMU_DDTP_MODE_OFF = 0,
+      RISCV_IOMMU_DDTP_MODE_BARE = 1,
+      RISCV_IOMMU_DDTP_MODE_1LVL = 2,
+      RISCV_IOMMU_DDTP_MODE_2LVL = 3,
+      RISCV_IOMMU_DDTP_MODE_3LVL = 4,
+      RISCV_IOMMU_DDTP_MODE_MAX = 4
+};
+
+
+/* 5.6 Command Queue Base (64bits) */
+#define RISCV_IOMMU_REG_CQB             0x0018
+#define RISCV_IOMMU_CQB_LOG2SZ          RISCV_IOMMU_QUEUE_LOGSZ_FIELD
+#define RISCV_IOMMU_CQB_PPN             RISCV_IOMMU_PPN_FIELD
+
+/* 5.7 Command Queue head (32bits) */
+#define RISCV_IOMMU_REG_CQH             0x0020
+#define RISCV_IOMMU_CQH_INDEX           RISCV_IOMMU_QUEUE_INDEX_FIELD
+
+/* 5.8 Command Queue tail (32bits) */
+#define RISCV_IOMMU_REG_CQT             0x0024
+#define RISCV_IOMMU_CQT_INDEX           RISCV_IOMMU_QUEUE_INDEX_FIELD
+
+
+/* 5.9 Fault Queue Base (64bits) */
+#define RISCV_IOMMU_REG_FQB             0x0028
+#define RISCV_IOMMU_FQB_LOG2SZ          RISCV_IOMMU_QUEUE_LOGSZ_FIELD
+#define RISCV_IOMMU_FQB_PPN             RISCV_IOMMU_PPN_FIELD
+
+/* 5.10 Fault Queue Head (32bits) */
+#define RISCV_IOMMU_REG_FQH             0x0030
+#define RISCV_IOMMU_FQH_INDEX           RISCV_IOMMU_QUEUE_INDEX_FIELD
+
+/* 5.11 Fault Queue tail (32bits) */
+#define RISCV_IOMMU_REG_FQT             0x0034
+#define RISCV_IOMMU_FQT_INDEX           RISCV_IOMMU_QUEUE_INDEX_FIELD
+
+
+/* 5.12 Page Request Queue base (64bits) */
+#define RISCV_IOMMU_REG_PQB             0x0038
+#define RISCV_IOMMU_PQB_LOG2SZ          RISCV_IOMMU_QUEUE_LOGSZ_FIELD
+#define RISCV_IOMMU_PQB_PPN             RISCV_IOMMU_PPN_FIELD
+
+/* 5.13 Page Request Queue head (32bits) */
+#define RISCV_IOMMU_REG_PQH             0x0040
+#define RISCV_IOMMU_PQH_INDEX           RISCV_IOMMU_QUEUE_INDEX_FIELD
+
+/* 5.14 Page Request Queue tail (32bits) */
+#define RISCV_IOMMU_REG_PQT             0x0044
+#define RISCV_IOMMU_PQT_INDEX_MASK      RISCV_IOMMU_QUEUE_INDEX_FIELD
+
+/* 5.15 Command Queue CSR (32bits) */
+#define RISCV_IOMMU_REG_CQCSR           0x0048
+#define RISCV_IOMMU_CQCSR_CQEN          RISCV_IOMMU_QUEUE_ENABLE
+#define RISCV_IOMMU_CQCSR_CIE           RISCV_IOMMU_QUEUE_INTR_ENABLE
+#define RISCV_IOMMU_CQCSR_CQMF          RISCV_IOMMU_QUEUE_MEM_FAULT
+#define RISCV_IOMMU_CQCSR_CMD_TO        BIT(9)
+#define RISCV_IOMMU_CQCSR_CMD_ILL       BIT(10)
+#define RISCV_IOMMU_CQCSR_FENCE_W_IP    BIT(11)
+#define RISCV_IOMMU_CQCSR_CQON          RISCV_IOMMU_QUEUE_ACTIVE
+#define RISCV_IOMMU_CQCSR_BUSY          RISCV_IOMMU_QUEUE_BUSY
+
+
+/* 5.16 Fault Queue CSR (32bits) */
+#define RISCV_IOMMU_REG_FQCSR           0x004C
+#define RISCV_IOMMU_FQCSR_FQEN          RISCV_IOMMU_QUEUE_ENABLE
+#define RISCV_IOMMU_FQCSR_FIE           RISCV_IOMMU_QUEUE_INTR_ENABLE
+#define RISCV_IOMMU_FQCSR_FQMF          RISCV_IOMMU_QUEUE_MEM_FAULT
+#define RISCV_IOMMU_FQCSR_FQOF          RISCV_IOMMU_QUEUE_OVERFLOW
+#define RISCV_IOMMU_FQCSR_FQON          RISCV_IOMMU_QUEUE_ACTIVE
+#define RISCV_IOMMU_FQCSR_BUSY          RISCV_IOMMU_QUEUE_BUSY
+
+
+/* 5.17 Page Request Queue CSR (32bits) */
+#define RISCV_IOMMU_REG_PQCSR           0x0050
+#define RISCV_IOMMU_PQCSR_PQEN          RISCV_IOMMU_QUEUE_ENABLE
+#define RISCV_IOMMU_PQCSR_PIE           RISCV_IOMMU_QUEUE_INTR_ENABLE
+#define RISCV_IOMMU_PQCSR_PQMF          RISCV_IOMMU_QUEUE_MEM_FAULT
+#define RISCV_IOMMU_PQCSR_PQOF          RISCV_IOMMU_QUEUE_OVERFLOW
+#define RISCV_IOMMU_PQCSR_PQON          RISCV_IOMMU_QUEUE_ACTIVE
+#define RISCV_IOMMU_PQCSR_BUSY          RISCV_IOMMU_QUEUE_BUSY
+
+
+/* 5.18 Interrupt Pending Status (32bits) */
+#define RISCV_IOMMU_REG_IPSR            0x0054
+
+#define RISCV_IOMMU_INTR_CQ             0
+#define RISCV_IOMMU_INTR_FQ             1
+#define RISCV_IOMMU_INTR_PM             2
+#define RISCV_IOMMU_INTR_PQ             3
+#define RISCV_IOMMU_INTR_COUNT          4
+
+#define RISCV_IOMMU_IPSR_CIP            BIT(RISCV_IOMMU_INTR_CQ)
+#define RISCV_IOMMU_IPSR_FIP            BIT(RISCV_IOMMU_INTR_FQ)
+#define RISCV_IOMMU_IPSR_PMIP           BIT(RISCV_IOMMU_INTR_PM)
+#define RISCV_IOMMU_IPSR_PIP            BIT(RISCV_IOMMU_INTR_PQ)
+
+#define RISCV_IOMMU_IOCOUNT_NUM         31
+
+/* 5.19 Performance monitoring counter overflow status (32bits) */
+#define RISCV_IOMMU_REG_IOCOUNTOVF      0x0058
+#define RISCV_IOMMU_IOCOUNTOVF_CY       BIT(0)
+#define RISCV_IOMMU_IOCOUNTOVF_HPM      GENMASK(31, 1)
+
+/* 5.20 Performance monitoring counter inhibits (32bits) */
+#define RISCV_IOMMU_REG_IOCOUNTINH      0x005C
+#define RISCV_IOMMU_IOCOUNTINH_CY       BIT(0)
+#define RISCV_IOMMU_IOCOUNTINH_HPM      GENMASK(31, 1)
+
+/* 5.21 Performance monitoring cycles counter (64bits) */
+#define RISCV_IOMMU_REG_IOHPMCYCLES     0x0060
+#define RISCV_IOMMU_IOHPMCYCLES_COUNTER GENMASK_ULL(62, 0)
+#define RISCV_IOMMU_IOHPMCYCLES_OVF     BIT_ULL(63)
+
+/* 5.22 Performance monitoring event counters (31 * 64bits) */
+#define RISCV_IOMMU_REG_IOHPMCTR_BASE   0x0068
+#define RISCV_IOMMU_REG_IOHPMCTR(_n)    \
+    (RISCV_IOMMU_REG_IOHPMCTR_BASE + (_n * 0x8))
+
+/* 5.23 Performance monitoring event selectors (31 * 64bits) */
+#define RISCV_IOMMU_REG_IOHPMEVT_BASE   0x0160
+#define RISCV_IOMMU_REG_IOHPMEVT(_n)    \
+    (RISCV_IOMMU_REG_IOHPMEVT_BASE + (_n * 0x8))
+#define RISCV_IOMMU_IOHPMEVT_EVENT_ID   GENMASK_ULL(14, 0)
+#define RISCV_IOMMU_IOHPMEVT_DMASK      BIT_ULL(15)
+#define RISCV_IOMMU_IOHPMEVT_PID_PSCID  GENMASK_ULL(35, 16)
+#define RISCV_IOMMU_IOHPMEVT_DID_GSCID  GENMASK_ULL(59, 36)
+#define RISCV_IOMMU_IOHPMEVT_PV_PSCV    BIT_ULL(60)
+#define RISCV_IOMMU_IOHPMEVT_DV_GSCV    BIT_ULL(61)
+#define RISCV_IOMMU_IOHPMEVT_IDT        BIT_ULL(62)
+#define RISCV_IOMMU_IOHPMEVT_OF         BIT_ULL(63)
+
+/**
+ * enum RISCV_IOMMU_HPMEVENT_id - Performance-monitoring event identifier
+ *
+ * @RISCV_IOMMU_HPMEVENT_INVALID: Invalid event, do not count
+ * @RISCV_IOMMU_HPMEVENT_URQ: Untranslated requests
+ * @RISCV_IOMMU_HPMEVENT_TRQ: Translated requests
+ * @RISCV_IOMMU_HPMEVENT_ATS_RQ: ATS translation requests
+ * @RISCV_IOMMU_HPMEVENT_TLB_MISS: TLB misses
+ * @RISCV_IOMMU_HPMEVENT_DD_WALK: Device directory walks
+ * @RISCV_IOMMU_HPMEVENT_PD_WALK: Process directory walks
+ * @RISCV_IOMMU_HPMEVENT_S_VS_WALKS: S/VS-Stage page table walks
+ * @RISCV_IOMMU_HPMEVENT_G_WALKS: G-Stage page table walks
+ * @RISCV_IOMMU_HPMEVENT_MAX: Value to denote maximum Event IDs
+ */
+enum RISCV_IOMMU_HPMEVENT_id {
+    RISCV_IOMMU_HPMEVENT_INVALID    = 0,
+    RISCV_IOMMU_HPMEVENT_URQ        = 1,
+    RISCV_IOMMU_HPMEVENT_TRQ        = 2,
+    RISCV_IOMMU_HPMEVENT_ATS_RQ     = 3,
+    RISCV_IOMMU_HPMEVENT_TLB_MISS   = 4,
+    RISCV_IOMMU_HPMEVENT_DD_WALK    = 5,
+    RISCV_IOMMU_HPMEVENT_PD_WALK    = 6,
+    RISCV_IOMMU_HPMEVENT_S_VS_WALKS = 7,
+    RISCV_IOMMU_HPMEVENT_G_WALKS    = 8,
+    RISCV_IOMMU_HPMEVENT_MAX        = 9
+};
+
+/* 5.24 Translation request IOVA (64bits) */
+#define RISCV_IOMMU_REG_TR_REQ_IOVA     0x0258
+#define RISCV_IOMMU_TR_REQ_IOVA_VPN     GENMASK_ULL(63, 12)
+
+/* 5.25 Translation request control (64bits) */
+#define RISCV_IOMMU_REG_TR_REQ_CTL      0x0260
+#define RISCV_IOMMU_TR_REQ_CTL_GO_BUSY  BIT_ULL(0)
+#define RISCV_IOMMU_TR_REQ_CTL_PRIV     BIT_ULL(1)
+#define RISCV_IOMMU_TR_REQ_CTL_EXE      BIT_ULL(2)
+#define RISCV_IOMMU_TR_REQ_CTL_NW       BIT_ULL(3)
+#define RISCV_IOMMU_TR_REQ_CTL_PID      GENMASK_ULL(31, 12)
+#define RISCV_IOMMU_TR_REQ_CTL_PV       BIT_ULL(32)
+#define RISCV_IOMMU_TR_REQ_CTL_DID      GENMASK_ULL(63, 40)
+
+/* 5.26 Translation request response (64bits) */
+#define RISCV_IOMMU_REG_TR_RESPONSE     0x0268
+#define RISCV_IOMMU_TR_RESPONSE_FAULT   BIT_ULL(0)
+#define RISCV_IOMMU_TR_RESPONSE_PBMT    GENMASK_ULL(8, 7)
+#define RISCV_IOMMU_TR_RESPONSE_SZ      BIT_ULL(9)
+#define RISCV_IOMMU_TR_RESPONSE_PPN     RISCV_IOMMU_PPN_FIELD
+
+
+/* 5.27 Interrupt cause to vector (64bits) */
+#define RISCV_IOMMU_REG_IVEC            0x02F8
+#define RISCV_IOMMU_IVEC_CIV            GENMASK_ULL(3, 0)
+#define RISCV_IOMMU_IVEC_FIV            GENMASK_ULL(7, 4)
+#define RISCV_IOMMU_IVEC_PMIV           GENMASK_ULL(11, 8)
+#define RISCV_IOMMU_IVEC_PIV            GENMASK_ULL(15, 12)
+
+
+/* 5.28 MSI Configuration table (32 * 64bits) */
+#define RISCV_IOMMU_REG_MSI_CONFIG      0x0300
+#define RISCV_IOMMU_REG_MSI_ADDR(_n)    \
+    (RISCV_IOMMU_REG_MSI_CONFIG + (_n * 0x10))
+#define RISCV_IOMMU_MSI_ADDR            GENMASK_ULL(55, 2)
+#define RISCV_IOMMU_REG_MSI_DATA(_n)    \
+    (RISCV_IOMMU_REG_MSI_CONFIG + (_n * 0x10) + 0x08)
+#define RISCV_IOMMU_MSI_DATA            GENMASK_ULL(31, 0)
+#define RISCV_IOMMU_REG_MSI_VEC_CTL(_n) \
+    (RISCV_IOMMU_REG_MSI_CONFIG + (_n * 0x10) + 0x0C)
+#define RISCV_IOMMU_MSI_VEC_CTL_M      BIT_ULL(0)
+
+
+#define RISCV_IOMMU_REG_SIZE           0x1000
+
+/*
+ * Chapter 2: Data structures
+ */
+
+/*
+ * Device Directory Table macros for non-leaf nodes
+ */
+#define RISCV_IOMMU_DDTE_VALID          BIT_ULL(0)
+#define RISCV_IOMMU_DDTE_PPN            RISCV_IOMMU_PPN_FIELD
+
+/**
+ * struct riscv_iommu_dc - Device Context
+ * @tc: Translation Control
+ * @iohgatp: I/O Hypervisor guest address translation and protection
+ *           (Second stage context)
+ * @ta: Translation Attributes
+ * @fsc: First stage context
+ * @msiptpt: MSI page table pointer
+ * @msi_addr_mask: MSI address mask
+ * @msi_addr_pattern: MSI address pattern
+ *
+ * This structure is used for leaf nodes on the Device Directory Table,
+ * in case RISCV_IOMMU_CAP_MSI_FLAT is not set, the bottom 4 fields are
+ * not present and are skipped with pointer arithmetic to avoid
+ * casting, check out riscv_iommu_get_dc().
+ * See section 2.1 for more details
+ */
+struct riscv_iommu_dc {
+      uint64_t tc;
+      uint64_t iohgatp;
+      uint64_t ta;
+      uint64_t fsc;
+      uint64_t msiptp;
+      uint64_t msi_addr_mask;
+      uint64_t msi_addr_pattern;
+      uint64_t _reserved;
+};
+
+/* Translation control fields */
+#define RISCV_IOMMU_DC_TC_V             BIT_ULL(0)
+#define RISCV_IOMMU_DC_TC_EN_ATS        BIT_ULL(1)
+#define RISCV_IOMMU_DC_TC_EN_PRI        BIT_ULL(2)
+#define RISCV_IOMMU_DC_TC_T2GPA         BIT_ULL(3)
+#define RISCV_IOMMU_DC_TC_DTF           BIT_ULL(4)
+#define RISCV_IOMMU_DC_TC_PDTV          BIT_ULL(5)
+#define RISCV_IOMMU_DC_TC_PRPR          BIT_ULL(6)
+#define RISCV_IOMMU_DC_TC_GADE          BIT_ULL(7)
+#define RISCV_IOMMU_DC_TC_SADE          BIT_ULL(8)
+#define RISCV_IOMMU_DC_TC_DPE           BIT_ULL(9)
+#define RISCV_IOMMU_DC_TC_SBE           BIT_ULL(10)
+#define RISCV_IOMMU_DC_TC_SXL           BIT_ULL(11)
+
+/* Second-stage (aka G-stage) context fields */
+#define RISCV_IOMMU_DC_IOHGATP_PPN      RISCV_IOMMU_ATP_PPN_FIELD
+#define RISCV_IOMMU_DC_IOHGATP_GSCID    GENMASK_ULL(59, 44)
+#define RISCV_IOMMU_DC_IOHGATP_MODE     RISCV_IOMMU_ATP_MODE_FIELD
+
+/**
+ * enum riscv_iommu_dc_iohgatp_modes - Guest address
+ * translation/protection modes
+ *
+ * @RISCV_IOMMU_DC_IOHGATP_MODE_BARE:
+ *      No translation/protection
+ * @RISCV_IOMMU_DC_IOHGATP_MODE_SV32X4:
+ *      Sv32x4 (2-bit extension of Sv32), when fctl.GXL == 1
+ * @RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4:
+ *      Sv39x4 (2-bit extension of Sv39), when fctl.GXL == 0
+ * @RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4:
+ *      Sv48x4 (2-bit extension of Sv48), when fctl.GXL == 0
+ * @RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4:
+ *      Sv57x4 (2-bit extension of Sv57), when fctl.GXL == 0
+ */
+enum riscv_iommu_dc_iohgatp_modes {
+      RISCV_IOMMU_DC_IOHGATP_MODE_BARE = 0,
+      RISCV_IOMMU_DC_IOHGATP_MODE_SV32X4 = 8,
+      RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4 = 8,
+      RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4 = 9,
+      RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4 = 10
+};
+
+/* Translation attributes fields */
+#define RISCV_IOMMU_DC_TA_PSCID         GENMASK_ULL(31, 12)
+
+/* First-stage context fields */
+#define RISCV_IOMMU_DC_FSC_PPN          RISCV_IOMMU_ATP_PPN_FIELD
+#define RISCV_IOMMU_DC_FSC_MODE         RISCV_IOMMU_ATP_MODE_FIELD
+
+/**
+ * enum riscv_iommu_dc_fsc_atp_modes - First stage address
+ * translation/protection modes
+ *
+ * @RISCV_IOMMU_DC_FSC_MODE_BARE: No translation/protection
+ * @RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV32: Sv32, when dc.tc.SXL == 1
+ * @RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39: Sv39, when dc.tc.SXL == 0
+ * @RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV48: Sv48, when dc.tc.SXL == 0
+ * @RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV57: Sv57, when dc.tc.SXL == 0
+ * @RISCV_IOMMU_DC_FSC_PDTP_MODE_PD8: 1lvl PDT, 8bit process ids
+ * @RISCV_IOMMU_DC_FSC_PDTP_MODE_PD17: 2lvl PDT, 17bit process ids
+ * @RISCV_IOMMU_DC_FSC_PDTP_MODE_PD20: 3lvl PDT, 20bit process ids
+ *
+ * FSC holds IOSATP when RISCV_IOMMU_DC_TC_PDTV is 0 and PDTP otherwise.
+ * IOSATP controls the first stage address translation (same as the satp
+ * register on the RISC-V MMU), and PDTP holds the process directory table,
+ * used to select a first stage page table based on a process id (for devices
+ * that support multiple process ids).
+ */
+enum riscv_iommu_dc_fsc_atp_modes {
+      RISCV_IOMMU_DC_FSC_MODE_BARE = 0,
+      RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV32 = 8,
+      RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39 = 8,
+      RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV48 = 9,
+      RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV57 = 10,
+      RISCV_IOMMU_DC_FSC_PDTP_MODE_PD8 = 1,
+      RISCV_IOMMU_DC_FSC_PDTP_MODE_PD17 = 2,
+      RISCV_IOMMU_DC_FSC_PDTP_MODE_PD20 = 3
+};
+
+/* MSI page table pointer */
+#define RISCV_IOMMU_DC_MSIPTP_PPN       RISCV_IOMMU_ATP_PPN_FIELD
+#define RISCV_IOMMU_DC_MSIPTP_MODE      RISCV_IOMMU_ATP_MODE_FIELD
+#define RISCV_IOMMU_DC_MSIPTP_MODE_OFF  0
+#define RISCV_IOMMU_DC_MSIPTP_MODE_FLAT 1
+
+/* MSI address mask */
+#define RISCV_IOMMU_DC_MSI_ADDR_MASK    GENMASK_ULL(51, 0)
+
+/* MSI address pattern */
+#define RISCV_IOMMU_DC_MSI_PATTERN      GENMASK_ULL(51, 0)
+
+
+/**
+ * struct riscv_iommu_pc - Process Context
+ * @ta: Translation Attributes
+ * @fsc: First stage context
+ *
+ * This structure is used for leaf nodes on the Process Directory Table
+ * See section 2.3 for more details
+ */
+struct riscv_iommu_pc {
+      uint64_t ta;
+      uint64_t fsc;
+};
+
+/* Translation attributes fields */
+#define RISCV_IOMMU_PC_TA_V             BIT_ULL(0)
+#define RISCV_IOMMU_PC_TA_ENS           BIT_ULL(1)
+#define RISCV_IOMMU_PC_TA_SUM           BIT_ULL(2)
+#define RISCV_IOMMU_PC_TA_PSCID         GENMASK_ULL(31, 12)
+
+/* First stage context fields */
+#define RISCV_IOMMU_PC_FSC_PPN          GENMASK_ULL(43, 0)
+#define RISCV_IOMMU_PC_FSC_MODE         GENMASK_ULL(63, 60)
+
+
+/*
+ * Chapter 3: In-memory queue interface
+ */
+
+/**
+ * struct riscv_iommu_cmd - Generic I/O MMU command structure
+ * @dword0: Includes the opcode and the function identifier
+ * @dword1: Opcode specific data
+ *
+ * The commands are interpreted as two 64bit fields, where the first
+ * 7bits of the first field are the opcode which also defines the
+ * command's format, followed by a 3bit field that specifies the
+ * function invoked by that command, and the rest is opcode-specific.
+ * This is a generic struct which will be populated differently
+ * according to each command. For more infos on the commands and
+ * the command queue check section 3.1.
+ */
+struct riscv_iommu_command {
+      uint64_t dword0;
+      uint64_t dword1;
+};
+
+/* Fields on dword0, common for all commands */
+#define RISCV_IOMMU_CMD_OPCODE          GENMASK_ULL(6, 0)
+#define RISCV_IOMMU_CMD_FUNC            GENMASK_ULL(9, 7)
+
+/* 3.1.1 I/O MMU Page-table cache invalidation */
+/* Fields on dword0 */
+#define RISCV_IOMMU_CMD_IOTINVAL_OPCODE         1
+#define RISCV_IOMMU_CMD_IOTINVAL_FUNC_VMA       0
+#define RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA      1
+#define RISCV_IOMMU_CMD_IOTINVAL_AV     BIT_ULL(10)
+#define RISCV_IOMMU_CMD_IOTINVAL_PSCID  GENMASK_ULL(31, 12)
+#define RISCV_IOMMU_CMD_IOTINVAL_PSCV   BIT_ULL(32)
+#define RISCV_IOMMU_CMD_IOTINVAL_GV     BIT_ULL(33)
+#define RISCV_IOMMU_CMD_IOTINVAL_GSCID  GENMASK_ULL(59, 44)
+/* dword1 is the address, 4K-alligned and shifted to the right by two bits. */
+
+/* 3.1.2 I/O MMU Command Queue Fences */
+/* Fields on dword0 */
+#define RISCV_IOMMU_CMD_IOFENCE_OPCODE          2
+#define RISCV_IOMMU_CMD_IOFENCE_FUNC_C          0
+#define RISCV_IOMMU_CMD_IOFENCE_AV      BIT_ULL(10)
+#define RISCV_IOMMU_CMD_IOFENCE_WSI     BIT_ULL(11)
+#define RISCV_IOMMU_CMD_IOFENCE_PR      BIT_ULL(12)
+#define RISCV_IOMMU_CMD_IOFENCE_PW      BIT_ULL(13)
+#define RISCV_IOMMU_CMD_IOFENCE_DATA    GENMASK_ULL(63, 32)
+/* dword1 is the address, word-size alligned and shifted to the right by two bits. */
+
+/* 3.1.3 I/O MMU Directory cache invalidation */
+/* Fields on dword0 */
+#define RISCV_IOMMU_CMD_IODIR_OPCODE            3
+#define RISCV_IOMMU_CMD_IODIR_FUNC_INVAL_DDT    0
+#define RISCV_IOMMU_CMD_IODIR_FUNC_INVAL_PDT    1
+#define RISCV_IOMMU_CMD_IODIR_PID       GENMASK_ULL(31, 12)
+#define RISCV_IOMMU_CMD_IODIR_DV        BIT_ULL(33)
+#define RISCV_IOMMU_CMD_IODIR_DID       GENMASK_ULL(63, 40)
+/* dword1 is reserved for standard use */
+
+/* 3.1.4 I/O MMU PCIe ATS */
+/* Fields on dword0 */
+#define RISCV_IOMMU_CMD_ATS_OPCODE              4
+#define RISCV_IOMMU_CMD_ATS_FUNC_INVAL          0
+#define RISCV_IOMMU_CMD_ATS_FUNC_PRGR           1
+#define RISCV_IOMMU_CMD_ATS_PID         GENMASK_ULL(31, 12)
+#define RISCV_IOMMU_CMD_ATS_PV          BIT_ULL(32)
+#define RISCV_IOMMU_CMD_ATS_DSV         BIT_ULL(33)
+#define RISCV_IOMMU_CMD_ATS_RID         GENMASK_ULL(55, 40)
+#define RISCV_IOMMU_CMD_ATS_DSEG        GENMASK_ULL(63, 56)
+/* dword1 is the ATS payload, two different payload types for INVAL and PRGR */
+
+/* ATS.INVAL payload*/
+#define RISCV_IOMMU_CMD_ATS_INVAL_G     BIT_ULL(0)
+/* Bits 1 - 10 are zeroed */
+#define RISCV_IOMMU_CMD_ATS_INVAL_S     BIT_ULL(11)
+#define RISCV_IOMMU_CMD_ATS_INVAL_UADDR GENMASK_ULL(63, 12)
+
+/* ATS.PRGR payload */
+/* Bits 0 - 31 are zeroed */
+#define RISCV_IOMMU_CMD_ATS_PRGR_PRG_INDEX      GENMASK_ULL(40, 32)
+/* Bits 41 - 43 are zeroed */
+#define RISCV_IOMMU_CMD_ATS_PRGR_RESP_CODE      GENMASK_ULL(47, 44)
+#define RISCV_IOMMU_CMD_ATS_PRGR_DST_ID         GENMASK_ULL(63, 48)
+
+
+/**
+ * struct riscv_iommu_fq_record - Fault/Event Queue Record
+ * @hdr: Header, includes fault/event cause, PID/DID, transaction type etc
+ * @_reserved: Low 32bits for custom use, high 32bits for standard use
+ * @iotval: Transaction-type/cause specific format
+ * @iotval2: Cause specific format
+ *
+ * The fault/event queue reports events and failures raised when
+ * processing transactions. Each record is a 32byte structure where
+ * the first dword has a fixed format for providing generic infos
+ * regarding the fault/event, and two more dwords are there for
+ * fault/event-specific information. For more details see section
+ * 3.2.
+ */
+struct riscv_iommu_fq_record {
+      uint64_t hdr;
+      uint64_t _reserved;
+      uint64_t iotval;
+      uint64_t iotval2;
+};
+
+/* Fields on header */
+#define RISCV_IOMMU_FQ_HDR_CAUSE        GENMASK_ULL(11, 0)
+#define RISCV_IOMMU_FQ_HDR_PID          GENMASK_ULL(31, 12)
+#define RISCV_IOMMU_FQ_HDR_PV           BIT_ULL(32)
+#define RISCV_IOMMU_FQ_HDR_PRIV         BIT_ULL(33)
+#define RISCV_IOMMU_FQ_HDR_TTYPE        GENMASK_ULL(39, 34)
+#define RISCV_IOMMU_FQ_HDR_DID          GENMASK_ULL(63, 40)
+
+/**
+ * enum riscv_iommu_fq_causes - Fault/event cause values
+ * @RISCV_IOMMU_FQ_CAUSE_INST_FAULT: Instruction access fault
+ * @RISCV_IOMMU_FQ_CAUSE_RD_ADDR_MISALIGNED: Read address misaligned
+ * @RISCV_IOMMU_FQ_CAUSE_RD_FAULT: Read load fault
+ * @RISCV_IOMMU_FQ_CAUSE_WR_ADDR_MISALIGNED: Write/AMO address misaligned
+ * @RISCV_IOMMU_FQ_CAUSE_WR_FAULT: Write/AMO access fault
+ * @RISCV_IOMMU_FQ_CAUSE_INST_FAULT_S: Instruction page fault
+ * @RISCV_IOMMU_FQ_CAUSE_RD_FAULT_S: Read page fault
+ * @RISCV_IOMMU_FQ_CAUSE_WR_FAULT_S: Write/AMO page fault
+ * @RISCV_IOMMU_FQ_CAUSE_INST_FAULT_VS: Instruction guest page fault
+ * @RISCV_IOMMU_FQ_CAUSE_RD_FAULT_VS: Read guest page fault
+ * @RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS: Write/AMO guest page fault
+ * @RISCV_IOMMU_FQ_CAUSE_DMA_DISABLED: All inbound transactions disallowed
+ * @RISCV_IOMMU_FQ_CAUSE_DDT_LOAD_FAULT: DDT entry load access fault
+ * @RISCV_IOMMU_FQ_CAUSE_DDT_INVALID: DDT entry invalid
+ * @RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED: DDT entry misconfigured
+ * @RISCV_IOMMU_FQ_CAUSE_TTYPE_BLOCKED: Transaction type disallowed
+ * @RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT: MSI PTE load access fault
+ * @RISCV_IOMMU_FQ_CAUSE_MSI_INVALID: MSI PTE invalid
+ * @RISCV_IOMMU_FQ_CAUSE_MSI_MISCONFIGURED: MSI PTE misconfigured
+ * @RISCV_IOMMU_FQ_CAUSE_MRIF_FAULT: MRIF access fault
+ * @RISCV_IOMMU_FQ_CAUSE_PDT_LOAD_FAULT: PDT entry load access fault
+ * @RISCV_IOMMU_FQ_CAUSE_PDT_INVALID: PDT entry invalid
+ * @RISCV_IOMMU_FQ_CAUSE_PDT_MISCONFIGURED: PDT entry misconfigured
+ * @RISCV_IOMMU_FQ_CAUSE_DDT_CORRUPTED: DDT data corruption
+ * @RISCV_IOMMU_FQ_CAUSE_PDT_CORRUPTED: PDT data corruption
+ * @RISCV_IOMMU_FQ_CAUSE_MSI_PT_CORRUPTED: MSI page table data corruption
+ * @RISCV_IOMMU_FQ_CAUSE_MRIF_CORRUIPTED: MRIF data corruption
+ * @RISCV_IOMMU_FQ_CAUSE_INTERNAL_DP_ERROR: Internal data path error
+ * @RISCV_IOMMU_FQ_CAUSE_MSI_WR_FAULT: IOMMU MSI write access fault
+ * @RISCV_IOMMU_FQ_CAUSE_PT_CORRUPTED: First/second stage page table data corruption
+ *
+ * Values are on table 11 of the spec, encodings 275 - 2047 are reserved for
+ * standard use, and 2048 - 4095 for custom use.
+ */
+enum riscv_iommu_fq_causes {
+      RISCV_IOMMU_FQ_CAUSE_INST_FAULT           = 1,
+      RISCV_IOMMU_FQ_CAUSE_RD_ADDR_MISALIGNED   = 4,
+      RISCV_IOMMU_FQ_CAUSE_RD_FAULT             = 5,
+      RISCV_IOMMU_FQ_CAUSE_WR_ADDR_MISALIGNED   = 6,
+      RISCV_IOMMU_FQ_CAUSE_WR_FAULT             = 7,
+      RISCV_IOMMU_FQ_CAUSE_INST_FAULT_S         = 12,
+      RISCV_IOMMU_FQ_CAUSE_RD_FAULT_S           = 13,
+      RISCV_IOMMU_FQ_CAUSE_WR_FAULT_S           = 15,
+      RISCV_IOMMU_FQ_CAUSE_INST_FAULT_VS        = 20,
+      RISCV_IOMMU_FQ_CAUSE_RD_FAULT_VS          = 21,
+      RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS          = 23,
+      RISCV_IOMMU_FQ_CAUSE_DMA_DISABLED         = 256,
+      RISCV_IOMMU_FQ_CAUSE_DDT_LOAD_FAULT       = 257,
+      RISCV_IOMMU_FQ_CAUSE_DDT_INVALID          = 258,
+      RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED    = 259,
+      RISCV_IOMMU_FQ_CAUSE_TTYPE_BLOCKED        = 260,
+      RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT       = 261,
+      RISCV_IOMMU_FQ_CAUSE_MSI_INVALID          = 262,
+      RISCV_IOMMU_FQ_CAUSE_MSI_MISCONFIGURED    = 263,
+      RISCV_IOMMU_FQ_CAUSE_MRIF_FAULT           = 264,
+      RISCV_IOMMU_FQ_CAUSE_PDT_LOAD_FAULT       = 265,
+      RISCV_IOMMU_FQ_CAUSE_PDT_INVALID          = 266,
+      RISCV_IOMMU_FQ_CAUSE_PDT_MISCONFIGURED    = 267,
+      RISCV_IOMMU_FQ_CAUSE_DDT_CORRUPTED        = 268,
+      RISCV_IOMMU_FQ_CAUSE_PDT_CORRUPTED        = 269,
+      RISCV_IOMMU_FQ_CAUSE_MSI_PT_CORRUPTED     = 270,
+      RISCV_IOMMU_FQ_CAUSE_MRIF_CORRUIPTED      = 271,
+      RISCV_IOMMU_FQ_CAUSE_INTERNAL_DP_ERROR    = 272,
+      RISCV_IOMMU_FQ_CAUSE_MSI_WR_FAULT         = 273,
+      RISCV_IOMMU_FQ_CAUSE_PT_CORRUPTED         = 274
+};
+
+/**
+ * enum riscv_iommu_fq_ttypes: Fault/event transaction types
+ * @RISCV_IOMMU_FQ_TTYPE_NONE: None. Fault not caused by an inbound transaction.
+ * @RISCV_IOMMU_FQ_TTYPE_UADDR_INST_FETCH: Instruction fetch from untranslated address
+ * @RISCV_IOMMU_FQ_TTYPE_UADDR_RD: Read from untranslated address
+ * @RISCV_IOMMU_FQ_TTYPE_UADDR_WR: Write/AMO to untranslated address
+ * @RISCV_IOMMU_FQ_TTYPE_TADDR_INST_FETCH: Instruction fetch from translated address
+ * @RISCV_IOMMU_FQ_TTYPE_TADDR_RD: Read from translated address
+ * @RISCV_IOMMU_FQ_TTYPE_TADDR_WR: Write/AMO to translated address
+ * @RISCV_IOMMU_FQ_TTYPE_PCIE_ATS_REQ: PCIe ATS translation request
+ * @RISCV_IOMMU_FW_TTYPE_PCIE_MSG_REQ: PCIe message request
+ *
+ * Values are on table 12 of the spec, type 4 and 10 - 31 are reserved for
+ * standard use and 31 - 63 for custom use.
+ */
+enum riscv_iommu_fq_ttypes {
+      RISCV_IOMMU_FQ_TTYPE_NONE = 0,
+      RISCV_IOMMU_FQ_TTYPE_UADDR_INST_FETCH = 1,
+      RISCV_IOMMU_FQ_TTYPE_UADDR_RD = 2,
+      RISCV_IOMMU_FQ_TTYPE_UADDR_WR = 3,
+      RISCV_IOMMU_FQ_TTYPE_TADDR_INST_FETCH = 5,
+      RISCV_IOMMU_FQ_TTYPE_TADDR_RD = 6,
+      RISCV_IOMMU_FQ_TTYPE_TADDR_WR = 7,
+      RISCV_IOMMU_FQ_TTYPE_PCIE_ATS_REQ = 8,
+      RISCV_IOMMU_FW_TTYPE_PCIE_MSG_REQ = 9,
+};
+
+
+/**
+ * struct riscv_iommu_pq_record - PCIe Page Request record
+ * @hdr: Header, includes PID, DID etc
+ * @payload: Holds the page address, request group and permission bits
+ *
+ * For more infos on the PCIe Page Request queue see chapter 3.3.
+ */
+struct riscv_iommu_pq_record {
+      uint64_t hdr;
+      uint64_t payload;
+};
+
+/* Header fields */
+#define RISCV_IOMMU_PREQ_HDR_PID        GENMASK_ULL(31, 12)
+#define RISCV_IOMMU_PREQ_HDR_PV         BIT_ULL(32)
+#define RISCV_IOMMU_PREQ_HDR_PRIV       BIT_ULL(33)
+#define RISCV_IOMMU_PREQ_HDR_EXEC       BIT_ULL(34)
+#define RISCV_IOMMU_PREQ_HDR_DID        GENMASK_ULL(63, 40)
+
+/* Payload fields */
+#define RISCV_IOMMU_PREQ_PAYLOAD_R      BIT_ULL(0)
+#define RISCV_IOMMU_PREQ_PAYLOAD_W      BIT_ULL(1)
+#define RISCV_IOMMU_PREQ_PAYLOAD_L      BIT_ULL(2)
+#define RISCV_IOMMU_PREQ_PAYLOAD_M      GENMASK_ULL(2, 0)
+#define RISCV_IOMMU_PREQ_PRG_INDEX      GENMASK_ULL(11, 3)
+#define RISCV_IOMMU_PREQ_UADDR          GENMASK_ULL(63, 12)
+
+
+/**
+ * struct riscv_iommu_msi_pte - MSI Page Table Entry
+ * @pte: MSI PTE
+ * @mrif_info: Memory-resident interrupt file info
+ *
+ * The MSI Page Table is used for virtualizing MSIs, so that when
+ * a device sends an MSI to a guest, the IOMMU can reroute it
+ * by translating the MSI address, either to a guest interrupt file
+ * or a memory resident interrupt file (MRIF). Note that this page table
+ * is an array of MSI PTEs, not a multi-level pt, each entry
+ * is a leaf entry. For more infos check out the the AIA spec, chapter 9.5.
+ *
+ * Also in basic mode the mrif_info field is ignored by the IOMMU and can
+ * be used by software, any other reserved fields on pte must be zeroed-out
+ * by software.
+ */
+struct riscv_iommu_msi_pte {
+      uint64_t pte;
+      uint64_t mrif_info;
+};
+
+/* Fields on pte */
+#define RISCV_IOMMU_MSI_PTE_V           BIT_ULL(0)
+#define RISCV_IOMMU_MSI_PTE_M           GENMASK_ULL(2, 1)
+
+#define RISCV_IOMMU_MSI_PTE_M_MRIF      1
+#define RISCV_IOMMU_MSI_PTE_M_BASIC     3
+
+/* When M == 1 (MRIF mode) */
+#define RISCV_IOMMU_MSI_PTE_MRIF_ADDR   GENMASK_ULL(53, 7)
+/* When M == 3 (basic mode) */
+#define RISCV_IOMMU_MSI_PTE_PPN         RISCV_IOMMU_PPN_FIELD
+#define RISCV_IOMMU_MSI_PTE_C           BIT_ULL(63)
+
+/* Fields on mrif_info */
+#define RISCV_IOMMU_MSI_MRIF_NID        GENMASK_ULL(9, 0)
+#define RISCV_IOMMU_MSI_MRIF_NPPN       RISCV_IOMMU_PPN_FIELD
+#define RISCV_IOMMU_MSI_MRIF_NID_MSB    BIT_ULL(60)
+
+
+#endif /* _RISCV_IOMMU_BITS_H_ */
diff --git a/hw/riscv/riscv-iommu-pci.c b/hw/riscv/riscv-iommu-pci.c
new file mode 100644
index 0000000000..e205f806d6
--- /dev/null
+++ b/hw/riscv/riscv-iommu-pci.c
@@ -0,0 +1,181 @@
+/*
+ * QEMU emulation of an RISC-V IOMMU (Ziommu)
+ *
+ * Copyright (C) 2022-2023 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/qdev-properties.h"
+#include "hw/riscv/riscv_hart.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/host-utils.h"
+#include "qom/object.h"
+
+#include "cpu_bits.h"
+#include "riscv-iommu.h"
+#include "riscv-iommu-bits.h"
+
+#ifndef PCI_VENDOR_ID_RIVOS
+#define PCI_VENDOR_ID_RIVOS           0x1efd
+#endif
+
+#ifndef PCI_DEVICE_ID_RIVOS_IOMMU
+#define PCI_DEVICE_ID_RIVOS_IOMMU     0xedf1
+#endif
+
+/* RISC-V IOMMU PCI Device Emulation */
+
+typedef struct RISCVIOMMUStatePci {
+    PCIDevice        pci;     /* Parent PCIe device state */
+    MemoryRegion     bar0;    /* PCI BAR (including MSI-x config) */
+    RISCVIOMMUState  iommu;   /* common IOMMU state */
+} RISCVIOMMUStatePci;
+
+/* interrupt delivery callback */
+static void riscv_iommu_pci_notify(RISCVIOMMUState *iommu, unsigned vector)
+{
+    RISCVIOMMUStatePci *s = container_of(iommu, RISCVIOMMUStatePci, iommu);
+
+    if (msix_enabled(&(s->pci))) {
+        msix_notify(&(s->pci), vector);
+    }
+}
+
+static void riscv_iommu_pci_realize(PCIDevice *dev, Error **errp)
+{
+    RISCVIOMMUStatePci *s = DO_UPCAST(RISCVIOMMUStatePci, pci, dev);
+    RISCVIOMMUState *iommu = &s->iommu;
+    uint64_t cap = iommu->cap;
+    Error *err = NULL;
+
+    /* Set device id for trace / debug */
+    DEVICE(iommu)->id = g_strdup_printf("%02x:%02x.%01x",
+        pci_dev_bus_num(dev), PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
+
+    /* Support MSI only */
+    cap = set_field(cap, RISCV_IOMMU_CAP_IGS, RISCV_IOMMU_CAP_IGS_MSI);
+    qdev_prop_set_uint64(DEVICE(dev), "capabilities", cap);
+
+    if (!qdev_realize(DEVICE(iommu), NULL, errp)) {
+        return;
+    }
+
+    memory_region_init(&s->bar0, OBJECT(s), "riscv-iommu-bar0",
+        QEMU_ALIGN_UP(memory_region_size(&iommu->regs_mr), TARGET_PAGE_SIZE));
+    memory_region_add_subregion(&s->bar0, 0, &iommu->regs_mr);
+
+    pcie_endpoint_cap_init(dev, 0);
+
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
+                     PCI_BASE_ADDRESS_MEM_TYPE_64, &s->bar0);
+
+    int ret = msix_init(dev, RISCV_IOMMU_INTR_COUNT,
+                        &s->bar0, 0, RISCV_IOMMU_REG_MSI_CONFIG,
+                        &s->bar0, 0, RISCV_IOMMU_REG_MSI_CONFIG + 256, 0, &err);
+
+    if (ret == -ENOTSUP) {
+        /*
+         * MSI-x is not supported by the platform.
+         * Driver should use timer/polling based notification handlers.
+         */
+        warn_report_err(err);
+    } else if (ret < 0) {
+        error_propagate(errp, err);
+        return;
+    } else {
+        /* mark all allocated MSIx vectors as used. */
+        msix_vector_use(dev, RISCV_IOMMU_INTR_CQ);
+        msix_vector_use(dev, RISCV_IOMMU_INTR_FQ);
+        msix_vector_use(dev, RISCV_IOMMU_INTR_PM);
+        msix_vector_use(dev, RISCV_IOMMU_INTR_PQ);
+        iommu->notify = riscv_iommu_pci_notify;
+    }
+
+    PCIBus *bus = pci_device_root_bus(dev);
+    if (!bus) {
+        error_setg(errp, "can't find PCIe root port for %02x:%02x.%x",
+            pci_bus_num(pci_get_bus(dev)), PCI_SLOT(dev->devfn),
+            PCI_FUNC(dev->devfn));
+        return;
+    }
+
+    riscv_iommu_pci_setup_iommu(iommu, bus, errp);
+}
+
+static void riscv_iommu_pci_exit(PCIDevice *pci_dev)
+{
+    pci_setup_iommu(pci_device_root_bus(pci_dev), NULL, NULL);
+}
+
+static const VMStateDescription riscv_iommu_vmstate = {
+    .name = "riscv-iommu",
+    .unmigratable = 1
+};
+
+static void riscv_iommu_pci_init(Object *obj)
+{
+    RISCVIOMMUStatePci *s = RISCV_IOMMU_PCI(obj);
+    RISCVIOMMUState *iommu = &s->iommu;
+
+    object_initialize_child(obj, "iommu", iommu, TYPE_RISCV_IOMMU);
+    qdev_alias_all_properties(DEVICE(iommu), obj);
+}
+
+static Property riscv_iommu_pci_properties[] = {
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void riscv_iommu_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = riscv_iommu_pci_realize;
+    k->exit = riscv_iommu_pci_exit;
+    k->vendor_id = PCI_VENDOR_ID_RIVOS;
+    k->device_id = PCI_DEVICE_ID_RIVOS_IOMMU;
+    k->revision = 0;
+    k->class_id = 0x0806;
+    dc->desc = "RISCV-IOMMU DMA Remapping device";
+    dc->vmsd = &riscv_iommu_vmstate;
+    dc->hotpluggable = false;
+    dc->user_creatable = true;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    device_class_set_props(dc, riscv_iommu_pci_properties);
+}
+
+static const TypeInfo riscv_iommu_pci = {
+    .name = TYPE_RISCV_IOMMU_PCI,
+    .parent = TYPE_PCI_DEVICE,
+    .class_init = riscv_iommu_pci_class_init,
+    .instance_init = riscv_iommu_pci_init,
+    .instance_size = sizeof(RISCVIOMMUStatePci),
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { },
+    },
+};
+
+static void riscv_iommu_register_pci_types(void)
+{
+    type_register_static(&riscv_iommu_pci);
+}
+
+type_init(riscv_iommu_register_pci_types);
diff --git a/hw/riscv/riscv-iommu-sys.c b/hw/riscv/riscv-iommu-sys.c
new file mode 100644
index 0000000000..7148588b59
--- /dev/null
+++ b/hw/riscv/riscv-iommu-sys.c
@@ -0,0 +1,123 @@
+/*
+ * QEMU emulation of an RISC-V IOMMU (Ziommu) - Platform Device
+ *
+ * Copyright (C) 2022-2023 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/host-utils.h"
+#include "qemu/module.h"
+#include "qemu/osdep.h"
+#include "qom/object.h"
+
+#include "cpu_bits.h"
+#include "riscv-iommu.h"
+#include "riscv-iommu-bits.h"
+
+/* RISC-V IOMMU System Platform Device Emulation */
+
+struct RISCVIOMMUStateSys {
+    SysBusDevice     parent;
+    uint64_t         addr;
+    qemu_irq         irqs[4];
+    RISCVIOMMUState  iommu;
+};
+
+/* interrupt delivery callback */
+static void riscv_iommu_sys_notify(RISCVIOMMUState *iommu, unsigned vector)
+{
+    RISCVIOMMUStateSys *s = container_of(iommu, RISCVIOMMUStateSys, iommu);
+
+    if (vector < RISCV_IOMMU_INTR_COUNT && s->irqs[vector]) {
+        qemu_irq_pulse(s->irqs[vector]);
+    }
+}
+
+static void riscv_iommu_sys_realize(DeviceState *dev, Error **errp)
+{
+    RISCVIOMMUStateSys *s = RISCV_IOMMU_SYS(dev);
+    RISCVIOMMUState *iommu = &s->iommu;
+    PCIBus *pci_bus;
+    uint64_t cap = iommu->cap;
+    int i;
+
+    /* Support WSI only */
+    cap = set_field(cap, RISCV_IOMMU_CAP_IGS, RISCV_IOMMU_CAP_IGS_WSI);
+    qdev_prop_set_uint64(dev, "capabilities", cap);
+
+    if (!qdev_realize(DEVICE(iommu), NULL, errp)) {
+        return;
+    }
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &iommu->regs_mr);
+    if (s->addr) {
+        sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, s->addr);
+    }
+
+    for (i = 0; i < RISCV_IOMMU_INTR_COUNT; i++) {
+        sysbus_init_irq(&s->parent, &s->irqs[i]);
+    }
+
+    iommu->notify = riscv_iommu_sys_notify;
+
+    pci_bus = (PCIBus *) object_resolve_path_type("", TYPE_PCI_BUS, NULL);
+    if (pci_bus) {
+        riscv_iommu_pci_setup_iommu(iommu, pci_bus, errp);
+    }
+}
+
+static void riscv_iommu_sys_init(Object *obj)
+{
+    RISCVIOMMUStateSys *s = RISCV_IOMMU_SYS(obj);
+    RISCVIOMMUState *iommu = &s->iommu;
+
+    object_initialize_child(obj, "iommu", iommu, TYPE_RISCV_IOMMU);
+    qdev_alias_all_properties(DEVICE(iommu), obj);
+}
+
+static Property riscv_iommu_sys_properties[] = {
+    DEFINE_PROP_UINT64("addr", RISCVIOMMUStateSys, addr, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void riscv_iommu_sys_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = riscv_iommu_sys_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    device_class_set_props(dc, riscv_iommu_sys_properties);
+}
+
+static const TypeInfo riscv_iommu_sys = {
+    .name          = TYPE_RISCV_IOMMU_SYS,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .class_init    = riscv_iommu_sys_class_init,
+    .instance_init = riscv_iommu_sys_init,
+    .instance_size = sizeof(RISCVIOMMUStateSys),
+};
+
+static void riscv_iommu_register_sys(void)
+{
+    type_register_static(&riscv_iommu_sys);
+}
+
+type_init(riscv_iommu_register_sys)
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
new file mode 100644
index 0000000000..fd271b2988
--- /dev/null
+++ b/hw/riscv/riscv-iommu.c
@@ -0,0 +1,2539 @@
+/*
+ * QEMU emulation of an RISC-V IOMMU (Ziommu)
+ *
+ * Copyright (C) 2021-2023, Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci_device.h"
+#include "hw/qdev-properties.h"
+#include "hw/riscv/riscv_hart.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/timer.h"
+
+#include "cpu_bits.h"
+#include "riscv-iommu.h"
+#include "riscv-iommu-bits.h"
+#include "trace.h"
+
+#define LIMIT_CACHE_CTX               (1U << 7)
+#define LIMIT_CACHE_IOT               (1U << 20)
+
+/* Physical page number coversions */
+#define PPN_PHYS(ppn)                 ((ppn) << TARGET_PAGE_BITS)
+#define PPN_DOWN(phy)                 ((phy) >> TARGET_PAGE_BITS)
+
+typedef struct RISCVIOMMUContext RISCVIOMMUContext;
+typedef struct RISCVIOMMUEntry RISCVIOMMUEntry;
+
+/* Device assigned I/O address space */
+struct RISCVIOMMUSpace {
+    IOMMUMemoryRegion iova_mr;  /* IOVA memory region for attached device */
+    AddressSpace iova_as;       /* IOVA address space for attached device */
+    RISCVIOMMUState *iommu;     /* Managing IOMMU device state */
+    uint32_t devid;             /* Requester identifier, AKA device_id */
+    bool notifier;              /* IOMMU unmap notifier enabled */
+    QLIST_ENTRY(RISCVIOMMUSpace) list;
+};
+
+/* Device translation context state. */
+struct RISCVIOMMUContext {
+    uint64_t devid:24;          /* Requester Id, AKA device_id */
+    uint64_t pasid:20;          /* Process Address Space ID */
+    uint64_t __rfu:20;          /* reserved */
+    uint64_t tc;                /* Translation Control */
+    uint64_t ta;                /* Translation Attributes */
+    uint64_t satp;              /* S-Stage address translation and protection */
+    uint64_t gatp;              /* G-Stage address translation and protection */
+    uint64_t msi_addr_mask;     /* MSI filtering - address mask */
+    uint64_t msi_addr_pattern;  /* MSI filtering - address pattern */
+    uint64_t msiptp;            /* MSI redirection page table pointer */
+};
+
+/* Address translation cache entry */
+struct RISCVIOMMUEntry {
+    uint64_t iova:44;           /* IOVA Page Number */
+    uint64_t pscid:20;          /* Process Soft-Context identifier */
+    uint64_t phys:44;           /* Physical Page Number */
+    uint64_t gscid:16;          /* Guest Soft-Context identifier */
+    uint64_t perm:2;            /* IOMMU_RW flags */
+    uint64_t __rfu:2;
+};
+
+/* IOMMU index for transactions without PASID specified. */
+#define RISCV_IOMMU_NOPASID 0
+
+static void riscv_iommu_notify(RISCVIOMMUState *s, int vec)
+{
+    const uint32_t ipsr =
+        riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_IPSR, (1 << vec), 0);
+    const uint32_t ivec = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IVEC);
+    if (s->notify && !(ipsr & (1 << vec))) {
+        s->notify(s, (ivec >> (vec * 4)) & 0x0F);
+    }
+}
+
+static void riscv_iommu_fault(RISCVIOMMUState *s, struct riscv_iommu_fq_record *ev)
+{
+    uint32_t ctrl = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_FQCSR);
+    uint32_t head = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_FQH) & s->fq_mask;
+    uint32_t tail = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_FQT) & s->fq_mask;
+    uint32_t next = (tail + 1) & s->fq_mask;
+    uint32_t devid = get_field(ev->hdr, RISCV_IOMMU_FQ_HDR_DID);
+
+    trace_riscv_iommu_flt(s->parent_obj.id, PCI_BUS_NUM(devid), PCI_SLOT(devid),
+                          PCI_FUNC(devid), ev->hdr, ev->iotval);
+
+    if (!(ctrl & RISCV_IOMMU_FQCSR_FQON) ||
+        !!(ctrl & (RISCV_IOMMU_FQCSR_FQOF | RISCV_IOMMU_FQCSR_FQMF))) {
+        return;
+    }
+
+    if (head == next) {
+        riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_FQCSR, RISCV_IOMMU_FQCSR_FQOF, 0);
+    } else {
+        dma_addr_t addr = s->fq_addr + tail * sizeof(*ev);
+        if (dma_memory_write(s->target_as, addr, ev, sizeof(*ev),
+                             MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+            riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_FQCSR, RISCV_IOMMU_FQCSR_FQMF, 0);
+        } else {
+            riscv_iommu_reg_set32(s, RISCV_IOMMU_REG_FQT, next);
+        }
+    }
+
+    if (ctrl & RISCV_IOMMU_FQCSR_FIE) {
+        riscv_iommu_notify(s, RISCV_IOMMU_INTR_FQ);
+    }
+}
+
+static void riscv_iommu_pri(RISCVIOMMUState *s,
+    struct riscv_iommu_pq_record *pr)
+{
+    uint32_t ctrl = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_PQCSR);
+    uint32_t head = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_PQH) & s->pq_mask;
+    uint32_t tail = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_PQT) & s->pq_mask;
+    uint32_t next = (tail + 1) & s->pq_mask;
+    uint32_t devid = get_field(pr->hdr, RISCV_IOMMU_PREQ_HDR_DID);
+
+    trace_riscv_iommu_pri(s->parent_obj.id, PCI_BUS_NUM(devid), PCI_SLOT(devid),
+                          PCI_FUNC(devid), pr->payload);
+
+    if (!(ctrl & RISCV_IOMMU_PQCSR_PQON) ||
+        !!(ctrl & (RISCV_IOMMU_PQCSR_PQOF | RISCV_IOMMU_PQCSR_PQMF))) {
+        return;
+    }
+
+    if (head == next) {
+        riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_PQCSR, RISCV_IOMMU_PQCSR_PQOF, 0);
+    } else {
+        dma_addr_t addr = s->pq_addr + tail * sizeof(*pr);
+        if (dma_memory_write(s->target_as, addr, pr, sizeof(*pr),
+                             MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+            riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_PQCSR, RISCV_IOMMU_PQCSR_PQMF, 0);
+        } else {
+            riscv_iommu_reg_set32(s, RISCV_IOMMU_REG_PQT, next);
+        }
+    }
+
+    if (ctrl & RISCV_IOMMU_PQCSR_PIE) {
+        riscv_iommu_notify(s, RISCV_IOMMU_INTR_PQ);
+    }
+}
+
+static void __hpm_incr_ctr(RISCVIOMMUState *s, uint32_t ctr_idx)
+{
+    const uint32_t off = ctr_idx << 3;
+    uint64_t cntr_val;
+
+    qemu_spin_lock(&s->regs_lock);
+    cntr_val = ldq_le_p(&s->regs_rw[RISCV_IOMMU_REG_IOHPMCTR_BASE + off]);
+    stq_le_p(&s->regs_rw[RISCV_IOMMU_REG_IOHPMCTR_BASE + off], cntr_val + 1);
+    qemu_spin_unlock(&s->regs_lock);
+
+    /* Handle the overflow scenario. */
+    if (cntr_val == UINT64_MAX) {
+        /*
+         * Generate interrupt only if OF bit is clear. +1 to offset the cycle
+         * register OF bit.
+         */
+        const uint32_t ovf =
+            riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_IOCOUNTOVF, BIT(ctr_idx + 1), 0);
+        if (!get_field(ovf, BIT(ctr_idx + 1))) {
+            riscv_iommu_reg_mod64(s,
+                                  RISCV_IOMMU_REG_IOHPMEVT_BASE + off,
+                                  RISCV_IOMMU_IOHPMEVT_OF,
+                                  0);
+            riscv_iommu_notify(s, RISCV_IOMMU_INTR_PM);
+        }
+    }
+}
+
+static void riscv_iommu_hpm_incr_ctr(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
+    unsigned event_id)
+{
+    const uint32_t inhibit = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTINH);
+    uint32_t did_gscid;
+    uint32_t pid_pscid;
+    uint32_t ctr_idx;
+    gpointer value;
+    uint32_t ctrs;
+    uint64_t evt;
+
+    if (!(s->cap & RISCV_IOMMU_CAP_HPM)) {
+        return;
+    }
+
+    pthread_rwlock_rdlock(&s->ht_lock);
+    value = g_hash_table_lookup(s->hpm_event_ctr_map,
+                                GUINT_TO_POINTER(event_id));
+    if (value == NULL) {
+        pthread_rwlock_unlock(&s->ht_lock);
+        return;
+    }
+
+    for (ctrs = GPOINTER_TO_UINT(value); ctrs != 0; ctrs &= ctrs - 1) {
+        ctr_idx = ctz32(ctrs);
+        if (get_field(inhibit, BIT(ctr_idx + 1))) {
+            continue;
+        }
+
+        evt = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_IOHPMEVT_BASE + (ctr_idx << 3));
+
+        /*
+         * It's quite possible that event ID has been changed in counter
+         * but hashtable hasn't been updated yet. We don't want to increment
+         * counter for the old event ID.
+         */
+        if (event_id != get_field(evt, RISCV_IOMMU_IOHPMEVT_EVENT_ID)) {
+            continue;
+        }
+
+        if (get_field(evt, RISCV_IOMMU_IOHPMEVT_IDT)) {
+            did_gscid = get_field(ctx->gatp, RISCV_IOMMU_DC_IOHGATP_GSCID);
+            pid_pscid = get_field(ctx->ta, RISCV_IOMMU_DC_TA_PSCID);
+        } else {
+            did_gscid = ctx->devid;
+            pid_pscid = ctx->pasid;
+        }
+
+        if (get_field(evt, RISCV_IOMMU_IOHPMEVT_PV_PSCV)) {
+            /*
+             * If the transaction does not have a valid process_id, counter
+             * increments if device_id matches DID_GSCID. If the transaction has
+             * a valid process_id, counter increments if device_id matches
+             * DID_GSCID and process_id matches PID_PSCID. See IOMMU
+             * Specification, Chapter 5.23. Performance-monitoring event
+             * selector.
+             */
+            if (ctx->pasid &&
+                get_field(evt, RISCV_IOMMU_IOHPMEVT_PID_PSCID) != pid_pscid) {
+                continue;
+            }
+        }
+
+        if (get_field(evt, RISCV_IOMMU_IOHPMEVT_DV_GSCV)) {
+            uint32_t mask = ~0;
+
+            if (get_field(evt, RISCV_IOMMU_IOHPMEVT_DMASK)) {
+                /*
+                 * 1001 1011   mask = GSCID
+                 * 0000 0111   mask = mask ^ (mask + 1)
+                 * 1111 1000   mask = ~mask;
+                 */
+                mask = get_field(evt, RISCV_IOMMU_IOHPMEVT_DID_GSCID);
+                mask = mask ^ (mask + 1);
+                mask = ~mask;
+            }
+
+            if ((get_field(evt, RISCV_IOMMU_IOHPMEVT_DID_GSCID) & mask) !=
+                (did_gscid & mask)) {
+                continue;
+            }
+        }
+
+        __hpm_incr_ctr(s, ctr_idx);
+    }
+
+    pthread_rwlock_unlock(&s->ht_lock);
+}
+
+/* Portable implementation of pext_u64, bit-mask extraction. */
+static uint64_t _pext_u64(uint64_t val, uint64_t ext)
+{
+    uint64_t ret = 0;
+    uint64_t rot = 1;
+
+    while (ext) {
+        if (ext & 1) {
+            if (val & 1) {
+                ret |= rot;
+            }
+            rot <<= 1;
+        }
+        val >>= 1;
+        ext >>= 1;
+    }
+
+    return ret;
+}
+
+/* Check if GPA matches MSI/MRIF pattern. */
+static bool riscv_iommu_msi_check(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
+    dma_addr_t gpa)
+{
+    if (get_field(ctx->msiptp, RISCV_IOMMU_DC_MSIPTP_MODE) !=
+        RISCV_IOMMU_DC_MSIPTP_MODE_FLAT) {
+        return false; /* Invalid MSI/MRIF mode */
+    }
+
+    if ((PPN_DOWN(gpa) ^ ctx->msi_addr_pattern) & ~ctx->msi_addr_mask) {
+        return false; /* GPA not in MSI range defined by AIA IMSIC rules. */
+    }
+
+    return true;
+}
+
+/*
+ * RISCV IOMMU Address Translation Lookup - Page Table Walk
+ *
+ * Note: Code is based on get_physical_address() from target/riscv/cpu_helper.c
+ * Both implementation can be merged into single helper function in future.
+ * Keeping them separate for now, as error reporting and flow specifics are
+ * sufficiently different for separate implementation.
+ *
+ * @s        : IOMMU Device State
+ * @ctx      : Translation context for device id and process address space id.
+ * @iotlb    : translation data: physical address and access mode.
+ * @gpa      : provided IOVA is a guest physical address, use G-Stage only.
+ * @return   : success or fault cause code.
+ */
+static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
+    IOMMUTLBEntry *iotlb, bool gpa)
+{
+    dma_addr_t addr, base;
+    uint64_t satp, gatp, pte;
+    bool en_s, en_g;
+    struct {
+        unsigned char step;
+        unsigned char levels;
+        unsigned char ptidxbits;
+        unsigned char ptesize;
+    } sc[2];
+    /* Translation stage phase */
+    enum {
+        S_STAGE = 0,
+        G_STAGE = 1,
+    } pass;
+
+    satp = get_field(ctx->satp, RISCV_IOMMU_ATP_MODE_FIELD);
+    gatp = get_field(ctx->gatp, RISCV_IOMMU_ATP_MODE_FIELD);
+
+    en_s = satp != RISCV_IOMMU_DC_FSC_MODE_BARE && !gpa;
+    en_g = gatp != RISCV_IOMMU_DC_IOHGATP_MODE_BARE;
+
+    /* Early check for MSI address match when IOVA == GPA */
+    if (!en_s && (iotlb->perm & IOMMU_WO) &&
+        riscv_iommu_msi_check(s, ctx, iotlb->iova)) {
+        iotlb->target_as = &s->trap_as;
+        iotlb->translated_addr = iotlb->iova;
+        iotlb->addr_mask = ~TARGET_PAGE_MASK;
+        return 0;
+    }
+
+    /* Exit early for pass-through mode. */
+    if (!(en_s || en_g)) {
+        iotlb->translated_addr = iotlb->iova;
+        iotlb->addr_mask = ~TARGET_PAGE_MASK;
+        /* Allow R/W in pass-through mode */
+        iotlb->perm = IOMMU_RW;
+        return 0;
+    }
+
+    /* S/G translation parameters. */
+    for (pass = 0; pass < 2; pass++) {
+        sc[pass].step = 0;
+        if (pass ? (s->fctl & RISCV_IOMMU_FCTL_GXL) :
+            (ctx->tc & RISCV_IOMMU_DC_TC_SXL)) {
+            /* 32bit mode for GXL/SXL == 1 */
+            switch (pass ? gatp : satp) {
+            case RISCV_IOMMU_DC_IOHGATP_MODE_BARE:
+                sc[pass].levels    = 0;
+                sc[pass].ptidxbits = 0;
+                sc[pass].ptesize   = 0;
+                break;
+            case RISCV_IOMMU_DC_IOHGATP_MODE_SV32X4:
+                if (!(s->cap &
+                    (pass ? RISCV_IOMMU_CAP_G_SV32 : RISCV_IOMMU_CAP_S_SV32))) {
+                    return RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED;
+                }
+                sc[pass].levels    = 2;
+                sc[pass].ptidxbits = 10;
+                sc[pass].ptesize   = 4;
+                break;
+            default:
+                return RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED;
+            }
+        } else {
+            /* 64bit mode for GXL/SXL == 0 */
+            switch (pass ? gatp : satp) {
+            case RISCV_IOMMU_DC_IOHGATP_MODE_BARE:
+                sc[pass].levels    = 0;
+                sc[pass].ptidxbits = 0;
+                sc[pass].ptesize   = 0;
+                break;
+            case RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4:
+                if (!(s->cap &
+                    (pass ? RISCV_IOMMU_CAP_G_SV39 : RISCV_IOMMU_CAP_S_SV39))) {
+                    return RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED;
+                }
+                sc[pass].levels    = 3;
+                sc[pass].ptidxbits = 9;
+                sc[pass].ptesize   = 8;
+                break;
+            case RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4:
+                if (!(s->cap &
+                    (pass ? RISCV_IOMMU_CAP_G_SV48 : RISCV_IOMMU_CAP_S_SV48))) {
+                    return RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED;
+                }
+                sc[pass].levels    = 4;
+                sc[pass].ptidxbits = 9;
+                sc[pass].ptesize   = 8;
+                break;
+            case RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4:
+                if (!(s->cap &
+                    (pass ? RISCV_IOMMU_CAP_G_SV57 : RISCV_IOMMU_CAP_S_SV57))) {
+                    return RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED;
+                }
+                sc[pass].levels    = 5;
+                sc[pass].ptidxbits = 9;
+                sc[pass].ptesize   = 8;
+                break;
+            default:
+                return RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED;
+            }
+        }
+    };
+
+    /* S/G stages translation tables root pointers */
+    gatp = PPN_PHYS(get_field(ctx->gatp, RISCV_IOMMU_ATP_PPN_FIELD));
+    satp = PPN_PHYS(get_field(ctx->satp, RISCV_IOMMU_ATP_PPN_FIELD));
+    addr = (en_s && en_g) ? satp : iotlb->iova;
+    base = en_g ? gatp : satp;
+    pass = en_g ? G_STAGE : S_STAGE;
+
+    do {
+        const unsigned widened = (pass && !sc[pass].step) ? 2 : 0;
+        const unsigned va_bits = widened + sc[pass].ptidxbits;
+        const unsigned va_skip = TARGET_PAGE_BITS + sc[pass].ptidxbits *
+                                 (sc[pass].levels - 1 - sc[pass].step);
+        const unsigned idx = (addr >> va_skip) & ((1 << va_bits) - 1);
+        const dma_addr_t pte_addr = base + idx * sc[pass].ptesize;
+        const bool ade =
+            ctx->tc & (pass ? RISCV_IOMMU_DC_TC_GADE : RISCV_IOMMU_DC_TC_SADE);
+
+        /* Address range check before first level lookup */
+        if (!sc[pass].step) {
+            const uint64_t va_mask = (1ULL << (va_skip + va_bits)) - 1;
+            if ((addr & va_mask) != addr) {
+                return RISCV_IOMMU_FQ_CAUSE_DMA_DISABLED;
+            }
+        }
+
+        /* Read page table entry */
+        if (dma_memory_read(s->target_as, pte_addr, &pte,
+                sc[pass].ptesize, MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+            return (iotlb->perm & IOMMU_WO) ? RISCV_IOMMU_FQ_CAUSE_WR_FAULT
+                                            : RISCV_IOMMU_FQ_CAUSE_RD_FAULT;
+        }
+
+        if (pass == S_STAGE) {
+            riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_S_VS_WALKS);
+        } else {
+            riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_G_WALKS);
+        }
+
+        if (sc[pass].ptesize == 4) {
+            pte = (uint64_t) le32_to_cpu(*((uint32_t *)&pte));
+        } else {
+            pte = le64_to_cpu(pte);
+        }
+
+        sc[pass].step++;
+        hwaddr ppn = pte >> PTE_PPN_SHIFT;
+
+        if (!(pte & PTE_V)) {
+            break;                /* Invalid PTE */
+        } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
+            base = PPN_PHYS(ppn); /* Inner PTE, continue walking */
+        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
+            break;                /* Reserved leaf PTE flags: PTE_W */
+        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
+            break;                /* Reserved leaf PTE flags: PTE_W + PTE_X */
+        } else if (ppn & ((1ULL << (va_skip - TARGET_PAGE_BITS)) - 1)) {
+            break;                /* Misaligned PPN */
+        } else if ((iotlb->perm & IOMMU_RO) && !(pte & PTE_R)) {
+            break;                /* Read access check failed */
+        } else if ((iotlb->perm & IOMMU_WO) && !(pte & PTE_W)) {
+            break;                /* Write access check failed */
+        } else if ((iotlb->perm & IOMMU_RO) && !ade && !(pte & PTE_A)) {
+            break;                /* Access bit not set */
+        } else if ((iotlb->perm & IOMMU_WO) && !ade && !(pte & PTE_D)) {
+            break;                /* Dirty bit not set */
+        } else {
+            /* Leaf PTE, translation completed. */
+            sc[pass].step = sc[pass].levels;
+            base = PPN_PHYS(ppn) | (addr & ((1ULL << va_skip) - 1));
+            /* Update address mask based on smallest translation granularity */
+            iotlb->addr_mask &= (1ULL << va_skip) - 1;
+            /* Continue with S-Stage translation? */
+            if (pass && sc[0].step != sc[0].levels) {
+                pass = S_STAGE;
+                addr = iotlb->iova;
+                continue;
+            }
+            /* Translation phase completed (GPA or SPA) */
+            iotlb->translated_addr = base;
+            iotlb->perm = (pte & PTE_W) ? ((pte & PTE_R) ? IOMMU_RW : IOMMU_WO)
+                                                         : IOMMU_RO;
+
+            /* Check MSI GPA address match */
+            if (pass == S_STAGE && (iotlb->perm & IOMMU_WO) &&
+                riscv_iommu_msi_check(s, ctx, base)) {
+                /* Trap MSI writes and return GPA address. */
+                iotlb->target_as = &s->trap_as;
+                iotlb->addr_mask = ~TARGET_PAGE_MASK;
+                return 0;
+            }
+
+            /* Continue with G-Stage translation? */
+            if (!pass && en_g) {
+                pass = G_STAGE;
+                addr = base;
+                base = gatp;
+                sc[pass].step = 0;
+                continue;
+            }
+
+            return 0;
+        }
+
+        if (sc[pass].step == sc[pass].levels) {
+            break; /* Can't find leaf PTE */
+        }
+
+        /* Continue with G-Stage translation? */
+        if (!pass && en_g) {
+            pass = G_STAGE;
+            addr = base;
+            base = gatp;
+            sc[pass].step = 0;
+        }
+    } while (1);
+
+    return (iotlb->perm & IOMMU_WO) ?
+                (pass ? RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS :
+                        RISCV_IOMMU_FQ_CAUSE_WR_FAULT_S) :
+                (pass ? RISCV_IOMMU_FQ_CAUSE_RD_FAULT_VS :
+                        RISCV_IOMMU_FQ_CAUSE_RD_FAULT_S);
+}
+
+/* Redirect MSI write for given GPA. */
+static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
+    RISCVIOMMUContext *ctx, uint64_t gpa, uint64_t data,
+    unsigned size, MemTxAttrs attrs)
+{
+    MemTxResult res;
+    dma_addr_t addr;
+    uint64_t intn;
+    uint32_t n190;
+    uint64_t pte[2];
+
+    if (!riscv_iommu_msi_check(s, ctx, gpa)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+
+    /* Interrupt File Number */
+    intn = _pext_u64(PPN_DOWN(gpa), ctx->msi_addr_mask);
+    if (intn >= 256) {
+        /* Interrupt file number out of range */
+        return MEMTX_ACCESS_ERROR;
+    }
+
+    /* fetch MSI PTE */
+    addr = PPN_PHYS(get_field(ctx->msiptp, RISCV_IOMMU_DC_MSIPTP_PPN));
+    addr = addr | (intn * sizeof(pte));
+    res = dma_memory_read(s->target_as, addr, &pte, sizeof(pte),
+            MEMTXATTRS_UNSPECIFIED);
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    le64_to_cpus(&pte[0]);
+    le64_to_cpus(&pte[1]);
+
+    if (!(pte[0] & RISCV_IOMMU_MSI_PTE_V) || (pte[0] & RISCV_IOMMU_MSI_PTE_C)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+
+    switch (get_field(pte[0], RISCV_IOMMU_MSI_PTE_M)) {
+    case RISCV_IOMMU_MSI_PTE_M_BASIC:
+        /* MSI Pass-through mode */
+        addr = PPN_PHYS(get_field(pte[0], RISCV_IOMMU_MSI_PTE_PPN));
+        addr = addr | (gpa & TARGET_PAGE_MASK);
+
+        trace_riscv_iommu_msi(s->parent_obj.id, PCI_BUS_NUM(ctx->devid),
+                              PCI_SLOT(ctx->devid), PCI_FUNC(ctx->devid),
+                              gpa, addr);
+
+        return dma_memory_write(s->target_as, addr, &data, size, attrs);
+    case RISCV_IOMMU_MSI_PTE_M_MRIF:
+        /* MRIF mode, continue. */
+        break;
+    default:
+        return MEMTX_ACCESS_ERROR;
+    }
+
+    /*
+     * Report an error for interrupt identities exceeding the maximum allowed
+     * for an IMSIC interrupt file (2047) or destination address is not 32-bit
+     * aligned. See IOMMU Specification, Chapter 2.3. MSI page tables.
+     */
+    if ((data > 2047) || (gpa & 3)) {
+        return MEMTX_ACCESS_ERROR;
+    }
+
+    /* MSI MRIF mode, non atomic pending bit update */
+
+    /* MRIF pending bit address */
+    addr = get_field(pte[0], RISCV_IOMMU_MSI_PTE_MRIF_ADDR) << 9;
+    addr = addr | ((data & 0x7c0) >> 3);
+
+    trace_riscv_iommu_msi(s->parent_obj.id, PCI_BUS_NUM(ctx->devid),
+                          PCI_SLOT(ctx->devid), PCI_FUNC(ctx->devid),
+                          gpa, addr);
+
+    /* MRIF pending bit mask */
+    data = 1ULL << (data & 0x03f);
+    res = dma_memory_read(s->target_as, addr, &intn, sizeof(intn), attrs);
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    intn = intn | data;
+    res = dma_memory_write(s->target_as, addr, &intn, sizeof(intn), attrs);
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    /* Get MRIF enable bits */
+    addr = addr + sizeof(intn);
+    res = dma_memory_read(s->target_as, addr, &intn, sizeof(intn), attrs);
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    if (!(intn & data)) {
+        /* notification disabled, MRIF update completed. */
+        return MEMTX_OK;
+    }
+
+    /* Send notification message */
+    addr = PPN_PHYS(get_field(pte[1], RISCV_IOMMU_MSI_MRIF_NPPN));
+    n190 = get_field(pte[1], RISCV_IOMMU_MSI_MRIF_NID) |
+          (get_field(pte[1], RISCV_IOMMU_MSI_MRIF_NID_MSB) << 10);
+
+    res = dma_memory_write(s->target_as, addr, &n190, sizeof(n190), attrs);
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    return MEMTX_OK;
+}
+
+/*
+ * Device Context format.
+ *
+ * @s         : IOMMU Device State
+ * @return    : 0: extended (64 bytes) | 1: base (32 bytes)
+ */
+static int riscv_iommu_dc_is_base(RISCVIOMMUState *s)
+{
+    return !(s->cap & RISCV_IOMMU_CAP_MSI_FLAT);
+}
+
+/*
+ * RISC-V IOMMU Device Context Loopkup - Device Directory Tree Walk
+ *
+ * @s         : IOMMU Device State
+ * @ctx       : Device Translation Context with devid and pasid set.
+ * @return    : success or fault code.
+ */
+static int riscv_iommu_ctx_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx)
+{
+    const uint64_t ddtp = s->ddtp;
+    unsigned mode = get_field(ddtp, RISCV_IOMMU_DDTP_MODE);
+    dma_addr_t addr = PPN_PHYS(get_field(ddtp, RISCV_IOMMU_DDTP_PPN));
+    struct riscv_iommu_dc dc;
+    const int dc_fmt = riscv_iommu_dc_is_base(s);
+    const size_t dc_len = sizeof(dc) >> dc_fmt;
+    unsigned depth;
+    uint64_t de;
+
+    switch (mode) {
+    case RISCV_IOMMU_DDTP_MODE_OFF:
+        return RISCV_IOMMU_FQ_CAUSE_DMA_DISABLED;
+
+    case RISCV_IOMMU_DDTP_MODE_BARE:
+        /* mock up pass-through translation context */
+        ctx->gatp = set_field(0, RISCV_IOMMU_ATP_MODE_FIELD,
+            RISCV_IOMMU_DC_IOHGATP_MODE_BARE);
+        ctx->satp = set_field(0, RISCV_IOMMU_ATP_MODE_FIELD,
+            RISCV_IOMMU_DC_FSC_MODE_BARE);
+        ctx->tc = RISCV_IOMMU_DC_TC_EN_ATS | RISCV_IOMMU_DC_TC_V;
+        ctx->ta = 0;
+        ctx->msiptp = 0;
+        return 0;
+
+    case RISCV_IOMMU_DDTP_MODE_1LVL:
+        depth = 0;
+        break;
+
+    case RISCV_IOMMU_DDTP_MODE_2LVL:
+        depth = 1;
+        break;
+
+    case RISCV_IOMMU_DDTP_MODE_3LVL:
+        depth = 2;
+        break;
+
+    default:
+        return RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED;
+    }
+
+    /*
+     * Check supported device id width (in bits).
+     * See IOMMU Specification, Chapter 6. Software guidelines.
+     * - if extended device-context format is used:
+     *   1LVL: 6, 2LVL: 15, 3LVL: 24
+     * - if base device-context format is used:
+     *   1LVL: 7, 2LVL: 16, 3LVL: 24
+     */
+    if (ctx->devid >= (1 << (depth * 9 + 6 + (dc_fmt && depth != 2)))) {
+        return RISCV_IOMMU_FQ_CAUSE_DDT_INVALID;
+    }
+
+    /* Device directory tree walk */
+    for (; depth-- > 0; ) {
+        riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_DD_WALK);
+
+        /*
+         * Select device id index bits based on device directory tree level
+         * and device context format.
+         * See IOMMU Specification, Chapter 2. Data Structures.
+         * - if extended device-context format is used:
+         *   device index: [23:15][14:6][5:0]
+         * - if base device-context format is used:
+         *   device index: [23:16][15:7][6:0]
+         */
+        const int split = depth * 9 + 6 + dc_fmt;
+        addr |= ((ctx->devid >> split) << 3) & ~TARGET_PAGE_MASK;
+        if (dma_memory_read(s->target_as, addr, &de, sizeof(de),
+                            MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+            return RISCV_IOMMU_FQ_CAUSE_DDT_LOAD_FAULT;
+        }
+        le64_to_cpus(&de);
+        if (!(de & RISCV_IOMMU_DDTE_VALID)) {
+            return RISCV_IOMMU_FQ_CAUSE_DDT_INVALID; /* invalid directory entry */
+        }
+        if (de & ~(RISCV_IOMMU_DDTE_PPN | RISCV_IOMMU_DDTE_VALID)) {
+            return RISCV_IOMMU_FQ_CAUSE_DDT_INVALID; /* reserved bits set. */
+        }
+        addr = PPN_PHYS(get_field(de, RISCV_IOMMU_DDTE_PPN));
+    }
+
+    riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_DD_WALK);
+
+    /* index into device context entry page */
+    addr |= (ctx->devid * dc_len) & ~TARGET_PAGE_MASK;
+
+    memset(&dc, 0, sizeof(dc));
+    if (dma_memory_read(s->target_as, addr, &dc, dc_len,
+                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+        return RISCV_IOMMU_FQ_CAUSE_DDT_LOAD_FAULT;
+    }
+
+    /* Set translation context. */
+    ctx->tc = le64_to_cpu(dc.tc);
+    ctx->gatp = le64_to_cpu(dc.iohgatp);
+    ctx->satp = le64_to_cpu(dc.fsc);
+    ctx->ta = le64_to_cpu(dc.ta);
+    ctx->msiptp = le64_to_cpu(dc.msiptp);
+    ctx->msi_addr_mask = le64_to_cpu(dc.msi_addr_mask);
+    ctx->msi_addr_pattern = le64_to_cpu(dc.msi_addr_pattern);
+
+    if (!(ctx->tc & RISCV_IOMMU_DC_TC_V)) {
+        return RISCV_IOMMU_FQ_CAUSE_DDT_INVALID;
+    }
+
+    /* FSC field checks */
+    mode = get_field(ctx->satp, RISCV_IOMMU_DC_FSC_MODE);
+    addr = PPN_PHYS(get_field(ctx->satp, RISCV_IOMMU_DC_FSC_PPN));
+
+    if (mode == RISCV_IOMMU_DC_FSC_MODE_BARE) {
+        /* No S-Stage translation, done. */
+        return 0;
+    }
+
+    if (!(ctx->tc & RISCV_IOMMU_DC_TC_PDTV)) {
+        if (ctx->pasid != RISCV_IOMMU_NOPASID) {
+            /* PASID is disabled */
+            return RISCV_IOMMU_FQ_CAUSE_TTYPE_BLOCKED;
+        }
+        if (mode > RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV57) {
+            /* Invalid translation mode */
+            return RISCV_IOMMU_FQ_CAUSE_DDT_INVALID;
+        }
+        return 0;
+    }
+
+    if (ctx->pasid == RISCV_IOMMU_NOPASID) {
+        if (!(ctx->tc & RISCV_IOMMU_DC_TC_DPE)) {
+            /* No default PASID enabled, set BARE mode */
+            ctx->satp = 0ULL;
+            return 0;
+        } else {
+            /* Use default PASID #0 */
+            ctx->pasid = 0;
+        }
+    }
+
+    /* FSC.TC.PDTV enabled */
+    if (mode > RISCV_IOMMU_DC_FSC_PDTP_MODE_PD20) {
+        /* Invalid PDTP.MODE */
+        return RISCV_IOMMU_FQ_CAUSE_PDT_MISCONFIGURED;
+    }
+
+    for (depth = mode - RISCV_IOMMU_DC_FSC_PDTP_MODE_PD8; depth-- > 0; ) {
+        riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_PD_WALK);
+
+        /*
+         * Select process id index bits based on process directory tree
+         * level. See IOMMU Specification, 2.2. Process-Directory-Table.
+         */
+        const int split = depth * 9 + 8;
+        addr |= ((ctx->pasid >> split) << 3) & ~TARGET_PAGE_MASK;
+        if (dma_memory_read(s->target_as, addr, &de, sizeof(de),
+                            MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+            return RISCV_IOMMU_FQ_CAUSE_PDT_LOAD_FAULT;
+        }
+        le64_to_cpus(&de);
+        if (!(de & RISCV_IOMMU_PC_TA_V)) {
+            return RISCV_IOMMU_FQ_CAUSE_PDT_INVALID;
+        }
+        addr = PPN_PHYS(get_field(de, RISCV_IOMMU_PC_FSC_PPN));
+    }
+
+    riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_PD_WALK);
+
+    /* Leaf entry in PDT */
+    addr |= (ctx->pasid << 4) & ~TARGET_PAGE_MASK;
+    if (dma_memory_read(s->target_as, addr, &dc.ta, sizeof(uint64_t) * 2,
+                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+        return RISCV_IOMMU_FQ_CAUSE_PDT_LOAD_FAULT;
+    }
+
+    /* Use FSC and TA from process directory entry. */
+    ctx->ta = le64_to_cpu(dc.ta);
+    ctx->satp = le64_to_cpu(dc.fsc);
+
+    return 0;
+}
+
+/* Translation Context cache support */
+static gboolean __ctx_equal(gconstpointer v1, gconstpointer v2)
+{
+    RISCVIOMMUContext *c1 = (RISCVIOMMUContext *) v1;
+    RISCVIOMMUContext *c2 = (RISCVIOMMUContext *) v2;
+    return c1->devid == c2->devid && c1->pasid == c2->pasid;
+}
+
+static guint __ctx_hash(gconstpointer v)
+{
+    RISCVIOMMUContext *ctx = (RISCVIOMMUContext *) v;
+    /* Generate simple hash of (pasid, devid), assuming 24-bit wide devid */
+    return (guint)(ctx->devid) + ((guint)(ctx->pasid) << 24);
+}
+
+static void __ctx_inval_devid_pasid(gpointer key, gpointer value, gpointer data)
+{
+    RISCVIOMMUContext *ctx = (RISCVIOMMUContext *) value;
+    RISCVIOMMUContext *arg = (RISCVIOMMUContext *) data;
+    if (ctx->tc & RISCV_IOMMU_DC_TC_V &&
+        ctx->devid == arg->devid &&
+        ctx->pasid == arg->pasid) {
+        ctx->tc &= ~RISCV_IOMMU_DC_TC_V;
+    }
+}
+
+static void __ctx_inval_devid(gpointer key, gpointer value, gpointer data)
+{
+    RISCVIOMMUContext *ctx = (RISCVIOMMUContext *) value;
+    RISCVIOMMUContext *arg = (RISCVIOMMUContext *) data;
+    if (ctx->tc & RISCV_IOMMU_DC_TC_V &&
+        ctx->devid == arg->devid) {
+        ctx->tc &= ~RISCV_IOMMU_DC_TC_V;
+    }
+}
+
+static void __ctx_inval_all(gpointer key, gpointer value, gpointer data)
+{
+    RISCVIOMMUContext *ctx = (RISCVIOMMUContext *) value;
+    if (ctx->tc & RISCV_IOMMU_DC_TC_V) {
+        ctx->tc &= ~RISCV_IOMMU_DC_TC_V;
+    }
+}
+
+static void riscv_iommu_ctx_inval(RISCVIOMMUState *s, GHFunc func,
+    uint32_t devid, uint32_t pasid)
+{
+    GHashTable *ctx_cache;
+    RISCVIOMMUContext key = {
+        .devid = devid,
+        .pasid = pasid,
+    };
+    ctx_cache = g_hash_table_ref(s->ctx_cache);
+    g_hash_table_foreach(ctx_cache, func, &key);
+    g_hash_table_unref(ctx_cache);
+}
+
+/* Find or allocate translation context for a given {device_id, process_id} */
+static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOMMUState *s,
+    unsigned devid, unsigned pasid, void **ref)
+{
+    GHashTable *ctx_cache;
+    RISCVIOMMUContext *ctx;
+    RISCVIOMMUContext key = {
+        .devid = devid,
+        .pasid = pasid,
+    };
+
+    ctx_cache = g_hash_table_ref(s->ctx_cache);
+    ctx = g_hash_table_lookup(ctx_cache, &key);
+
+    if (ctx && (ctx->tc & RISCV_IOMMU_DC_TC_V)) {
+        *ref = ctx_cache;
+        return ctx;
+    }
+
+    if (g_hash_table_size(s->ctx_cache) >= LIMIT_CACHE_CTX) {
+        ctx_cache = g_hash_table_new_full(__ctx_hash, __ctx_equal,
+                                          g_free, NULL);
+        g_hash_table_unref(qatomic_xchg(&s->ctx_cache, ctx_cache));
+    }
+
+    ctx = g_new0(RISCVIOMMUContext, 1);
+    ctx->devid = devid;
+    ctx->pasid = pasid;
+
+    int fault = riscv_iommu_ctx_fetch(s, ctx);
+    if (!fault) {
+        g_hash_table_add(ctx_cache, ctx);
+        *ref = ctx_cache;
+        return ctx;
+    }
+
+    g_hash_table_unref(ctx_cache);
+    *ref = NULL;
+
+    if (!(ctx->tc & RISCV_IOMMU_DC_TC_DTF)) {
+        struct riscv_iommu_fq_record ev = { 0 };
+        ev.hdr = set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_CAUSE, fault);
+        ev.hdr = set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_TTYPE,
+            RISCV_IOMMU_FQ_TTYPE_UADDR_RD);
+        ev.hdr = set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_DID, devid);
+        ev.hdr = set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_PID, pasid);
+        ev.hdr = set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_PV, !!pasid);
+        riscv_iommu_fault(s, &ev);
+    }
+
+    g_free(ctx);
+    return NULL;
+}
+
+static void riscv_iommu_ctx_put(RISCVIOMMUState *s, void *ref)
+{
+    if (ref) {
+        g_hash_table_unref((GHashTable *)ref);
+    }
+}
+
+/* Find or allocate address space for a given device */
+static AddressSpace *riscv_iommu_space(RISCVIOMMUState *s, uint32_t devid)
+{
+    RISCVIOMMUSpace *as;
+
+    /* FIXME: PCIe bus remapping for attached endpoints. */
+    devid |= s->bus << 8;
+
+    qemu_mutex_lock(&s->core_lock);
+    QLIST_FOREACH(as, &s->spaces, list) {
+        if (as->devid == devid) {
+            break;
+        }
+    }
+    qemu_mutex_unlock(&s->core_lock);
+
+    if (as == NULL) {
+        char name[64];
+        as = g_new0(RISCVIOMMUSpace, 1);
+
+        as->iommu = s;
+        as->devid = devid;
+
+        snprintf(name, sizeof(name), "riscv-iommu-%04x:%02x.%d-iova",
+            PCI_BUS_NUM(as->devid), PCI_SLOT(as->devid), PCI_FUNC(as->devid));
+
+        /* IOVA address space, untranslated addresses */
+        memory_region_init_iommu(&as->iova_mr, sizeof(as->iova_mr),
+            TYPE_RISCV_IOMMU_MEMORY_REGION,
+            OBJECT(as), name, UINT64_MAX);
+        address_space_init(&as->iova_as, MEMORY_REGION(&as->iova_mr),
+            TYPE_RISCV_IOMMU_PCI);
+
+        qemu_mutex_lock(&s->core_lock);
+        QLIST_INSERT_HEAD(&s->spaces, as, list);
+        qemu_mutex_unlock(&s->core_lock);
+
+        trace_riscv_iommu_new(s->parent_obj.id, PCI_BUS_NUM(as->devid),
+                PCI_SLOT(as->devid), PCI_FUNC(as->devid));
+    }
+    return &as->iova_as;
+}
+
+/* Translation Object cache support */
+static gboolean __iot_equal(gconstpointer v1, gconstpointer v2)
+{
+    RISCVIOMMUEntry *t1 = (RISCVIOMMUEntry *) v1;
+    RISCVIOMMUEntry *t2 = (RISCVIOMMUEntry *) v2;
+    return t1->gscid == t2->gscid && t1->pscid == t2->pscid &&
+           t1->iova == t2->iova;
+}
+
+static guint __iot_hash(gconstpointer v)
+{
+    RISCVIOMMUEntry *t = (RISCVIOMMUEntry *) v;
+    return (guint)t->iova;
+}
+
+/* GV: 1 PSCV: 1 AV: 1 */
+static void __iot_inval_pscid_iova(gpointer key, gpointer value, gpointer data)
+{
+    RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
+    RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
+    if (iot->gscid == arg->gscid &&
+        iot->pscid == arg->pscid &&
+        iot->iova == arg->iova) {
+        iot->perm = 0;
+    }
+}
+
+/* GV: 1 PSCV: 1 AV: 0 */
+static void __iot_inval_pscid(gpointer key, gpointer value, gpointer data)
+{
+    RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
+    RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
+    if (iot->gscid == arg->gscid &&
+        iot->pscid == arg->pscid) {
+        iot->perm = 0;
+    }
+}
+
+/* GV: 1 GVMA: 1 */
+static void __iot_inval_gscid_gpa(gpointer key, gpointer value, gpointer data)
+{
+    RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
+    RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
+    if (iot->gscid == arg->gscid) {
+        /* simplified cache, no GPA matching */
+        iot->perm = 0;
+    }
+}
+
+/* GV: 1 GVMA: 0 */
+static void __iot_inval_gscid(gpointer key, gpointer value, gpointer data)
+{
+    RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
+    RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
+    if (iot->gscid == arg->gscid) {
+        iot->perm = 0;
+    }
+}
+
+/* GV: 0 */
+static void __iot_inval_all(gpointer key, gpointer value, gpointer data)
+{
+    RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
+    iot->perm = 0;
+}
+
+/* caller should keep ref-count for iot_cache object */
+static RISCVIOMMUEntry *riscv_iommu_iot_lookup(RISCVIOMMUContext *ctx,
+    GHashTable *iot_cache, hwaddr iova)
+{
+    RISCVIOMMUEntry key = {
+        .gscid = get_field(ctx->gatp, RISCV_IOMMU_DC_IOHGATP_GSCID),
+        .pscid = get_field(ctx->ta, RISCV_IOMMU_DC_TA_PSCID),
+        .iova  = PPN_DOWN(iova),
+    };
+    return g_hash_table_lookup(iot_cache, &key);
+}
+
+/* caller should keep ref-count for iot_cache object */
+static void riscv_iommu_iot_update(RISCVIOMMUState *s,
+    GHashTable *iot_cache, RISCVIOMMUEntry *iot)
+{
+    if (!s->iot_limit) {
+        return;
+    }
+
+    if (g_hash_table_size(s->iot_cache) >= s->iot_limit) {
+        iot_cache = g_hash_table_new_full(__iot_hash, __iot_equal,
+                                          g_free, NULL);
+        g_hash_table_unref(qatomic_xchg(&s->iot_cache, iot_cache));
+    }
+    g_hash_table_add(iot_cache, iot);
+}
+
+static void riscv_iommu_iot_inval(RISCVIOMMUState *s, GHFunc func,
+    uint32_t gscid, uint32_t pscid, hwaddr iova)
+{
+    GHashTable *iot_cache;
+    RISCVIOMMUEntry key = {
+        .gscid = gscid,
+        .pscid = pscid,
+        .iova  = PPN_DOWN(iova),
+    };
+
+    iot_cache = g_hash_table_ref(s->iot_cache);
+    g_hash_table_foreach(iot_cache, func, &key);
+    g_hash_table_unref(iot_cache);
+}
+
+static int riscv_iommu_translate(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
+    IOMMUTLBEntry *iotlb, bool enable_cache)
+{
+    RISCVIOMMUEntry *iot;
+    IOMMUAccessFlags perm;
+    bool enable_faults;
+    bool enable_pasid;
+    bool enable_pri;
+    GHashTable *iot_cache;
+    int fault;
+
+    riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_URQ);
+
+    iot_cache = g_hash_table_ref(s->iot_cache);
+
+    enable_faults = !(ctx->tc & RISCV_IOMMU_DC_TC_DTF);
+    /*
+     * TC[32] is reserved for custom extensions, used here to temporarily
+     * enable automatic page-request generation for ATS queries.
+     */
+    enable_pri = (iotlb->perm == IOMMU_NONE) && (ctx->tc & BIT_ULL(32));
+    enable_pasid = (ctx->tc & RISCV_IOMMU_DC_TC_PDTV);
+
+    /* Check for ATS request. */
+    if (iotlb->perm == IOMMU_NONE) {
+        riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_ATS_RQ);
+        /* Check if ATS is disabled. */
+        if (!(ctx->tc & RISCV_IOMMU_DC_TC_EN_ATS)) {
+            enable_pri = false;
+            fault = RISCV_IOMMU_FQ_CAUSE_TTYPE_BLOCKED;
+            goto done;
+        }
+        trace_riscv_iommu_ats(s->parent_obj.id, PCI_BUS_NUM(ctx->devid),
+                PCI_SLOT(ctx->devid), PCI_FUNC(ctx->devid), iotlb->iova);
+    }
+
+    iot = riscv_iommu_iot_lookup(ctx, iot_cache, iotlb->iova);
+    perm = iot ? iot->perm : IOMMU_NONE;
+    if (perm != IOMMU_NONE) {
+        iotlb->translated_addr = PPN_PHYS(iot->phys);
+        iotlb->addr_mask = ~TARGET_PAGE_MASK;
+        iotlb->perm = perm;
+        fault = 0;
+        goto done;
+    }
+
+    riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_TLB_MISS);
+
+    /* Translate using device directory / page table information. */
+    fault = riscv_iommu_spa_fetch(s, ctx, iotlb, false);
+
+    if (!fault && iotlb->target_as == &s->trap_as) {
+        /* Do not cache trapped MSI translations */
+        goto done;
+    }
+
+    if (!fault && iotlb->translated_addr != iotlb->iova && enable_cache) {
+        iot = g_new0(RISCVIOMMUEntry, 1);
+        iot->iova = PPN_DOWN(iotlb->iova);
+        iot->phys = PPN_DOWN(iotlb->translated_addr);
+        iot->gscid = get_field(ctx->gatp, RISCV_IOMMU_DC_IOHGATP_GSCID);
+        iot->pscid = get_field(ctx->ta, RISCV_IOMMU_DC_TA_PSCID);
+        iot->perm = iotlb->perm;
+        riscv_iommu_iot_update(s, iot_cache, iot);
+    }
+
+done:
+    g_hash_table_unref(iot_cache);
+
+    if (enable_pri && fault) {
+        struct riscv_iommu_pq_record pr = {0};
+        if (enable_pasid) {
+            pr.hdr = set_field(RISCV_IOMMU_PREQ_HDR_PV,
+                RISCV_IOMMU_PREQ_HDR_PID, ctx->pasid);
+        }
+        pr.hdr = set_field(pr.hdr, RISCV_IOMMU_PREQ_HDR_DID, ctx->devid);
+        pr.payload = (iotlb->iova & TARGET_PAGE_MASK) | RISCV_IOMMU_PREQ_PAYLOAD_M;
+        riscv_iommu_pri(s, &pr);
+        return fault;
+    }
+
+    if (enable_faults && fault) {
+        struct riscv_iommu_fq_record ev;
+        const unsigned ttype =
+            (iotlb->perm & IOMMU_RW) ? RISCV_IOMMU_FQ_TTYPE_UADDR_WR :
+            ((iotlb->perm & IOMMU_RO) ? RISCV_IOMMU_FQ_TTYPE_UADDR_RD :
+            RISCV_IOMMU_FQ_TTYPE_PCIE_ATS_REQ);
+        ev.hdr = set_field(0, RISCV_IOMMU_FQ_HDR_CAUSE, fault);
+        ev.hdr = set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_TTYPE, ttype);
+        ev.hdr = set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_PV, enable_pasid);
+        ev.hdr = set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_PID, ctx->pasid);
+        ev.hdr = set_field(ev.hdr, RISCV_IOMMU_FQ_HDR_DID, ctx->devid);
+        ev.iotval    = iotlb->iova;
+        ev.iotval2   = iotlb->translated_addr;
+        ev._reserved = 0;
+        riscv_iommu_fault(s, &ev);
+        return fault;
+    }
+
+    return 0;
+}
+
+/* IOMMU Command Interface */
+static MemTxResult riscv_iommu_iofence(RISCVIOMMUState *s, bool notify,
+    uint64_t addr, uint32_t data)
+{
+    /*
+     * ATS processing in this implementation of the IOMMU is synchronous,
+     * no need to wait for completions here.
+     */
+    if (!notify) {
+        return MEMTX_OK;
+    }
+
+    return dma_memory_write(s->target_as, addr, &data, sizeof(data),
+        MEMTXATTRS_UNSPECIFIED);
+}
+
+static void riscv_iommu_ats(RISCVIOMMUState *s,
+    struct riscv_iommu_command *cmd, IOMMUNotifierFlag flag,
+    IOMMUAccessFlags perm,
+    void (*trace_fn)(const char *id))
+{
+    RISCVIOMMUSpace *as = NULL;
+    IOMMUNotifier *n;
+    IOMMUTLBEvent event;
+    uint32_t pasid;
+    uint32_t devid;
+    const bool pv = cmd->dword0 & RISCV_IOMMU_CMD_ATS_PV;
+
+    if (cmd->dword0 & RISCV_IOMMU_CMD_ATS_DSV) {
+        /* Use device segment and requester id */
+        devid = get_field(cmd->dword0,
+            RISCV_IOMMU_CMD_ATS_DSEG | RISCV_IOMMU_CMD_ATS_RID);
+    } else {
+        devid = get_field(cmd->dword0, RISCV_IOMMU_CMD_ATS_RID);
+    }
+
+    pasid = get_field(cmd->dword0, RISCV_IOMMU_CMD_ATS_PID);
+
+    qemu_mutex_lock(&s->core_lock);
+    QLIST_FOREACH(as, &s->spaces, list) {
+        if (as->devid == devid) {
+            break;
+        }
+    }
+    qemu_mutex_unlock(&s->core_lock);
+
+    if (!as || !as->notifier) {
+        return;
+    }
+
+    event.type = flag;
+    event.entry.perm = perm;
+    event.entry.target_as = s->target_as;
+
+    IOMMU_NOTIFIER_FOREACH(n, &as->iova_mr) {
+        if (!pv || n->iommu_idx == pasid) {
+            event.entry.iova = n->start;
+            event.entry.addr_mask = n->end - n->start;
+            trace_fn(as->iova_mr.parent_obj.name);
+            memory_region_notify_iommu_one(n, &event);
+        }
+    }
+}
+
+static void riscv_iommu_ats_inval(RISCVIOMMUState *s,
+    struct riscv_iommu_command *cmd)
+{
+    return riscv_iommu_ats(s, cmd, IOMMU_NOTIFIER_DEVIOTLB_UNMAP, IOMMU_NONE,
+                           trace_riscv_iommu_ats_inval);
+}
+
+static void riscv_iommu_ats_prgr(RISCVIOMMUState *s,
+    struct riscv_iommu_command *cmd)
+{
+    unsigned resp_code = get_field(cmd->dword1, RISCV_IOMMU_CMD_ATS_PRGR_RESP_CODE);
+    /* Using the access flag to carry response code information */
+    IOMMUAccessFlags perm = resp_code ? IOMMU_NONE : IOMMU_RW;
+    return riscv_iommu_ats(s, cmd, IOMMU_NOTIFIER_MAP, perm,
+                           trace_riscv_iommu_ats_prgr);
+}
+
+static void riscv_iommu_process_ddtp(RISCVIOMMUState *s)
+{
+    uint64_t old_ddtp = s->ddtp;
+    uint64_t new_ddtp = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_DDTP);
+    unsigned new_mode = get_field(new_ddtp, RISCV_IOMMU_DDTP_MODE);
+    unsigned old_mode = get_field(old_ddtp, RISCV_IOMMU_DDTP_MODE);
+    bool ok = false;
+
+    /*
+     * Check for allowed DDTP.MODE transitions:
+     * {OFF, BARE}        -> {OFF, BARE, 1LVL, 2LVL, 3LVL}
+     * {1LVL, 2LVL, 3LVL} -> {OFF, BARE}
+     */
+    if (new_mode == old_mode ||
+        new_mode == RISCV_IOMMU_DDTP_MODE_OFF ||
+        new_mode == RISCV_IOMMU_DDTP_MODE_BARE) {
+        ok = true;
+    } else if (new_mode == RISCV_IOMMU_DDTP_MODE_1LVL ||
+               new_mode == RISCV_IOMMU_DDTP_MODE_2LVL ||
+               new_mode == RISCV_IOMMU_DDTP_MODE_3LVL) {
+        ok = old_mode == RISCV_IOMMU_DDTP_MODE_OFF ||
+             old_mode == RISCV_IOMMU_DDTP_MODE_BARE;
+    }
+
+    if (ok) {
+        /* clear reserved and busy bits, report back sanitized version */
+        new_ddtp = set_field(new_ddtp & RISCV_IOMMU_DDTP_PPN,
+                             RISCV_IOMMU_DDTP_MODE, new_mode);
+    } else {
+        new_ddtp = old_ddtp;
+    }
+    s->ddtp = new_ddtp;
+
+    riscv_iommu_reg_set64(s, RISCV_IOMMU_REG_DDTP, new_ddtp);
+}
+
+/* Command function and opcode field. */
+#define RISCV_IOMMU_CMD(func, op) (((func) << 7) | (op))
+
+static void riscv_iommu_process_cq_tail(RISCVIOMMUState *s)
+{
+    struct riscv_iommu_command cmd;
+    MemTxResult res;
+    dma_addr_t addr;
+    uint32_t tail, head, ctrl;
+    GHFunc func;
+
+    ctrl = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_CQCSR);
+    tail = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_CQT) & s->cq_mask;
+    head = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_CQH) & s->cq_mask;
+
+    /* Check for pending error or queue processing disabled */
+    if (!(ctrl & RISCV_IOMMU_CQCSR_CQON) ||
+        !!(ctrl & (RISCV_IOMMU_CQCSR_CMD_ILL | RISCV_IOMMU_CQCSR_CQMF))) {
+        return;
+    }
+
+    while (tail != head) {
+        addr = s->cq_addr  + head * sizeof(cmd);
+        res = dma_memory_read(s->target_as, addr, &cmd, sizeof(cmd),
+                              MEMTXATTRS_UNSPECIFIED);
+
+        if (res != MEMTX_OK) {
+            riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_CQCSR, RISCV_IOMMU_CQCSR_CQMF, 0);
+            goto fault;
+        }
+
+        trace_riscv_iommu_cmd(s->parent_obj.id, cmd.dword0, cmd.dword1);
+
+        switch (get_field(cmd.dword0, RISCV_IOMMU_CMD_OPCODE | RISCV_IOMMU_CMD_FUNC)) {
+        case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_IOFENCE_FUNC_C,
+                             RISCV_IOMMU_CMD_IOFENCE_OPCODE):
+            res = riscv_iommu_iofence(s, cmd.dword0 & RISCV_IOMMU_CMD_IOFENCE_AV,
+                cmd.dword1, get_field(cmd.dword0, RISCV_IOMMU_CMD_IOFENCE_DATA));
+
+            if (res != MEMTX_OK) {
+                riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_CQCSR,
+                                      RISCV_IOMMU_CQCSR_CQMF, 0);
+                goto fault;
+            }
+            break;
+
+        case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA,
+                             RISCV_IOMMU_CMD_IOTINVAL_OPCODE):
+            if (cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_PSCV) {
+                /* illegal command arguments IOTINVAL.GVMA & PSCV == 1 */
+                goto cmd_ill;
+            } else if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_GV)) {
+                /* invalidate all cache mappings */
+                func = __iot_inval_all;
+            } else if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_AV)) {
+                /* invalidate cache matching GSCID */
+                func = __iot_inval_gscid;
+            } else {
+                /* invalidate cache matching GSCID and ADDR (GPA) */
+                func = __iot_inval_gscid_gpa;
+            }
+            riscv_iommu_iot_inval(s, func,
+                get_field(cmd.dword0, RISCV_IOMMU_CMD_IOTINVAL_GSCID), 0,
+                cmd.dword1 & TARGET_PAGE_MASK);
+            break;
+
+        case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_IOTINVAL_FUNC_VMA,
+                             RISCV_IOMMU_CMD_IOTINVAL_OPCODE):
+            if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_GV)) {
+                /* invalidate all cache mappings, simplified model */
+                func = __iot_inval_all;
+            } else if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_PSCV)) {
+                /* invalidate cache matching GSCID, simplified model */
+                func = __iot_inval_gscid;
+            } else if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_AV)) {
+                /* invalidate cache matching GSCID and PSCID */
+                func = __iot_inval_pscid;
+            } else {
+                /* invalidate cache matching GSCID and PSCID and ADDR (IOVA) */
+                func = __iot_inval_pscid_iova;
+            }
+            riscv_iommu_iot_inval(s, func,
+                get_field(cmd.dword0, RISCV_IOMMU_CMD_IOTINVAL_GSCID),
+                get_field(cmd.dword0, RISCV_IOMMU_CMD_IOTINVAL_PSCID),
+                cmd.dword1 & TARGET_PAGE_MASK);
+            break;
+
+        case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_IODIR_FUNC_INVAL_DDT,
+                             RISCV_IOMMU_CMD_IODIR_OPCODE):
+            if (!(cmd.dword0 & RISCV_IOMMU_CMD_IODIR_DV)) {
+                /* invalidate all device context cache mappings */
+                func = __ctx_inval_all;
+            } else {
+                /* invalidate all device context matching DID */
+                func = __ctx_inval_devid;
+            }
+            riscv_iommu_ctx_inval(s, func,
+                get_field(cmd.dword0, RISCV_IOMMU_CMD_IODIR_DID), 0);
+            break;
+
+        case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_IODIR_FUNC_INVAL_PDT,
+                             RISCV_IOMMU_CMD_IODIR_OPCODE):
+            if (!(cmd.dword0 & RISCV_IOMMU_CMD_IODIR_DV)) {
+                /* illegal command arguments IODIR_PDT & DV == 0 */
+                goto cmd_ill;
+            } else {
+                func = __ctx_inval_devid_pasid;
+            }
+            riscv_iommu_ctx_inval(s, func,
+                get_field(cmd.dword0, RISCV_IOMMU_CMD_IODIR_DID),
+                get_field(cmd.dword0, RISCV_IOMMU_CMD_IODIR_PID));
+            break;
+
+        /* ATS commands */
+        case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_ATS_FUNC_INVAL,
+                             RISCV_IOMMU_CMD_ATS_OPCODE):
+            riscv_iommu_ats_inval(s, &cmd);
+            break;
+
+        case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_ATS_FUNC_PRGR,
+                             RISCV_IOMMU_CMD_ATS_OPCODE):
+            riscv_iommu_ats_prgr(s, &cmd);
+            break;
+
+        default:
+        cmd_ill:
+            /* Invalid instruction, do not advance instruction index. */
+            riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_CQCSR,
+                RISCV_IOMMU_CQCSR_CMD_ILL, 0);
+            goto fault;
+        }
+
+        /* Advance and update head pointer after command completes. */
+        head = (head + 1) & s->cq_mask;
+        riscv_iommu_reg_set32(s, RISCV_IOMMU_REG_CQH, head);
+    }
+    return;
+
+fault:
+    if (ctrl & RISCV_IOMMU_CQCSR_CIE) {
+        riscv_iommu_notify(s, RISCV_IOMMU_INTR_CQ);
+    }
+}
+
+static void riscv_iommu_process_cq_control(RISCVIOMMUState *s)
+{
+    uint64_t base;
+    uint32_t ctrl_set = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_CQCSR);
+    uint32_t ctrl_clr;
+    bool enable = !!(ctrl_set & RISCV_IOMMU_CQCSR_CQEN);
+    bool active = !!(ctrl_set & RISCV_IOMMU_CQCSR_CQON);
+
+    if (enable && !active) {
+        base = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_CQB);
+        s->cq_mask = (2ULL << get_field(base, RISCV_IOMMU_CQB_LOG2SZ)) - 1;
+        s->cq_addr = PPN_PHYS(get_field(base, RISCV_IOMMU_CQB_PPN));
+        stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_CQT], ~s->cq_mask);
+        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_CQH], 0);
+        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_CQT], 0);
+        ctrl_set = RISCV_IOMMU_CQCSR_CQON;
+        ctrl_clr = RISCV_IOMMU_CQCSR_BUSY | RISCV_IOMMU_CQCSR_CQMF |
+            RISCV_IOMMU_CQCSR_CMD_ILL | RISCV_IOMMU_CQCSR_CMD_TO;
+    } else if (!enable && active) {
+        stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_CQT], ~0);
+        ctrl_set = 0;
+        ctrl_clr = RISCV_IOMMU_CQCSR_BUSY | RISCV_IOMMU_CQCSR_CQON;
+    } else {
+        ctrl_set = 0;
+        ctrl_clr = RISCV_IOMMU_CQCSR_BUSY;
+    }
+
+    riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_CQCSR, ctrl_set, ctrl_clr);
+}
+
+static void riscv_iommu_process_fq_control(RISCVIOMMUState *s)
+{
+    uint64_t base;
+    uint32_t ctrl_set = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_FQCSR);
+    uint32_t ctrl_clr;
+    bool enable = !!(ctrl_set & RISCV_IOMMU_FQCSR_FQEN);
+    bool active = !!(ctrl_set & RISCV_IOMMU_FQCSR_FQON);
+
+    if (enable && !active) {
+        base = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_FQB);
+        s->fq_mask = (2ULL << get_field(base, RISCV_IOMMU_FQB_LOG2SZ)) - 1;
+        s->fq_addr = PPN_PHYS(get_field(base, RISCV_IOMMU_FQB_PPN));
+        stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_FQH], ~s->fq_mask);
+        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_FQH], 0);
+        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_FQT], 0);
+        ctrl_set = RISCV_IOMMU_FQCSR_FQON;
+        ctrl_clr = RISCV_IOMMU_FQCSR_BUSY | RISCV_IOMMU_FQCSR_FQMF |
+            RISCV_IOMMU_FQCSR_FQOF;
+    } else if (!enable && active) {
+        stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_FQH], ~0);
+        ctrl_set = 0;
+        ctrl_clr = RISCV_IOMMU_FQCSR_BUSY | RISCV_IOMMU_FQCSR_FQON;
+    } else {
+        ctrl_set = 0;
+        ctrl_clr = RISCV_IOMMU_FQCSR_BUSY;
+    }
+
+    riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_FQCSR, ctrl_set, ctrl_clr);
+}
+
+static void riscv_iommu_process_pq_control(RISCVIOMMUState *s)
+{
+    uint64_t base;
+    uint32_t ctrl_set = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_PQCSR);
+    uint32_t ctrl_clr;
+    bool enable = !!(ctrl_set & RISCV_IOMMU_PQCSR_PQEN);
+    bool active = !!(ctrl_set & RISCV_IOMMU_PQCSR_PQON);
+
+    if (enable && !active) {
+        base = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_PQB);
+        s->pq_mask = (2ULL << get_field(base, RISCV_IOMMU_PQB_LOG2SZ)) - 1;
+        s->pq_addr = PPN_PHYS(get_field(base, RISCV_IOMMU_PQB_PPN));
+        stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_PQH], ~s->pq_mask);
+        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_PQH], 0);
+        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_PQT], 0);
+        ctrl_set = RISCV_IOMMU_PQCSR_PQON;
+        ctrl_clr = RISCV_IOMMU_PQCSR_BUSY | RISCV_IOMMU_PQCSR_PQMF |
+            RISCV_IOMMU_PQCSR_PQOF;
+    } else if (!enable && active) {
+        stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_PQH], ~0);
+        ctrl_set = 0;
+        ctrl_clr = RISCV_IOMMU_PQCSR_BUSY | RISCV_IOMMU_PQCSR_PQON;
+    } else {
+        ctrl_set = 0;
+        ctrl_clr = RISCV_IOMMU_PQCSR_BUSY;
+    }
+
+    riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_PQCSR, ctrl_set, ctrl_clr);
+}
+
+static void riscv_iommu_process_dbg(RISCVIOMMUState *s)
+{
+    uint64_t iova = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_TR_REQ_IOVA);
+    uint64_t ctrl = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_TR_REQ_CTL);
+    unsigned devid = get_field(ctrl, RISCV_IOMMU_TR_REQ_CTL_DID);
+    unsigned pid = get_field(ctrl, RISCV_IOMMU_TR_REQ_CTL_PID);
+    RISCVIOMMUContext *ctx;
+    void *ref;
+
+    if (!(ctrl & RISCV_IOMMU_TR_REQ_CTL_GO_BUSY)) {
+        return;
+    }
+
+    ctx = riscv_iommu_ctx(s, devid, pid, &ref);
+    if (ctx == NULL) {
+        riscv_iommu_reg_set64(s, RISCV_IOMMU_REG_TR_RESPONSE,
+            RISCV_IOMMU_TR_RESPONSE_FAULT | (RISCV_IOMMU_FQ_CAUSE_DMA_DISABLED << 10));
+    } else {
+        IOMMUTLBEntry iotlb = {
+            .iova = iova,
+            .perm = IOMMU_NONE,
+            .addr_mask = ~0,
+            .target_as = NULL,
+        };
+        int fault = riscv_iommu_translate(s, ctx, &iotlb, false);
+        if (fault) {
+            iova = RISCV_IOMMU_TR_RESPONSE_FAULT | (((uint64_t) fault) << 10);
+        } else {
+            iova = ((iotlb.translated_addr & ~iotlb.addr_mask) >> 2) &
+                RISCV_IOMMU_TR_RESPONSE_PPN;
+        }
+        riscv_iommu_reg_set64(s, RISCV_IOMMU_REG_TR_RESPONSE, iova);
+    }
+
+    riscv_iommu_reg_mod64(s, RISCV_IOMMU_REG_TR_REQ_CTL, 0,
+        RISCV_IOMMU_TR_REQ_CTL_GO_BUSY);
+    riscv_iommu_ctx_put(s, ref);
+}
+
+/* Core IOMMU execution activation */
+enum {
+    RISCV_IOMMU_EXEC_DDTP,
+    RISCV_IOMMU_EXEC_CQCSR,
+    RISCV_IOMMU_EXEC_CQT,
+    RISCV_IOMMU_EXEC_FQCSR,
+    RISCV_IOMMU_EXEC_FQH,
+    RISCV_IOMMU_EXEC_PQCSR,
+    RISCV_IOMMU_EXEC_PQH,
+    RISCV_IOMMU_EXEC_TR_REQUEST,
+    /* RISCV_IOMMU_EXEC_EXIT must be the last enum value */
+    RISCV_IOMMU_EXEC_EXIT,
+};
+
+static void *riscv_iommu_core_proc(void* arg)
+{
+    RISCVIOMMUState *s = arg;
+    unsigned exec = 0;
+    unsigned mask = 0;
+
+    while (!(exec & BIT(RISCV_IOMMU_EXEC_EXIT))) {
+        mask = (mask ? mask : BIT(RISCV_IOMMU_EXEC_EXIT)) >> 1;
+        switch (exec & mask) {
+        case BIT(RISCV_IOMMU_EXEC_DDTP):
+            riscv_iommu_process_ddtp(s);
+            break;
+        case BIT(RISCV_IOMMU_EXEC_CQCSR):
+            riscv_iommu_process_cq_control(s);
+            break;
+        case BIT(RISCV_IOMMU_EXEC_CQT):
+            riscv_iommu_process_cq_tail(s);
+            break;
+        case BIT(RISCV_IOMMU_EXEC_FQCSR):
+            riscv_iommu_process_fq_control(s);
+            break;
+        case BIT(RISCV_IOMMU_EXEC_FQH):
+            /* NOP */
+            break;
+        case BIT(RISCV_IOMMU_EXEC_PQCSR):
+            riscv_iommu_process_pq_control(s);
+            break;
+        case BIT(RISCV_IOMMU_EXEC_PQH):
+            /* NOP */
+            break;
+        case BIT(RISCV_IOMMU_EXEC_TR_REQUEST):
+            riscv_iommu_process_dbg(s);
+            break;
+        }
+        exec &= ~mask;
+        if (!exec) {
+            qemu_mutex_lock(&s->core_lock);
+            exec = s->core_exec;
+            while (!exec) {
+                qemu_cond_wait(&s->core_cond, &s->core_lock);
+                exec = s->core_exec;
+            }
+            s->core_exec = 0;
+            qemu_mutex_unlock(&s->core_lock);
+        }
+    };
+
+    return NULL;
+}
+
+/* For now we assume IOMMU HPM frequency to be 1GHz so 1-cycle is of 1-ns. */
+static inline uint64_t __get_cycles(void)
+{
+    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+}
+
+static void __hpm_setup_timer(RISCVIOMMUState *s, uint64_t value)
+{
+    const uint32_t inhibit = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTINH);
+    uint64_t overflow_at, overflow_ns;
+
+    if (get_field(inhibit, RISCV_IOMMU_IOCOUNTINH_CY)) {
+        return;
+    }
+
+    /*
+     * We are using INT64_MAX here instead to UINT64_MAX because cycle counter
+     * has 63-bit precision and INT64_MAX is the maximum it can store.
+     */
+    if (value) {
+        overflow_ns = INT64_MAX - value + 1;
+    } else {
+        overflow_ns = INT64_MAX;
+    }
+
+    overflow_at = (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + overflow_ns;
+
+    if (overflow_at > INT64_MAX) {
+        s->irq_overflow_left = overflow_at - INT64_MAX;
+        overflow_at = INT64_MAX;
+    }
+
+    timer_mod_anticipate_ns(s->hpm_timer, overflow_at);
+}
+
+/* Updates the internal cycle counter state when iocntinh:CY is changed. */
+static void riscv_iommu_process_iocntinh_cy(RISCVIOMMUState *s,
+                                            bool prev_cy_inh)
+{
+    const uint32_t inhibit = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTINH);
+
+    /* We only need to process CY bit toggle. */
+    if (!(inhibit ^ prev_cy_inh)) {
+        return;
+    }
+
+    if (!(inhibit & RISCV_IOMMU_IOCOUNTINH_CY)) {
+        /*
+         * Cycle counter is enabled. Just start the timer again and update the
+         * clock snapshot value to point to the current time to make sure
+         * iohpmcycles read is correct.
+         */
+        s->hpmcycle_prev = __get_cycles();
+        __hpm_setup_timer(s, s->hpmcycle_val);
+    } else {
+        /*
+         * Cycle counter is disabled. Stop the timer and update the cycle
+         * counter to record the current value which is last programmed
+         * value + the cycles passed so far.
+         */
+        s->hpmcycle_val = s->hpmcycle_val + (__get_cycles() - s->hpmcycle_prev);
+        timer_del(s->hpm_timer);
+    }
+}
+
+static void riscv_iommu_process_hpmcycle_write(RISCVIOMMUState *s)
+{
+    const uint64_t val = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_IOHPMCYCLES);
+    const uint32_t ovf = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTOVF);
+
+    /*
+     * Clear OF bit in IOCNTOVF if it's being cleared in IOHPMCYCLES register.
+     */
+    if (get_field(ovf, RISCV_IOMMU_IOCOUNTOVF_CY) &&
+        !get_field(val, RISCV_IOMMU_IOHPMCYCLES_OVF)) {
+        riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_IOCOUNTOVF, 0,
+            RISCV_IOMMU_IOCOUNTOVF_CY);
+    }
+
+    s->hpmcycle_val = val & ~RISCV_IOMMU_IOHPMCYCLES_OVF;
+    s->hpmcycle_prev = __get_cycles();
+    __hpm_setup_timer(s, s->hpmcycle_val);
+}
+
+static inline bool __check_valid_event_id(unsigned event_id)
+{
+    return event_id > RISCV_IOMMU_HPMEVENT_INVALID &&
+           event_id < RISCV_IOMMU_HPMEVENT_MAX;
+}
+
+static gboolean __hpm_event_equal(gpointer key, gpointer value, gpointer udata)
+{
+    uint32_t *pair = udata;
+
+    if (GPOINTER_TO_UINT(value) & (1 << pair[0])) {
+        pair[1] = GPOINTER_TO_UINT(key);
+        return true;
+    }
+
+    return false;
+}
+
+/* Caller must check ctr_idx against hpm_ctrs to see if its supported or not. */
+static void __update_event_map(RISCVIOMMUState *s, uint64_t value,
+    uint32_t ctr_idx)
+{
+    unsigned event_id = get_field(value, RISCV_IOMMU_IOHPMEVT_EVENT_ID);
+    uint32_t pair[2] = { ctr_idx, RISCV_IOMMU_HPMEVENT_INVALID };
+    uint32_t new_value = 1 << ctr_idx;
+    gpointer data;
+
+    /* If EventID field is RISCV_IOMMU_HPMEVENT_INVALID remove the current mapping. */
+    if (event_id == RISCV_IOMMU_HPMEVENT_INVALID) {
+        data = g_hash_table_find(s->hpm_event_ctr_map, __hpm_event_equal, pair);
+
+        new_value = GPOINTER_TO_UINT(data) & ~(new_value);
+        pthread_rwlock_wrlock(&s->ht_lock);
+        if (new_value != 0) {
+            g_hash_table_replace(s->hpm_event_ctr_map,
+                                 GUINT_TO_POINTER(pair[1]),
+                                 GUINT_TO_POINTER(new_value));
+        } else {
+            g_hash_table_remove(s->hpm_event_ctr_map,
+                                GUINT_TO_POINTER(pair[1]));
+        }
+        pthread_rwlock_unlock(&s->ht_lock);
+
+        return;
+    }
+
+    /* Update the counter mask if the event is already enabled. */
+    if (g_hash_table_lookup_extended(s->hpm_event_ctr_map,
+                                     GUINT_TO_POINTER(event_id),
+                                     NULL,
+                                     &data)) {
+        new_value |= GPOINTER_TO_UINT(data);
+    }
+
+    pthread_rwlock_wrlock(&s->ht_lock);
+    g_hash_table_insert(s->hpm_event_ctr_map,
+                        GUINT_TO_POINTER(event_id),
+                        GUINT_TO_POINTER(new_value));
+    pthread_rwlock_unlock(&s->ht_lock);
+}
+
+static void riscv_iommu_process_hpmevt_write(RISCVIOMMUState *s,
+                                             uint32_t evt_reg)
+{
+    const uint32_t ctr_idx = (evt_reg - RISCV_IOMMU_REG_IOHPMEVT_BASE) >> 3;
+    const uint32_t ovf = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTOVF);
+    uint64_t val = riscv_iommu_reg_get64(s, evt_reg);
+
+    if (ctr_idx >= s->hpm_cntrs) {
+        return;
+    }
+
+    /* Clear OF bit in IOCNTOVF if it's being cleared in IOHPMEVT register. */
+    if (get_field(ovf, BIT(ctr_idx + 1)) && !get_field(val, RISCV_IOMMU_IOHPMEVT_OF)) {
+        /* +1 to offset CYCLE register OF bit. */
+        riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_IOCOUNTOVF, 0, BIT(ctr_idx + 1));
+    }
+
+    if (!__check_valid_event_id(get_field(val, RISCV_IOMMU_IOHPMEVT_EVENT_ID))) {
+        /* Reset EventID (WARL) field to invalid. */
+        val = set_field(val, RISCV_IOMMU_IOHPMEVT_EVENT_ID,
+            RISCV_IOMMU_HPMEVENT_INVALID);
+        riscv_iommu_reg_set64(s, evt_reg, val);
+    }
+
+    __update_event_map(s, val, ctr_idx);
+}
+
+static void riscv_iommu_process_hpm_writes(RISCVIOMMUState *s,
+                                           uint32_t regb,
+                                           bool prev_cy_inh)
+{
+    switch (regb) {
+    case RISCV_IOMMU_REG_IOCOUNTINH:
+        riscv_iommu_process_iocntinh_cy(s, prev_cy_inh);
+        break;
+
+    case RISCV_IOMMU_REG_IOHPMCYCLES:
+    case RISCV_IOMMU_REG_IOHPMCYCLES + 4:
+        riscv_iommu_process_hpmcycle_write(s);
+        break;
+
+    case RISCV_IOMMU_REG_IOHPMEVT_BASE ...
+        RISCV_IOMMU_REG_IOHPMEVT(RISCV_IOMMU_IOCOUNT_NUM) + 4:
+        riscv_iommu_process_hpmevt_write(s, regb & ~7);
+        break;
+    }
+}
+
+static MemTxResult riscv_iommu_mmio_write(void *opaque, hwaddr addr,
+    uint64_t data, unsigned size, MemTxAttrs attrs)
+{
+    RISCVIOMMUState *s = opaque;
+    uint32_t regb = addr & ~3;
+    bool cy_inh = false;
+    uint32_t busy = 0;
+    uint32_t exec = 0;
+
+    if (size == 0 || size > 8 || (addr & (size - 1)) != 0) {
+        /* Unsupported MMIO alignment or access size */
+        return MEMTX_ERROR;
+    }
+
+    if (addr + size > RISCV_IOMMU_REG_MSI_CONFIG) {
+        /* Unsupported MMIO access location. */
+        return MEMTX_ACCESS_ERROR;
+    }
+
+    /* Track actionable MMIO write. */
+    switch (regb) {
+    case RISCV_IOMMU_REG_DDTP:
+    case RISCV_IOMMU_REG_DDTP + 4:
+        exec = BIT(RISCV_IOMMU_EXEC_DDTP);
+        regb = RISCV_IOMMU_REG_DDTP;
+        busy = RISCV_IOMMU_DDTP_BUSY;
+        break;
+
+    case RISCV_IOMMU_REG_CQT:
+        exec = BIT(RISCV_IOMMU_EXEC_CQT);
+        break;
+
+    case RISCV_IOMMU_REG_CQCSR:
+        exec = BIT(RISCV_IOMMU_EXEC_CQCSR);
+        busy = RISCV_IOMMU_CQCSR_BUSY;
+        break;
+
+    case RISCV_IOMMU_REG_FQH:
+        exec = BIT(RISCV_IOMMU_EXEC_FQH);
+        break;
+
+    case RISCV_IOMMU_REG_FQCSR:
+        exec = BIT(RISCV_IOMMU_EXEC_FQCSR);
+        busy = RISCV_IOMMU_FQCSR_BUSY;
+        break;
+
+    case RISCV_IOMMU_REG_PQH:
+        exec = BIT(RISCV_IOMMU_EXEC_PQH);
+        break;
+
+    case RISCV_IOMMU_REG_PQCSR:
+        exec = BIT(RISCV_IOMMU_EXEC_PQCSR);
+        busy = RISCV_IOMMU_PQCSR_BUSY;
+        break;
+
+    case RISCV_IOMMU_REG_IOCOUNTINH:
+        if (addr != RISCV_IOMMU_REG_IOCOUNTINH) {
+            break;
+        }
+
+        /* Store previous value of CY bit. */
+        cy_inh = !!(riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTINH) &
+            RISCV_IOMMU_IOCOUNTINH_CY);
+        break;
+
+    case RISCV_IOMMU_REG_TR_REQ_CTL:
+        exec = BIT(RISCV_IOMMU_EXEC_TR_REQUEST);
+        regb = RISCV_IOMMU_REG_TR_REQ_CTL;
+        busy = RISCV_IOMMU_TR_REQ_CTL_GO_BUSY;
+        break;
+    }
+
+    /*
+     * Registers update might be not synchronized with core logic.
+     * If system software updates register when relevant BUSY bit is set
+     * IOMMU behavior of additional writes to the register is UNSPECIFIED
+     */
+
+    qemu_spin_lock(&s->regs_lock);
+    if (size == 1) {
+        uint8_t ro = s->regs_ro[addr];
+        uint8_t wc = s->regs_wc[addr];
+        uint8_t rw = s->regs_rw[addr];
+        s->regs_rw[addr] = ((rw & ro) | (data & ~ro)) & ~(data & wc);
+    } else if (size == 2) {
+        uint16_t ro = lduw_le_p(&s->regs_ro[addr]);
+        uint16_t wc = lduw_le_p(&s->regs_wc[addr]);
+        uint16_t rw = lduw_le_p(&s->regs_rw[addr]);
+        stw_le_p(&s->regs_rw[addr], ((rw & ro) | (data & ~ro)) & ~(data & wc));
+    } else if (size == 4) {
+        uint32_t ro = ldl_le_p(&s->regs_ro[addr]);
+        uint32_t wc = ldl_le_p(&s->regs_wc[addr]);
+        uint32_t rw = ldl_le_p(&s->regs_rw[addr]);
+        stl_le_p(&s->regs_rw[addr], ((rw & ro) | (data & ~ro)) & ~(data & wc));
+    } else if (size == 8) {
+        uint64_t ro = ldq_le_p(&s->regs_ro[addr]);
+        uint64_t wc = ldq_le_p(&s->regs_wc[addr]);
+        uint64_t rw = ldq_le_p(&s->regs_rw[addr]);
+        stq_le_p(&s->regs_rw[addr], ((rw & ro) | (data & ~ro)) & ~(data & wc));
+    }
+
+    /* Busy flag update, MSB 4-byte register. */
+    if (busy) {
+        uint32_t rw = ldl_le_p(&s->regs_rw[regb]);
+        stl_le_p(&s->regs_rw[regb], rw | busy);
+    }
+    qemu_spin_unlock(&s->regs_lock);
+
+    /* Process HPM writes and update any internal state if needed. */
+    if (regb >= RISCV_IOMMU_REG_IOCOUNTOVF &&
+        regb <= (RISCV_IOMMU_REG_IOHPMEVT(RISCV_IOMMU_IOCOUNT_NUM) + 4)) {
+        riscv_iommu_process_hpm_writes(s, regb, cy_inh);
+    }
+
+    /* Wake up core processing thread. */
+    if (exec) {
+        qemu_mutex_lock(&s->core_lock);
+        s->core_exec |= exec;
+        qemu_cond_signal(&s->core_cond);
+        qemu_mutex_unlock(&s->core_lock);
+    }
+
+    return MEMTX_OK;
+}
+
+static uint64_t riscv_iommu_hpmcycle_read(RISCVIOMMUState *s)
+{
+    const uint64_t cycle = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_IOHPMCYCLES);
+    const uint32_t inhibit = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTINH);
+    const uint64_t ctr_prev = s->hpmcycle_prev;
+    const uint64_t ctr_val = s->hpmcycle_val;
+
+    if (get_field(inhibit, RISCV_IOMMU_IOCOUNTINH_CY)) {
+        /*
+         * Counter should not increment if inhibit bit is set. We can't really
+         * stop the QEMU_CLOCK_VIRTUAL, so we just return the last updated
+         * counter value to indicate that counter was not incremented.
+         */
+        return (ctr_val & RISCV_IOMMU_IOHPMCYCLES_COUNTER) |
+               (cycle & RISCV_IOMMU_IOHPMCYCLES_OVF);
+    }
+
+    return (ctr_val + __get_cycles() - ctr_prev) |
+        (cycle & RISCV_IOMMU_IOHPMCYCLES_OVF);
+}
+
+static MemTxResult riscv_iommu_mmio_read(void *opaque, hwaddr addr,
+    uint64_t *data, unsigned size, MemTxAttrs attrs)
+{
+    RISCVIOMMUState *s = opaque;
+    uint64_t val = -1;
+    uint8_t *ptr;
+
+    if ((addr & (size - 1)) != 0) {
+        /* Unsupported MMIO alignment. */
+        return MEMTX_ERROR;
+    }
+
+    if (addr + size > RISCV_IOMMU_REG_MSI_CONFIG) {
+        return MEMTX_ACCESS_ERROR;
+    }
+
+    /* Compute cycle register value. */
+    if ((addr & ~7) == RISCV_IOMMU_REG_IOHPMCYCLES) {
+        val = riscv_iommu_hpmcycle_read(s);
+        ptr = (uint8_t *)&val + (addr & 7);
+    } else if ((addr & ~3) == RISCV_IOMMU_REG_IOCOUNTOVF) {
+        /*
+         * Software can read RISCV_IOMMU_REG_IOCOUNTOVF before timer callback completes.
+         * In which case CY_OF bit in RISCV_IOMMU_IOHPMCYCLES_OVF would be 0. Here we
+         * take the CY_OF bit state from RISCV_IOMMU_REG_IOHPMCYCLES register as it's
+         * not dependent over the timer callback and is computed from cycle
+         * overflow.
+         */
+        val = ldq_le_p(&s->regs_rw[addr]);
+        val |= (riscv_iommu_hpmcycle_read(s) & RISCV_IOMMU_IOHPMCYCLES_OVF)
+                   ? RISCV_IOMMU_IOCOUNTOVF_CY
+                   : 0;
+        ptr = (uint8_t *)&val + (addr & 3);
+    } else {
+        ptr = &s->regs_rw[addr];
+    }
+
+    if (size == 1) {
+        val = (uint64_t)*ptr;
+    } else if (size == 2) {
+        val = lduw_le_p(ptr);
+    } else if (size == 4) {
+        val = ldl_le_p(ptr);
+    } else if (size == 8) {
+        val = ldq_le_p(ptr);
+    } else {
+        return MEMTX_ERROR;
+    }
+
+    *data = val;
+
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps riscv_iommu_mmio_ops = {
+    .read_with_attrs = riscv_iommu_mmio_read,
+    .write_with_attrs = riscv_iommu_mmio_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    }
+};
+
+/*
+ * Translations matching MSI pattern check are redirected to "riscv-iommu-trap"
+ * memory region as untranslated address, for additional MSI/MRIF interception
+ * by IOMMU interrupt remapping implementation.
+ * Note: Device emulation code generating an MSI is expected to provide a valid
+ * memory transaction attributes with requested_id set.
+ */
+static MemTxResult riscv_iommu_trap_write(void *opaque, hwaddr addr,
+    uint64_t data, unsigned size, MemTxAttrs attrs)
+{
+    RISCVIOMMUState* s = (RISCVIOMMUState *)opaque;
+    RISCVIOMMUContext *ctx;
+    MemTxResult res;
+    void *ref;
+    uint32_t devid = attrs.requester_id;
+
+    if (attrs.unspecified) {
+        return MEMTX_ACCESS_ERROR;
+    }
+
+    /* FIXME: PCIe bus remapping for attached endpoints. */
+    devid |= s->bus << 8;
+
+    ctx = riscv_iommu_ctx(s, devid, 0, &ref);
+    if (ctx == NULL) {
+        res = MEMTX_ACCESS_ERROR;
+    } else {
+        res = riscv_iommu_msi_write(s, ctx, addr, data, size, attrs);
+    }
+    riscv_iommu_ctx_put(s, ref);
+    return res;
+}
+
+static MemTxResult riscv_iommu_trap_read(void *opaque, hwaddr addr,
+    uint64_t *data, unsigned size, MemTxAttrs attrs)
+{
+    return MEMTX_ACCESS_ERROR;
+}
+
+static const MemoryRegionOps riscv_iommu_trap_ops = {
+    .read_with_attrs = riscv_iommu_trap_read,
+    .write_with_attrs = riscv_iommu_trap_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    }
+};
+
+/* Timer callback for cycle counter overflow. */
+static void riscv_iommu_hpm_timer_cb(void *priv)
+{
+    RISCVIOMMUState *s = priv;
+    const uint32_t inhibit = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTINH);
+    uint32_t ovf;
+
+    if (get_field(inhibit, RISCV_IOMMU_IOCOUNTINH_CY)) {
+        return;
+    }
+
+    if (s->irq_overflow_left > 0) {
+        uint64_t irq_trigger_at =
+            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + s->irq_overflow_left;
+        timer_mod_anticipate_ns(s->hpm_timer, irq_trigger_at);
+        s->irq_overflow_left = 0;
+        return;
+    }
+
+    ovf = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTOVF);
+    if (!get_field(ovf, RISCV_IOMMU_IOCOUNTOVF_CY)) {
+        /*
+         * We don't need to set hpmcycle_val to zero and update hpmcycle_prev to
+         * current clock value. The way we calculate iohpmcycs will overflow
+         * and return the correct value. This avoids the need to synchronize
+         * timer callback and write callback.
+         */
+        riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_IOCOUNTOVF,
+            RISCV_IOMMU_IOCOUNTOVF_CY, 0);
+        riscv_iommu_reg_mod64(s, RISCV_IOMMU_REG_IOHPMCYCLES,
+            RISCV_IOMMU_IOHPMCYCLES_OVF, 0);
+        riscv_iommu_notify(s, RISCV_IOMMU_INTR_PM);
+    }
+}
+
+static void riscv_iommu_realize(DeviceState *dev, Error **errp)
+{
+    const uint64_t cap_implemented =
+        RISCV_IOMMU_CAP_MSI_FLAT |
+        RISCV_IOMMU_CAP_MSI_MRIF |
+        RISCV_IOMMU_CAP_ATS |
+        RISCV_IOMMU_CAP_S_SV32 |
+        RISCV_IOMMU_CAP_S_SV39 |
+        RISCV_IOMMU_CAP_S_SV48 |
+        RISCV_IOMMU_CAP_S_SV57 |
+        RISCV_IOMMU_CAP_G_SV32 |
+        RISCV_IOMMU_CAP_G_SV39 |
+        RISCV_IOMMU_CAP_G_SV48 |
+        RISCV_IOMMU_CAP_G_SV57 |
+        RISCV_IOMMU_CAP_MSI_FLAT |
+        RISCV_IOMMU_CAP_MSI_MRIF |
+        RISCV_IOMMU_CAP_ATS |
+        RISCV_IOMMU_CAP_IGS |
+        RISCV_IOMMU_CAP_HPM |
+        RISCV_IOMMU_CAP_DBG |
+        RISCV_IOMMU_CAP_PD8 |
+        RISCV_IOMMU_CAP_PD17 |
+        RISCV_IOMMU_CAP_PD20;
+
+    RISCVIOMMUState *s = RISCV_IOMMU(dev);
+
+    s->cap &= cap_implemented;
+    s->cap = set_field(s->cap, RISCV_IOMMU_CAP_VERSION, s->version);
+
+    if (s->hpm_cntrs > RISCV_IOMMU_IOCOUNT_NUM) {
+        /* Clip number of HPM counters to maximum supported (31). */
+        s->hpm_cntrs = RISCV_IOMMU_IOCOUNT_NUM;
+    } else if (s->hpm_cntrs == 0) {
+        /* Disable hardware performance monitor interface */
+        s->cap |= RISCV_IOMMU_CAP_HPM;
+    }
+
+    /* Verify supported IGS */
+    switch (get_field(s->cap, RISCV_IOMMU_CAP_IGS)) {
+    case RISCV_IOMMU_CAP_IGS_MSI:
+    case RISCV_IOMMU_CAP_IGS_WSI:
+        break;
+    default:
+        error_setg(errp, "can't support requested IGS mode: cap: %" PRIx64,
+            s->cap);
+        return;
+    }
+
+    /* Report QEMU target physical address space limits */
+    s->cap = set_field(s->cap, RISCV_IOMMU_CAP_PAS, TARGET_PHYS_ADDR_SPACE_BITS);
+
+    /* Adjust reported PD capabilities */
+    if (s->pasid_bits < 20) {
+        s->cap &= ~RISCV_IOMMU_CAP_PD20;
+    } else if (s->pasid_bits < 17) {
+        s->cap &= ~RISCV_IOMMU_CAP_PD17;
+    } else if (s->pasid_bits < 8) {
+        s->cap &= ~RISCV_IOMMU_CAP_PD8;
+    }
+
+    /* Out-of-reset translation mode: OFF (DMA disabled) BARE (passthrough) */
+    s->ddtp = set_field(0, RISCV_IOMMU_DDTP_MODE, s->enable_off ?
+                        RISCV_IOMMU_DDTP_MODE_OFF : RISCV_IOMMU_DDTP_MODE_BARE);
+
+    /* register storage */
+    s->regs_rw = g_new0(uint8_t, RISCV_IOMMU_REG_SIZE);
+    s->regs_ro = g_new0(uint8_t, RISCV_IOMMU_REG_SIZE);
+    s->regs_wc = g_new0(uint8_t, RISCV_IOMMU_REG_SIZE);
+
+     /* Mark all registers read-only */
+    memset(s->regs_ro, 0xff, RISCV_IOMMU_REG_SIZE);
+
+    /*
+     * Register complete MMIO space, including MSI/PBA registers.
+     * Note, PCIDevice implementation will add overlapping MR for MSI/PBA,
+     * managed directly by the PCIDevice implementation.
+     */
+    memory_region_init_io(&s->regs_mr, OBJECT(dev), &riscv_iommu_mmio_ops, s,
+        "riscv-iommu-regs", RISCV_IOMMU_REG_SIZE);
+
+    /* Set power-on register state */
+    stq_le_p(&s->regs_rw[RISCV_IOMMU_REG_CAP], s->cap);
+    stq_le_p(&s->regs_rw[RISCV_IOMMU_REG_FCTL], s->fctl);
+    stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_DDTP],
+        ~(RISCV_IOMMU_DDTP_PPN | RISCV_IOMMU_DDTP_MODE));
+    stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_CQB],
+        ~(RISCV_IOMMU_CQB_LOG2SZ | RISCV_IOMMU_CQB_PPN));
+    stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_FQB],
+        ~(RISCV_IOMMU_FQB_LOG2SZ | RISCV_IOMMU_FQB_PPN));
+    stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_PQB],
+        ~(RISCV_IOMMU_PQB_LOG2SZ | RISCV_IOMMU_PQB_PPN));
+    stl_le_p(&s->regs_wc[RISCV_IOMMU_REG_CQCSR], RISCV_IOMMU_CQCSR_CQMF |
+        RISCV_IOMMU_CQCSR_CMD_TO | RISCV_IOMMU_CQCSR_CMD_ILL);
+    stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_CQCSR], RISCV_IOMMU_CQCSR_CQON |
+        RISCV_IOMMU_CQCSR_BUSY);
+    stl_le_p(&s->regs_wc[RISCV_IOMMU_REG_FQCSR], RISCV_IOMMU_FQCSR_FQMF |
+        RISCV_IOMMU_FQCSR_FQOF);
+    stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_FQCSR], RISCV_IOMMU_FQCSR_FQON |
+        RISCV_IOMMU_FQCSR_BUSY);
+    stl_le_p(&s->regs_wc[RISCV_IOMMU_REG_PQCSR], RISCV_IOMMU_PQCSR_PQMF |
+        RISCV_IOMMU_PQCSR_PQOF);
+    stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_PQCSR], RISCV_IOMMU_PQCSR_PQON |
+        RISCV_IOMMU_PQCSR_BUSY);
+    stl_le_p(&s->regs_wc[RISCV_IOMMU_REG_IPSR], ~0);
+    /* If HPM registers are enabled. */
+    if (s->cap & RISCV_IOMMU_CAP_HPM) {
+        /* +1 for cycle counter bit. */
+        stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_IOCOUNTINH], ~((2 << s->hpm_cntrs) - 1));
+        stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_IOHPMCYCLES], 0);
+        memset(&s->regs_ro[RISCV_IOMMU_REG_IOHPMCTR_BASE], 0x00, s->hpm_cntrs * 8);
+        memset(&s->regs_ro[RISCV_IOMMU_REG_IOHPMEVT_BASE], 0x00, s->hpm_cntrs * 8);
+    }
+    stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_IVEC], 0);
+    stq_le_p(&s->regs_rw[RISCV_IOMMU_REG_DDTP], s->ddtp);
+    /* If debug registers enabled. */
+    if (s->cap & RISCV_IOMMU_CAP_DBG) {
+        stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_TR_REQ_IOVA], 0);
+        stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_TR_REQ_CTL],
+            RISCV_IOMMU_TR_REQ_CTL_GO_BUSY);
+    }
+
+    /* Memory region for downstream access, if specified. */
+    if (s->target_mr) {
+        s->target_as = g_new0(AddressSpace, 1);
+        address_space_init(s->target_as, s->target_mr,
+            "riscv-iommu-downstream");
+    } else {
+        /* Fallback to global system memory. */
+        s->target_as = &address_space_memory;
+    }
+
+    /* Memory region for untranslated MRIF/MSI writes */
+    memory_region_init_io(&s->trap_mr, OBJECT(dev), &riscv_iommu_trap_ops, s,
+            "riscv-iommu-trap", ~0ULL);
+    address_space_init(&s->trap_as, &s->trap_mr, "riscv-iommu-trap-as");
+
+    /* Device translation context cache */
+    s->ctx_cache = g_hash_table_new_full(__ctx_hash, __ctx_equal,
+                                         g_free, NULL);
+    s->iot_cache = g_hash_table_new_full(__iot_hash, __iot_equal,
+                                         g_free, NULL);
+
+    if (s->cap & RISCV_IOMMU_CAP_HPM) {
+        s->hpm_event_ctr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
+        pthread_rwlock_init(&s->ht_lock, NULL);
+        s->hpm_timer =
+            timer_new_ns(QEMU_CLOCK_VIRTUAL, riscv_iommu_hpm_timer_cb, s);
+    }
+
+    s->iommus.le_next = NULL;
+    s->iommus.le_prev = NULL;
+    QLIST_INIT(&s->spaces);
+    qemu_cond_init(&s->core_cond);
+    qemu_mutex_init(&s->core_lock);
+    qemu_spin_init(&s->regs_lock);
+    qemu_thread_create(&s->core_proc, "riscv-iommu-core",
+        riscv_iommu_core_proc, s, QEMU_THREAD_JOINABLE);
+}
+
+static void riscv_iommu_unrealize(DeviceState *dev)
+{
+    RISCVIOMMUState *s = RISCV_IOMMU(dev);
+
+    qemu_mutex_lock(&s->core_lock);
+    /* cancel pending operations and stop */
+    s->core_exec = BIT(RISCV_IOMMU_EXEC_EXIT);
+    qemu_cond_signal(&s->core_cond);
+    qemu_mutex_unlock(&s->core_lock);
+    qemu_thread_join(&s->core_proc);
+    qemu_cond_destroy(&s->core_cond);
+    qemu_mutex_destroy(&s->core_lock);
+    if (s->cap & RISCV_IOMMU_CAP_HPM) {
+        timer_free(s->hpm_timer);
+        pthread_rwlock_destroy(&s->ht_lock);
+        g_hash_table_unref(s->hpm_event_ctr_map);
+    }
+    g_hash_table_unref(s->iot_cache);
+    g_hash_table_unref(s->ctx_cache);
+}
+
+static Property riscv_iommu_properties[] = {
+    DEFINE_PROP_UINT32("version", RISCVIOMMUState, version,
+        RISCV_IOMMU_SPEC_DOT_VER),
+    DEFINE_PROP_UINT64("capabilities", RISCVIOMMUState, cap, ~0ULL),
+    DEFINE_PROP_BOOL("off", RISCVIOMMUState, enable_off, TRUE),
+    DEFINE_PROP_UINT32("bus", RISCVIOMMUState, bus, 0x0),
+    DEFINE_PROP_UINT32("ioatc-limit", RISCVIOMMUState, iot_limit,
+        LIMIT_CACHE_IOT),
+    DEFINE_PROP_LINK("downstream-mr", RISCVIOMMUState, target_mr,
+        TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_UINT8("hpm-counters", RISCVIOMMUState, hpm_cntrs,
+        RISCV_IOMMU_IOCOUNT_NUM),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void riscv_iommu_class_init(ObjectClass *klass, void* data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    /* internal device for riscv-iommu-{pci/sys}, not user-creatable */
+    dc->user_creatable = false;
+    dc->realize = riscv_iommu_realize;
+    dc->unrealize = riscv_iommu_unrealize;
+    device_class_set_props(dc, riscv_iommu_properties);
+}
+
+static const TypeInfo riscv_iommu_info = {
+    .name = TYPE_RISCV_IOMMU,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(RISCVIOMMUState),
+    .class_init = riscv_iommu_class_init,
+};
+
+static const char *IOMMU_FLAG_STR[] = {
+    "NA",
+    "RO",
+    "WR",
+    "RW",
+};
+
+/* RISC-V IOMMU Memory Region - Address Translation Space */
+static IOMMUTLBEntry riscv_iommu_memory_region_translate(
+    IOMMUMemoryRegion *iommu_mr, hwaddr addr,
+    IOMMUAccessFlags flag, int iommu_idx)
+{
+    RISCVIOMMUSpace *as = container_of(iommu_mr, RISCVIOMMUSpace, iova_mr);
+    RISCVIOMMUContext *ctx;
+    void *ref;
+    IOMMUTLBEntry iotlb = {
+        .iova = addr,
+        .target_as = as->iommu->target_as,
+        .addr_mask = ~0ULL,
+        .perm = flag,
+    };
+
+    ctx = riscv_iommu_ctx(as->iommu, as->devid, iommu_idx, &ref);
+    if (ctx == NULL) {
+        /* Translation disabled or invalid. */
+        iotlb.addr_mask = 0;
+        iotlb.perm = IOMMU_NONE;
+    } else if (riscv_iommu_translate(as->iommu, ctx, &iotlb, true)) {
+        /* Translation disabled or fault reported. */
+        iotlb.addr_mask = 0;
+        iotlb.perm = IOMMU_NONE;
+    }
+
+    /* Trace all dma translations with original access flags. */
+    trace_riscv_iommu_dma(as->iommu->parent_obj.id, PCI_BUS_NUM(as->devid),
+                          PCI_SLOT(as->devid), PCI_FUNC(as->devid), iommu_idx,
+                          IOMMU_FLAG_STR[flag & IOMMU_RW], iotlb.iova,
+                          iotlb.translated_addr);
+
+    riscv_iommu_ctx_put(as->iommu, ref);
+
+    return iotlb;
+}
+
+static int riscv_iommu_memory_region_notify(
+    IOMMUMemoryRegion *iommu_mr, IOMMUNotifierFlag old,
+    IOMMUNotifierFlag new, Error **errp)
+{
+    RISCVIOMMUSpace *as = container_of(iommu_mr, RISCVIOMMUSpace, iova_mr);
+
+    if (old == IOMMU_NOTIFIER_NONE) {
+        as->notifier = true;
+        trace_riscv_iommu_notifier_add(iommu_mr->parent_obj.name);
+    } else if (new == IOMMU_NOTIFIER_NONE) {
+        as->notifier = false;
+        trace_riscv_iommu_notifier_del(iommu_mr->parent_obj.name);
+    }
+
+    return 0;
+}
+
+static inline bool pci_is_iommu(PCIDevice *pdev)
+{
+    return pci_get_word(pdev->config + PCI_CLASS_DEVICE) == 0x0806;
+}
+
+static AddressSpace *riscv_iommu_find_as(PCIBus *bus, void *opaque, int devfn)
+{
+    RISCVIOMMUState *s = (RISCVIOMMUState *) opaque;
+    PCIDevice *pdev = pci_find_device(bus, pci_bus_num(bus), devfn);
+    AddressSpace *as = NULL;
+
+    if (pdev && pci_is_iommu(pdev)) {
+        return s->target_as;
+    }
+
+    /* Find first registered IOMMU device */
+    while (s->iommus.le_prev) {
+        s = *(s->iommus.le_prev);
+    }
+
+    /* Find first matching IOMMU */
+    while (s != NULL && as == NULL) {
+        as = riscv_iommu_space(s, PCI_BUILD_BDF(pci_bus_num(bus), devfn));
+        s = s->iommus.le_next;
+    }
+
+    return as ? as : &address_space_memory;
+}
+
+void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
+    Error **errp)
+{
+    if (bus->iommu_fn == riscv_iommu_find_as) {
+        /* Allow multiple IOMMUs on the same PCIe bus, link known devices */
+        RISCVIOMMUState *last = (RISCVIOMMUState *)bus->iommu_opaque;
+        QLIST_INSERT_AFTER(last, iommu, iommus);
+    } else if (bus->iommu_fn == NULL) {
+        pci_setup_iommu(bus, riscv_iommu_find_as, iommu);
+    } else {
+        error_setg(errp, "can't register secondary IOMMU for PCI bus #%d",
+            pci_bus_num(bus));
+    }
+}
+
+static int riscv_iommu_memory_region_index(IOMMUMemoryRegion *iommu_mr,
+    MemTxAttrs attrs)
+{
+    return RISCV_IOMMU_NOPASID;
+}
+
+static int riscv_iommu_memory_region_index_len(IOMMUMemoryRegion *iommu_mr)
+{
+    return 1;
+}
+
+static void riscv_iommu_memory_region_init(ObjectClass *klass, void *data)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
+
+    imrc->translate = riscv_iommu_memory_region_translate;
+    imrc->notify_flag_changed = riscv_iommu_memory_region_notify;
+    imrc->attrs_to_index = riscv_iommu_memory_region_index;
+    imrc->num_indexes = riscv_iommu_memory_region_index_len;
+}
+
+static const TypeInfo riscv_iommu_memory_region_info = {
+    .parent = TYPE_IOMMU_MEMORY_REGION,
+    .name = TYPE_RISCV_IOMMU_MEMORY_REGION,
+    .class_init = riscv_iommu_memory_region_init,
+};
+
+static void riscv_iommu_register_mr_types(void)
+{
+    type_register_static(&riscv_iommu_memory_region_info);
+    type_register_static(&riscv_iommu_info);
+}
+
+type_init(riscv_iommu_register_mr_types);
diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
new file mode 100644
index 0000000000..c68e09db58
--- /dev/null
+++ b/hw/riscv/riscv-iommu.h
@@ -0,0 +1,152 @@
+/*
+ * QEMU emulation of an RISC-V IOMMU (Ziommu)
+ *
+ * Copyright (C) 2022-2023 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RISCV_IOMMU_STATE_H
+#define HW_RISCV_IOMMU_STATE_H
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+
+#include "hw/riscv/iommu.h"
+
+struct RISCVIOMMUState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    uint32_t version;     /* Reported interface version number */
+    uint32_t pasid_bits;  /* process identifier width */
+    uint32_t bus;         /* PCI bus mapping for non-root endpoints */
+
+    uint64_t cap;         /* IOMMU supported capabilities */
+    uint64_t fctl;        /* IOMMU enabled features */
+    bool enable_off;      /* Enable out-of-reset OFF mode (DMA disabled) */
+
+    /* IOMMU Internal State */
+    uint64_t ddtp;        /* Validated Device Directory Tree Root Pointer */
+
+    dma_addr_t cq_addr;   /* Command queue base physical address */
+    dma_addr_t fq_addr;   /* Fault/event queue base physical address */
+    dma_addr_t pq_addr;   /* Page request queue base physical address */
+
+    uint32_t cq_mask;     /* Command queue index bit mask */
+    uint32_t fq_mask;     /* Fault/event queue index bit mask */
+    uint32_t pq_mask;     /* Page request queue index bit mask */
+
+    /* interrupt notifier */
+    void (*notify)(RISCVIOMMUState *iommu, unsigned vector);
+
+    /* IOMMU State Machine */
+    QemuThread core_proc; /* Background processing thread */
+    QemuMutex core_lock;  /* Global IOMMU lock, used for cache/regs updates */
+    QemuCond core_cond;   /* Background processing wake up signal */
+    unsigned core_exec;   /* Processing thread execution actions */
+
+    /* IOMMU target address space */
+    AddressSpace *target_as;
+    MemoryRegion *target_mr;
+
+    /* MSI / MRIF access trap */
+    AddressSpace trap_as;
+    MemoryRegion trap_mr;
+
+    GHashTable *ctx_cache;          /* Device translation Context Cache */
+    GHashTable *iot_cache;          /* IO Translated Address Cache */
+    unsigned iot_limit;             /* IO Translation Cache size limit */
+
+    /* HPM cycle counter */
+    QEMUTimer *hpm_timer;
+    uint64_t hpmcycle_val;      /* Current value of cycle register */
+    uint64_t hpmcycle_prev;     /* Saved value of QEMU_CLOCK_VIRTUAL clock */
+    uint64_t irq_overflow_left; /* Value beyond INT64_MAX after overflow */
+
+    /* HPM event counters */
+    uint8_t hpm_cntrs;
+    GHashTable *hpm_event_ctr_map; /* Mapping of events to counters */
+    pthread_rwlock_t ht_lock;      /* Lock used for hpm_event_ctr_map updates */
+
+    /* MMIO Hardware Interface */
+    MemoryRegion regs_mr;
+    QemuSpin regs_lock;
+    uint8_t *regs_rw;  /* register state (user write) */
+    uint8_t *regs_wc;  /* write-1-to-clear mask */
+    uint8_t *regs_ro;  /* read-only mask */
+
+    QLIST_ENTRY(RISCVIOMMUState) iommus;
+    QLIST_HEAD(, RISCVIOMMUSpace) spaces;
+};
+
+void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
+         Error **errp);
+
+/* private helpers */
+
+/* Register helper functions */
+static inline uint32_t riscv_iommu_reg_mod32(RISCVIOMMUState *s,
+    unsigned idx, uint32_t set, uint32_t clr)
+{
+    uint32_t val;
+    qemu_spin_lock(&s->regs_lock);
+    val = ldl_le_p(s->regs_rw + idx);
+    stl_le_p(s->regs_rw + idx, (val & ~clr) | set);
+    qemu_spin_unlock(&s->regs_lock);
+    return val;
+}
+
+static inline void riscv_iommu_reg_set32(RISCVIOMMUState *s,
+    unsigned idx, uint32_t set)
+{
+    qemu_spin_lock(&s->regs_lock);
+    stl_le_p(s->regs_rw + idx, set);
+    qemu_spin_unlock(&s->regs_lock);
+}
+
+static inline uint32_t riscv_iommu_reg_get32(RISCVIOMMUState *s,
+    unsigned idx)
+{
+    return ldl_le_p(s->regs_rw + idx);
+}
+
+static inline uint64_t riscv_iommu_reg_mod64(RISCVIOMMUState *s,
+    unsigned idx, uint64_t set, uint64_t clr)
+{
+    uint64_t val;
+    qemu_spin_lock(&s->regs_lock);
+    val = ldq_le_p(s->regs_rw + idx);
+    stq_le_p(s->regs_rw + idx, (val & ~clr) | set);
+    qemu_spin_unlock(&s->regs_lock);
+    return val;
+}
+
+static inline void riscv_iommu_reg_set64(RISCVIOMMUState *s,
+    unsigned idx, uint64_t set)
+{
+    qemu_spin_lock(&s->regs_lock);
+    stq_le_p(s->regs_rw + idx, set);
+    qemu_spin_unlock(&s->regs_lock);
+}
+
+static inline uint64_t riscv_iommu_reg_get64(RISCVIOMMUState *s,
+    unsigned idx)
+{
+    return ldq_le_p(s->regs_rw + idx);
+}
+
+
+
+#endif
diff --git a/hw/riscv/trace-events b/hw/riscv/trace-events
new file mode 100644
index 0000000000..fd5e21e3d4
--- /dev/null
+++ b/hw/riscv/trace-events
@@ -0,0 +1,14 @@
+# See documentation at docs/devel/tracing.rst
+
+# riscv-iommu.c
+riscv_iommu_new(const char *id, unsigned b, unsigned d, unsigned f) "%s: device attached %04x:%02x.%d"
+riscv_iommu_flt(const char *id, unsigned b, unsigned d, unsigned f, uint64_t reason, uint64_t iova) "%s: fault %04x:%02x.%u reason: 0x%"PRIx64" iova: 0x%"PRIx64
+riscv_iommu_ats(const char *id, unsigned b, unsigned d, unsigned f, uint64_t iova) "%s: translate request %04x:%02x.%u iova: 0x%"PRIx64
+riscv_iommu_pri(const char *id, unsigned b, unsigned d, unsigned f, uint64_t iova) "%s: page request %04x:%02x.%u iova: 0x%"PRIx64
+riscv_iommu_dma(const char *id, unsigned b, unsigned d, unsigned f, unsigned pasid, const char *dir, uint64_t iova, uint64_t phys) "%s: translate %04x:%02x.%u #%u %s 0x%"PRIx64" -> 0x%"PRIx64
+riscv_iommu_msi(const char *id, unsigned b, unsigned d, unsigned f, uint64_t iova, uint64_t phys) "%s: translate %04x:%02x.%u MSI 0x%"PRIx64" -> 0x%"PRIx64
+riscv_iommu_cmd(const char *id, uint64_t l, uint64_t u) "%s: command 0x%"PRIx64" 0x%"PRIx64
+riscv_iommu_notifier_add(const char *id) "%s: dev-iotlb notifier added"
+riscv_iommu_notifier_del(const char *id) "%s: dev-iotlb notifier removed"
+riscv_iommu_ats_inval(const char *id) "%s: dev-iotlb invalidate"
+riscv_iommu_ats_prgr(const char *id) "%s: dev-iotlb page request group response"
diff --git a/hw/riscv/trace.h b/hw/riscv/trace.h
new file mode 100644
index 0000000000..b88504b750
--- /dev/null
+++ b/hw/riscv/trace.h
@@ -0,0 +1,2 @@
+#include "trace/trace-hw_riscv.h"
+
diff --git a/include/hw/riscv/iommu.h b/include/hw/riscv/iommu.h
new file mode 100644
index 0000000000..2a63a5cbf2
--- /dev/null
+++ b/include/hw/riscv/iommu.h
@@ -0,0 +1,40 @@
+/*
+ * QEMU emulation of an RISC-V IOMMU (Ziommu)
+ *
+ * Copyright (C) 2022-2023 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RISCV_IOMMU_H
+#define HW_RISCV_IOMMU_H
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+
+#define TYPE_RISCV_IOMMU "x-riscv-iommu"
+OBJECT_DECLARE_SIMPLE_TYPE(RISCVIOMMUState, RISCV_IOMMU)
+typedef struct RISCVIOMMUState RISCVIOMMUState;
+
+#define TYPE_RISCV_IOMMU_MEMORY_REGION "x-riscv-iommu-mr"
+typedef struct RISCVIOMMUSpace RISCVIOMMUSpace;
+
+#define TYPE_RISCV_IOMMU_PCI "x-riscv-iommu-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(RISCVIOMMUStatePci, RISCV_IOMMU_PCI)
+typedef struct RISCVIOMMUStatePci RISCVIOMMUStatePci;
+
+#define TYPE_RISCV_IOMMU_SYS "x-riscv-iommu-device"
+OBJECT_DECLARE_SIMPLE_TYPE(RISCVIOMMUStateSys, RISCV_IOMMU_SYS)
+typedef struct RISCVIOMMUStateSys RISCVIOMMUStateSys;
+
+#endif
diff --git a/meson.build b/meson.build
index 5fcdb37a71..693ea3447d 100644
--- a/meson.build
+++ b/meson.build
@@ -3268,6 +3268,7 @@ if have_system
     'hw/rdma',
     'hw/rdma/vmw',
     'hw/rtc',
+    'hw/riscv',
     'hw/s390x',
     'hw/scsi',
     'hw/sd',
-- 
2.34.1


