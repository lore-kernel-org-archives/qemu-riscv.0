Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6G-0006qR-8F
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5n-0006D0-Az
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:27 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5d-0001Su-36
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:23 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 17so7606916pfz.4
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DkRSjZK4s1X6JiwKyTRkh9Sv6TW6zjiR4pJsIp26yK4=;
 b=dYpR5sCQ/MBKQk+9TLiHzrj2ulvjmAuAd1wwtBlGHkxzlYrLO7GY+EBa88gM6m07rL
 v+drd/gYuUlRWVRQgwlcFv0XgRyAZ/laoF5ydVKtKj1IISxrbDxHUdccKyWi+EKifhob
 giijSTAtuXNRDhQ1E7tyb2JG1WkBQDaGdNpHLmKDB1TkjDlBhXEvtAwFq+0WtIHeMbYb
 Q5EDYz6aErTiPtTBH6qc44Wk7yq5Z9/za/GMrzC1ThAO/766sQKQneHep06QJajOmbvE
 UOKFGoppp7HQk0qdx24F3u8YYsGh4ciX57NNdeY7il2CPk9E5QbjjpY89vlHWCT8UWDO
 W2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DkRSjZK4s1X6JiwKyTRkh9Sv6TW6zjiR4pJsIp26yK4=;
 b=Thi2fMzkL/eCu/FanAwmVPToWtzLjSkCp3hFlzeiPA+XajWfPntsCWfoCvjHLZ7+VK
 COcr1JfmDuZhkJUlRRn/ShlUHTcywyhEuB9jTKoaRbZZy9hPzM0QcOi4jKS6JCvNbwdU
 5pFnK192VLyzvQjtrRz6234jTauixQkbK0UB8xj+Ky+Tw5Ekw7TGwv2zrY0qm/MzNv/4
 HJri0PC0odccnldGUQ+ftivRH/XcHGbBlKFYs1koO3u0SKvW9dl5ieSrz4mnPzxFKk4M
 ZFsuXu4m7V9YZN16xhkrl/U7uSS2oMa0ijnTDXqbzotAh93P2+Ajm/Vnl1BdPSBtGrkY
 0Xfg==
X-Gm-Message-State: AOAM53018ScCffeQ7enFtKOf3PgOJkfaIxSOMKQAhwpbPsLY9HO3x2dV
 XuisaECXrhcqTqRp4EWQzLLpTi9DJmQs/w==
X-Google-Smtp-Source: ABdhPJyuubcrSP8Nsl6YWMhgWUEHvsG9aF1VeYJ8TDU8ntkUScv/w9VfxcnHaDRxyV8RyRtuthzpdA==
X-Received: by 2002:a63:fa50:: with SMTP id g16mr36247530pgk.16.1625804771424; 
 Thu, 08 Jul 2021 21:26:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 03/17] target/riscv: Use gpr_{src,dst} in shift operations
Date: Thu,  8 Jul 2021 21:25:54 -0700
Message-Id: <20210709042608.883256-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:28 -0000

These operations are slightly more complicated since
we need to crop the shift operand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 68 +++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 42 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2cfcb849b8..a60b198623 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -778,18 +778,14 @@ static bool gen_arith(DisasContext *ctx, arg_r *a,
 static bool gen_shift(DisasContext *ctx, arg_r *a,
                         void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-
-    tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_gen_andi_tl(ext2, src2, TARGET_LONG_BITS - 1);
+    (*func)(dest, src1, ext2);
+    tcg_temp_free(ext2);
     return true;
 }
 
@@ -805,58 +801,46 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 static bool gen_shifti(DisasContext *ctx, arg_shift *a,
                        void(*func)(TCGv, TCGv, TCGv))
 {
+    TCGv dest, src1, src2;
+
     if (a->shamt >= TARGET_LONG_BITS) {
         return false;
     }
 
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    dest = gpr_dst(ctx, a->rd);
+    src1 = gpr_src(ctx, a->rs1);
+    src2 = tcg_constant_tl(a->shamt);
 
-    gen_get_gpr(source1, a->rs1);
-
-    tcg_gen_movi_tl(source2, a->shamt);
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    (*func)(dest, src1, src2);
     return true;
 }
 
 static bool gen_shiftw(DisasContext *ctx, arg_r *a,
                        void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    tcg_gen_andi_tl(ext2, src2, 31);
+    (*func)(dest, src1, ext2);
+    tcg_gen_ext32s_tl(dest, dest);
 
-    tcg_gen_andi_tl(source2, source2, 31);
-    (*func)(source1, source1, source2);
-    tcg_gen_ext32s_tl(source1, source1);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_temp_free(ext2);
     return true;
 }
 
 static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
                         void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = tcg_constant_tl(a->shamt);
 
-    gen_get_gpr(source1, a->rs1);
-    tcg_gen_movi_tl(source2, a->shamt);
+    (*func)(dest, src1, src2);
+    tcg_gen_ext32s_tl(dest, dest);
 
-    (*func)(source1, source1, source2);
-    tcg_gen_ext32s_tl(source1, source1);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
     return true;
 }
 
-- 
2.25.1


