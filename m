Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45836606B3BC
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=bAUk8y6S
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgt1-0002g5-ML; Wed, 04 Nov 2026 14:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsZ-0002Gz-UU
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:43 -0500
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsX-0002LB-Rr
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:39 -0500
Received: by mail-dy1-x1330.google.com with SMTP id
 5a478bee46e88-36d6e342f98so1155266eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821355; x=1794426155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Za031PGODCr/G/OzuUhztaW/d/iPbRMWKAmTbOZNaTc=;
 b=bAUk8y6S8XtFzcwx0ztcnDa/k5y0hB48vUA4ASZ+kK2giF1p9FgRQYyC1ZZjtoudlZ
 qGZQrZqYFGIKis0VtpqBXe1vcn0ddE6RToQ9E3256O9GqtvA7i7RGryvXqFCNfgDSiC6
 knyr/kJKVkCnbKTBX1f1U3FGWHKKCXEBB0VE6udI84S99j763SPKTAA8aTnqJI0XQlvr
 V1iMCbg1Uez2PhYUALy+s+kjSxV8abVBpHbNyytTHzc6LKpISj8Kbt0zciIp4QB+1r9R
 aEhAzZYjhXI+4ANGpbzBLyedwfQECET9r4werPAleajFP/K7hmFxRRiip9ni3ImUhrNJ
 Dm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821355; x=1794426155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Za031PGODCr/G/OzuUhztaW/d/iPbRMWKAmTbOZNaTc=;
 b=w5w9vsmN9G7GXHdHB6P6LFRrxsI0yuoKOh9iQtaLS2SBGLd1owhDPbyLdBYDMzgiRP
 nKoX2Irs+bdIYKmvzc/zytvuETEZV19XiSEeXJ7174Q0pUaFHanYL+ADRCy0bEWsCeB+
 TpHSAtpzzwly0rSrGvfCx0m07i2ltSr48HOmuZfQO3MTxseMm1006VOEiGq/dWBAk64h
 +6E9ECiRO+8L/vHmWWABScPJROCvo2bsvjdy0UGn33DpQsXjZliVlVAZzJIU6TgFbLUy
 zYmHtMix+jV5lfXVgmAlgKYr965o3BJ3nn/FTESjjfeS4UknOGFYGA26RTk1sKaYuSjy
 Tv3g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzx/A0Ao8cLTbfl/LJ+khN3UWT7y3M9Sfe9biOiYDqFseDAJf3sDF7wykAkJmx54lNRXnXFNetf88BB@nongnu.org
X-Gm-Message-State: APuU4Z/gEk1r1OgvkvczP9we0cJ1ksrNyq+wLspjiMDroNOtJ9lP1ia5
 sIK4IPQ7jF4/+Aqyn32qwc5Fs1Pehn7mMtR5gFqNoVBsHVlRk6/f/IQY8FZXPJxxbJ8=
X-Gm-Gg: AYBFou0KH6c9pAORUo2GuX16m5D6ZZSQ5iupLP/+RH8pxWuSnyJ4aIa8oyJpRBoChou
 QI0tDXX3YhazkF2ZAyKqvx8MMyGrSJqgPaVfch+EzLPCxP7MNWFD68hGhaacjaRpj6X7Op0zSCX
 /IPt2S9TCbTi46BAPFDgdQt5jVtoIbxW9AFNHEX6smxP0W6TnmOrAdMljLQPXV0djAuxg4yK4ux
 5OWEi3J5kPv+3+WxRA/R7YnC9tCYdWLR7k4Jv5GwfMHW81Kn2eVM637em/bdFbo+Tmkb8woGqVz
 jgnujopsT0Xr6ppueR5T7iHVudPy4OIltVmGGAPHA+z51nxvSx7VGtb/rP9K+5NnBCIpIcFB2LM
 Vo3K43Lj0lnkhaBBQLu4O7RmkgBgDPFFj6IazMsMjK/wJGkiFGQCpmQLqmJj8aPsZX0jB0JQLAd
 q4i21i+SLgJ2sNiAIaqAiRe78Oe3EJW+B6vFd/pQ80Y4EJVo6cySeF6EbFbSRSerLcn7dgrIXnG
 oHSYO13uPYXfBdoxZVIuI3KD0ZDqgJpDUahDhymbWMU25fE6Xj9Aw4e9hqRtCrq6gKVRl1RyMER
 i7u6MLZPu2HhZoipkKcFvktLqaJTFc8KN03d0UtyJ76FGxPotbcGaS4LyNL+eQ21l7/xvH4AWVO
 4+iqpkA4JApiwVzmBwjDDv3sUiMYK
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id
 5a478bee46e88-36a423a8b7fmr27929510eec.18.1793821355129; 
 Wed, 04 Nov 2026 11:42:35 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:34 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 06/38] target/riscv: rvv: Implement Zvqwdota8i instructions
Date: Thu,  5 Nov 2026 03:41:21 +0800
Message-ID: <20261104194155.679241-7-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1330;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement the vqwdotau.vv and vqwdotas.vv instructions from the
Zvqwdota8i extension. These instructions compute a dot product between
two 8-bit integer vectors, accumulating into a 32-bit scalar in vd[0].

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/helper.h                       |  4 ++
 target/riscv/insn32.decode                  |  4 ++
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 63 +++++++++++++++++++++
 target/riscv/tcg/vector_helper.c            | 49 ++++++++++++++++
 4 files changed, 120 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1cffcad580c..767b04658b4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1387,6 +1387,10 @@ DEF_HELPER_1(ssamoswap_disabled, void, env)
 /* Zalrsc SC write probe */
 DEF_HELPER_FLAGS_3(sc_probe_write, TCG_CALL_NO_WG, void, env, tl, tl)
 
+/* Zvqwdota8i - 8-bit Integer Dot Product */
+DEF_HELPER_6(vqwdotau_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vqwdotas_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+
 /* SiFive Custom int8 Matrix-Multiply */
 DEF_HELPER_5(sf_vqmaccu_4x8x4, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(sf_vqmacc_4x8x4, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 795badc8a7d..cc7d639ab73 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1097,3 +1097,7 @@ vwabda_vv     111101 . ..... ..... 000 ..... 1010111 @r_vm
 vwabda_vx     111101 . ..... ..... 100 ..... 1010111 @r_vm
 vwabdau_vv    111110 . ..... ..... 000 ..... 1010111 @r_vm
 vwabdau_vx    111110 . ..... ..... 100 ..... 1010111 @r_vm
+
+# *** Zvqwdota8i 8-bit Integer Dot-Product Extension ***
+vqwdotau_vv  100110 . ..... ..... 000 ..... 1110111 @r_vm
+vqwdotas_vv  100111 . ..... ..... 000 ..... 1110111 @r_vm
diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index 7e1295f33e7..befdbf273e5 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -4132,7 +4132,70 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  \
     return false;                                                       \
 }
 
+/* Zvqwdota8i 8-bit Integer Dot-Product Extension */
+static bool vext_zvdota_base_check(DisasContext *s, arg_rmrr * a)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           s->vstart_eq_zero &&
+           require_align(a->rs1, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           require_vm(a->vm, a->rd) &&
+           require_noover(a->rd, 0, a->rs1, s->lmul) &&
+           require_noover(a->rd, 0, a->rs2, s->lmul) &&
+           vext_check_input_eew(s, a->rs1, s->sew, a->rs2, s->sew, a->vm);
+}
+
+static bool vext_vqwdota_check(DisasContext *s, arg_rmrr *a)
+{
+    return vext_zvdota_base_check(s, a) &&
+           (s->cfg_ptr->ext_zvqwdota8i && s->sew == MO_8);
+}
+
+typedef void gen_helper_zvdota_int(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr,
+                                   TCGv_env, TCGv_i32);
+
+#define GEN_ZVDOTA_INT_TRANS(NAME, CHECK)                               \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  \
+{                                                                       \
+    static gen_helper_zvdota_int * const fns[2] = {                     \
+        gen_helper_##NAME##_b, NULL,                                    \
+    };                                                                  \
+    if (CHECK(s, a)) {                                                  \
+        TCGv_ptr dest, src1, src2, mask;                                \
+        TCGv_i32 desc;                                                  \
+        uint32_t data = 0;                                              \
+                                                                        \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                      \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                  \
+        data = FIELD_DP32(data, VDATA, VTA, s->vta);                    \
+        data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);  \
+                                                                        \
+        dest = tcg_temp_new_ptr();                                      \
+        mask = tcg_temp_new_ptr();                                      \
+        src1 = tcg_temp_new_ptr();                                      \
+        src2 = tcg_temp_new_ptr();                                      \
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,            \
+                                          s->cfg_ptr->vlenb, data));    \
+                                                                        \
+        tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));            \
+        tcg_gen_addi_ptr(src1, tcg_env, vreg_ofs(s, a->rs1));           \
+        tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, a->rs2));           \
+        tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));                \
+                                                                        \
+        fns[s->sew](dest, mask, src1, src2, tcg_env, desc);             \
+                                                                        \
+        finalize_rvv_inst(s);                                           \
+                                                                        \
+        return true;                                                    \
+    }                                                                   \
+    return false;                                                       \
+}
+
 GEN_ABD_OPIVV_WIDEN_TRANS(vwabda_vv, vwabd_vv_check)
 GEN_ABD_OPIVX_WIDEN_TRANS(vwabda_vx, vwabd_vx_check)
 GEN_ABD_OPIVV_WIDEN_TRANS(vwabdau_vv, vwabd_vv_check)
 GEN_ABD_OPIVX_WIDEN_TRANS(vwabdau_vx, vwabd_vx_check)
+
+GEN_ZVDOTA_INT_TRANS(vqwdotau_vv, vext_vqwdota_check)
+GEN_ZVDOTA_INT_TRANS(vqwdotas_vv, vext_vqwdota_check)
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 4ba0a89f4b5..6abcf522648 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -5970,3 +5970,52 @@ GEN_VEXT_VV(vwabdau_vv_b, 2)
 GEN_VEXT_VV(vwabdau_vv_h, 4)
 GEN_VEXT_VX(vwabdau_vx_b, 2)
 GEN_VEXT_VX(vwabdau_vx_h, 4)
+
+/*
+ * Zvqwdota8i: 8-bit Integer Dot Product with Accumulation
+ */
+#define GEN_VEXT_ZVDOTA_INT(NAME, WD, W1, T2, HD, HS)            \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,      \
+                  CPURISCVState *env, uint32_t desc)             \
+{                                                                \
+    uint32_t vm = vext_vm(desc);                                 \
+    uint32_t vl = env->vl;                                       \
+    uint32_t vta = vext_vta(desc);                               \
+    uint32_t vta_all_1s = vext_vta_all_1s(desc);                 \
+    uint16_t vlenb = riscv_cpu_cfg(env)->vlenb;                  \
+    uint32_t total_elems = vlenb >> ctzl(sizeof(uint##WD##_t));  \
+    uint8_t altfmt = FIELD_EX64(env->vtype, VTYPE, ALTFMT);      \
+    uint32_t i;                                                  \
+    uint##WD##_t acc, dot_result, a;                             \
+                                                                 \
+    VSTART_CHECK_EARLY_EXIT(env, vl);                            \
+                                                                 \
+    acc = *((uint##WD##_t *)vd + HD(0));                         \
+    dot_result = 0;                                              \
+                                                                 \
+    for (i = 0; i < vl; i++) {                                   \
+        if (!vm && !vext_elem_mask(v0, i)) {                     \
+            continue;                                            \
+        }                                                        \
+                                                                 \
+        uint##WD##_t b = *((T2 *)vs2 + HS(i));                   \
+        if (altfmt) {                                            \
+            a = *((int##W1##_t *)vs1 + HS(i));                   \
+        } else {                                                 \
+            a = *((uint##W1##_t *)vs1 + HS(i));                  \
+        }                                                        \
+        dot_result += (a * b);                                   \
+    }                                                            \
+                                                                 \
+    *((uint##WD##_t *)vd + HD(0)) = acc + dot_result;            \
+                                                                 \
+    env->vstart = 0;                                             \
+                                                                 \
+    if (vta_all_1s) {                                            \
+        vext_set_elems_1s(vd, vta, sizeof(int##WD##_t),          \
+                          total_elems * sizeof(int##WD##_t));    \
+    }                                                            \
+}
+
+GEN_VEXT_ZVDOTA_INT(vqwdotau_vv_b, 32, 8, uint8_t, H4, H1)
+GEN_VEXT_ZVDOTA_INT(vqwdotas_vv_b, 32, 8, int8_t, H4, H1)
-- 
2.56.0


