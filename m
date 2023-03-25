Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2PS-0002Lj-Kg
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2PR-0002LU-24
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:50:09 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2PO-0007BO-AU
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:50:08 -0400
Received: by mail-pl1-x62f.google.com with SMTP id ix20so4138317plb.3
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LP8MgBCrrKqMXZu4QENlu92W5JZ8wKo9nYU2yFy7zrA=;
 b=IOKU9zzX2pPOnJIntLSd8Xk0bVBRWyLzZUgZqsuYrHasFyvLJA4YNNaiDI1gkGnuGB
 wrJcXuewbr8yiSsgeI9J0Vk7KxYNhR2VIbbzEc9vGtAr7Uc9/6Uv4Ng+tF/3/f9N6QdE
 eP/hrBlfafsOQostrMgdy014wmQlFTZkZirZQJMa8wBmddGwLPMpeqsKMPb2pJluRoSJ
 78idrJp6rENzICFa8GjjVstL4OCKVde9qrqC11nKVYeW0GUyh0sESJ37VzpXAZ/3GVeA
 AA1oRzgm7UggEgUVUlLno9HF/5RDYTwFX+9JISEOaYj5Zd+BRvieXU5nPeoUULlAI7q3
 xkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LP8MgBCrrKqMXZu4QENlu92W5JZ8wKo9nYU2yFy7zrA=;
 b=IpbPnn2j5OMcn0WI/VLgDdoIA0SddTsQYe+NYoQt1sobgm/I4wPpK5I2FeXx9Nn2YP
 dOHNrFSy2hpgriGQo2HLxpD8+RwyR2aR6tOXDV/RRNBHP2wlrY+uv3GbcIgXAjWneQ+S
 Is4NCMpk6FEu5DmQLfVz3aaeZe8xYb194a9IVGknL7esKYYTQQgM/hi3qiefYaZQuspl
 UfoADxqqORT89iC4OBsK63ocrpJJttoPhJz56V5eerswYw3nhQri5ypS3vpHTZ4Mya3W
 Gt7VkA44PVt54p2otXd77VRMZhR4UtoVX27RvoIA0MznVYPtyucK5rIOHL7K2fq1XzHo
 bVUw==
X-Gm-Message-State: AAQBX9d0ajPxY0fGCVeIo6mMVNElklIWbQrQU3yKAoY/7ow2np/jzl+B
 y0PEoJaW2uV82cvqEvPySf8AFVSN8fiqaJ2kBqg=
X-Google-Smtp-Source: AKy350Y8qSl3oYNpmuY/3C6CCWE++YhB8G0u+uZNX98gluUDEA9I8wRcNXkI2+zrdR+7zt0+C7U0+w==
X-Received: by 2002:a17:90b:4a50:b0:234:e3f:f53b with SMTP id
 lb16-20020a17090b4a5000b002340e3ff53bmr5891477pjb.21.1679741679650; 
 Sat, 25 Mar 2023 03:54:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 10/25] target/riscv: Handle HLV, HSV via helpers
Date: Sat, 25 Mar 2023 03:54:14 -0700
Message-Id: <20230325105429.1142530-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 11:50:09 -0000

Implement these instructions via helpers, in expectation
of determining the mmu_idx to use at runtime.  This allows
the permission check to also be moved out of line, which
allows HLSX to be removed from TB_FLAGS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h                      |   6 +-
 target/riscv/helper.h                   |  12 ++-
 target/riscv/cpu_helper.c               |  26 ++---
 target/riscv/op_helper.c                |  99 +++++++++++++++--
 target/riscv/translate.c                |   2 -
 target/riscv/insn_trans/trans_rvh.c.inc | 135 ++++++++++--------------
 6 files changed, 169 insertions(+), 111 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5e589db106..f03ff1f10c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -641,8 +641,7 @@ FIELD(TB_FLAGS, LMUL, 7, 3)
 FIELD(TB_FLAGS, SEW, 10, 3)
 FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
 FIELD(TB_FLAGS, VILL, 14, 1)
-/* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 15, 1)
+FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
 FIELD(TB_FLAGS, XL, 16, 2)
 /* If PointerMasking should be applied */
@@ -654,8 +653,7 @@ FIELD(TB_FLAGS, VMA, 21, 1)
 FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
-FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
-FIELD(TB_FLAGS, PRIV, 25, 2)
+FIELD(TB_FLAGS, PRIV, 24, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 37b54e0991..be60bd1525 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -123,8 +123,16 @@ DEF_HELPER_1(itrigger_match, void, env)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(hyp_tlb_flush, void, env)
 DEF_HELPER_1(hyp_gvma_tlb_flush, void, env)
-DEF_HELPER_2(hyp_hlvx_hu, tl, env, tl)
-DEF_HELPER_2(hyp_hlvx_wu, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlv_bu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlv_hu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlv_wu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlv_d, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlvx_hu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_2(hyp_hlvx_wu, TCG_CALL_NO_WG, tl, env, tl)
+DEF_HELPER_FLAGS_3(hyp_hsv_b, TCG_CALL_NO_WG, void, env, tl, tl)
+DEF_HELPER_FLAGS_3(hyp_hsv_h, TCG_CALL_NO_WG, void, env, tl, tl)
+DEF_HELPER_FLAGS_3(hyp_hsv_w, TCG_CALL_NO_WG, void, env, tl, tl)
+DEF_HELPER_FLAGS_3(hyp_hsv_d, TCG_CALL_NO_WG, void, env, tl, tl)
 #endif
 
 /* Vector functions */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 052fdd2d9d..9bb84be4e1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -102,24 +102,16 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     fs = get_field(env->mstatus, MSTATUS_FS);
     vs = get_field(env->mstatus, MSTATUS_VS);
 
-    if (riscv_has_ext(env, RVH)) {
-        if (env->priv == PRV_M ||
-            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
-                get_field(env->hstatus, HSTATUS_HU))) {
-            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
-        }
-
-        if (riscv_cpu_virt_enabled(env)) {
-            flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
-            /*
-             * Merge DISABLED and !DIRTY states using MIN.
-             * We will set both fields when dirtying.
-             */
-            fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
-            vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
-        }
+    if (riscv_cpu_virt_enabled(env)) {
+        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
+        /*
+         * Merge DISABLED and !DIRTY states using MIN.
+         * We will set both fields when dirtying.
+         */
+        fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
+        vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
     }
+
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index b2169a99ff..0f81645adf 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -427,6 +427,91 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
     helper_hyp_tlb_flush(env);
 }
 
+static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
+{
+    if (env->priv == PRV_M) {
+        /* always allowed */
+    } else if (riscv_cpu_virt_enabled(env)) {
+        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
+    } else if (env->priv == PRV_U && !get_field(env->hstatus, HSTATUS_HU)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
+    }
+
+    return cpu_mmu_index(env, x) | MMU_HYP_ACCESS_BIT;
+}
+
+target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+
+    return cpu_ldb_mmu(env, addr, oi, ra);
+}
+
+target_ulong helper_hyp_hlv_hu(CPURISCVState *env, target_ulong addr)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
+
+    return cpu_ldw_mmu(env, addr, oi, ra);
+}
+
+target_ulong helper_hyp_hlv_wu(CPURISCVState *env, target_ulong addr)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
+
+    return cpu_ldl_mmu(env, addr, oi, ra);
+}
+
+target_ulong helper_hyp_hlv_d(CPURISCVState *env, target_ulong addr)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUQ, mmu_idx);
+
+    return cpu_ldq_mmu(env, addr, oi, ra);
+}
+
+void helper_hyp_hsv_b(CPURISCVState *env, target_ulong addr, target_ulong val)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+
+    cpu_stb_mmu(env, addr, val, oi, ra);
+}
+
+void helper_hyp_hsv_h(CPURISCVState *env, target_ulong addr, target_ulong val)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
+
+    cpu_stw_mmu(env, addr, val, oi, ra);
+}
+
+void helper_hyp_hsv_w(CPURISCVState *env, target_ulong addr, target_ulong val)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
+
+    cpu_stl_mmu(env, addr, val, oi, ra);
+}
+
+void helper_hyp_hsv_d(CPURISCVState *env, target_ulong addr, target_ulong val)
+{
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, false, ra);
+    MemOpIdx oi = make_memop_idx(MO_TEUQ, mmu_idx);
+
+    cpu_stq_mmu(env, addr, val, oi, ra);
+}
+
 /*
  * TODO: These implementations are not quite correct.  They perform the
  * access using execute permission just fine, but the final PMP check
@@ -434,20 +519,22 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
  * a fair fraction of cputlb.c, fixing this requires adding new mmu_idx
  * which would imply that exact check in tlb_fill.
  */
-target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
+target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong addr)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, true, ra);
     MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
 
-    return cpu_ldw_code_mmu(env, address, oi, GETPC());
+    return cpu_ldw_code_mmu(env, addr, oi, GETPC());
 }
 
-target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
+target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong addr)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    uintptr_t ra = GETPC();
+    int mmu_idx = check_access_hlsv(env, true, ra);
     MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
 
-    return cpu_ldl_code_mmu(env, address, oi, GETPC());
+    return cpu_ldl_code_mmu(env, addr, oi, ra);
 }
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index abfc152553..5282588247 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -78,7 +78,6 @@ typedef struct DisasContext {
     bool virt_inst_excp;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
-    bool hlsx;
     /* vector extension */
     bool vill;
     /*
@@ -1150,7 +1149,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-    ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 15842f4282..3e9322130f 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -16,156 +16,131 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef CONFIG_USER_ONLY
-static bool check_access(DisasContext *ctx)
-{
-    if (!ctx->hlsx) {
-        if (ctx->virt_enabled) {
-            generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
-        } else {
-            generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
-        }
-        return false;
-    }
-    return true;
-}
-#endif
-
-static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
-{
 #ifdef CONFIG_USER_ONLY
-    return false;
+#define do_hlv(ctx, a, func)  false
+#define do_hsv(ctx, a, func)  false
 #else
-    decode_save_opc(ctx);
-    if (check_access(ctx)) {
-        TCGv dest = dest_gpr(ctx, a->rd);
-        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
-        tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
-        gen_set_gpr(ctx, a->rd, dest);
-    }
-    return true;
-#endif
+static void gen_helper_hyp_hlv_b(TCGv r, TCGv_env e, TCGv a)
+{
+    gen_helper_hyp_hlv_bu(r, e, a);
+    tcg_gen_ext8s_tl(r, r);
 }
 
+static void gen_helper_hyp_hlv_h(TCGv r, TCGv_env e, TCGv a)
+{
+    gen_helper_hyp_hlv_hu(r, e, a);
+    tcg_gen_ext16s_tl(r, r);
+}
+
+static void gen_helper_hyp_hlv_w(TCGv r, TCGv_env e, TCGv a)
+{
+    gen_helper_hyp_hlv_wu(r, e, a);
+    tcg_gen_ext32s_tl(r, r);
+}
+
+static bool do_hlv(DisasContext *ctx, arg_r2 *a,
+                   void (*func)(TCGv, TCGv_env, TCGv))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    decode_save_opc(ctx);
+    func(dest, cpu_env, addr);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool do_hsv(DisasContext *ctx, arg_r2_s *a,
+                   void (*func)(TCGv_env, TCGv, TCGv))
+{
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    decode_save_opc(ctx);
+    func(cpu_env, addr, data);
+    return true;
+}
+#endif /* CONFIG_USER_ONLY */
+
 static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_SB);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_b);
 }
 
 static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TESW);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_h);
 }
 
 static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TESL);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_w);
 }
 
 static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_UB);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_bu);
 }
 
 static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TEUW);
-}
-
-static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
-{
-#ifdef CONFIG_USER_ONLY
-    return false;
-#else
-    decode_save_opc(ctx);
-    if (check_access(ctx)) {
-        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
-        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
-        tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
-    }
-    return true;
-#endif
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_hu);
 }
 
 static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hsv(ctx, a, MO_SB);
+    return do_hsv(ctx, a, gen_helper_hyp_hsv_b);
 }
 
 static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hsv(ctx, a, MO_TESW);
+    return do_hsv(ctx, a, gen_helper_hyp_hsv_h);
 }
 
 static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-    return do_hsv(ctx, a, MO_TESL);
+    return do_hsv(ctx, a, gen_helper_hyp_hsv_w);
 }
 
 static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TEUL);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_wu);
 }
 
 static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-    return do_hlv(ctx, a, MO_TEUQ);
+    return do_hlv(ctx, a, gen_helper_hyp_hlv_d);
 }
 
 static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-    return do_hsv(ctx, a, MO_TEUQ);
+    return do_hsv(ctx, a, gen_helper_hyp_hsv_d);
 }
 
-#ifndef CONFIG_USER_ONLY
-static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
-                    void (*func)(TCGv, TCGv_env, TCGv))
-{
-    decode_save_opc(ctx);
-    if (check_access(ctx)) {
-        TCGv dest = dest_gpr(ctx, a->rd);
-        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        func(dest, cpu_env, addr);
-        gen_set_gpr(ctx, a->rd, dest);
-    }
-    return true;
-}
-#endif
-
 static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_hu);
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, gen_helper_hyp_hlvx_hu);
 }
 
 static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_wu);
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, gen_helper_hyp_hlvx_wu);
 }
 
 static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
-- 
2.34.1


