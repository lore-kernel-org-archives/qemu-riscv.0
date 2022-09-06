Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVXc5-0005py-Cq
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 08:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbh-0005gG-RH
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:11 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbY-0003u3-V5
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:06 -0400
Received: by mail-ej1-x62a.google.com with SMTP id fy31so22811431ejc.6
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HzcnmBZhlnyxyz+B0S5H5mHBZlHKlSltS0mBvmvwa5I=;
 b=qznkQ0PYEEXkpUnYral+U0lnkTVZcSxzx4iowY5pUJHacnWjzhnZHy7N6YMK4YCHML
 emz49Ef5DRdI0KMYqNXBrm9WYDhQeP6fOlZEUfcSeRpV1g79Y8yCCTeXl/6pmpZ2CKm2
 ZO4LXV4HFnR2d2JAObJteZ1xVthwOEe5irzcYJl9lEbKNGrFEDDFArssyqIcLciHtC9I
 zWtsr+0DwK3PKdxjr3FOJ2dxRuiFeNcjSxOj4gQ5nNBZnEskACuYXQl30GOF9n9wxG4/
 vfQUZM5lJbShjW7uYVCcDmRBhmjCvZAwGzGgS40Nelr24w6YFSiEAobzf0kySmQYEYCP
 6JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HzcnmBZhlnyxyz+B0S5H5mHBZlHKlSltS0mBvmvwa5I=;
 b=p7FWoSZdrQBKPEnIdZHTwHZ0Th5L3s8bmnj3hZRLksQtmTxWFnYoEzLy4K/TXk3W0A
 zommuP1WESImjCRm4ByAr9rFKReWK57yNXogqoheDC5oB+/zKq60Y50Wp1k78NMhq7jz
 YJ9ZKrTZprD/f6davpjLC589Qwvj0/b4IFdbBG9OJKBJhCaglg+hKbKOWcC0Kz4rR++h
 on/wiFAAz4H9rWRRqkdou/Zu/N17ahupH1wxcZu9ABYAQBcm3HDfSv0Dy+43HvZYkEoo
 biGhsgoj/dU9Olcq4cyj2Y0RY91FU2cUHQ3yuXgtqIWsv01cdH/LnmNOKn8zn6InyjAm
 ncNg==
X-Gm-Message-State: ACgBeo3NYIEZkQVsAfzgyAZXTsfyu6ocWrm/Td0ibKkswyBVMgPNx3yI
 lgigN7BhTq2mJuCxBcb8K6UbaOmsynymZ9mc
X-Google-Smtp-Source: AA6agR6M+Z1LArubZmJGKr8ZrnkDmYmoV9cnyFoks1aUBAeDfTcSlyXel8XD+B1GwrC/CxRKE0C/mA==
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr30999693ejb.609.1662466979098; 
 Tue, 06 Sep 2022 05:22:59 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:22:58 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 08/11] RISC-V: Adding T-Head MemPair extension
Date: Tue,  6 Sep 2022 14:22:40 +0200
Message-Id: <20220906122243.1243354-9-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 06 Sep 2022 12:23:11 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head MemPair instructions.
The patch uses the T-Head specific decoder and translation.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  1 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 90 ++++++++++++++++++++++
 target/riscv/meson.build                   |  1 +
 target/riscv/translate.c                   |  3 +
 target/riscv/xtheadmempair.decode          | 29 +++++++
 6 files changed, 125 insertions(+)
 create mode 100644 target/riscv/xtheadmempair.decode

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 990a1f57af..9370722ffa 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -926,6 +926,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
+    DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xtheadxmae", RISCVCPU, cfg.ext_xtheadxmae, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1982d9293f..6cc2d19075 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -446,6 +446,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadmac;
+    bool ext_xtheadmempair;
     bool ext_xtheadsync;
     bool ext_xtheadxmae;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index fc8307b113..a2bae249fb 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -284,3 +284,93 @@ static bool trans_th_mulsw(DisasContext *ctx, arg_th_mulsw *a)
     ctx->ol = MXL_RV32;
     return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
 }
+
+static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
+                            int shamt)
+{
+    TCGv rd1 = dest_gpr(ctx, a->rd1);
+    TCGv rd2 = dest_gpr(ctx, a->rd2);
+    TCGv rs = get_gpr(ctx, a->rs, EXT_NONE);
+    TCGv addr1 = tcg_temp_new();
+    TCGv addr2 = tcg_temp_new();
+
+    tcg_gen_movi_tl(addr1, a->sh2);
+    tcg_gen_shli_tl(addr1, addr1, shamt);
+    tcg_gen_add_tl(addr1, rs, addr1);
+    if ((memop & MO_SIZE) == MO_64) {
+        tcg_gen_addi_tl(addr2, addr1, 8);
+    } else {
+        tcg_gen_addi_tl(addr2, addr1, 4);
+    }
+
+    if (get_xl(ctx) == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr1, addr1);
+        tcg_gen_ext32u_tl(addr2, addr2);
+    }
+
+    tcg_gen_qemu_ld_tl(rd1, addr1, ctx->mem_idx, memop);
+    tcg_gen_qemu_ld_tl(rd2, addr2, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd1, rd1);
+    gen_set_gpr(ctx, a->rd2, rd2);
+
+    tcg_temp_free(addr1);
+    tcg_temp_free(addr2);
+    return true;
+}
+
+static bool trans_th_ldd(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_loadpair_tl(ctx, a, MO_TESQ, 4);
+}
+
+static bool trans_th_lwd(DisasContext *ctx, arg_th_pair *a)
+{
+    return gen_loadpair_tl(ctx, a, MO_TESL, 3);
+}
+
+static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
+{
+    return gen_loadpair_tl(ctx, a, MO_TEUL, 3);
+}
+
+static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
+                             int shamt)
+{
+    TCGv data1 = get_gpr(ctx, a->rd1, EXT_NONE);
+    TCGv data2 = get_gpr(ctx, a->rd2, EXT_NONE);
+    TCGv rs = get_gpr(ctx, a->rs, EXT_NONE);
+    TCGv addr1 = tcg_temp_new();
+    TCGv addr2 = tcg_temp_new();
+
+    tcg_gen_movi_tl(addr1, a->sh2);
+    tcg_gen_shli_tl(addr1, addr1, shamt);
+    tcg_gen_add_tl(addr1, rs, addr1);
+    if ((memop & MO_SIZE) == MO_64) {
+        tcg_gen_addi_tl(addr2, addr1, 8);
+    } else {
+        tcg_gen_addi_tl(addr2, addr1, 4);
+    }
+
+    if (get_xl(ctx) == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr1, addr1);
+        tcg_gen_ext32u_tl(addr2, addr2);
+    }
+
+    tcg_gen_qemu_st_tl(data1, addr1, ctx->mem_idx, memop);
+    tcg_gen_qemu_st_tl(data2, addr2, ctx->mem_idx, memop);
+
+    tcg_temp_free(addr1);
+    tcg_temp_free(addr2);
+    return true;
+}
+
+static bool trans_th_sdd(DisasContext *ctx, arg_th_pair *a)
+{
+    return gen_storepair_tl(ctx, a, MO_TESQ, 4);
+}
+
+static bool trans_th_swd(DisasContext *ctx, arg_th_pair *a)
+{
+    return gen_storepair_tl(ctx, a, MO_TESL, 3);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 55c019e55b..998f0ba336 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -8,6 +8,7 @@ gen = [
   decodetree.process('xtheadcmo.decode', extra_args: '--static-decode=decode_xtheadcmo'),
   decodetree.process('xtheadcondmov.decode', extra_args: '--static-decode=decode_xtheadcondmov'),
   decodetree.process('xtheadmac.decode', extra_args: '--static-decode=decode_xtheadmac'),
+  decodetree.process('xtheadmempair.decode', extra_args: '--static-decode=decode_xtheadmempair'),
   decodetree.process('xtheadsync.decode', extra_args: '--static-decode=decode_xtheadsync'),
   decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
 ]
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 56cc89ce4a..308de419cb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -138,6 +138,7 @@ MATERIALISE_EXT_PREDICATE(xtheadbs)
 MATERIALISE_EXT_PREDICATE(xtheadcmo)
 MATERIALISE_EXT_PREDICATE(xtheadcondmov);
 MATERIALISE_EXT_PREDICATE(xtheadmac);
+MATERIALISE_EXT_PREDICATE(xtheadmempair);
 MATERIALISE_EXT_PREDICATE(xtheadsync)
 MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
 
@@ -731,6 +732,7 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 #include "decode-xtheadcmo.c.inc"
 #include "decode-xtheadcondmov.c.inc"
 #include "decode-xtheadmac.c.inc"
+#include "decode-xtheadmempair.c.inc"
 #include "decode-xtheadsync.c.inc"
 #include "decode-XVentanaCondOps.c.inc"
 
@@ -1058,6 +1060,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         { has_xtheadcmo_p, decode_xtheadcmo },
         { has_xtheadcondmov_p, decode_xtheadcondmov },
         { has_xtheadmac_p, decode_xtheadmac },
+        { has_xtheadmempair_p, decode_xtheadmempair },
         { has_xtheadsync_p, decode_xtheadsync },
         { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
diff --git a/target/riscv/xtheadmempair.decode b/target/riscv/xtheadmempair.decode
new file mode 100644
index 0000000000..135dc10a59
--- /dev/null
+++ b/target/riscv/xtheadmempair.decode
@@ -0,0 +1,29 @@
+#
+# RISC-V instruction decode for the XTheadMemPair extension
+#
+# Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+
+# The XTheadMemPair extension provides two-GP-register operations.
+#
+# It is documented in
+# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
+
+# Fields
+%sh2       25:2
+%rd2       20:5
+%rs        15:5
+%rd1        7:5
+
+# Argument sets
+&th_pair        rd1 rs rd2 sh2
+
+# Formats:
+@th_pair     ..... .. ..... ..... ... ..... ....... &th_pair %rd1 %rs %rd2 %sh2
+
+th_ldd       11111 .. ..... ..... 100 ..... 0001011 @th_pair
+th_lwd       11100 .. ..... ..... 100 ..... 0001011 @th_pair
+th_lwud      11110 .. ..... ..... 100 ..... 0001011 @th_pair
+th_sdd       11111 .. ..... ..... 101 ..... 0001011 @th_pair
+th_swd       11100 .. ..... ..... 101 ..... 0001011 @th_pair
-- 
2.37.2


