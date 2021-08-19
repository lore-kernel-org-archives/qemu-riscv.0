Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGdzQ-0006ZL-LA
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 05:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzO-0006QV-3B
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:30 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzM-0000IN-9L
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:29 -0400
Received: by mail-pg1-x530.google.com with SMTP id 17so5266032pgp.4
 for <qemu-riscv@nongnu.org>; Thu, 19 Aug 2021 02:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYb4KcS76i1HvVLzrH2TA0j+WopMecWVOQWs5FlWmg0=;
 b=z1tbT0pEOjFVTEdaTX9BspN+RGALCS79J3etI6vfwi1XtIKeOdc36VShIBtDv3PZDw
 XZSwrh22KtqzqmkCayV//RhvwgLpdaXkAp/QE4sf0tLDT2bgyZasDereoDr0k97tT6rJ
 VxeQOBsJ8CaWWsoJSj4KzQ2/zmQsnkharSjeTOnthZqA7sYWg4gunjAO2x+WCg4uKMw9
 SQ1bCWulXqHRoOkPeH9B3yzjBxG6oVxcdDJ4Qh0vKwnqzM8lwXIyykt3o6JijayTFKpX
 n6fw5dtnArsHcRXG1sYKEVWMeCKITGEnFf9K12mdpQYQgyTuTD0C1Ebyr+mgWhmddleU
 0NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYb4KcS76i1HvVLzrH2TA0j+WopMecWVOQWs5FlWmg0=;
 b=XDuXfKbOFdthAPXJt7qe0aEYh0pfXk+zsFcoI8+I17A/hlHZxCorZrGWQWvOygDsY2
 tadoddArFL78JEEgkvrQVht5xbHA9Hs8UW0YmjvaCx8yu3A6sQsdb9wDbh2IAwaNDtmw
 OmlBP+VugFrgZBCDn5zXVaqfW6NwT2IhU+DPIHNE8XScYMp4ujNsQv0bzucCGdhlVXlH
 U8Hn8dcOv9fpmlvBtVrp/RNoH8pBCnGNeP8yi+z44jUGIY39cnW3Ui/e27bu2aPnXaSt
 7bzRcD8+7myVa1gX3Wdtturng4J61M9Gr07FN+D3knGgjco6jPDO+2cmYOGCdeF+F2Bw
 28hA==
X-Gm-Message-State: AOAM531JGe46K9u7W75Z0IuyIkaIhNTkCjuAJYdQTv6LpxIXnJs4onHi
 dA065FDnXpWDpG8P9RtTivRZsQ==
X-Google-Smtp-Source: ABdhPJwTe9GfDDZRQK1CeSsU+u/D7yn2gpsIz5Ko1/tm8kzmYTRNtDDYueHLToQMG9VVFhPItGL7dg==
X-Received: by 2002:aa7:864e:0:b0:3e3:439b:c3fc with SMTP id
 a14-20020aa7864e000000b003e3439bc3fcmr838262pfo.64.1629363926871; 
 Thu, 19 Aug 2021 02:05:26 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 13/21] target/riscv: Use get_gpr in branches
Date: Wed, 18 Aug 2021 23:04:54 -1000
Message-Id: <20210819090502.428068-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Aug 2021 09:05:30 -0000

Narrow the scope of t0 in trans_jalr.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e25f64c45a..af3e0bc0e6 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -54,24 +54,25 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
 
 static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
-    /* no chaining with JALR */
     TCGLabel *misaligned = NULL;
-    TCGv t0 = tcg_temp_new();
 
-
-    gen_get_gpr(ctx, cpu_pc, a->rs1);
-    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
+    tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
     if (!has_ext(ctx, RVC)) {
+        TCGv t0 = tcg_temp_new();
+
         misaligned = gen_new_label();
         tcg_gen_andi_tl(t0, cpu_pc, 0x2);
         tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
+        tcg_temp_free(t0);
     }
 
     if (a->rd != 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
     }
+
+    /* No chaining with JALR. */
     lookup_and_goto_ptr(ctx);
 
     if (misaligned) {
@@ -80,21 +81,18 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 
-    tcg_temp_free(t0);
     return true;
 }
 
 static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 {
     TCGLabel *l = gen_new_label();
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
 
-    tcg_gen_brcond_tl(cond, source1, source2, l);
+    tcg_gen_brcond_tl(cond, src1, src2, l);
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
+
     gen_set_label(l); /* branch taken */
 
     if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
@@ -105,9 +103,6 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-
     return true;
 }
 
-- 
2.25.1


