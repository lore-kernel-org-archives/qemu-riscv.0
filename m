Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6L-00071w-JH
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5z-0006Nn-JA
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:35 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5h-0001WX-Ap
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:35 -0400
Received: by mail-pf1-x436.google.com with SMTP id q10so7543865pfj.12
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X1qeQE6kB9QQ0i3jNEW6Omw4RLTIbFXQtxHWy2nbQ+Y=;
 b=NcRheggWnNrSnCm+Fi3FhLtdVgz/kWqJce/SeOQ9jxPipN1TBhEvSu+0ZnlhVxtnS4
 8sgwgdcXbMe84B6fCEX5ZRNo4ij+iQizm3jozCqtRbv25mSJHAabgUf4UjKlmP+wreqr
 y40RMPD3yvA9YM6eGJD2OBf/PDjWUbM2mcSqTgGJZN92AMQI5/9v6spSKY/jgrviDk9o
 WmmLR0j3kmChHuaz1YYoPDJEkxry+vIZfJwjMBWdOSDthr4hyYxfADPTIGe+zm790nL8
 bT7kOgYuPzUIfpeOQS4qx0EbF3rev+G5bbmrcGkOvyr7DlauciMHZXlp4fZs+TEDu3wd
 mXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X1qeQE6kB9QQ0i3jNEW6Omw4RLTIbFXQtxHWy2nbQ+Y=;
 b=IKyQ+x34CPuMWS8RFiU8S9mnxALgjhO5hvT9S2VAnQcTOMyr16urXQjYmjLqRwKISN
 OgOeDou12EH0sP93euAbO0hKe8l93tkkpOHO4V97luJO/cLL4i/rV8XUIFmL9m/kcWHk
 BDx4G+wvxFMs2Z1c89Cke9mBvHBlrm1l643L636L2O165O/vqmlbDkrS1J8KM1YBLrRC
 zzE/UlLqhSNIqHVJUrH27ZPnEkbcfnNe5TuoVvljKvu6kwn5QN4fYP2E232dsOiVcCZW
 HkHmJPC7CnJh6bcDUO1v06Qxnru1CrI2Mqvs9bMr5TyXEij1CkUDrK9aI0NWaVEN1aqf
 gQYg==
X-Gm-Message-State: AOAM532QAJuP5NW/ovhpYEdF0aw0eJizcOCiQl5lvl1JD0owljsPeSD8
 n2RBvtbC0Ke808A7gXdiTMw/0Q==
X-Google-Smtp-Source: ABdhPJxpilxN0saasMT8XZ97jVNyDmgqrg4yLejuGmIGeYfqjQHwwC+hU+eV3V+9fp1LewLPVtXUAA==
X-Received: by 2002:a65:550a:: with SMTP id f10mr10448133pgr.155.1625804775783; 
 Thu, 08 Jul 2021 21:26:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 10/17] target/riscv: Use gpr_{src,dst} for RVA
Date: Thu,  8 Jul 2021 21:26:01 -0700
Message-Id: <20210709042608.883256-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:35 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rva.c.inc | 42 +++++++++----------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index ab2ec4f0a5..5bb5bbd09c 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -18,11 +18,11 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
+static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 = tcg_temp_new();
+    TCGv src1 = gpr_src(ctx, a->rs1);
+
     /* Put addr in load_res, data in load_val.  */
-    gen_get_gpr(src1, a->rs1);
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
@@ -33,30 +33,26 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
     tcg_gen_mov_tl(load_res, src1);
     gen_set_gpr(a->rd, load_val);
 
-    tcg_temp_free(src1);
     return true;
 }
 
-static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
+static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 = tcg_temp_new();
-    TCGv src2 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
-    gen_get_gpr(src1, a->rs1);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
-    gen_get_gpr(src2, a->rs2);
     /*
      * Note that the TCG atomic primitives are SC,
      * so we can ignore AQ/RL along this path.
      */
-    tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
+    tcg_gen_atomic_cmpxchg_tl(dest, load_res, load_val, src2,
                               ctx->mem_idx, mop);
-    tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
-    gen_set_gpr(a->rd, dat);
+    tcg_gen_setcond_tl(TCG_COND_NE, dest, dest, load_val);
     tcg_gen_br(l2);
 
     gen_set_label(l1);
@@ -65,8 +61,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
      * provide the memory barrier implied by AQ/RL.
      */
     tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
-    tcg_gen_movi_tl(dat, 1);
-    gen_set_gpr(a->rd, dat);
+    tcg_gen_movi_tl(dest, 1);
 
     gen_set_label(l2);
     /*
@@ -75,9 +70,6 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
      */
     tcg_gen_movi_tl(load_res, -1);
 
-    tcg_temp_free(dat);
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
     return true;
 }
 
@@ -85,17 +77,11 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
                     MemOp mop)
 {
-    TCGv src1 = tcg_temp_new();
-    TCGv src2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
 
-    gen_get_gpr(src1, a->rs1);
-    gen_get_gpr(src2, a->rs2);
-
-    (*func)(src2, src1, src2, ctx->mem_idx, mop);
-
-    gen_set_gpr(a->rd, src2);
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
+    (*func)(dest, src1, src2, ctx->mem_idx, mop);
     return true;
 }
 
-- 
2.25.1


