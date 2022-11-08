Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osOBT-0006Zo-Q8
	for mharc-qemu-riscv@gnu.org; Tue, 08 Nov 2022 07:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOBN-0006Wv-5k
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 07:58:26 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOBJ-0005s8-8O
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 07:58:24 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso16188492fac.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Nov 2022 04:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFXOtEFct7aZBn9qsLOf6vADmM9nDSRAlMOl6gM3bOU=;
 b=d9DIGKlp3/H3zKXQjsgXloo+q9f6M+lFAYH+7FQN+AAHGVbyyviR2Rf+tRo9JEMwh4
 Cp0Ql/c5VxxOW4fMY0lRlQgnBRireVBnVocGhgJiloSGvZWLKhjBeDgmttUlh2wI54bb
 nXM7iHM+68YYbg95cC3rRUSrPItQpWBEoZT6ggqyXyHbSlTFWvZadjMInHfywRvHbYAc
 7e2bB/OcdFq3FJ8oD8u3KmgcWy4uueZSU4T04oePv5BSAql2aPnl371jmpyjWwaEA189
 +QkrGyfDxTFzAJckFLSzQoyMsWnHwOWn+r0wmoJ2g6wRngNEjwgIn4/W9VCGxBpkiscu
 LIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SFXOtEFct7aZBn9qsLOf6vADmM9nDSRAlMOl6gM3bOU=;
 b=3+15BiU2GATiYXQqJndhsDreLz0H1jWx4hSihJ6ZoSiV++yVMMe6MyXv1DFkAqldQh
 VWvxNWC/zZMGjSyqin1RUmPVz4upbs8k/URWf1W6g3UH6dpON69ke0ugaf2cIKvOu1y/
 6oaIgYNTaYNgWtKHfKt7tcf2PKhgouFsle7b/3SEjLV++SofQ+xxtwkC2SYA96gVlt0B
 w5xXxQt/FgRZaru9GwVjp7CpVdfoOObTiA/5HFESqGSuyRwfN0UUoizacSd5Y8VyV1SF
 hp7q9qpv1bY1+RYK4yQIbOGSIgJPj7uBpwy88LsbjeF4oi9JKOyifbbNLaDagEA0Ijwe
 arqg==
X-Gm-Message-State: ACrzQf2Hl+4WyrARyBg1LmxRJo24EfR4vfajeUaufMAWH1HssNCeY3YE
 vTmE5+aNc1msMo3n224cPNgiCg==
X-Google-Smtp-Source: AMsMyM4sV8tpDE3Tk4lbBxlkATd8acT+EwA4p9ddYCQJD2AAyutnyT2oqH9wJTLhNGrTvl/twgfETA==
X-Received: by 2002:a05:6870:d28c:b0:130:efc6:9790 with SMTP id
 d12-20020a056870d28c00b00130efc69790mr43807656oae.2.1667912299882; 
 Tue, 08 Nov 2022 04:58:19 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a0568080d4f00b0035a81480ffcsm2342501oik.38.2022.11.08.04.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 04:58:19 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 5/5] target/riscv: Ensure opcode is saved for all relevant
 instructions
Date: Tue,  8 Nov 2022 18:27:03 +0530
Message-Id: <20221108125703.1463577-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=apatel@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
X-List-Received-Date: Tue, 08 Nov 2022 12:58:27 -0000

We should call decode_save_opc() for all relevant instructions which
can potentially generate a virtual instruction fault or a guest page
fault because generating transformed instruction upon guest page fault
expects opcode to be available. Without this, hypervisor will see
transformed instruction as zero in htinst CSR for guest MMIO emulation
which makes MMIO emulation in hypervisor slow and also breaks nested
virtualization.

Fixes: a9814e3e08d2 ("target/riscv: Minimize the calls to decode_save_opc")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rva.c.inc     | 10 +++++++---
 target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvh.c.inc     |  3 +++
 target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
 target/riscv/insn_trans/trans_svinval.c.inc |  3 +++
 7 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 45db82c9be..5f194a447b 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -20,8 +20,10 @@
 
 static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 = get_address(ctx, a->rs1, 0);
+    TCGv src1;
 
+    decode_save_opc(ctx);
+    src1 = get_address(ctx, a->rs1, 0);
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
@@ -43,6 +45,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
+    decode_save_opc(ctx);
     src1 = get_address(ctx, a->rs1, 0);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
@@ -81,9 +84,10 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     MemOp mop)
 {
     TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_address(ctx, a->rs1, 0);
-    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv src1, src2 = get_gpr(ctx, a->rs2, EXT_NONE);
 
+    decode_save_opc(ctx);
+    src1 = get_address(ctx, a->rs1, 0);
     func(dest, src1, src2, ctx->mem_idx, mop);
 
     gen_set_gpr(ctx, a->rd, dest);
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 1397c1ce1c..6e3159b797 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -38,6 +38,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
+    decode_save_opc(ctx);
     addr = get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEUQ);
 
@@ -52,6 +53,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
+    decode_save_opc(ctx);
     addr = get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUQ);
     return true;
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index a1d3eb52ad..965e1f8d11 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -38,6 +38,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
+    decode_save_opc(ctx);
     addr = get_address(ctx, a->rs1, a->imm);
     dest = cpu_fpr[a->rd];
     tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
@@ -54,6 +55,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
+    decode_save_opc(ctx);
     addr = get_address(ctx, a->rs1, a->imm);
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
     return true;
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 4f8aecddc7..9248b48c36 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -36,6 +36,7 @@ static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
 #ifdef CONFIG_USER_ONLY
     return false;
 #else
+    decode_save_opc(ctx);
     if (check_access(ctx)) {
         TCGv dest = dest_gpr(ctx, a->rd);
         TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -82,6 +83,7 @@ static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
 #ifdef CONFIG_USER_ONLY
     return false;
 #else
+    decode_save_opc(ctx);
     if (check_access(ctx)) {
         TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
         TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
@@ -135,6 +137,7 @@ static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
                     void (*func)(TCGv, TCGv_env, TCGv))
 {
+    decode_save_opc(ctx);
     if (check_access(ctx)) {
         TCGv dest = dest_gpr(ctx, a->rd);
         TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index c49dbec0eb..1665efb639 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -261,6 +261,7 @@ static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
 
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
+    decode_save_opc(ctx);
     if (get_xl(ctx) == MXL_RV128) {
         return gen_load_i128(ctx, a, memop);
     } else {
@@ -350,6 +351,7 @@ static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
 
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
+    decode_save_opc(ctx);
     if (get_xl(ctx) == MXL_RV128) {
         return gen_store_i128(ctx, a, memop);
     } else {
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 5d07150cd0..2ad5716312 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -49,6 +49,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     REQUIRE_FPU;
     REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
+    decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
         TCGv temp = temp_new(ctx);
@@ -71,6 +72,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     REQUIRE_FPU;
     REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
+    decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
         TCGv temp = tcg_temp_new();
diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
index 2682bd969f..f3cd7d5c0b 100644
--- a/target/riscv/insn_trans/trans_svinval.c.inc
+++ b/target/riscv/insn_trans/trans_svinval.c.inc
@@ -28,6 +28,7 @@ static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
     /* Do the same as sfence.vma currently */
     REQUIRE_EXT(ctx, RVS);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_tlb_flush(cpu_env);
     return true;
 #endif
@@ -56,6 +57,7 @@ static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
     /* Do the same as hfence.vvma currently */
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_hyp_tlb_flush(cpu_env);
     return true;
 #endif
@@ -68,6 +70,7 @@ static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
     /* Do the same as hfence.gvma currently */
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_hyp_gvma_tlb_flush(cpu_env);
     return true;
 #endif
-- 
2.34.1


