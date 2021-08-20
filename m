Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YS-0006JN-42
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YG-0005u4-PJ
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:32 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YB-00040W-JE
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:32 -0400
Received: by mail-pg1-x52d.google.com with SMTP id y23so9882535pgi.7
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qlhkq1KnWytqWQYMYVE1HHAXhG14CZ9/5+/6OOdC+lU=;
 b=U4WC6RzSaZrBAdintROdZOymM3Uu44NQUMyxzlA4Y63B2uo0frVBwAb/WJ+kBcd+fW
 ijkzzU0sTVYZYMoDP1XqPqfPW1f32RBGNAzZuxlmtZOVGUW43VQUgOfK0bfU6v3v5yGn
 TomLxQO5wiHqK3LoFRdDsnXwuWKwPCu5agag9VQ1xCQXxRNbt/4yoyT1cKFZ2SUO4Tl8
 ktd0sWlbxMDf/vN4vNUMwWKohQzsOcwhL9q2BbnYhR+7MUld6lbKDstkEpgzS9VzhsUW
 nT87CnG/zlrRZZFvEtihw9Vx604ZB/vWczQTbbRhKFMT5eFq6SWAPXthixaoaYMsMfUs
 uBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qlhkq1KnWytqWQYMYVE1HHAXhG14CZ9/5+/6OOdC+lU=;
 b=CxPUa/qgQG3+uDIn4juBAosyrRN5IZclQIt/Ynu3zn6lAudDlklVLzAPHjQtK5H0n1
 2HEiVwvLfMDe1uy+BUurDwSsl9yWBU5C3q0GxXyTbU6KRDdCDSgk6k+spF0ByH81ebLy
 fsy23/2eeBPyWLSNWmlzaLbArT2qm2P6TUdB6ytxMn6fZBnXa8BkHJe3UJDtFaGRNfAR
 LvY6FtcpOuUjp5OYf5rViDi5Wh73UIlY/hWuDadraf4K4SxXA4ezVnNre6OccwHEc0u7
 gjSXkCdQqz+pOXdZlQhkVHuc1qvqMHm/g+13Jg5XaKbWPpyqjfrlQb8Gn3i8IgIHKvU/
 6USg==
X-Gm-Message-State: AOAM531x7SuFs8K6ov4ucPjxyDJZB645HqiZrFptcTSPzHljjzq1imug
 CAeRMp8K250iNicR58aTyLgvlQ==
X-Google-Smtp-Source: ABdhPJz4M9tjF0gxl6Yq+WZxsuk5spzqS3mMNzPttrsqIYaZ7i+AMBi8ArRAvtbCVaAKbHUTX5Q9WA==
X-Received: by 2002:a05:6a00:2150:b029:399:711c:826f with SMTP id
 o16-20020a056a002150b0290399711c826fmr20515571pfk.14.1629481406230; 
 Fri, 20 Aug 2021 10:43:26 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 16/21] target/riscv: Use {get,dest}_gpr for RVA
Date: Fri, 20 Aug 2021 07:42:52 -1000
Message-Id: <20210820174257.548286-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:33 -0000

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rva.c.inc | 47 ++++++++++---------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 3cc3c3b073..6ea07d89b0 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -18,11 +18,10 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
+static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 = tcg_temp_new();
-    /* Put addr in load_res, data in load_val.  */
-    gen_get_gpr(ctx, src1, a->rs1);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
+
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
@@ -30,33 +29,33 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
+
+    /* Put addr in load_res, data in load_val.  */
     tcg_gen_mov_tl(load_res, src1);
     gen_set_gpr(ctx, a->rd, load_val);
 
-    tcg_temp_free(src1);
     return true;
 }
 
-static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
+static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 = tcg_temp_new();
-    TCGv src2 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
+    TCGv dest, src1, src2;
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
-    gen_get_gpr(ctx, src1, a->rs1);
+    src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
-    gen_get_gpr(ctx, src2, a->rs2);
     /*
      * Note that the TCG atomic primitives are SC,
      * so we can ignore AQ/RL along this path.
      */
-    tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
+    dest = dest_gpr(ctx, a->rd);
+    src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    tcg_gen_atomic_cmpxchg_tl(dest, load_res, load_val, src2,
                               ctx->mem_idx, mop);
-    tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
-    gen_set_gpr(ctx, a->rd, dat);
+    tcg_gen_setcond_tl(TCG_COND_NE, dest, dest, load_val);
+    gen_set_gpr(ctx, a->rd, dest);
     tcg_gen_br(l2);
 
     gen_set_label(l1);
@@ -65,8 +64,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
      * provide the memory barrier implied by AQ/RL.
      */
     tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
-    tcg_gen_movi_tl(dat, 1);
-    gen_set_gpr(ctx, a->rd, dat);
+    gen_set_gpr(ctx, a->rd, tcg_constant_tl(1));
 
     gen_set_label(l2);
     /*
@@ -75,9 +73,6 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
      */
     tcg_gen_movi_tl(load_res, -1);
 
-    tcg_temp_free(dat);
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
     return true;
 }
 
@@ -85,17 +80,13 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
                     MemOp mop)
 {
-    TCGv src1 = tcg_temp_new();
-    TCGv src2 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
 
-    gen_get_gpr(ctx, src1, a->rs1);
-    gen_get_gpr(ctx, src2, a->rs2);
+    func(dest, src1, src2, ctx->mem_idx, mop);
 
-    (*func)(src2, src1, src2, ctx->mem_idx, mop);
-
-    gen_set_gpr(ctx, a->rd, src2);
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
-- 
2.25.1


