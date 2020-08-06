Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRl-0002Y8-7c
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRi-0002Sf-SA
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:26 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRg-0007q8-Lg
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:26 -0400
Received: by mail-pj1-x102d.google.com with SMTP id f9so6276544pju.4
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r58vNekqFy+FboKBPYU11BqyOjQ2+UIJF/KW9uuTF3w=;
 b=LY0CbWU2U8jmXQi9wPO2Y1g0w8zSFevdbvMHfvX3LI4jB4vLf5mMxwq2pRGNg/goUC
 NeQrDUJ/cxSHEDhqBxsznhKmtMbnSyZKmy1ZdXCJHu4/6V5GGp5eHIc25VlxLzg3DUlX
 aE/kI3Xefl+qKdAnHpGOY69XK+lhfvk373AediSpzBGIXKZT107gjKfl6BnvmEpz9v6x
 W9WXJi5Vw9v1pL7ulemTshkXsaAXjBS4IfuGnb8QQBi+I1BRUpYamtjiSG8MJyLfSvim
 0A52khqd8RiECjAmYiYTRpsTfyCgBhGqZyNsCWXRO/fUWrXXggx0aRO4GIAoMv7vsy/W
 jYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r58vNekqFy+FboKBPYU11BqyOjQ2+UIJF/KW9uuTF3w=;
 b=bBqYHOoiG8yzwsDQZ5zqF4fKHgOxSeDuSpdvKLbl7FS2sYwsu1iUnpkiCOwB/cVW2O
 W0ok4MUVlIGjzsJQHrKZ7HKDhQ4FqCXAdYYSg1WdK+CxbpYExvXsaXuVT7OnEB7D+KsW
 1WTNG9ZxSe8iv6ViiZj6kWUSaNKvbaUSCnQnmgwgg6D+uQg8f3cSiOPiT6H0JxWVu+Z9
 NQFxDgIv9oBP/28f2HgIxiMdeDGNz8EZSLnhau9fBojI45bWOOpUJ6Si52UokwlLt5Uv
 YED5Yl794uijNeu1hbCsv4VKX9NHLkHCCa515BxFhxoU2bX+ucXnNZSgjqunri0JyXOm
 Tt6g==
X-Gm-Message-State: AOAM531L2b3qqjrdSLgsiMeuw+Ft3vTOyTf+MFAK3Fwv6orqRwxS3PcJ
 rZUcpP3hXkhp89zPRCt/rS/XLxcN9Bg=
X-Google-Smtp-Source: ABdhPJyzxL0zQ9T9FWaLaRZderjl5yucGwkU+CgsB5jcVrmUNjhKuSBwe1ibO3+iSct12uZU7ISCtA==
X-Received: by 2002:a17:902:b603:: with SMTP id
 b3mr7313005pls.285.1596710903393; 
 Thu, 06 Aug 2020 03:48:23 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:23 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 25/71] target/riscv: rvv-1.0: load/store whole register
 instructions
Date: Thu,  6 Aug 2020 18:46:22 +0800
Message-Id: <20200806104709.13235-26-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:27 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vl<nf>re<eew>.v
* vs<nf>r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 21 +++++++
 target/riscv/insn32.decode              | 22 ++++++++
 target/riscv/insn_trans/trans_rvv.inc.c | 74 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 63 +++++++++++++++++++++
 4 files changed, 180 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9200178d25c..25d076d71a8 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -145,6 +145,27 @@ DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32)
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
 DEF_HELPER_6(vamoswapei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoswapei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoswapei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6a9cf6ad534..c99575d1360 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -267,6 +267,28 @@ vle16ff_v     ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
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
 #*** Vector AMO operations are encoded under the standard AMO major opcode ***
 vamoswapei8_v   00001 . . ..... ..... 000 ..... 0101111 @r_wdvm
 vamoswapei16_v  00001 . . ..... ..... 101 ..... 0101111 @r_wdvm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 3b49c76179e..c7e094b6e5b 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1014,6 +1014,80 @@ GEN_VEXT_TRANS(vle16ff_v, 16, 1, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vle32ff_v, 32, 2, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vle64ff_v, 64, 3, r2nfvm, ldff_op, ld_us_check)
 
+/*
+ * load and store whole register instructions
+ */
+typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
+
+static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t data,
+                             gen_helper_ldst_whole *fn, DisasContext *s,
+                             bool is_store)
+{
+    TCGv_ptr dest;
+    TCGv base;
+    TCGv_i32 desc;
+
+    dest = tcg_temp_new_ptr();
+    base = tcg_temp_new();
+    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+
+    gen_get_gpr(base, rs1);
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+
+    fn(dest, base, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+    tcg_temp_free(base);
+    tcg_temp_free_i32(desc);
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+    return true;
+}
+
+/*
+ * load and store whole register instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 7.9)
+ */
+#define GEN_LDST_WHOLE_TRANS(NAME, EEW, ARGTYPE, ARG_NF, IS_STORE)     \
+static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a)           \
+{                                                                      \
+    if (require_rvv(s) &&                                              \
+        require_align(a->rd, ARG_NF)) {                                \
+        uint32_t data = 0;                                             \
+        bool ret;                                                      \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                 \
+        data = FIELD_DP32(data, VDATA, SEW, s->sew);                   \
+        data = FIELD_DP32(data, VDATA, NF, ARG_NF);                    \
+        ret = ldst_whole_trans(a->rd, a->rs1, data, gen_helper_##NAME, \
+                               s, IS_STORE);                           \
+        return ret;                                                    \
+    }                                                                  \
+    return false;                                                      \
+}
+
+GEN_LDST_WHOLE_TRANS(vl1re8_v,  8,  vl1re8_v,  1, false)
+GEN_LDST_WHOLE_TRANS(vl1re16_v, 16, vl1re16_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re32_v, 32, vl1re32_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re64_v, 64, vl1re64_v, 1, false)
+GEN_LDST_WHOLE_TRANS(vl2re8_v,  8,  vl2re8_v,  2, false)
+GEN_LDST_WHOLE_TRANS(vl2re16_v, 16, vl2re16_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re32_v, 32, vl2re32_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re64_v, 64, vl2re64_v, 2, false)
+GEN_LDST_WHOLE_TRANS(vl4re8_v,  8,  vl4re8_v,  4, false)
+GEN_LDST_WHOLE_TRANS(vl4re16_v, 16, vl4re16_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re32_v, 32, vl4re32_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re64_v, 64, vl4re64_v, 4, false)
+GEN_LDST_WHOLE_TRANS(vl8re8_v,  8,  vl8re8_v,  8, false)
+GEN_LDST_WHOLE_TRANS(vl8re16_v, 16, vl8re16_v, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re32_v, 32, vl8re32_v, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re64_v, 64, vl8re64_v, 8, false)
+
+GEN_LDST_WHOLE_TRANS(vs1r_v, 8, vs1r_v, 1, true)
+GEN_LDST_WHOLE_TRANS(vs2r_v, 8, vs2r_v, 2, true)
+GEN_LDST_WHOLE_TRANS(vs4r_v, 8, vs4r_v, 4, true)
+GEN_LDST_WHOLE_TRANS(vs8r_v, 8, vs8r_v, 8, true)
+
 /*
  *** vector atomic operation
  */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 011d861d92c..a58051ded93 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -537,6 +537,69 @@ GEN_VEXT_LDFF(vle16ff_v, int16_t, lde_h)
 GEN_VEXT_LDFF(vle32ff_v, int32_t, lde_w)
 GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
 
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
+    uint32_t max_elems = vlenb / esz;
+
+    /* probe every access */
+    probe_pages(env, base, vlenb * nf, ra, access_type);
+
+    /* load bytes from guest memory */
+    for (k = 0; k < nf; k++) {
+        for (i = 0; i < max_elems; i++) {
+            target_ulong addr = base + (i + k * max_elems) * esz;
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+        }
+    }
+}
+
+#define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)             \
+void HELPER(NAME)(void *vd, target_ulong base,              \
+                  CPURISCVState *env, uint32_t desc)        \
+{                                                           \
+    vext_ldst_whole(vd, base, env, desc, LOAD_FN,           \
+                    sizeof(ETYPE), GETPC(), MMU_DATA_LOAD); \
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
+#define GEN_VEXT_ST_WHOLE(NAME, ETYPE, STORE_FN)             \
+void HELPER(NAME)(void *vd, target_ulong base,               \
+                  CPURISCVState *env, uint32_t desc)         \
+{                                                            \
+    vext_ldst_whole(vd, base, env, desc, STORE_FN,           \
+                    sizeof(ETYPE), GETPC(), MMU_DATA_STORE); \
+}
+
+GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs2r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs4r_v, int8_t, ste_b)
+GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
+
 /*
  *** Vector AMO Operations (Zvamo)
  */
-- 
2.17.1


