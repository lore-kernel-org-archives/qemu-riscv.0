Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0626CA5FA3
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 20:14:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAvG2-0008Jd-PS; Sun, 27 Sep 2026 16:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvG0-0008JH-P0
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:13:56 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvFz-0003YF-4u
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:13:56 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 d9443c01a7336-2d90ba1d807so18857365ad.3
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 13:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790540033; x=1791144833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O+o0QDQs82pEiMq4tWdLNS83nyp2jAr6qiX3oWOkdxY=;
 b=se43B9EDe3arP/sn+QmFP0Yc2y2cAmf2wQXTmA/uXDm+uXhuKEcSDHTgTSKOmdAHKh
 r/Z6SzDH4I4RG453DOxq3xFNhN8Sfx95bdNZ2Mryk/vQ5s1kI52l5x/rOg06FJNV7Z1p
 TXlYpJoGbFgD1mzwAAn4ExcM/yUvloc1ElyQ16yGcxy06l4SG5wcXgOiNnmnyS0cs14d
 vcYbmmWIGWJxeRPzOsNShQTrem3/w2XU1T7IZLzAtWsGiNZQT+u0Ip91uXoOR5svYh4K
 SKdfT2TkTcq5TuB6wPXAP3O4yN6rAiPaNiYrRxpjzCxxsPGr9AEQnZTbLwQpY6/WGHKY
 2Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790540033; x=1791144833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O+o0QDQs82pEiMq4tWdLNS83nyp2jAr6qiX3oWOkdxY=;
 b=sL2VfCu/29urpRTTchlLOdrOI4rWocVDbnKqM9IK/hZDnoaewAXLoCACmFryIYvyAK
 QCM8lZICk7WxnKdHsRjSIHDrfRP+Kz3C9+Dpjxx8/naVd6ESrrO/CJbhNca6fWq67KB8
 5t1xUNUV/aSNIusfukm9qir9Vr+OxXH9zLJ7Lb/3MeYunJuWDwrWfSF2mh9zz/LZqnRT
 M4b1TdO4n8d1Co+aHRdjK8h0V2f3VQeGh5IjJAytQ5IDk8/CiPeUfc4XFFJbVM6aXFjN
 bp79Gyu9uYRa7+hdvcvITB/GT8lvrEbe46zPDlm1NKnOV1x6cuBNJszUstfnQ8bOykAN
 q6Lw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwthYMUxyaxvQ/Pjo6LNjVArA/MHLYizWKP2SN6xKZc0jVuve2jj9DgIyrVMVedjE/FcQiaoabce99W@nongnu.org
X-Gm-Message-State: AFq9FYKnTkUCN86SFH7N/dirdByqc5QnGYGid4l16T1uhydXABqPuIS+
 T3LW/IKRtp4BuVcBasBMLwGQmmXx5tuXsJx60u//SSsTcy6d6IBWTScd
X-Gm-Gg: AYBFou0gIYL9Bp85qyFiDDKN6+H903ScZdV3Ks24Z5vjOlDh+V6HKN7Z6rUVCvLAcXx
 KaT3i+o0ans//GIBofmgOqi1KiDEqQXvsxEiGKXdF20Jtj9kPZWHoCDYw5//fnp3/rBc5+O20FQ
 Koo85dzNArC/JScqePFFU9N8njvAeaNJT6wbypYRMPZHyrlBYCmbj+GfdZgDu2suKT1LfQsS0sC
 AYh8m6yx1p8MoMttZG2A7a1w9ZbIzIjVc6jxMHAQyf9Pwicxa164k7nkMjJYIU6zVCianfF2WWP
 fsmmZ77sgeeGZhHdb8QztIY2kobK2VkqUFR9ndtuNP7npj6RO8XcrHgxkMbK77AEKopuTg+JxsL
 FugCtbL3tHjrkWM6EaDEpO9t6tsYlCr/PJdDsGDDd5aiRZK9ZaDnQ37KtBXUnK/+BoqIwxCvjKw
 GPhV6zNdmGMtWynLprw9b+24ajwZOaeAhLSWD64d5IJLlrA8H1VRQlg3I+fSVVs8zNgL8+/3RAh
 3b96EQmnY2f+j+rfGDZUf4+MlN+YVs/QXLehF6OfWna+YcPt6W+nNX4WVlK1BvywvJotpke9w==
X-Received: by 2002:a17:90b:4a45:b0:39e:6c68:c77c with SMTP id
 98e67ed59e1d1-3a098e07a64mr9844412a91.50.1790540033490; 
 Sun, 27 Sep 2026 13:13:53 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (33.223.194.35.bc.googleusercontent.com. [35.194.223.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0c719f86fsm13932737a91.7.2026.09.27.13.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 13:13:53 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 portias@oss.tenstorrent.com, wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw,
 marscheng@google.com, eleanor15x@gmail.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v5 2/7] hw/misc: Add Sophgo CV1800B clock controller
Date: Sun, 27 Sep 2026 20:13:21 +0000
Message-ID: <20260927201326.650943-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260927201326.650943-1-visitorckw@gmail.com>
References: <20260927201326.650943-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=visitorckw@gmail.com; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add a stub for the CV1800B clock controller. This is specifically
required for the SDHCI controller to function correctly under Linux.

The Linux 'sophgo,cv1800-clk' driver probes this device to determine
the clock tree configuration. This implementation sets the bypass
registers (CLK_BYP_0 and CLK_BYP_1) to 0xFFFFFFFF during reset,
matching the POR default state. This bypasses the PLLs and allows the
SDHCI and other peripherals to operate using the 25MHz reference clock.

Without this device, the SD card driver fails to initialize, preventing
the system from mounting the root filesystem from the SD card.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 hw/misc/Kconfig               |  3 ++
 hw/misc/cv1800b_clk.c         | 98 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build           |  1 +
 include/hw/misc/cv1800b_clk.h | 26 ++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 hw/misc/cv1800b_clk.c
 create mode 100644 include/hw/misc/cv1800b_clk.h

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 46e3c03cc8..7abd22869a 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -263,4 +263,7 @@ config AXIADO_CLK
 config K230_DECOMP_GZIP
     bool
 
+config SOPHGO_CV1800B_CLK
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/cv1800b_clk.c b/hw/misc/cv1800b_clk.c
new file mode 100644
index 0000000000..38807995ac
--- /dev/null
+++ b/hw/misc/cv1800b_clk.c
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Sophgo CV1800B Clock Controller
+ *
+ * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/misc/cv1800b_clk.h"
+
+#define REG_BYTE_WIDTH    (sizeof(uint32_t))
+#define REG_CLK_BYP_0     (0x030 / REG_BYTE_WIDTH)
+#define REG_CLK_BYP_1     (0x034 / REG_BYTE_WIDTH)
+
+static uint64_t cv1800b_clk_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    CV1800BClkState *s = opaque;
+    uint32_t val = 0;
+
+    if (addr < CV1800B_CLK_IOSIZE) {
+        val = s->regs[addr / REG_BYTE_WIDTH];
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+    }
+
+    return val;
+}
+
+static void cv1800b_clk_write(void *opaque, hwaddr addr, uint64_t val, unsigned int size)
+{
+    CV1800BClkState *s = opaque;
+
+    if (addr < CV1800B_CLK_IOSIZE) {
+        s->regs[addr / REG_BYTE_WIDTH] = val;
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+    }
+}
+
+static const MemoryRegionOps cv1800b_clk_ops = {
+    .read = cv1800b_clk_read,
+    .write = cv1800b_clk_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void cv1800b_clk_reset_hold(Object *obj, ResetType type)
+{
+    CV1800BClkState *s = CV1800B_CLK(obj);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    /*
+     * TODO: Implement proper PLL state machines.
+     * For now, use POR default to bypass PLLs and boot via 25MHz XTAL.
+     */
+    s->regs[REG_CLK_BYP_0] = 0xFFFFFFFF;
+    s->regs[REG_CLK_BYP_1] = 0xFFFFFFFF;
+}
+
+static void cv1800b_clk_init(Object *obj)
+{
+    CV1800BClkState *s = CV1800B_CLK(obj);
+
+    memory_region_init_io(&s->iomem, obj, &cv1800b_clk_ops, s,
+                            TYPE_CV1800B_CLK, CV1800B_CLK_IOSIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+}
+
+static void cv1800b_clk_class_init(ObjectClass *klass, const void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    rc->phases.hold = cv1800b_clk_reset_hold;
+}
+
+static const TypeInfo cv1800b_clk_info = {
+    .name = TYPE_CV1800B_CLK,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(CV1800BClkState),
+    .instance_init = cv1800b_clk_init,
+    .class_init = cv1800b_clk_class_init,
+};
+
+static void cv1800b_clk_register_types(void)
+{
+    type_register_static(&cv1800b_clk_info);
+}
+
+type_init(cv1800b_clk_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 9790afa104..244bf278a9 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -39,6 +39,7 @@ system_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true: files('sifive_e_aon.c'))
 system_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
 system_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
 system_ss.add(when: 'CONFIG_K230_DECOMP_GZIP', if_true: files('k230_decomp_gzip.c'))
+system_ss.add(when: 'CONFIG_SOPHGO_CV1800B_CLK', if_true: files('cv1800b_clk.c'))
 
 subdir('macio')
 
diff --git a/include/hw/misc/cv1800b_clk.h b/include/hw/misc/cv1800b_clk.h
new file mode 100644
index 0000000000..4d03d887c6
--- /dev/null
+++ b/include/hw/misc/cv1800b_clk.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Sophgo CV1800B Clock Controller
+ *
+ * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#ifndef HW_MISC_CV1800B_CLK_H
+#define HW_MISC_CV1800B_CLK_H
+
+#include "hw/core/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_CV1800B_CLK "cv1800b-clk"
+OBJECT_DECLARE_SIMPLE_TYPE(CV1800BClkState, CV1800B_CLK)
+
+#define CV1800B_CLK_IOSIZE 0x1000
+
+struct CV1800BClkState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    uint32_t regs[CV1800B_CLK_IOSIZE / sizeof(uint32_t)];
+};
+
+#endif
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


