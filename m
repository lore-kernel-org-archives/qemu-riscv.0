Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3172C77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 13:19:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q3zFf-000218-CR; Tue, 30 May 2023 09:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFY-0001yf-HQ
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:18:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFU-0006qC-QQ
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:18:56 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5147dce372eso6540851a12.0
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1685452730; x=1688044730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HftqDWGmJlifsZRB0n8+hRGxCixGvedpfat79sGni7o=;
 b=ArwZpZWyvXuOsqS4dM9iluu1IzAEua6DkCGhdFuzk+qnWsIkRUB2i8T1EwtF/T/s87
 JCugeo/SAcMhjtoLvGF20ReWVoKmBJbnau1UhkkBqbemSk1ItPnweKdzEdBjP58uiccp
 K99CvG4vn0u4PWpkInu5DD4zTbSXJ0d0bWoCH+QgKgzm9VSelof2JDGqU9Hihe3jUfD6
 kF4tYjJfqmMmwuolRSpqb3cbu4bMWgKhIOzIh8qahLPuLYxsZbbGNPCJBScmsVKmDSWy
 LxYm7HiA1yZIUjTWhcQsoa3K+utBmgY6H0LJ1Iybs67QhLGSHnvu4/EbF4VYHLBEXMqC
 nb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685452730; x=1688044730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HftqDWGmJlifsZRB0n8+hRGxCixGvedpfat79sGni7o=;
 b=U7Gml2ZOybgoay/EWR/IRjYAAl3YBj5MgLnxUVXlG9psuob8HbNfSwmHYNVlkYEcm6
 CwYXVWK265BSvCwPtKbR2HexMSQF54exEozX6XE0RGI7d2y2PqMmbDhNZely/xE5UGL/
 EryWEzvl25Y/BS7o4mYw4hzXz/nu7cqzQzguYui9LlGB1orOYlcBm0KbrjVZv25ltvuo
 dqCytcFipG0MpAQOSFm3y6BlyX5DpovY6GR3Ftk9mw06UKGTrM9m/c7Y6bWiiiFG2L9K
 iFbO/pzBq9wYhgnmQiesgBa3M9w4MeymhRJEsO+3/kxX+9vD45j+sJd6KUq2ZImcDbZy
 Eosg==
X-Gm-Message-State: AC+VfDyNGHK1yVEdViS7kqzPGAQIFX0+8LRN+ZqRVNSI2jZqz7qunrHy
 RmtIh44SmhQbnXaM8aC6M1qZY9azRMSzEo3Z1Tc=
X-Google-Smtp-Source: ACHHUZ5/4z60gZL/5itfSYD/8yylHcCvv2cmB6IDL3d3Sbyw5RjRi4mHMwVa+7UzmTCz97E/OOneIw==
X-Received: by 2002:a17:906:fd82:b0:96a:6f35:d1a5 with SMTP id
 xa2-20020a170906fd8200b0096a6f35d1a5mr2305484ejb.67.1685452729797; 
 Tue, 30 May 2023 06:18:49 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm7376156ejc.66.2023.05.30.06.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:18:49 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/9] target/riscv: Factor out RISCVCPUConfig from cpu.h
Date: Tue, 30 May 2023 15:18:36 +0200
Message-Id: <20230530131843.1186637-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

The file target/riscv/cpu.h cannot be included by files outside
of target/riscv/. To share data with other parts of QEMU (e.g.
the disassembler) we need to factor out the relevant code.
Therefore, this patch moves the definition of RISCVCPUConfig
(and tightly coupled dependencies and functions) into its
own target/riscv/cpu-config.h file.
The goal is to be able to share the enablement-status of
the RISC-V ISA extensions (RISCVCPUConfig::ext_*) with
other parts of QEMU.

This patch does not introduce new functionality.
However, the patch includes a small change:
The parameter for the extension test functions has been changed
from 'DisasContext*' to 'const RISCVCPUConfig*'.
This allows to keep these functions in cpu-config.h.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu-config.h | 148 ++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h        | 114 +----------------------------
 target/riscv/translate.c  |  27 +------
 3 files changed, 151 insertions(+), 138 deletions(-)
 create mode 100644 target/riscv/cpu-config.h

diff --git a/target/riscv/cpu-config.h b/target/riscv/cpu-config.h
new file mode 100644
index 0000000000..ca368af0b2
--- /dev/null
+++ b/target/riscv/cpu-config.h
@@ -0,0 +1,148 @@
+/*
+ * QEMU RISC-V CPU Config
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef RISCV_CPU_CONFIG_H
+#define RISCV_CPU_CONFIG_H
+
+/*
+ * map is a 16-bit bitmap: the most significant set bit in map is the maximum
+ * satp mode that is supported. It may be chosen by the user and must respect
+ * what qemu implements (valid_1_10_32/64) and what the hw is capable of
+ * (supported bitmap below).
+ *
+ * init is a 16-bit bitmap used to make sure the user selected a correct
+ * configuration as per the specification.
+ *
+ * supported is a 16-bit bitmap used to reflect the hw capabilities.
+ */
+typedef struct {
+    uint16_t map, init, supported;
+} RISCVSATPMap;
+
+struct RISCVCPUConfig {
+    bool ext_zba;
+    bool ext_zbb;
+    bool ext_zbc;
+    bool ext_zbkb;
+    bool ext_zbkc;
+    bool ext_zbkx;
+    bool ext_zbs;
+    bool ext_zca;
+    bool ext_zcb;
+    bool ext_zcd;
+    bool ext_zce;
+    bool ext_zcf;
+    bool ext_zcmp;
+    bool ext_zcmt;
+    bool ext_zk;
+    bool ext_zkn;
+    bool ext_zknd;
+    bool ext_zkne;
+    bool ext_zknh;
+    bool ext_zkr;
+    bool ext_zks;
+    bool ext_zksed;
+    bool ext_zksh;
+    bool ext_zkt;
+    bool ext_ifencei;
+    bool ext_icsr;
+    bool ext_icbom;
+    bool ext_icboz;
+    bool ext_zicond;
+    bool ext_zihintpause;
+    bool ext_smstateen;
+    bool ext_sstc;
+    bool ext_svadu;
+    bool ext_svinval;
+    bool ext_svnapot;
+    bool ext_svpbmt;
+    bool ext_zdinx;
+    bool ext_zawrs;
+    bool ext_zfh;
+    bool ext_zfhmin;
+    bool ext_zfinx;
+    bool ext_zhinx;
+    bool ext_zhinxmin;
+    bool ext_zve32f;
+    bool ext_zve64f;
+    bool ext_zve64d;
+    bool ext_zmmul;
+    bool ext_zvfh;
+    bool ext_zvfhmin;
+    bool ext_smaia;
+    bool ext_ssaia;
+    bool ext_sscofpmf;
+    bool rvv_ta_all_1s;
+    bool rvv_ma_all_1s;
+
+    uint32_t mvendorid;
+    uint64_t marchid;
+    uint64_t mimpid;
+
+    /* Vendor-specific custom extensions */
+    bool ext_xtheadba;
+    bool ext_xtheadbb;
+    bool ext_xtheadbs;
+    bool ext_xtheadcmo;
+    bool ext_xtheadcondmov;
+    bool ext_xtheadfmemidx;
+    bool ext_xtheadfmv;
+    bool ext_xtheadmac;
+    bool ext_xtheadmemidx;
+    bool ext_xtheadmempair;
+    bool ext_xtheadsync;
+    bool ext_XVentanaCondOps;
+
+    uint8_t pmu_num;
+    char *priv_spec;
+    char *user_spec;
+    char *bext_spec;
+    char *vext_spec;
+    uint16_t vlen;
+    uint16_t elen;
+    uint16_t cbom_blocksize;
+    uint16_t cboz_blocksize;
+    bool mmu;
+    bool pmp;
+    bool epmp;
+    bool debug;
+    bool misa_w;
+
+    bool short_isa_string;
+
+#ifndef CONFIG_USER_ONLY
+    RISCVSATPMap satp_mode;
+#endif
+};
+
+typedef struct RISCVCPUConfig RISCVCPUConfig;
+
+/* Helper functions to test for extensions.  */
+
+static inline bool always_true_p(const RISCVCPUConfig *cfg __attribute__((__unused__)))
+{
+    return true;
+}
+
+static inline bool has_xthead_p(const RISCVCPUConfig *cfg)
+{
+    return cfg->ext_xtheadba || cfg->ext_xtheadbb ||
+           cfg->ext_xtheadbs || cfg->ext_xtheadcmo ||
+           cfg->ext_xtheadcondmov ||
+           cfg->ext_xtheadfmemidx || cfg->ext_xtheadfmv ||
+           cfg->ext_xtheadmac || cfg->ext_xtheadmemidx ||
+           cfg->ext_xtheadmempair || cfg->ext_xtheadsync;
+}
+
+#define MATERIALISE_EXT_PREDICATE(ext) \
+    static inline bool has_ ## ext ## _p(const RISCVCPUConfig *cfg) \
+    { \
+        return cfg->ext_ ## ext ; \
+    }
+
+MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
+
+#endif /* RISCV_CPU_CONFIG_H */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de7e43126a..895a307bad 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -28,6 +28,7 @@
 #include "qemu/int128.h"
 #include "cpu_bits.h"
 #include "qapi/qapi-types-common.h"
+#include "cpu-config.h"
 #include "cpu-qom.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
@@ -368,119 +369,6 @@ struct CPUArchState {
     uint64_t kvm_timer_frequency;
 };
 
-/*
- * map is a 16-bit bitmap: the most significant set bit in map is the maximum
- * satp mode that is supported. It may be chosen by the user and must respect
- * what qemu implements (valid_1_10_32/64) and what the hw is capable of
- * (supported bitmap below).
- *
- * init is a 16-bit bitmap used to make sure the user selected a correct
- * configuration as per the specification.
- *
- * supported is a 16-bit bitmap used to reflect the hw capabilities.
- */
-typedef struct {
-    uint16_t map, init, supported;
-} RISCVSATPMap;
-
-struct RISCVCPUConfig {
-    bool ext_zba;
-    bool ext_zbb;
-    bool ext_zbc;
-    bool ext_zbkb;
-    bool ext_zbkc;
-    bool ext_zbkx;
-    bool ext_zbs;
-    bool ext_zca;
-    bool ext_zcb;
-    bool ext_zcd;
-    bool ext_zce;
-    bool ext_zcf;
-    bool ext_zcmp;
-    bool ext_zcmt;
-    bool ext_zk;
-    bool ext_zkn;
-    bool ext_zknd;
-    bool ext_zkne;
-    bool ext_zknh;
-    bool ext_zkr;
-    bool ext_zks;
-    bool ext_zksed;
-    bool ext_zksh;
-    bool ext_zkt;
-    bool ext_ifencei;
-    bool ext_icsr;
-    bool ext_icbom;
-    bool ext_icboz;
-    bool ext_zicond;
-    bool ext_zihintpause;
-    bool ext_smstateen;
-    bool ext_sstc;
-    bool ext_svadu;
-    bool ext_svinval;
-    bool ext_svnapot;
-    bool ext_svpbmt;
-    bool ext_zdinx;
-    bool ext_zawrs;
-    bool ext_zfh;
-    bool ext_zfhmin;
-    bool ext_zfinx;
-    bool ext_zhinx;
-    bool ext_zhinxmin;
-    bool ext_zve32f;
-    bool ext_zve64f;
-    bool ext_zve64d;
-    bool ext_zmmul;
-    bool ext_zvfh;
-    bool ext_zvfhmin;
-    bool ext_smaia;
-    bool ext_ssaia;
-    bool ext_sscofpmf;
-    bool rvv_ta_all_1s;
-    bool rvv_ma_all_1s;
-
-    uint32_t mvendorid;
-    uint64_t marchid;
-    uint64_t mimpid;
-
-    /* Vendor-specific custom extensions */
-    bool ext_xtheadba;
-    bool ext_xtheadbb;
-    bool ext_xtheadbs;
-    bool ext_xtheadcmo;
-    bool ext_xtheadcondmov;
-    bool ext_xtheadfmemidx;
-    bool ext_xtheadfmv;
-    bool ext_xtheadmac;
-    bool ext_xtheadmemidx;
-    bool ext_xtheadmempair;
-    bool ext_xtheadsync;
-    bool ext_XVentanaCondOps;
-
-    uint8_t pmu_num;
-    char *priv_spec;
-    char *user_spec;
-    char *bext_spec;
-    char *vext_spec;
-    uint16_t vlen;
-    uint16_t elen;
-    uint16_t cbom_blocksize;
-    uint16_t cboz_blocksize;
-    bool mmu;
-    bool pmp;
-    bool epmp;
-    bool debug;
-    bool misa_w;
-
-    bool short_isa_string;
-
-#ifndef CONFIG_USER_ONLY
-    RISCVSATPMap satp_mode;
-#endif
-};
-
-typedef struct RISCVCPUConfig RISCVCPUConfig;
-
 /*
  * RISCVCPU:
  * @env: #CPURISCVState
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 928da0d3f0..2697cc26d0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -119,29 +119,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa_ext & ext;
 }
 
-static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
-{
-    return true;
-}
-
-static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
-{
-    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
-           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadcondmov ||
-           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadfmv ||
-           ctx->cfg_ptr->ext_xtheadmac || ctx->cfg_ptr->ext_xtheadmemidx ||
-           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsync;
-}
-
-#define MATERIALISE_EXT_PREDICATE(ext)  \
-    static bool has_ ## ext ## _p(DisasContext *ctx)    \
-    { \
-        return ctx->cfg_ptr->ext_ ## ext ; \
-    }
-
-MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
-
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
@@ -1106,7 +1083,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
      * that are tested in-order until a decoder matches onto the opcode.
      */
     static const struct {
-        bool (*guard_func)(DisasContext *);
+        bool (*guard_func)(const RISCVCPUConfig *);
         bool (*decode_func)(DisasContext *, uint32_t);
     } decoders[] = {
         { always_true_p,  decode_insn32 },
@@ -1135,7 +1112,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
 
         for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
-            if (decoders[i].guard_func(ctx) &&
+            if (decoders[i].guard_func(ctx->cfg_ptr) &&
                 decoders[i].decode_func(ctx, opcode32)) {
                 return;
             }
-- 
2.40.1


