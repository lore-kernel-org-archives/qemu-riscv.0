Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscX-0005yb-Ai
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcM-0004yR-QW
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:58 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcK-0006UZ-Ix
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:58 -0400
Received: by mail-pl1-x641.google.com with SMTP id k5so2084521plk.13
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=B0oWgVVuIJMkOiHfhrtolCTiAnQm8jzmRVh9R6fSbVE=;
 b=BDlaYLtli9e+6gVH5W9Ipoe7NWkawsV01Wov+l9SrDkD6jkxSie/0o/kJ3AAN0v8l9
 PuqIfxsr3QzvorogpBj3WNjDtrE+DVG39NU7hDQYjIbTKwzrBKddXzXC0PRGBO0QLaWM
 oUHcKXanuWd/+qFwuFCeISkffOmSxCtv/4PmGbqOdqQls7oaA40NCW8u8nVc+s00+ZkM
 0Iy0JkzFiyqybuulIhVnYL4ps81kSpDOAL2Fg7B8JhLVaCtUCcJnpjs7fI53eRpftAmw
 5SNOrwmZRLyJPs0QII2UlMN5Q2LRuyjkWDwywVdO9YMYY9GIebDzU45gx6wOxbanJ3Jn
 s8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=B0oWgVVuIJMkOiHfhrtolCTiAnQm8jzmRVh9R6fSbVE=;
 b=tLkG4mmmf94EdzGVYa+79uCcrcnafCcw75f3MBtKd+Eu0GAKJCEPVqCM4CoVppRK5K
 zh9pCXpGeanKJi2EpUZ/IUD60GLSTNHi7RQLnwiNCGMBDa8bva+XCNoRlL0iDtmroXQg
 T/MsCdB2IOP+yS0Dz6GJqPsRklGePc9x7vY+HvvV8oOvsEcH9ULmFGFXZK4kABzzbycx
 RZGduAnce0YZWF7SL+qPhPEXlXOy+Owvor0mRu2gPiLgnwhgLddZjhcY/zou1xY2ebmT
 1DOBD2bVqX+SxPQOhrkM45p/8OG8+TbEP2DBjQrhJdKty2LpMGe/R2Sd+YB70pMcHz2E
 qkRQ==
X-Gm-Message-State: AOAM532smcd3ge3xVpN/hSO0v/7fUMy8pBhvLKQHqDwDwz5UKishJKg/
 d5iswx2/pKSHG8dnIUGIAsb4309GoD/szQ==
X-Google-Smtp-Source: ABdhPJymruzl8vrE2RvBg2yp1HY0XUYv4yRjbjwDTy+4JzCGCEM/gmknth6fLOkp0uEPaFhPqbXFpA==
X-Received: by 2002:a17:902:bb96:: with SMTP id
 m22mr2080844pls.6.1594378255304; 
 Fri, 10 Jul 2020 03:50:55 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:50:54 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 07/65] target/riscv: rvv-0.9: add vector context status
Date: Fri, 10 Jul 2020 18:48:21 +0800
Message-Id: <20200710104920.13550-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x641.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:58 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:50:59 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h                      |  4 ++
 target/riscv/cpu_bits.h                 |  1 +
 target/riscv/cpu_helper.c               | 13 ++++++
 target/riscv/csr.c                      | 25 ++++++++++-
 target/riscv/insn_trans/trans_rvv.inc.c | 57 +++++++++++++++++++++----
 target/riscv/translate.c                | 32 ++++++++++++++
 6 files changed, 123 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a804a5d0ba..0cf3fe9456 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -317,6 +317,7 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+bool riscv_cpu_vector_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
@@ -415,6 +416,9 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     if (riscv_cpu_fp_enabled(env)) {
         flags |= env->mstatus & MSTATUS_FS;
     }
+    if (riscv_cpu_vector_enabled(env)) {
+        flags |= env->mstatus & MSTATUS_VS;
+    }
 #endif
     *pflags = flags;
 }
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 202440e5eb..79ae0accbc 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -376,6 +376,7 @@
 #define MSTATUS_SPP         0x00000100
 #define MSTATUS_MPP         0x00001800
 #define MSTATUS_FS          0x00006000
+#define MSTATUS_VS          0x00000600
 #define MSTATUS_XS          0x00018000
 #define MSTATUS_MPRV        0x00020000
 #define MSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 75d2ae3434..8e119fd8b5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -108,6 +108,19 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
     return false;
 }
 
+/* Return true is vector support is currently enabled */
+bool riscv_cpu_vector_enabled(CPURISCVState *env)
+{
+    if (env->mstatus & MSTATUS_VS) {
+        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_VS)) {
+            return false;
+        }
+        return true;
+    }
+
+    return false;
+}
+
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
     target_ulong mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 34ce509e64..77d371f385 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -180,6 +180,7 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     if (vs(env, csrno) >= 0) {
@@ -210,6 +211,13 @@ static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return -1;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
     env->vxrm = val;
     return 0;
 }
@@ -222,6 +230,13 @@ static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return -1;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
     env->vxsat = val;
     return 0;
 }
@@ -234,6 +249,13 @@ static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return -1;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
     env->vstart = val;
     return 0;
 }
@@ -420,7 +442,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-        MSTATUS_TW;
+        MSTATUS_TW | MSTATUS_VS;
 #if defined(TARGET_RISCV64)
     /*
      * RV32: MPV and MTL are not in mstatus. The current plan is to
@@ -432,6 +454,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     mstatus = (mstatus & ~mask) | (val & mask);
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
+            ((mstatus & MSTATUS_VS) == MSTATUS_VS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
     env->mstatus = mstatus;
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 70d31a5525..3ae40ad0c1 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -23,6 +23,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
 {
     TCGv s1, s2, dst;
 
+    REQUIRE_RVV;
     if (!has_ext(ctx, RVV)) {
         return false;
     }
@@ -48,6 +49,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     tcg_temp_free(s1);
     tcg_temp_free(s2);
     tcg_temp_free(dst);
+    mark_vs_dirty(s);
     return true;
 }
 
@@ -55,6 +57,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
 {
     TCGv s1, s2, dst;
 
+    REQUIRE_RVV;
     if (!has_ext(ctx, RVV)) {
         return false;
     }
@@ -78,6 +81,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     tcg_temp_free(s1);
     tcg_temp_free(s2);
     tcg_temp_free(dst);
+    mark_vs_dirty(s);
     return true;
 }
 
@@ -235,6 +239,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
           { NULL,                NULL,
             gen_helper_vlwu_v_w, gen_helper_vlwu_v_d } }
     };
+    bool ret;
 
     fn =  fns[a->vm][seq][s->sew];
     if (fn == NULL) {
@@ -245,7 +250,9 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
+    ret = ldst_us_trans(a->rd, a->rs1, data, fn, s);
+    mark_vs_dirty(s);
+    return ret;
 }
 
 static bool ld_us_check(DisasContext *s, arg_r2nfvm* a)
@@ -372,6 +379,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
         { NULL,                 NULL,
           gen_helper_vlswu_v_w, gen_helper_vlswu_v_d },
     };
+    bool ret;
 
     fn =  fns[seq][s->sew];
     if (fn == NULL) {
@@ -382,7 +390,9 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    ret  = ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    mark_vs_dirty(s);
+    return ret;
 }
 
 static bool ld_stride_check(DisasContext *s, arg_rnfvm* a)
@@ -500,6 +510,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
         { NULL,                 NULL,
           gen_helper_vlxwu_v_w, gen_helper_vlxwu_v_d },
     };
+    bool ret;
 
     fn =  fns[seq][s->sew];
     if (fn == NULL) {
@@ -510,7 +521,9 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    ret = ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    mark_vs_dirty(s);
+    return ret;
 }
 
 static bool ld_index_check(DisasContext *s, arg_rnfvm* a)
@@ -622,6 +635,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
         { NULL,                  NULL,
           gen_helper_vlwuff_v_w, gen_helper_vlwuff_v_d }
     };
+    bool ret;
 
     fn =  fns[seq][s->sew];
     if (fn == NULL) {
@@ -632,7 +646,9 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    return ldff_trans(a->rd, a->rs1, data, fn, s);
+    ret = ldff_trans(a->rd, a->rs1, data, fn, s);
+    mark_vs_dirty(s);
+    return ret;
 }
 
 GEN_VEXT_TRANS(vlbff_v, 0, r2nfvm, ldff_op, ld_us_check)
@@ -719,6 +735,7 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
         gen_helper_vamomaxud_v_d
     };
 #endif
+    bool ret;
 
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         gen_helper_exit_atomic(cpu_env);
@@ -741,7 +758,9 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, WD, a->wd);
-    return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    ret = amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+    mark_vs_dirty(s);
+    return ret;
 }
 /*
  * There are two rules check here.
@@ -823,6 +842,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, 0, s->vlen / 8, data, fn);
     }
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -896,6 +916,7 @@ static inline bool
 do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
               gen_helper_opivx *fn)
 {
+    bool ret;
     if (!opivx_check(s, a)) {
         return false;
     }
@@ -911,9 +932,12 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
 
         tcg_temp_free_i64(src1);
         tcg_temp_free(tmp);
+        mark_vs_dirty(s);
         return true;
     }
-    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    ret = opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    mark_vs_dirty(s);
+    return ret;
 }
 
 /* OPIVX with GVEC IR */
@@ -1035,6 +1059,7 @@ static inline bool
 do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
               gen_helper_opivx *fn, int zx)
 {
+    bool ret;
     if (!opivx_check(s, a)) {
         return false;
     }
@@ -1047,10 +1072,12 @@ do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
             gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                     sextract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
         }
+        ret = true;
     } else {
-        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
+        ret = opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
     }
-    return true;
+    mark_vs_dirty(s);
+    return ret;
 }
 
 /* OPIVI with GVEC IR */
@@ -1111,6 +1138,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
                            vreg_ofs(s, a->rs2),
                            cpu_env, 0, s->vlen / 8,
                            data, fn);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -1198,6 +1226,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
                            cpu_env, 0, s->vlen / 8, data, fn);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
@@ -1276,6 +1305,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env, 0,        \
                            s->vlen / 8, data, fns[s->sew]);        \
+        mark_vs_dirty(s);                                        \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1407,6 +1437,7 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
 
         tcg_temp_free_i32(src1);
         tcg_temp_free(tmp);
+        mark_vs_dirty(s);
         return true;
     }
     return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
@@ -1465,6 +1496,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env, 0,        \
                            s->vlen / 8, data, fns[s->sew]);        \
+        mark_vs_dirty(s);                                        \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1830,6 +1862,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env, 0,        \
                            s->vlen / 8, data, fns[s->sew - 1]);    \
+        mark_vs_dirty(s);                                        \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1942,6 +1975,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
                            vreg_ofs(s, a->rs1),                  \
                            vreg_ofs(s, a->rs2), cpu_env, 0,      \
                            s->vlen / 8, data, fns[s->sew - 1]);  \
+        mark_vs_dirty(s);                                      \
         gen_set_label(over);                                     \
         return true;                                             \
     }                                                            \
@@ -2016,6 +2050,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env, 0,        \
                            s->vlen / 8, data, fns[s->sew - 1]);    \
+        mark_vs_dirty(s);                                        \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2130,6 +2165,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env, 0,        \
                            s->vlen / 8, data, fns[s->sew - 1]);    \
+        mark_vs_dirty(s);                                        \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2270,6 +2306,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env, 0,        \
                            s->vlen / 8, data, fns[s->sew - 1]);    \
+        mark_vs_dirty(s);                                        \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2318,6 +2355,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env, 0,        \
                            s->vlen / 8, data, fns[s->sew - 1]);    \
+        mark_vs_dirty(s);                                        \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2824,6 +2862,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
         tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                              MAXSZ(s), MAXSZ(s), dest);
         tcg_temp_free_i64(dest);
+        mark_vs_dirty(s);
     } else {
         static gen_helper_opivx * const fns[4] = {
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
@@ -2850,6 +2889,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
                                  endian_ofs(s, a->rs2, a->rs1),
                                  MAXSZ(s), MAXSZ(s));
         }
+        mark_vs_dirty(s);
     } else {
         static gen_helper_opivx * const fns[4] = {
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
@@ -2886,6 +2926,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
+        mark_vs_dirty(s);
         gen_set_label(over);
         return true;
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9632e79cf3..a806e33301 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -47,6 +47,7 @@ typedef struct DisasContext {
     bool virt_enabled;
     uint32_t opcode;
     uint32_t mstatus_fs;
+    uint32_t mstatus_vs;
     uint32_t misa;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
@@ -416,6 +417,37 @@ static void mark_fs_dirty(DisasContext *ctx)
 static inline void mark_fs_dirty(DisasContext *ctx) { }
 #endif
 
+#ifndef CONFIG_USER_ONLY
+/* The states of mstatus_vs are:
+ * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
+ * We will have already diagnosed disabled state,
+ * and need to turn initial/clean into dirty.
+ */
+static void mark_vs_dirty(DisasContext *ctx)
+{
+    TCGv tmp;
+    if (ctx->mstatus_vs == MSTATUS_VS) {
+        return;
+    }
+    /* Remember the state change for the rest of the TB.  */
+    ctx->mstatus_vs = MSTATUS_VS;
+
+    tmp = tcg_temp_new();
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+    tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS | MSTATUS_SD);
+    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+
+    if (ctx->virt_enabled) {
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS | MSTATUS_SD);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+    }
+    tcg_temp_free(tmp);
+}
+#else
+static inline void mark_vs_dirty(DisasContext *ctx) { }
+#endif
+
 #if !defined(TARGET_RISCV64)
 static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
         int rs1, target_long imm)
-- 
2.17.1


