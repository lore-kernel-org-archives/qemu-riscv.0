Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6fFE-0003xs-O5
	for mharc-qemu-riscv@gnu.org; Sun, 09 Jan 2022 15:56:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6fFD-0003xc-B0
 for qemu-riscv@nongnu.org; Sun, 09 Jan 2022 15:56:51 -0500
Received: from [2a00:1450:4864:20::129] (port=33775
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6fFB-0004Hm-Ax
 for qemu-riscv@nongnu.org; Sun, 09 Jan 2022 15:56:51 -0500
Received: by mail-lf1-x129.google.com with SMTP id k21so37537872lfu.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Jan 2022 12:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKYOV+WL6MFnoooJZU7w0Veu39yli1EJRH1e0wNaMYs=;
 b=FXVZ8lXaVWi3MEcftOkANeeqdLU+HaU48LlCgxuQDzib8FNaOpn9Y6IXSqG/tWjess
 KDWbG+aZm037UCN9acZU+jzt1KkPWNcgdGSY48d+knXEJHJiuPOlFcXhFYzKMuPNxOIi
 sx2y1gYl7F1m+kRCpCpU3M3t8xgEe6v22y1hzOCmBlbhHvxuGC78SJPA2jM/zJV6rLTa
 FDq03FnofeaAY1bNzKZgv2PKjzQdGSnV7phwbFX0MBJNKZVu8hMeF7derisxZlFQBjSg
 J3eMsQbklKrTXqcRdSNjufqlhZMx65SWIADaPMjV97OtaSDuMxxmIl8LU3G11AKCdShM
 rqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKYOV+WL6MFnoooJZU7w0Veu39yli1EJRH1e0wNaMYs=;
 b=pUbMGGqvsaLvCp7XcFAevjWV6jC0vPKnT8ePk3FrPOB5SKchDoxtU167eEPujFjfaa
 HvY8MwR7hh0w+6SKF7XEmb7AE9bkFZYBlb2cmWBfX0OnptwrtX/Qs+gLnNzrHfmj+ruW
 LZdDEsYpHnUrEmrGuwwu3NVRznzVB6G604FdeDQTqGzgj3VOc//8hpCw0RG1R8tQrqUg
 GAGLwB7Q4otMTAYriBjJ2o8as+CkdcZ7klerkk7fq6a/NHHUz0MQT+DM4/sIaxGZVFGg
 nQrLHFgyjRrfuBgMRg3OGAlUnniTkIepar5bDioWa+3Li7caWauZe0ipcfPocXdWA1mW
 S6jQ==
X-Gm-Message-State: AOAM533OZ+0G4L0EnnEawKJm/XFn7ZQ0cUro/ysyuPkmj/lYx003bcpA
 Hm+CjIDl5BsEaNPo8g3CGBMPRK/oEjsaYLhk
X-Google-Smtp-Source: ABdhPJyHhaLauwcOY0MQxmB8fZOo3J0nh1GL8atbvN3Hxst6yT9iBxLCBuwMTWlTUwH5H72fdT21AQ==
X-Received: by 2002:a05:6512:3b07:: with SMTP id
 f7mr61528014lfv.567.1641761806066; 
 Sun, 09 Jan 2022 12:56:46 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id n20sm408526lfu.306.2022.01.09.12.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 12:56:45 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>, Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v1 2/2] target/riscv: Add XVentanaCondOps custom extension
Date: Sun,  9 Jan 2022 21:56:40 +0100
Message-Id: <20220109205640.4126817-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x129.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 09 Jan 2022 20:56:51 -0000

This adds support for the XVentanaCondOps custom extension
(vendor-defined by Ventana Micro Systems), which is documented at
https://github.com/ventanamicro/ventana-custom-extensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf

Given that the CUSTOM-3 opcode space is shared between vendors, these
are implemented as overlapping patterns and use the newly introduced
predicate-function infrastructure to further qualify the decode.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

 target/riscv/cpu.c                            |  3 ++
 target/riscv/cpu.h                            |  3 ++
 target/riscv/insn32.decode                    |  6 +++
 .../insn_trans/trans_xventanacondops.inc      | 39 +++++++++++++++++++
 target/riscv/translate.c                      |  9 +++++
 5 files changed, 60 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_xventanacondops.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e322e729d2..0355ca35e6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -645,6 +645,9 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
 
+    /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_xventanacondops, false),
+
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index dc10f27093..283e45755a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -318,6 +318,9 @@ struct RISCVCPU {
         bool ext_zfh;
         bool ext_zfhmin;
 
+        /* Vendor-specific custom extensions */
+        bool ext_xventanacondops;
+
         char *priv_spec;
         char *user_spec;
         char *bext_spec;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8617307b29..ef7372a59d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -784,3 +784,9 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
 fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
+
+# *** RV64 Custom-3 Extension ***
+{
+  vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r |has_xventanacondops_p
+  vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r |has_xventanacondops_p
+}
\ No newline at end of file
diff --git a/target/riscv/insn_trans/trans_xventanacondops.inc b/target/riscv/insn_trans/trans_xventanacondops.inc
new file mode 100644
index 0000000000..b8a5d031b5
--- /dev/null
+++ b/target/riscv/insn_trans/trans_xventanacondops.inc
@@ -0,0 +1,39 @@
+/*
+ * RISC-V translation routines for the XVentanaCondOps extension.
+ *
+ * Copyright (c) 2021-2022 VRULL GmbH.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+static bool gen_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
+{
+    return gen_condmask(ctx, a, TCG_COND_NE);
+}
+
+static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
+{
+    return gen_condmask(ctx, a, TCG_COND_EQ);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5df6c0d800..121c5605ea 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -115,6 +115,14 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa_ext & ext;
 }
 
+#define MATERIALISE_EXT_PREDICATE(ext)  \
+    static inline bool has_ ## ext ## _p(DisasContext *ctx) \
+    { \
+        return RISCV_CPU(ctx->cs)->cfg.ext_ ## ext ; \
+    }
+
+MATERIALISE_EXT_PREDICATE(xventanacondops);
+
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
@@ -651,6 +659,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
+#include "insn_trans/trans_xventanacondops.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
-- 
2.33.1


