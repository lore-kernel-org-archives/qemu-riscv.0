Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oo63U-00081K-OU
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 12:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63R-0007Xr-9G
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:30 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63P-0002RA-El
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:29 -0400
Received: by mail-pg1-x530.google.com with SMTP id q1so2020053pgl.11
 for <qemu-riscv@nongnu.org>; Thu, 27 Oct 2022 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFXOtEFct7aZBn9qsLOf6vADmM9nDSRAlMOl6gM3bOU=;
 b=NgM3usz7gaZwahJwl7XaEMDjn9O+nOnWVafU7CTkss0He3rapu0w7ETyvr+CghP95a
 Qtnmckg0CZGlItPGyQrO/+17M2jOA8RG+VrOhomlfbrgV4RgoCpomz1erm7FtthaiG30
 ED9mpStEkbGhxLD/eh9HcMYVEtFUpcHMcHLZA92M/Hm3Ip6mNrWzUqvHMcmxX4w0n0O+
 HLiKyPpxUy4+xh7LG1jV7AZv32S/lWvqAHGwsQEB47emShiFAF8svcPlwPscGlnVG77Q
 oSEiNUjMrUPAzPXavd3rePL01Or82+TbAveqIcFSCKoNLayht0YqckZmZUO8gPWCJbtM
 tQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SFXOtEFct7aZBn9qsLOf6vADmM9nDSRAlMOl6gM3bOU=;
 b=EdYsdQr5/oE7IYMMrX8xwJ1ITQIVaV3S548jNVa4dSH80hpCbDpON4tsFdM2NOXIJT
 UVw+UDBZ/MOZInd+7nWw+mUL6injmcf3hn8V3TsRHAsRLWBC/rFskctsL9LjeMzpXPN4
 r2OLZzOK6f8k2S6a/WkO3EGwTmRax8cVVr/1Ow8KaivlS1+JDPum1uLTZ9n0dfbmpi6k
 uX9okzkJ0qUmJjgG3N/kpspuN1n0p/+A+UPm8KOdkV8HrymsMKEg2I8Mk3R76ZH+CNDB
 qyw8F3zDP4qa2LjVE6FmUeM1GOlkRbaBPnLHtchOH+oFXw2Ji6GRYKhNvDdTEs04HK+C
 bkIw==
X-Gm-Message-State: ACrzQf1RSt8ZFkwWlw7eaEDXZ3YWneIU5TFCFWWTcvhTKGkAt2kvqNlL
 4ODamFVlIcv2SvcwX6jagq8JnQ==
X-Google-Smtp-Source: AMsMyM4KHOqpJw3kbTDRPLN5EmHcktY8uvzNP69XS7bp4+uNSL+TRKf4u4nGjxdawcmmuoMyWt9GmA==
X-Received: by 2002:a05:6a00:16c4:b0:535:890:d4a with SMTP id
 l4-20020a056a0016c400b0053508900d4amr50513833pfc.0.1666889306091; 
 Thu, 27 Oct 2022 09:48:26 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a9bc800b00212e5fe09d7sm1212543pjw.10.2022.10.27.09.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 09:48:25 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 5/5] target/riscv: Ensure opcode is saved for all relevant
 instructions
Date: Thu, 27 Oct 2022 22:17:43 +0530
Message-Id: <20221027164743.194265-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027164743.194265-1-apatel@ventanamicro.com>
References: <20221027164743.194265-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Thu, 27 Oct 2022 16:48:30 -0000

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


