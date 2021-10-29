Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNoL-0002Jg-Pe
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNoK-0002EL-8U
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:28 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNoC-0006pR-LK
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:23 -0400
Received: by mail-pg1-x529.google.com with SMTP id m21so9261990pgu.13
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UiUw4H+PfC2YnJnNQovokpyR7FCMhZHegO3136z9g7k=;
 b=k0gNDBWXoE0lW/pdyBs70D+2mepM9MkbxYC+n4Qmbhu352TOEywQy0o86VxCWH/u6Y
 uV2nvwAegsRfcDkVXvVQlIfqF8v1B3XAf2ZLjTDj1E7MndzkFHKdlgPy4qBULVF5jQso
 /xgAOH3PLRqPIRX5hz6IspXHHytvLz4ZyGT5BXhEoWLq0Ugdxk4Z2IMrQIb2Yq64UsuS
 E+CWR7I8KCf3s8Ip46IQNbqxMChRUHsxRMA08w0hmrUwhRgoC8S/+zBnZz2zKhhdPNXD
 dT4lZ+FyW8SX2zbhD95sJA7cQtBjmhP5tA7tMANdT5UpUnu+U8tVS81ih4qOutHJInSl
 HYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UiUw4H+PfC2YnJnNQovokpyR7FCMhZHegO3136z9g7k=;
 b=m39mo9+zGUV3cTva9fS3EfbitnzxhkHxFIs8jMCQGuFmSWT9luerklll749SCOQO9n
 4lROqjsDNNb/vAoqyZcFLE5qt2yo3ylXw8PMHG8dBmoL0WhPWQDhiroSOl0Zbd6PQH++
 3ayN7Xxs+LqAHyKTu03X6wFOndsTZUTUYDKpEa2I1MxHao55tXytn0vJkAYsfw49WxBC
 vO9NjENLYW4sIZsR64hzD+xfdbJ3boPNEYghDUVs/oNtlQIdUv4Z8hLrZdRp8rlFGfJN
 KAd5MmnSq3CA5ZleoGF3Z8MQot5Bogq3nCO8BQpnU43O67x6YlERVex3M8Qc6lE0RMsa
 K2lg==
X-Gm-Message-State: AOAM533brbyr5xrNPQWaZ601vK1aLgpAeREdXdT2AAFYWsP5CdKsqUJL
 s3Mx+YUf9ceY1aEnyu9Xw4Ko/w==
X-Google-Smtp-Source: ABdhPJyG0KidELpxpiyhZQji+8PWRKGIb0ou4UZf1J5TH5ViUglGlWqPgmvCFUN3azUwZjrYS0YVcw==
X-Received: by 2002:a63:7010:: with SMTP id l16mr7314503pgc.32.1635498259468; 
 Fri, 29 Oct 2021 02:04:19 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:04:19 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 74/76] target/riscv: rvv-1.0: add vector unit-stride mask
 load/store insns
Date: Fri, 29 Oct 2021 16:59:19 +0800
Message-Id: <20211029085922.255197-75-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Oct 2021 09:04:28 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvv.c.inc | 40 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 21 +++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ab283d12b79..6e58343af35 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -129,6 +129,8 @@ DEF_HELPER_5(vse8_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse16_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse32_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse64_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vlm_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vsm_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3b6524bad91..1a4a2871464 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -305,6 +305,10 @@ vse16_v    ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
 vse32_v    ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
 vse64_v    ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
 
+# Vector unit-stride mask load/store insns.
+vlm_v      000 000 1 01011 ..... 000 ..... 0000111 @r2
+vsm_v      000 000 1 01011 ..... 000 ..... 0100111 @r2
+
 # Vector strided insns.
 vlse8_v     ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlse16_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e540b5d33c2..97b1dc10265 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -697,6 +697,46 @@ GEN_VEXT_TRANS(vse16_v, MO_16, r2nfvm, st_us_op, st_us_check)
 GEN_VEXT_TRANS(vse32_v, MO_32, r2nfvm, st_us_op, st_us_check)
 GEN_VEXT_TRANS(vse64_v, MO_64, r2nfvm, st_us_op, st_us_check)
 
+/*
+ *** unit stride mask load and store
+ */
+static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
+{
+    uint32_t data = 0;
+    gen_helper_ldst_us *fn = gen_helper_vlm_v;
+
+    /* EMUL = 1, NFIELDS = 1 */
+    data = FIELD_DP32(data, VDATA, LMUL, 0);
+    data = FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
+}
+
+static bool ld_us_mask_check(DisasContext *s, arg_vlm_v *a, uint8_t eew)
+{
+    /* EMUL = 1, NFIELDS = 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
+{
+    uint32_t data = 0;
+    gen_helper_ldst_us *fn = gen_helper_vsm_v;
+
+    /* EMUL = 1, NFIELDS = 1 */
+    data = FIELD_DP32(data, VDATA, LMUL, 0);
+    data = FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
+}
+
+static bool st_us_mask_check(DisasContext *s, arg_vsm_v *a, uint8_t eew)
+{
+    /* EMUL = 1, NFIELDS = 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+GEN_VEXT_TRANS(vlm_v, MO_8, vlm_v, ld_us_mask_op, ld_us_mask_check)
+GEN_VEXT_TRANS(vsm_v, MO_8, vsm_v, st_us_mask_op, st_us_mask_check)
+
 /*
  *** stride load and store
  */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 83373ca6fc6..4c1a1310e63 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -345,6 +345,27 @@ GEN_VEXT_ST_US(vse16_v, int16_t, ste_h)
 GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
 GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
 
+/*
+ *** unit stride mask load and store, EEW = 1
+ */
+void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
+                    CPURISCVState *env, uint32_t desc)
+{
+    /* evl = ceil(vl/8) */
+    uint8_t evl = (env->vl + 7) >> 3;
+    vext_ldst_us(vd, base, env, desc, lde_b,
+                 0, evl, GETPC(), MMU_DATA_LOAD);
+}
+
+void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
+                    CPURISCVState *env, uint32_t desc)
+{
+    /* evl = ceil(vl/8) */
+    uint8_t evl = (env->vl + 7) >> 3;
+    vext_ldst_us(vd, base, env, desc, ste_b,
+                 0, evl, GETPC(), MMU_DATA_STORE);
+}
+
 /*
  *** index: access vector element from indexed memory
  */
-- 
2.25.1


