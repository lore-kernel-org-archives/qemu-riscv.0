Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YI-0005zo-CG
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YG-0005rg-7Y
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:32 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YA-0003zR-5e
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:31 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so7758499pjl.4
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dJryH0BufpeP6AML88ur/g/SaRIkQDAmMpBMoDajkM=;
 b=OAh21vRW6+ycM0hDwds6M2rhfFKX2dkvmMtxIhIUbpuiuZRqpwgdfEDM/bYYO6lWnT
 RCsSNNIZ17OYo0wrONOM8uQyOuF5B2Al7OKqwPZ/GiYSyMtFvHaO1n+Pal027hhkfTxO
 m0ElrzcKT8iYmW1YDBoPCKCAp8MQcaCIZdCLJRM9h+OyQ9H++hq4HDUtstN9O1bo5d7y
 y1FyL02HFyvbiBtzsmVfymWA5I1/oGgyJypomumtlF4vkXZhxoW09a7uTN15HACGyRQ4
 UjrnTIlBqO+LMg6+mS7mlpfKBLLPw3RlZPOA2iTWBFfgWy8UkzFTvYdpUJhReJiZ5dqy
 ZDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dJryH0BufpeP6AML88ur/g/SaRIkQDAmMpBMoDajkM=;
 b=ltUKjo1Jmb4EWkuGC36GE5xLitiE9Go2s2fDWUlnPryBcdGuiQj3nFdD1F+VKkC5oS
 NuEIrwT8tgQTGN/P4SZGbftoeZDFjs6GnCM9eaLe9Eil3TyJ9xHWtqaxAd2eiiUCg3hA
 M74YW3xivmdpJ7ULxgsEFVS6hiE6AnN3imycs+vnBr/Q54OpDC8lcaXsFxG5g+Y5zxWB
 X6FEblppputNLds44f/OOHfwZmdgZ5Gci04UMw9G2ZpUAAkiQ+9sX03Xf652pMwj1vWG
 TwRrg9GfTjA2qIzi1XnJWw7X58vz7/vsqtHjSkOaPFM1yofJIElXGwPgSGOAu3R+qX7m
 9Kdg==
X-Gm-Message-State: AOAM531Uv5xR1nrC00VB9Bdkhz+uOsbzCEgsOP00aRqFefCzUDOjbE92
 GX8G0+xhxE6cEdgxYJcFCG9DBg==
X-Google-Smtp-Source: ABdhPJzOqXngHQkRStfDyqvIdqnQXlljMzvj5paH0o34loDTE8QJrg5tN7O2vNoeETwWXnF83lV1Yw==
X-Received: by 2002:a17:90a:44:: with SMTP id 4mr5590432pjb.130.1629481404732; 
 Fri, 20 Aug 2021 10:43:24 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 15/21] target/riscv: Reorg csr instructions
Date: Fri, 20 Aug 2021 07:42:51 -1000
Message-Id: <20210820174257.548286-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:32 -0000

Introduce csrr and csrw helpers, for read-only and write-only insns.

Note that we do not properly implement this in riscv_csrrw, in that
we cannot distinguish true read-only (rs1 == 0) from any other zero
write_mask another source register -- this should still raise an
exception for read-only registers.

Only issue gen_io_start for CF_USE_ICOUNT.
Use ctx->zero for csrrc.
Use get_gpr and dest_gpr.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |   6 +-
 target/riscv/op_helper.c                |  18 +--
 target/riscv/insn_trans/trans_rvi.c.inc | 172 +++++++++++++++++-------
 3 files changed, 131 insertions(+), 65 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 415e37bc37..460eee9988 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -65,9 +65,9 @@ DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
-DEF_HELPER_3(csrrw, tl, env, tl, tl)
-DEF_HELPER_4(csrrs, tl, env, tl, tl, tl)
-DEF_HELPER_4(csrrc, tl, env, tl, tl, tl)
+DEF_HELPER_2(csrr, tl, env, int)
+DEF_HELPER_3(csrw, void, env, int, tl)
+DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 3c48e739ac..ee7c24efe7 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -37,11 +37,10 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
     riscv_raise_exception(env, exception, 0);
 }
 
-target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
-        target_ulong csr)
+target_ulong helper_csrr(CPURISCVState *env, int csr)
 {
     target_ulong val = 0;
-    RISCVException ret = riscv_csrrw(env, csr, &val, src, -1);
+    RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
@@ -49,23 +48,20 @@ target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
     return val;
 }
 
-target_ulong helper_csrrs(CPURISCVState *env, target_ulong src,
-        target_ulong csr, target_ulong rs1_pass)
+void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
 {
-    target_ulong val = 0;
-    RISCVException ret = riscv_csrrw(env, csr, &val, -1, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, NULL, src, -1);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
     }
-    return val;
 }
 
-target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
-        target_ulong csr, target_ulong rs1_pass)
+target_ulong helper_csrrw(CPURISCVState *env, int csr,
+                          target_ulong src, target_ulong write_mask)
 {
     target_ulong val = 0;
-    RISCVException ret = riscv_csrrw(env, csr, &val, 0, rs1_pass ? src : 0);
+    RISCVException ret = riscv_csrrw(env, csr, &val, src, write_mask);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index f616a26c82..688cb6a6ad 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -416,80 +416,150 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
     return true;
 }
 
-#define RISCV_OP_CSR_PRE do {\
-    source1 = tcg_temp_new(); \
-    csr_store = tcg_temp_new(); \
-    dest = tcg_temp_new(); \
-    rs1_pass = tcg_temp_new(); \
-    gen_get_gpr(ctx, source1, a->rs1); \
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next); \
-    tcg_gen_movi_tl(rs1_pass, a->rs1); \
-    tcg_gen_movi_tl(csr_store, a->csr); \
-    gen_io_start();\
-} while (0)
+static bool do_csr_post(DisasContext *ctx)
+{
+    /* We may have changed important cpu state -- exit to main loop. */
+    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    exit_tb(ctx);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
 
-#define RISCV_OP_CSR_POST do {\
-    gen_set_gpr(ctx, a->rd, dest); \
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
-    exit_tb(ctx); \
-    ctx->base.is_jmp = DISAS_NORETURN; \
-    tcg_temp_free(source1); \
-    tcg_temp_free(csr_store); \
-    tcg_temp_free(dest); \
-    tcg_temp_free(rs1_pass); \
-} while (0)
+static bool do_csrr(DisasContext *ctx, int rd, int rc)
+{
+    TCGv dest = dest_gpr(ctx, rd);
+    TCGv_i32 csr = tcg_constant_i32(rc);
 
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrr(dest, cpu_env, csr);
+    gen_set_gpr(ctx, rd, dest);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrw(DisasContext *ctx, int rc, TCGv src)
+{
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrw(cpu_env, csr, src);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrrw(DisasContext *ctx, int rd, int rc, TCGv src, TCGv mask)
+{
+    TCGv dest = dest_gpr(ctx, rd);
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrrw(dest, cpu_env, csr, src, mask);
+    gen_set_gpr(ctx, rd, dest);
+    return do_csr_post(ctx);
+}
 
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrw(dest, cpu_env, source1, csr_store);
-    RISCV_OP_CSR_POST;
-    return true;
+    TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    /*
+     * If rd == 0, the insn shall not read the csr, nor cause any of the
+     * side effects that might occur on a csr read.
+     */
+    if (a->rd == 0) {
+        return do_csrw(ctx, a->csr, src);
+    }
+
+    TCGv mask = tcg_constant_tl(-1);
+    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
 static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrs(dest, cpu_env, source1, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 == 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 == 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv ones = tcg_constant_tl(-1);
+    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
+    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
 
 static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrc(dest, cpu_env, source1, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 == 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 == 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
+    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
 
 static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrw(dest, cpu_env, rs1_pass, csr_store);
-    RISCV_OP_CSR_POST;
-    return true;
+    TCGv src = tcg_constant_tl(a->rs1);
+
+    /*
+     * If rd == 0, the insn shall not read the csr, nor cause any of the
+     * side effects that might occur on a csr read.
+     */
+    if (a->rd == 0) {
+        return do_csrw(ctx, a->csr, src);
+    }
+
+    TCGv mask = tcg_constant_tl(-1);
+    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
 static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrs(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 == 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 == 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv ones = tcg_constant_tl(-1);
+    TCGv mask = tcg_constant_tl(a->rs1);
+    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
 
 static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrc(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 == 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 == 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv mask = tcg_constant_tl(a->rs1);
+    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
-- 
2.25.1


