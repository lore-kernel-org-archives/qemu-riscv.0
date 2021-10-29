Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNm5-0006Ul-Ql
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNl2-0005uN-ER
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:08 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNl0-0005uL-Bc
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:04 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 75so9329816pga.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4GDIGdO/B85Oc12MsjqtZnIKCF9jElnU3EWr6vnoIM=;
 b=DLnNHIc9WDjRFhMyFxfFYGJD2+g2HhQFp2wNO3vvaxneR7+165po7Riiv2OpvFmitQ
 +aNTcSkUGeMlXPGGrtVAdUpMtiFIpxZI3ub4lLsvVFIW2jiiy1KTnlbvGNnrld8eDtF6
 O4vuBP6a4pjnvANsS36yHvcXKzrvoiqe2TkcG/SoWfP0NV79YraMyGwPpBVV7b+eVWLc
 djqsNFWo0qimaOmh7I8KGbhv7Fa0iBUYr/tXnwkkHP/l0m5siogMi9An2mjBrgt/G+oV
 QX+96qJyQp+IaWEz1fNytu3vhe7WhUfX+CaE2b3wsKntmXZ6yIvIr0jNnigW7MDdaXb3
 zOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4GDIGdO/B85Oc12MsjqtZnIKCF9jElnU3EWr6vnoIM=;
 b=pvsZgXQMJOrkBMTEpKocTd2bO+eiy2j2eAaUm75sgvIYSYgtvB7BQboAc9RvaDfB5u
 kRnC806Rf+JiMPQB3hXinb703ThgX6SaN9HNGdgEKzWXoG3zo2FsoaTKBMny6wVlWpLU
 g6A4l/EBlT+/bfQgZXiBWb8+u7LOKTkHpe2kXp/0oK2jqcouryx2NirzD3jqtCsx/o2E
 FkfM9qR5aAZEbt23EJYPsc3+CAxfSk10Bvt3EUUbsYCdKXbxVDWLjqh+X3Ih50TVMGO0
 W92Yi5VBFm3ciZWfNlF0ccQrbM6U0DPe2a3Zi2irm7wRyGMwkTyncyU74AFNA+CGUYvf
 DbBw==
X-Gm-Message-State: AOAM530xWgvo0VS2uVrdZFLr3BIyKquBSNOXq9E1twap0qSJsyMFGxRS
 jUErTskEo0lSwM2JYDvS/YSBIQ==
X-Google-Smtp-Source: ABdhPJwNMn9qI5YgJvA70isvoEA/QwKxxObNyggVBFOssQOAeGwcTzcY1AoTcow5TBpWcIiHr1KBog==
X-Received: by 2002:a62:b606:0:b0:47b:e32f:9ca with SMTP id
 j6-20020a62b606000000b0047be32f09camr9554384pff.57.1635498061054; 
 Fri, 29 Oct 2021 02:01:01 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:00 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 24/76] target/riscv: rvv-1.0: load/store whole register
 instructions
Date: Fri, 29 Oct 2021 16:58:29 +0800
Message-Id: <20211029085922.255197-25-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:01:08 -0000
X-List-Received-Date: Fri, 29 Oct 2021 09:01:08 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vl<nf>re<eew>.v
* vs<nf>r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 21 ++++++++
 target/riscv/insn32.decode              | 22 ++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 68 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 65 +++++++++++++++++++++++
 4 files changed, 176 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 57560b8c04d..b8894d61510 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -173,6 +173,27 @@ DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle32ff_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle64ff_v, void, ptr, ptr, tl, env, i32)
 
+DEF_HELPER_4(vl1re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl1re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl1re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl1re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl2re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl4re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re8_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re16_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re32_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vl8re64_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs1r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs2r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs4r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs8r_v, void, ptr, tl, env, i32)
+
 DEF_HELPER_6(vadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 180d97ecba3..7d8441d1f21 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -332,6 +332,28 @@ vle16ff_v     ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
 vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
 vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
 
+# Vector whole register insns
+vl1re8_v      000 000 1 01000 ..... 000 ..... 0000111 @r2
+vl1re16_v     000 000 1 01000 ..... 101 ..... 0000111 @r2
+vl1re32_v     000 000 1 01000 ..... 110 ..... 0000111 @r2
+vl1re64_v     000 000 1 01000 ..... 111 ..... 0000111 @r2
+vl2re8_v      001 000 1 01000 ..... 000 ..... 0000111 @r2
+vl2re16_v     001 000 1 01000 ..... 101 ..... 0000111 @r2
+vl2re32_v     001 000 1 01000 ..... 110 ..... 0000111 @r2
+vl2re64_v     001 000 1 01000 ..... 111 ..... 0000111 @r2
+vl4re8_v      011 000 1 01000 ..... 000 ..... 0000111 @r2
+vl4re16_v     011 000 1 01000 ..... 101 ..... 0000111 @r2
+vl4re32_v     011 000 1 01000 ..... 110 ..... 0000111 @r2
+vl4re64_v     011 000 1 01000 ..... 111 ..... 0000111 @r2
+vl8re8_v      111 000 1 01000 ..... 000 ..... 0000111 @r2
+vl8re16_v     111 000 1 01000 ..... 101 ..... 0000111 @r2
+vl8re32_v     111 000 1 01000 ..... 110 ..... 0000111 @r2
+vl8re64_v     111 000 1 01000 ..... 111 ..... 0000111 @r2
+vs1r_v        000 000 1 01000 ..... 000 ..... 0100111 @r2
+vs2r_v        001 000 1 01000 ..... 000 ..... 0100111 @r2
+vs4r_v        011 000 1 01000 ..... 000 ..... 0100111 @r2
+vs8r_v        111 000 1 01000 ..... 000 ..... 0100111 @r2
+
 # *** new major opcode OP-V ***
 vadd_vv         000000 . ..... ..... 000 ..... 1010111 @r_vm
 vadd_vx         000000 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5b5285b33f7..5e8e49d43f4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -960,6 +960,74 @@ GEN_VEXT_TRANS(vle16ff_v, MO_16, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vle32ff_v, MO_32, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_us_check)
 
+/*
+ * load and store whole register instructions
+ */
+typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
+
+static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
+                             gen_helper_ldst_whole *fn, DisasContext *s,
+                             bool is_store)
+{
+    TCGv_ptr dest;
+    TCGv base;
+    TCGv_i32 desc;
+
+    uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
+    dest = tcg_temp_new_ptr();
+    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+
+    base = get_gpr(s, rs1, EXT_NONE);
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+
+    fn(dest, base, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+
+    return true;
+}
+
+/*
+ * load and store whole register instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 7.9)
+ */
+#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, IS_STORE)                      \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)                 \
+{                                                                         \
+    if (require_rvv(s) &&                                                 \
+        QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                                 \
+        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, gen_helper_##NAME, \
+                                s, IS_STORE);                             \
+    }                                                                     \
+    return false;                                                         \
+}
+
+GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, false)
+GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, false)
+GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, false)
+GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, false)
+GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, false)
+
+GEN_LDST_WHOLE_TRANS(vs1r_v, 1, true)
+GEN_LDST_WHOLE_TRANS(vs2r_v, 2, true)
+GEN_LDST_WHOLE_TRANS(vs4r_v, 4, true)
+GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
+
 /*
  *** Vector Integer Arithmetic Instructions
  */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 0e7bf5d27fb..9a39a0e2d26 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -543,6 +543,71 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
 #define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
 #define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
 
+/*
+ *** load and store whole register instructions
+ */
+static void
+vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
+                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
+                MMUAccessType access_type)
+{
+    uint32_t i, k;
+    uint32_t nf = vext_nf(desc);
+    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint32_t max_elems = vlenb >> esz;
+
+    /* probe every access */
+    probe_pages(env, base, vlenb * nf, ra, access_type);
+
+    /* load bytes from guest memory */
+    for (k = 0; k < nf; k++) {
+        for (i = 0; i < max_elems; i++) {
+            target_ulong addr = base + ((i + k * max_elems) << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+        }
+    }
+}
+
+#define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)      \
+void HELPER(NAME)(void *vd, target_ulong base,       \
+                  CPURISCVState *env, uint32_t desc) \
+{                                                    \
+    vext_ldst_whole(vd, base, env, desc, LOAD_FN,    \
+                    ctzl(sizeof(ETYPE)), GETPC(),    \
+                    MMU_DATA_LOAD);                  \
+}
+
+GEN_VEXT_LD_WHOLE(vl1re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl1re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl1re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl1re64_v, int64_t, lde_d)
+GEN_VEXT_LD_WHOLE(vl2re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl2re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl2re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl2re64_v, int64_t, lde_d)
+GEN_VEXT_LD_WHOLE(vl4re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl4re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl4re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl4re64_v, int64_t, lde_d)
+GEN_VEXT_LD_WHOLE(vl8re8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_WHOLE(vl8re16_v, int16_t, lde_h)
+GEN_VEXT_LD_WHOLE(vl8re32_v, int32_t, lde_w)
+GEN_VEXT_LD_WHOLE(vl8re64_v, int64_t, lde_d)
+
+#define GEN_VEXT_ST_WHOLE(NAME, ETYPE, STORE_FN)     \
+void HELPER(NAME)(void *vd, target_ulong base,       \
+                  CPURISCVState *env, uint32_t desc) \
+{                                                    \
+    vext_ldst_whole(vd, base, env, desc, STORE_FN,   \
+                    ctzl(sizeof(ETYPE)), GETPC(),    \
+                    MMU_DATA_STORE);                 \
+}
+
+GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs2r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs4r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
+
 /*
  *** Vector Integer Arithmetic Instructions
  */
-- 
2.25.1


