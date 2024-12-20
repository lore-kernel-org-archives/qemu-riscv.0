Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75397E7718B
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:39:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOf5R-0004LN-KX; Fri, 20 Dec 2024 10:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tOf5P-0004Iu-AP
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 10:38:43 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tOf5N-0002dU-F1
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 10:38:43 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso396563366b.0
 for <qemu-riscv@nongnu.org>; Fri, 20 Dec 2024 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1734709120; x=1735313920; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuaZJpOlhqoq+AVWeiwLZIgDeh/1p5naseS9DVlnL0k=;
 b=GPl08+jhO6J3wYek22ULVZ8PERbsaBaoHe0lpTguz/TXkx1xK3p6m7udPtL3X5eetI
 EkoV8Lgi0QrqRxaDI9/ZYUsEYeognTRNrKqRwQPLyDNmNxc+25gimjgjhJrhpLSvIm2b
 9ft6uAMcHn6CBikKSt3PEuVY+Qt1a6emjKuUYKv/w1sHPraLdmmrjkOgos6wLQwRif5S
 cj+jqJTDoktCSuOwy7edmf8TSybDg+y24mTf2h2PG+85ALTbTMjzsPP1NsS6iQ92jOjk
 xxXZ4nA1Ak0XQUDeOZUQ+4EAiauX1NO6vPyLwbBJdJ/VIsZzecUr/LQaJCZ5RhvuwPzE
 FIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734709120; x=1735313920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yuaZJpOlhqoq+AVWeiwLZIgDeh/1p5naseS9DVlnL0k=;
 b=Clhh3MluK5epw4kCm7dYcZY8/CFdMrRQCHlpXXK2YrNmRtPdiKQUE1KHrhGASjWsgu
 7czoAQaOAXr+KiRd/nCOJgjAANwFWpat0D+L/3ELheVxs5nDQUnFZaXPw8ii5BTkbbyC
 Rl0zwPrHYKxeyg9LlB/C7ms/SvvMqFiUq07uPgajCAE+3FMhSR/qEK3tz6efCsOA2f3Z
 emMnN0BPp9bft3YQPEWnW3nR5hTLBiaBfRJmJ+wK4ju7L9124yS/6jHv+qd2ouDwOhxC
 30Jfh/wej+A7ND77JLlZIpXUQ9tgPJI/7jbvoNCXRz58gxC4zIKLx64fCivsmWh2Nj8V
 a0BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUew5M+74DghS8xL58o7wSChrU/nvKv2ppuey7W5gE3cZf2ogCV08SVmcmuHlyg+GrFYs9ATtM42/8H@nongnu.org
X-Gm-Message-State: AOJu0Yypn1se+9EyQHe814aBAAAiK7NUPF9CZqM6tt4deyXr5/uCAuG7
 wIr7Qo8p4pHUMXHPT7rwrx5TYkCJfI/QC6qyjWZqU/PoXKO0pm8llHfXLuaSGxM=
X-Gm-Gg: ASbGncsW4bWgx46fgb01VsLDY72M/wW0bk/hOHz4pRGF25z+xLrM7lOVykU6cKXtfop
 FnSMc3xf8KoleJd6bC1wXHpV31/Gufi78B6xskoabIHyH9shWcheF3LEvb1PnS7QiPwQiSFxCvi
 XX2nEWc7h9CPSlWsqLs6h02LuCEBg1K00LJv7AJuaIwGf4DgPz/S0MOEZVvhShl7guNiBmqoRd3
 IDmXKGDoF48Gn7LCaTkl8cUIEOatHcZ6eu7li1Bc05oGG3B/RG4BwFYn+fpi6U1SefkV01ICeBM
 ZVukRlv0Wjqo5H6Fl2GYRFgjIWx0GOg1nFDD1nEhYpo=
X-Google-Smtp-Source: AGHT+IEMeFl01p4BN7F1aC9/bD3FkZNnEi6fjLWFWCCV80ajdGSkk2xkuh8r0+4TMx2X07HusHa2vg==
X-Received: by 2002:a17:907:a089:b0:aa6:8e61:669d with SMTP id
 a640c23a62f3a-aac289357e7mr243513666b.9.1734709119975; 
 Fri, 20 Dec 2024 07:38:39 -0800 (PST)
Received: from paolo-laptop-amd.station (mob-109-118-46-116.net.vodafone.it.
 [109.118.46.116]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe4b85sm186371666b.118.2024.12.20.07.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 07:38:39 -0800 (PST)
From: Paolo Savini <paolo.savini@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Savini <paolo.savini@embecosm.com>,
 Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>,
 Jeremy Bennett <jeremy.bennett@embecosm.com>,
 Craig Blackmore <craig.blackmore@embecosm.com>
Subject: [RFC 1/1 v2] target/riscv: use tcg ops generation to emulate whole
 reg rvv loads/stores.
Date: Fri, 20 Dec 2024 15:38:34 +0000
Message-ID: <20241220153834.16302-2-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220153834.16302-1-paolo.savini@embecosm.com>
References: <20241220153834.16302-1-paolo.savini@embecosm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.savini@embecosm.com; helo=mail-ej1-x632.google.com
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

This patch replaces the use of a helper function with direct tcg ops generation
in order to emulate whole register loads and stores. This is done in order to
improve the performance of QEMU.
We still use the helper function when vstart is not 0 at the beginning of the
emulation of the whole register load or store.

Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 125 +++++++++++++++---------
 1 file changed, 78 insertions(+), 47 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b9883a5d32..c2c2c53254 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1100,25 +1100,56 @@ GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_us_check)
 typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
 
 static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
-                             gen_helper_ldst_whole *fn,
-                             DisasContext *s)
+                             uint32_t log2_esz, gen_helper_ldst_whole *fn,
+                             DisasContext *s, bool is_load)
 {
-    TCGv_ptr dest;
-    TCGv base;
-    TCGv_i32 desc;
-
-    uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
-    data = FIELD_DP32(data, VDATA, VM, 1);
-    dest = tcg_temp_new_ptr();
-    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
-                                      s->cfg_ptr->vlenb, data));
-
-    base = get_gpr(s, rs1, EXT_NONE);
-    tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
-
     mark_vs_dirty(s);
 
-    fn(dest, base, tcg_env, desc);
+    /*
+     * Load/store minimum vlenb bytes per iteration.
+     * When possible do this atomically.
+     * Update vstart with the number of processed elements.
+     */
+    if (s->vstart_eq_zero) {
+        TCGv addr = tcg_temp_new();
+        uint32_t size = s->cfg_ptr->vlenb * nf;
+        TCGv_i128 t16 = tcg_temp_new_i128();
+        MemOp atomicity = MO_ATOM_NONE;
+        if (log2_esz == 0) {
+            atomicity = MO_ATOM_NONE;
+        } else {
+            atomicity = MO_ATOM_IFALIGN_PAIR;
+        }
+        for (int i = 0; i < size; i += 16) {
+            addr = get_address(s, rs1, i);
+            if (is_load) {
+                tcg_gen_qemu_ld_i128(t16, addr, s->mem_idx,
+                        MO_LE | MO_128 | atomicity);
+                tcg_gen_st_i128(t16, tcg_env, vreg_ofs(s, vd) + i);
+            } else {
+                tcg_gen_ld_i128(t16, tcg_env, vreg_ofs(s, vd) + i);
+                tcg_gen_qemu_st_i128(t16, addr, s->mem_idx,
+                        MO_LE | MO_128 | atomicity);
+            }
+            if (i == size - 16) {
+                tcg_gen_movi_tl(cpu_vstart, 0);
+            } else {
+                tcg_gen_addi_tl(cpu_vstart, cpu_vstart, 16 >> log2_esz);
+            }
+        }
+    } else {
+        TCGv_ptr dest;
+        TCGv base;
+        TCGv_i32 desc;
+        uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
+        data = FIELD_DP32(data, VDATA, VM, 1);
+        dest = tcg_temp_new_ptr();
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
+                        s->cfg_ptr->vlenb, data));
+        base = get_gpr(s, rs1, EXT_NONE);
+        tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
+        fn(dest, base, tcg_env, desc);
+    }
 
     finalize_rvv_inst(s);
     return true;
@@ -1128,42 +1159,42 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
  * load and store whole register instructions ignore vtype and vl setting.
  * Thus, we don't need to check vill bit. (Section 7.9)
  */
-#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF)                                \
-static bool trans_##NAME(DisasContext *s, arg_##NAME * a)                 \
-{                                                                         \
-    if (require_rvv(s) &&                                                 \
-        QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                                 \
-        return ldst_whole_trans(a->rd, a->rs1, ARG_NF,                    \
-                                gen_helper_##NAME, s);                    \
-    }                                                                     \
-    return false;                                                         \
-}
-
-GEN_LDST_WHOLE_TRANS(vl1re8_v,  1)
-GEN_LDST_WHOLE_TRANS(vl1re16_v, 1)
-GEN_LDST_WHOLE_TRANS(vl1re32_v, 1)
-GEN_LDST_WHOLE_TRANS(vl1re64_v, 1)
-GEN_LDST_WHOLE_TRANS(vl2re8_v,  2)
-GEN_LDST_WHOLE_TRANS(vl2re16_v, 2)
-GEN_LDST_WHOLE_TRANS(vl2re32_v, 2)
-GEN_LDST_WHOLE_TRANS(vl2re64_v, 2)
-GEN_LDST_WHOLE_TRANS(vl4re8_v,  4)
-GEN_LDST_WHOLE_TRANS(vl4re16_v, 4)
-GEN_LDST_WHOLE_TRANS(vl4re32_v, 4)
-GEN_LDST_WHOLE_TRANS(vl4re64_v, 4)
-GEN_LDST_WHOLE_TRANS(vl8re8_v,  8)
-GEN_LDST_WHOLE_TRANS(vl8re16_v, 8)
-GEN_LDST_WHOLE_TRANS(vl8re32_v, 8)
-GEN_LDST_WHOLE_TRANS(vl8re64_v, 8)
+#define GEN_LDST_WHOLE_TRANS(NAME, ETYPE, ARG_NF, IS_LOAD)                  \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)                   \
+{                                                                           \
+    if (require_rvv(s) &&                                                   \
+        QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                                   \
+        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, ctzl(sizeof(ETYPE)), \
+                                gen_helper_##NAME, s, IS_LOAD);             \
+    }                                                                       \
+    return false;                                                           \
+}
+
+GEN_LDST_WHOLE_TRANS(vl1re8_v,  int8_t,  1, true)
+GEN_LDST_WHOLE_TRANS(vl1re16_v, int16_t, 1, true)
+GEN_LDST_WHOLE_TRANS(vl1re32_v, int32_t, 1, true)
+GEN_LDST_WHOLE_TRANS(vl1re64_v, int64_t, 1, true)
+GEN_LDST_WHOLE_TRANS(vl2re8_v,  int8_t,  2, true)
+GEN_LDST_WHOLE_TRANS(vl2re16_v, int16_t, 2, true)
+GEN_LDST_WHOLE_TRANS(vl2re32_v, int32_t, 2, true)
+GEN_LDST_WHOLE_TRANS(vl2re64_v, int64_t, 2, true)
+GEN_LDST_WHOLE_TRANS(vl4re8_v,  int8_t,  4, true)
+GEN_LDST_WHOLE_TRANS(vl4re16_v, int16_t, 4, true)
+GEN_LDST_WHOLE_TRANS(vl4re32_v, int32_t, 4, true)
+GEN_LDST_WHOLE_TRANS(vl4re64_v, int64_t, 4, true)
+GEN_LDST_WHOLE_TRANS(vl8re8_v,  int8_t,  8, true)
+GEN_LDST_WHOLE_TRANS(vl8re16_v, int16_t, 8, true)
+GEN_LDST_WHOLE_TRANS(vl8re32_v, int32_t, 8, true)
+GEN_LDST_WHOLE_TRANS(vl8re64_v, int64_t, 8, true)
 
 /*
  * The vector whole register store instructions are encoded similar to
  * unmasked unit-stride store of elements with EEW=8.
  */
-GEN_LDST_WHOLE_TRANS(vs1r_v, 1)
-GEN_LDST_WHOLE_TRANS(vs2r_v, 2)
-GEN_LDST_WHOLE_TRANS(vs4r_v, 4)
-GEN_LDST_WHOLE_TRANS(vs8r_v, 8)
+GEN_LDST_WHOLE_TRANS(vs1r_v, int8_t, 1, false)
+GEN_LDST_WHOLE_TRANS(vs2r_v, int8_t, 2, false)
+GEN_LDST_WHOLE_TRANS(vs4r_v, int8_t, 4, false)
+GEN_LDST_WHOLE_TRANS(vs8r_v, int8_t, 8, false)
 
 /*
  *** Vector Integer Arithmetic Instructions
-- 
2.34.1


