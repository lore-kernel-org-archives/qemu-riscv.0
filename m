Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX2w-00048A-AJ
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:09:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2u-00043H-Mt
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:36 -0500
Received: from [2607:f8b0:4864:20::1036] (port=41704
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2s-0000sE-GM
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:36 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso12877878pjb.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBWkeJq0iGzRJsn8Gd5jsi1w9vh2rm8pAxN7E75hP6s=;
 b=nPscMCneP55rz56mhKCTWMDqe8x+s8Kk94lX/fwCeWEUm0j9vitDrqmhTaKmHhNT4/
 ghwoZju3YEzE/TmsXJfWYvnazIc75OW0VbFYihen6dRNtYbBFxmwUCNLm6V+BHngjvC5
 /sC//BpxwSVhBizaGDmoAZnTUVqqA98dqI4FsSaMT9jMfdx0o8XQX+NdLHb+24spCnbf
 PLDhEpSXb0NDKZLreATJyVV1D3ADowMHy98GtMr+xR1Ra/1U0M1g8MRpD2h9NBzcFnHZ
 CJFgxkj5eJA+NZYR2e4ol8fakIvrGf9SlKJ37+wmS+imTNSwEZ7BVIJstGCKTUhgYyFt
 w4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBWkeJq0iGzRJsn8Gd5jsi1w9vh2rm8pAxN7E75hP6s=;
 b=cv+nl1Cj3CP/9Jf7CLaAkwWwZ2kI+JNDagLM8OCdmwqb0iNst2jImSigt889DzeaDG
 tl1cUxPuoEMkxqjTQblnBSqUpJq11cF9ar9dZdNZEEaUX/Z9hxBWFfnLQro2sH8anlEH
 uGS0COGqBvnABHziYzqY7rZAFNJCdFKyhO4MWEJrbdGS+LnaXE2PxV0XtpckHRP2Sdjm
 wA/jAgRE4toLQQ1FGFQAyM0A/nUjkkpqKhNkiAzDggR+LBiwVEBoJRrV5529+cuAcxUp
 cdS+MxE4IuwAKJtHqc5D0NIhEatVbyx+ZaiayyWzSc23jsBevLXQX69uIEJVDtUeMWjl
 RUnw==
X-Gm-Message-State: AOAM532BW/2k5luPzSE0bg4mYFlWCeuxfOQ/eLY12maJm1pI6BswgGnz
 zkEjRxmR45ggcTaIuAO4Ky4GMg==
X-Google-Smtp-Source: ABdhPJxrKrXuzf8TKfSXPls7daS3Op6hNCQHrUN7bH01EjrNi8INK1WbgkU9XZuPPV52hj1i4qZKLQ==
X-Received: by 2002:a17:902:6905:b0:142:9e19:702e with SMTP id
 j5-20020a170902690500b001429e19702emr58068125plk.34.1638155372346; 
 Sun, 28 Nov 2021 19:09:32 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:09:32 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 61/77] target/riscv: rvv-1.0: floating-point/integer
 type-convert instructions
Date: Mon, 29 Nov 2021 11:03:21 +0800
Message-Id: <20211129030340.429689-62-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:09:37 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfcvt.rtz.xu.f.v
* vfcvt.rtz.x.f.v

Also adjust GEN_OPFV_TRANS() to accept multiple floating-point rounding
modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 11 ++--
 target/riscv/insn_trans/trans_rvv.c.inc | 84 +++++++++++++++----------
 2 files changed, 59 insertions(+), 36 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 20b3095f56c..02064f8ec98 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -585,10 +585,13 @@ vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
-vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-vfcvt_x_f_v     100010 . ..... 00001 001 ..... 1010111 @r2_vm
-vfcvt_f_xu_v    100010 . ..... 00010 001 ..... 1010111 @r2_vm
-vfcvt_f_x_v     100010 . ..... 00011 001 ..... 1010111 @r2_vm
+
+vfcvt_xu_f_v       010010 . ..... 00000 001 ..... 1010111 @r2_vm
+vfcvt_x_f_v        010010 . ..... 00001 001 ..... 1010111 @r2_vm
+vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
+vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
+vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
+vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
 vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
 vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
 vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 047be5d5c47..4bc4dfa69fc 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1,5 +1,4 @@
 /*
- * RISC-V translation routines for the RVV Standard Extension.
  *
  * Copyright (c) 2020 T-Head Semiconductor Co., Ltd. All rights reserved.
  *
@@ -2369,34 +2368,41 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
-#define GEN_OPFV_TRANS(NAME, CHECK)                                \
-static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
-{                                                                  \
-    if (CHECK(s, a)) {                                             \
-        uint32_t data = 0;                                         \
-        static gen_helper_gvec_3_ptr * const fns[3] = {            \
-            gen_helper_##NAME##_h,                                 \
-            gen_helper_##NAME##_w,                                 \
-            gen_helper_##NAME##_d,                                 \
-        };                                                         \
-        TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, RISCV_FRM_DYN);                              \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
-                                                                   \
-        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
-        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
-                           fns[s->sew - 1]);                       \
-        mark_vs_dirty(s);                                          \
-        gen_set_label(over);                                       \
-        return true;                                               \
-    }                                                              \
-    return false;                                                  \
+static bool do_opfv(DisasContext *s, arg_rmr *a,
+                    gen_helper_gvec_3_ptr *fn,
+                    bool (*checkfn)(DisasContext *, arg_rmr *),
+                    int rm)
+{
+    if (checkfn(s, a)) {
+        uint32_t data = 0;
+        TCGLabel *over = gen_new_label();
+        gen_set_rm(s, rm);
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                           vreg_ofs(s, a->rs2), cpu_env,
+                           s->vlen / 8, s->vlen / 8, data, fn);
+        mark_vs_dirty(s);
+        gen_set_label(over);
+        return true;
+    }
+    return false;
+}
+
+#define GEN_OPFV_TRANS(NAME, CHECK, FRM)               \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
+{                                                      \
+    static gen_helper_gvec_3_ptr * const fns[3] = {    \
+        gen_helper_##NAME##_h,                         \
+        gen_helper_##NAME##_w,                         \
+        gen_helper_##NAME##_d                          \
+    };                                                 \
+    return do_opfv(s, a, fns[s->sew - 1], CHECK, FRM); \
 }
 
-GEN_OPFV_TRANS(vfsqrt_v, opfv_check)
+GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
@@ -2442,7 +2448,7 @@ GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
-GEN_OPFV_TRANS(vfclass_v, opfv_check)
+GEN_OPFV_TRANS(vfclass_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point Merge Instruction */
 GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
@@ -2496,10 +2502,24 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 }
 
 /* Single-Width Floating-Point/Integer Type-Convert Instructions */
-GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
+#define GEN_OPFV_CVT_TRANS(NAME, HELPER, FRM)               \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)       \
+{                                                           \
+    static gen_helper_gvec_3_ptr * const fns[3] = {         \
+        gen_helper_##HELPER##_h,                            \
+        gen_helper_##HELPER##_w,                            \
+        gen_helper_##HELPER##_d                             \
+    };                                                      \
+    return do_opfv(s, a, fns[s->sew - 1], opfv_check, FRM); \
+}
+
+GEN_OPFV_CVT_TRANS(vfcvt_xu_f_v, vfcvt_xu_f_v, RISCV_FRM_DYN)
+GEN_OPFV_CVT_TRANS(vfcvt_x_f_v, vfcvt_x_f_v, RISCV_FRM_DYN)
+GEN_OPFV_CVT_TRANS(vfcvt_f_xu_v, vfcvt_f_xu_v, RISCV_FRM_DYN)
+GEN_OPFV_CVT_TRANS(vfcvt_f_x_v, vfcvt_f_x_v, RISCV_FRM_DYN)
+/* Reuse the helper functions from vfcvt.xu.f.v and vfcvt.x.f.v */
+GEN_OPFV_CVT_TRANS(vfcvt_rtz_xu_f_v, vfcvt_xu_f_v, RISCV_FRM_RTZ)
+GEN_OPFV_CVT_TRANS(vfcvt_rtz_x_f_v, vfcvt_x_f_v, RISCV_FRM_RTZ)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 
-- 
2.25.1


