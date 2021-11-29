Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWz7-0003AG-36
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:05:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWz5-00032R-2N
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:39 -0500
Received: from [2607:f8b0:4864:20::62b] (port=42874
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWz2-0000OA-QU
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:38 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u17so10979179plg.9
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4GDIGdO/B85Oc12MsjqtZnIKCF9jElnU3EWr6vnoIM=;
 b=LSzR5Z9nmWYnGeS//bzcQaem1agIl/r1jYV03BtDEaSEjCM0Q1c6SuK2qAHxf/TJCm
 Z2T92AkQ6aG8gL5yX4np5eZenb4/7OQapBJd2V7HeY6i5o2E1P+fH9AvYrR5T45WHieX
 ngJH7FijNRXCxWkztla1FPZV43+XA0Hx/5h6KxABm5PwnB+h1436ORtl154fNgp/0vsn
 z+bSXMrtuYp3866j7LqagBXIwCySzphVEYOyhPNBeeM+3hvC2OZiOtQR0tVyKX/7jgvH
 Ij0xpvsLJ+OlP1u6C5n/7p21FQBZpYfktbjqkNv9txyMYPcYd2zLHir2KVSIB0mnFXO0
 jFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4GDIGdO/B85Oc12MsjqtZnIKCF9jElnU3EWr6vnoIM=;
 b=LTHWPpuNkbb8uV4WDvJWnGlxTeyFHlHABp7OuUF+q4uZYah1KkkAAy4KYuXmEpc0MS
 ryhfUKpBDPD0v2sp0wv7M4CpFafA4PPV4ebEr2nrle2ToFxHfd3eN1s78Bv5ACMEWrME
 zyHzAfZwhnK4H9TY3Sxfgkchi0on6r1/cPzAPyWAdJSJ5z8xc8wab8uV44rvT1cWR9nd
 qXEYAQ23TzmyUfW1xMouk9a+z8VmXwr5ElR201dHpdOVI/RcSLhnWm7C43mbHHZUSEL1
 Xf0/8TpPFD5YFGXlPXJsCbGE8zhD2z9/A71wlz1xdXRSHLpeCm81OMKy0L0Ru17Gj2TA
 cJvQ==
X-Gm-Message-State: AOAM531wEqHh9/wPsJKpBVGqIREgK2o+HwrnzWw605voZUuHruSNTLpk
 9uvKYtA/AAN+vLOx7WYbY6YSVA==
X-Google-Smtp-Source: ABdhPJzXeGkwoket5wnEToJeyebu10NjQ0yAKW7DLvUGw7/8GQ5Wzp6nLClm56bgpFVl7db6Fid2Bw==
X-Received: by 2002:a17:902:6905:b0:142:9e19:702e with SMTP id
 j5-20020a170902690500b001429e19702emr58048292plk.34.1638155135567; 
 Sun, 28 Nov 2021 19:05:35 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:05:35 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 24/77] target/riscv: rvv-1.0: load/store whole register
 instructions
Date: Mon, 29 Nov 2021 11:02:44 +0800
Message-Id: <20211129030340.429689-25-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:05:39 -0000

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


