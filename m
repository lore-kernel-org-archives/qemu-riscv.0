Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6Ti-0001mY-9W
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Tg-0001hE-Ib
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:32 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Td-0001EZ-KT
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:32 -0400
Received: by mail-pf1-x42e.google.com with SMTP id i133so6627pfe.12
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xy5SxA3eCt2ZryplWXTtOU5Re5HMsxcyIto5021c8Uk=;
 b=uQ+lW1NHaEPZmNkWd/wGYFufGMSrLVR6oHbegb79cg91ln1JHMLjQ7X5zx7r2RC945
 w+kbMt8go39VYFmIjEFpD00f2AQI1neE+7x3LNus0YDxvMpO2W3B/qE7RXTOhDFku0ZS
 H7ojhnnwfm9H8Nr1CYWF/kFA9+Nh2cRbcaSMfGHG4EnnUTZlDyC6RcUwx33Ahxp/3ovC
 W0Yx6pOVSSPgmhuYrrLzULW2MCdCIOnCLTW2zucK2tICyE9CLuBQLZ7Q0OWaMThgKd34
 mug8kEVLPM62t6nJu1Ya37KcPJ7WiqTrX7Tlb2p+xl5JGfMIL81W6Hfjw1oyif1pFZCo
 aTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xy5SxA3eCt2ZryplWXTtOU5Re5HMsxcyIto5021c8Uk=;
 b=Vbzfqkb5NahYspkB1BkHjFC527gxciKSfeON+CT3trxR7PnkqUtpAP+HjVtkIeJ/Xk
 Mik9J+3VTxM7HONXaNkZaGXbCSpcbRIT1EtmfwqBFu9gVHkes0XKK2fWhiRSlW9naCtr
 b7MBWXEjlbb6KlO51P8reGt+77ChsTtds02HIEV3LP0fXXNfs5YD+9iYvczJJT6va8sg
 G9h678UH+b/B9tI3W9nss2NGnxZuNXmxbVQ+H+2EmU8rYmLUEfQQix3kCra0yEwfi3RD
 2OZsGJ+zmAV9sMIXfdrnD4bhVsbsWwvM8gh6250fyVbPo0gKi0rIepu26/qapDJYmFlE
 Pa/w==
X-Gm-Message-State: AOAM531bb8F1YXOEjqPxWsZPg4Dit+4kx4nYiVNpUWCC2I9DJQ9lSSDr
 Of4gGpF/FvXBsk84f5H64SvkWg==
X-Google-Smtp-Source: ABdhPJxTlWgXEs4G+5bkdt4f6ADGqc9WNQvGutQSwJpiVsgEvt/9zGeNkpYa6FX5RKpatawB75iZkQ==
X-Received: by 2002:a65:6805:: with SMTP id l5mr5454651pgt.0.1629235108295;
 Tue, 17 Aug 2021 14:18:28 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 14/21] target/riscv: Use {get,
 dest}_gpr for integer load/store
Date: Tue, 17 Aug 2021 11:17:56 -1000
Message-Id: <20210817211803.283639-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 17 Aug 2021 21:18:32 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 36 +++++++++++++------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index af3e0bc0e6..f616a26c82 100644
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


