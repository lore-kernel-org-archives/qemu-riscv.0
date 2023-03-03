Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zq-0000ws-N5
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zd-0008RP-2y
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:21 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zb-00085b-AY
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:20 -0500
Received: by mail-pj1-x1031.google.com with SMTP id kb15so1814984pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832938;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFw20b6Bz2FDDW0u4vx4mlXe6VxyRQIjZ8e8ySZmec4=;
 b=JJv49+xJPwm7CbGC7jbqaw9T1jrXdi0hxF890fnmDgch7Y7TbTYjy3obngVqGr3AmY
 YJq1wO8O14qDnbKVEoKDaYF2VXlGOplrxRCY+XolxFpm3iiHwkSOLus+bIGxAGiy1W4/
 Gnj1w7xwtfq3uhPEttIPIeEnw0+4VAfu5+gKU77kuJS2XPNvEtWsKFPIHq7zlDNVcJNC
 eIvxly0LR9cwLlMMbIrzxCkDM/V5egxdRZqonHXpC+yU7rdBOba7RuxH2DOQc9IK0BBC
 cyzlpoQ0yBpbcdNCQcjGwh4y3DHRgfnF1Dy+WMZcjHL/7Ni/c0AMwX5vDuOFYNRnQpAE
 eJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832938;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFw20b6Bz2FDDW0u4vx4mlXe6VxyRQIjZ8e8ySZmec4=;
 b=SuM1Megk31OYEE8ILuO83mDK4qQJ6gfWqzoMP5YBybe7RpGTBlIqanREupsejZvNYa
 ix9FmPiuIrhMtwI2zmYedrtWjUaHegntW+AgCE97V4iGGlsJY9TyjAn95yAA4RxFmVgb
 plAdESkskm0PbibP8tYT+h5+XxRnvNyUEnAPzgFyiVGCIC0HISe2HjO3jXaaaMfThyOL
 QNkIU/N0c96irzgHrb3LbLifXOa2vf0qmwh/dwLxIz4DSvOHPGyXieJqiLKa0xa1oCWt
 Npubf5USAl8XrN7GsFiVUljmpkGedrUPvZXVzRw8xwzmR52/qgVns7Z/Cgb1MDOsr/bc
 e01A==
X-Gm-Message-State: AO0yUKXvChq2s4SEKXvIOWUJaexx+eCVU3Z2EnddwlKE+wBEEzXVWqWs
 4MTLFxfj4GKrxRnEFxmc+WmXl6cAqlrklx4q
X-Google-Smtp-Source: AK7set+3rzih3CAQS7KCWNydca64HEoVGSS6DKv04ZcgVE2A+THcbfWej7FSV4WADjjR2HPB2xIGQQ==
X-Received: by 2002:a17:902:e80a:b0:19d:243:d5d3 with SMTP id
 u10-20020a170902e80a00b0019d0243d5d3mr1066350plg.33.1677832937841; 
 Fri, 03 Mar 2023 00:42:17 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kq13-20020a170903284d00b0019a7f427b79sm980473plb.119.2023.03.03.00.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:17 -0800 (PST)
Subject: [PULL 45/59] target/riscv: Add support for Zicond extension
Date: Fri,  3 Mar 2023 00:37:26 -0800
Message-Id: <20230303083740.12817-46-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:22 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

The spec can be found in https://github.com/riscv/riscv-zicond.
Two instructions are added:
 - czero.eqz: Moves zero to a register rd, if the condition rs2 is
   equal to zero, otherwise moves rs1 to rd.
 - czero.nez: Moves zero to a register rd, if the condition rs2 is
   nonzero, otherwise moves rs1 to rd.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-ID: <20230221091009.36545-1-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c                           |  2 +
 target/riscv/cpu.h                           |  1 +
 target/riscv/insn32.decode                   |  4 ++
 target/riscv/insn_trans/trans_rvzicond.c.inc | 49 ++++++++++++++++++++
 target/riscv/translate.c                     |  1 +
 5 files changed, 57 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9e726d106e..3d41016eb4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -74,6 +74,7 @@ struct isa_ext_data {
 static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
     ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
+    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
@@ -1172,6 +1173,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d8e47b87e3..30c75bf7d6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -434,6 +434,7 @@ struct RISCVCPUConfig {
     bool ext_zkt;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_zicond;
     bool ext_zihintpause;
     bool ext_smstateen;
     bool ext_sstc;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b7e7613ea2..fb537e922e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -890,3 +890,7 @@ sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
 # *** RV32 Zksed Standard Extension ***
 sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
 sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
+
+# *** RV32 Zicond Standard Extension ***
+czero_eqz   0000111  ..... ..... 101 ..... 0110011 @r
+czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/insn_trans/trans_rvzicond.c.inc
new file mode 100644
index 0000000000..645260164e
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
@@ -0,0 +1,49 @@
+/*
+ * RISC-V translation routines for the Zicond Standard Extension.
+ *
+ * Copyright (c) 2020-2023 PLCT Lab
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
+#define REQUIRE_ZICOND(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_zicond) {      \
+        return false;                     \
+    }                                     \
+} while (0)
+
+static bool trans_czero_eqz(DisasContext *ctx, arg_czero_eqz *a)
+{
+    REQUIRE_ZICOND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, ctx->zero, ctx->zero, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_czero_nez(DisasContext *ctx, arg_czero_nez *a)
+{
+    REQUIRE_ZICOND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, ctx->zero, ctx->zero, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8ffa2116e0..4a957a50b5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1103,6 +1103,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzicond.c.inc"
 #include "insn_trans/trans_rvzawrs.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
-- 
2.39.2


