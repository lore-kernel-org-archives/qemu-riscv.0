Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapG-0008JA-Pz
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapF-0008F1-3N
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:17 -0500
Received: from [2607:f8b0:4864:20::533] (port=40495
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapB-0007AD-PT
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:16 -0500
Received: by mail-pg1-x533.google.com with SMTP id m24so7375671pgn.7
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6SPymJFWwrVjEFOEX9GNKj0LnbL2E+SdmzL+ZHK+iUA=;
 b=hzMDFpkI0bCmRB/3M9yB2nfSipH5nq9dvAOuRY+e2VeR7PYqQUq9Wvup7EljUVjqIH
 nxJLB3Gv/2NsC/w15QIspPkOUoTD8M/QGYRud525lAxcGBG11cyLEjUtpzdfkdigVv+w
 tt0XAUEwwenfeLp3gVuGRCxIzkegxMTe/d7vT8LlIcXi/nPObfXvABp6p0FDTXQxVETK
 jFNCrRXTRGEf4BgymtdqKBPzJ/HgQdgLCF4pWDQe+dUIXAmLEnU4fmY8RQrImgq3XGOS
 GZOKyoLT5EFKZUgsPAQDXqwD7gsT/qToRbjQe6SjIDF5jA//4L/nIhX0HV99qIGJ6V2E
 8YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6SPymJFWwrVjEFOEX9GNKj0LnbL2E+SdmzL+ZHK+iUA=;
 b=Iw7dzaColrLkcVLBwGPMLqKChpHRSXzUPbkddlTZPxlcWtEoLAL+fYtvP5eP5PzMMC
 jgbHydyOi5QTKUiQ08o9qLY4eotTqwqXW3BTfzPzBHybMJbrWNRKBuJw4ufNjql2y+aB
 pH93CsUz7RqIQ4Z3+sBDWLiD2DhHw9OOY1slwlMeaiVUaFFDoYD8uYIGpaDKXfhjO8oj
 fuHVUlyEXqwSEjBD/jZaljgg4hqKUExwRS1qc3uOVpV7GZJyEYuQCMEfI84alrjsag1K
 mkxbWdfYrYNH2qcP9vTlBrBYPbnXHYe2WMh9Qnb74uA3Qu+QwcsAM8cVqUOhwn/P1mIP
 A0xA==
X-Gm-Message-State: AOAM5320PuurcWohLTFFS4tyfRZTtmTqE4h9STQyPTzZQ+/pHvglQ4no
 flmqBZngS+/loLVyhk57U3Q6nQ==
X-Google-Smtp-Source: ABdhPJyW8SU7ehv64nhwd30KzaD1a4KidykNnIhMdEU4Bqv3evFWf21Hk5/MH5HYpq2qyhykknbo5Q==
X-Received: by 2002:a63:6201:: with SMTP id w1mr29838875pgb.299.1639123212490; 
 Fri, 10 Dec 2021 00:00:12 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:12 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 61/77] target/riscv: rvv-1.0: floating-point/integer
 type-convert instructions
Date: Fri, 10 Dec 2021 15:56:47 +0800
Message-Id: <20211210075704.23951-62-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:18 -0000

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
index 20b3095f56..02064f8ec9 100644
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
index 047be5d5c4..4bc4dfa69f 100644
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
2.31.1


