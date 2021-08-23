Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG34-0006oV-9V
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2z-0006Wz-P0
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:53 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2p-0003A5-JH
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:53 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y190so16335933pfg.7
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3svrSKGyK2gNLdmgDufB06u2LSjvvw9Nja4N3/DHvjo=;
 b=IYklu0hY2DkuIvJjWuViiTKS2WLDUveaxGSz23O+ujEoSztmHcqo5Dk24/tOkEfFEr
 0uMs/evghT0CW5Jkq3vub5Xc18Pwo9gPoob47Z1mM/HXHcZZe6AbJXCuVXNpGA1+kX3+
 gP/wCB+0Un9gGqOwV/bg65VC/FhhK6UuB/+MoZtqFucIOczTBeO/JU7JaisZF8xg/a8f
 spWdR9DgWIME0MqkXByH1EaE3qdDUhVpaP76f2OF9S1CBnAtk/AQLEWkZdFLC3le5lJ9
 VaoxnvVNT0cHA+piZuIWitMRKtdF1q6B/Oci+va72610s6+oqHT0WSREivlBwh6hElhY
 AZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3svrSKGyK2gNLdmgDufB06u2LSjvvw9Nja4N3/DHvjo=;
 b=tVkpPNjvJPyANFpGurjKDTPgbYWKg7Gt73qn0K2XlhJUGMxYYFxcq2ObhJj0iMO4PO
 v98umCG8x9rMqyArxzoAtVi9MGbMSpLP1/AcTFQon34OGH5xdM6p88+BV7khxMjqJmYJ
 2PwSgwoJ7w2DaM/hvYcysfEKTmgSuc6cAcKOofjEj+rnAD6GW4HqMDRC9ghnNMnmCdqv
 x1AHYa70eQuzRO07tmyQTc/q1Q3Q4hpGxaVprBJHyreTLzeLE2zw5n+xbSeTHDgu+1ti
 Z2b/tsC5Cznh1jIwrV7fzxH2NMrfBjfInqbVr5ttBQAN2pG+slAul0PoQLa41QYSjaD5
 gpiA==
X-Gm-Message-State: AOAM5333pae3CR+ZZ9N2pONF/4iHgrKJUP9lpZ3wH2bysIDl1QioB/qL
 8SVy6CvW1AUr7K5ZwF3p5LyZMg==
X-Google-Smtp-Source: ABdhPJw+C/SrOslihFyfmGcmrZeRGTPAqkxEs7Aoz/mG44FIfbp7d0Ht0oklkEfrltT2vxPt4IRScQ==
X-Received: by 2002:aa7:880f:0:b029:3e0:6f99:1f88 with SMTP id
 c15-20020aa7880f0000b02903e06f991f88mr35489825pfo.38.1629748541919; 
 Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 15/24] target/riscv: Use {get,
 dest}_gpr for integer load/store
Date: Mon, 23 Aug 2021 12:55:20 -0700
Message-Id: <20210823195529.560295-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:54 -0000

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 36 +++++++++++++------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index a5249e71c2..76454fb7e2 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -138,15 +138,17 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
 
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
-    gen_set_gpr(ctx, a->rd, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -177,19 +179,19 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
-    gen_get_gpr(ctx, dat, a->rs2);
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
 
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
 }
 
-
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
     return gen_store(ctx, a, MO_SB);
-- 
2.25.1


