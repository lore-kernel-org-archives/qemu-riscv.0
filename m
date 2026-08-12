Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278B5C5B56A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 17:46:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuD0d-00030J-OR; Wed, 12 Aug 2026 13:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuD0P-0002sS-Uc
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 13:44:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuD0M-0007fh-ES
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 13:44:44 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-39266382df6so1186042a91.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786556681; x=1787161481; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aO5xxvr129FUZ2xUaJTsH6Cn2QzOV43OYa6AnAgzYN0=;
 b=YlHAptdb3IubY6tAmlStzfUMgYeup65ZIbyA0aGLdx9NfD2tFWQ9ZtV3xkIybAKY0N
 lkQE2cEXNPzNUw94UJy95khfkoZhzAokfvwJDykPUqgGcGSb+2zYSavf1XU/3wLTvgzF
 wdPA9R7DSL/eoS1kq365ftFvz2CRo7E1JCUtEln4/SMdBbEwX6Kt4UOilPqcRot0RFyq
 KC1zRGRb0MIK4/jXgv/B6HzQhH0RLgiQ95i2kzt3b+m+suPpvfa1cAJ6nQIbIkxdb+cm
 LP1iCFaZgfu89ZJLtLnsUuPldCxEX6wClv18jtEIdSxnaISVF3P0ogMzjZZHG9jZijZc
 jNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786556681; x=1787161481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aO5xxvr129FUZ2xUaJTsH6Cn2QzOV43OYa6AnAgzYN0=;
 b=odmUUpx00bWLSdG+K3qbCehYI3tbb8wFNKESqavWO0IM0SIvxmU7yQmOEDCTBAu2Mu
 X3/4GcmSGJlcveKatP4jMzQXG0qE+rVFzgraRiaH/TO1u3fHBpk878LZn52Yh2gdZTG9
 YvzhggdvWztB+ua4sC2rCjCatG3fEpeBG5fguXrZ8z8SdWf331BkW5ZuGdsWzDdPalkc
 n/KjWC3bMwY1zaGfM8iJLFcJ4ojmF3RQVl44zaO/MVWlyUGjXfxf6WZxrhAgAlZYHx1C
 QJJoP92+XQ6Lbq1BJEwCXrUaESrXiUaUoAEqNzHMra0AhrPKNBs+9DO4ddq5EbtJ39Pj
 cfuA==
X-Forwarded-Encrypted: i=1;
 AHgh+RppfIMeW+jQYj/EALh6QybLugcFMvbloMSW2shym9nyQJ3UrgtxwPSesfuPPN5GVpWb7gCJ3nmbOGIW@nongnu.org
X-Gm-Message-State: AOJu0YwQNqiSwG3iKs3fKDqMk+t62RpJmmjlTPjThIQy+Jy6+FkdCEtT
 8RkUoQkgTOrNg/SM9dBYmAAa5BBbHrxxU3bP2rtKQzKU3iG8ULfjq+CyhOoX/1thKfA=
X-Gm-Gg: AR+sD11a9NoSDkX0cjU6N5EggZnB/PTFyZIPEMIdRiNEPj1/9SVn0fmcB3AHt8g6MqL
 3seB3HNuEJLODf92uM5iLfIaAEZLzslhZvqaBlF3AGnpkgHNc5NrojL/Fk3KCB4nMbOjVuxmRCl
 odHsEBtq1BhUHIAnVuzo7WbhtvAFdI2lZXogJIz/KzplFzUdC9aZNp+wZJ7nbiic3x5ONWEFnnP
 RFxefg0Ktz6ZsGXK9A4sg8r+yS9a2RU38Md4Thd8cA3RTC0av17R6z8GzwGaS9yw8B2/HpTEfqY
 W2GGgEw1ZAyV4f/AoBcakX3Xm2hHNeZWlV4uKudzPkADoP2GFcNkMwIrb6wTJM3hpWcZFzaH9OI
 3iuf65j40bJDWclLM5ZKHGS5nXghYb63NIX+MFtc2kulraftu5P5bE+kpGTzStvtNhy4wAdRgz9
 ZtgUj3JbIGJaAXAUcdyQGmhzfNpTNcVZbBAPdbBKbeoBfqRgGd1yWMdqJ/DSnrFKLhp8+6l1XlG
 pej8I1bBqyMlvk8e9hBYbzxoyExKvLGdw/qwqnKYBx02VvG+TUxsQCWSdgpABwl62Fos3H/3Ak=
X-Received: by 2002:a17:90a:d647:b0:37f:e326:6557 with SMTP id
 98e67ed59e1d1-393013d66dcmr8458642a91.4.1786556681120; 
 Wed, 12 Aug 2026 10:44:41 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931db13c3bsm13210a91.3.2026.08.12.10.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 10:44:40 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH v2 5/6] disas/riscv: Add disassembler support for
 Xsfvqmaccdod/Xsfvqmaccqoq
Date: Thu, 13 Aug 2026 01:44:15 +0800
Message-ID: <20260812174417.2468981-6-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812174417.2468981-1-max.chou@sifive.com>
References: <20260812174417.2468981-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Jason Chien <jason.chien@sifive.com>

Add disassembler support for all SiFive custom int8 matrix-multiply
instructions: sf.vqmacc{u,,us,su}.4x8x4 and sf.vqmacc{u,,us,su}.2x8x2.

These instructions share opcode 0b1011011 and funct3 0b010, and are
distinguished by funct6: 60-63 for the 4x8x4 (Xsfvqmaccqoq) tile and
44-47 for the 2x8x2 (Xsfvqmaccdod) tile.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 MAINTAINERS       |  1 +
 disas/meson.build |  3 +-
 disas/riscv-xsf.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++
 disas/riscv-xsf.h | 18 +++++++++++
 disas/riscv.c     |  2 ++
 disas/riscv.h     |  1 +
 6 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 disas/riscv-xsf.c
 create mode 100644 disas/riscv-xsf.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c9f9bd645a..02ca1682099 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -398,6 +398,7 @@ S: Supported
 F: target/riscv/xsf.decode
 F: target/riscv/tcg/insn_trans/trans_xsf.c.inc
 F: target/riscv/tcg/xsf_helper.c
+F: disas/riscv-xsf*
 
 RENESAS RX CPUs
 R: Yoshinori Sato <yoshinori.sato@nifty.com>
diff --git a/disas/meson.build b/disas/meson.build
index 42977a1f74d..91357162682 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -8,7 +8,8 @@ common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files(
     'riscv.c',
     'riscv-xthead.c',
     'riscv-xventana.c',
-    'riscv-xlrbr.c'
+    'riscv-xlrbr.c',
+    'riscv-xsf.c'
 ))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
diff --git a/disas/riscv-xsf.c b/disas/riscv-xsf.c
new file mode 100644
index 00000000000..8f752657a7c
--- /dev/null
+++ b/disas/riscv-xsf.c
@@ -0,0 +1,79 @@
+/*
+ * QEMU RISC-V Disassembler for xsf (SiFive vendor extensions).
+ *
+ * Copyright (c) 2023 SiFive, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "disas/riscv.h"
+#include "disas/riscv-xsf.h"
+
+typedef enum {
+    /* 0 is reserved for rv_op_illegal. */
+    xsf_op_sf_vqmaccu_4x8x4 = 1,
+    xsf_op_sf_vqmacc_4x8x4 = 2,
+    xsf_op_sf_vqmaccus_4x8x4 = 3,
+    xsf_op_sf_vqmaccsu_4x8x4 = 4,
+    xsf_op_sf_vqmaccu_2x8x2 = 5,
+    xsf_op_sf_vqmacc_2x8x2 = 6,
+    xsf_op_sf_vqmaccus_2x8x2 = 7,
+    xsf_op_sf_vqmaccsu_2x8x2 = 8,
+} rv_xsf_op;
+
+const rv_opcode_data xsf_opcode_data[] = {
+    { "illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
+    { "sf.vqmaccu.4x8x4", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
+    { "sf.vqmacc.4x8x4", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
+    { "sf.vqmaccus.4x8x4", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
+    { "sf.vqmaccsu.4x8x4", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
+    { "sf.vqmaccu.2x8x2", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
+    { "sf.vqmacc.2x8x2", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
+    { "sf.vqmaccus.2x8x2", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
+    { "sf.vqmaccsu.2x8x2", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
+};
+
+void decode_xsf(rv_decode *dec, rv_isa isa)
+{
+    rv_inst inst = dec->inst;
+    rv_opcode op = rv_op_illegal;
+
+    switch ((inst >> 0) & 0b1111111) {
+    case 0b1011011:
+        switch ((inst >> 12) & 0b111) {
+        case 0b010:
+            switch ((inst >> 26) & 0b111111) {
+            case 60:
+                op = xsf_op_sf_vqmaccu_4x8x4;
+                break;
+            case 61:
+                op = xsf_op_sf_vqmacc_4x8x4;
+                break;
+            case 62:
+                op = xsf_op_sf_vqmaccus_4x8x4;
+                break;
+            case 63:
+                op = xsf_op_sf_vqmaccsu_4x8x4;
+                break;
+            case 44:
+                op = xsf_op_sf_vqmaccu_2x8x2;
+                break;
+            case 45:
+                op = xsf_op_sf_vqmacc_2x8x2;
+                break;
+            case 46:
+                op = xsf_op_sf_vqmaccus_2x8x2;
+                break;
+            case 47:
+                op = xsf_op_sf_vqmaccsu_2x8x2;
+                break;
+            }
+            break;
+        }
+        break;
+    }
+
+    dec->op = op;
+}
diff --git a/disas/riscv-xsf.h b/disas/riscv-xsf.h
new file mode 100644
index 00000000000..b8462c356e2
--- /dev/null
+++ b/disas/riscv-xsf.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU disassembler -- RISC-V specific header (xsf*).
+ *
+ * Copyright (c) 2023 SiFive, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef DISAS_RISCV_XSF_H
+#define DISAS_RISCV_XSF_H
+
+#include "disas/riscv.h"
+
+extern const rv_opcode_data xsf_opcode_data[];
+
+void decode_xsf(rv_decode *, rv_isa);
+
+#endif /* DISAS_RISCV_XSF_H */
diff --git a/disas/riscv.c b/disas/riscv.c
index 7f1b2627737..032cd31e35c 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -27,6 +27,7 @@
 #include "disas/riscv-xthead.h"
 #include "disas/riscv-xventana.h"
 #include "disas/riscv-xlrbr.h"
+#include "disas/riscv-xsf.h"
 
 typedef enum {
     /* 0 is reserved for rv_op_illegal. */
@@ -5454,6 +5455,7 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
         { has_xtheadsync_p, xthead_opcode_data, decode_xtheadsync },
         { has_XVentanaCondOps_p, ventana_opcode_data, decode_xventanacondops },
         { has_xlrbr_p, rv_xlrbr_opcode_data, decode_xlrbr },
+        { has_xsf_p, xsf_opcode_data, decode_xsf },
     };
 
     for (size_t i = 0; i < ARRAY_SIZE(decoders); i++) {
diff --git a/disas/riscv.h b/disas/riscv.h
index 379e642ec84..66683201b9d 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -280,6 +280,7 @@ enum {
 #define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
 #define rv_fmt_vd_vs2_uimm            "O\tD,F,u"
 #define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
+#define rv_fmt_vd_vs1_vs2             "O\tD,E,F"
 #define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
 #define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
 #define rv_fmt_vd_fs1_vs2_vm          "O\tD,4,Fm"
-- 
2.43.0


