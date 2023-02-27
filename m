Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW88-0004Sn-Pq
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6Y-0006hK-GQ
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:18 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6W-0000ls-Do
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:17 -0500
Received: by mail-pl1-x633.google.com with SMTP id i10so5520442plr.9
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDr/G0N/cf+m+hkGWa1ktDxEpYaGWUpfy88lZunNdyw=;
 b=Wq397ahEu0zx/lALFZbph690aHd0waUNwZIu80MsXgUqMEhT071R+/t+P7KBlw5tFk
 uqAgVfqEdGtiFQu0i2GzPm4dKtLuycFYj4xJ6wUiciNTxLxPiV/65OW2uHH4Jgw7ZZGT
 RW3iGt5LU7jHKZxTM2+NsCOnLkKnkXCdhxNwyClhQ4cMDCWDsPKTK4SqtZgnHpyXiVUX
 UZ+TneoTUztHB3NuIBHMIL0STtWquvaWQgTU5p/QhsmdHJ2ww07lVvhDoku5z4YfcQ3X
 44GCniwdGQ7KtQt3GiV1zcdRknkFIAkfLgO5BZuGxJ/l4xJky/d3ru1SNxDJ+saNdUOS
 P/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDr/G0N/cf+m+hkGWa1ktDxEpYaGWUpfy88lZunNdyw=;
 b=mJ20xOVP5rpuv4ayjGI4iTpN4BR1a34zhd/LB1zZqsCAPGGvdsVwpZXaXgIweKwd0R
 ty7Sz6ysbsWKkTKssqLg/t3TnlPSuhXn+RSxB4h3+YLelbcPnOzdxAFXTzAiTc1a469i
 J6x9NqnJFmBMKYxqjfHfpeZwViEnUstuRhysHCn8PooCoK+D8mcwgwniv06Kb9hIgMRh
 su02NVr6SUIyKrKrWF7tZc3NRuvjvZ89zbF/QYqSQ1kZ3nz3gCdAERp7/UL4GQj+JnWu
 uL86YO3S1jAeKnw4Vm+/V+4V5Hk32RfWxkZTZbXwHeYIZY399r2pfw+0sUyog/uBKjVV
 gw0Q==
X-Gm-Message-State: AO0yUKWUOTAW4WDJ8JKLul9kRF5xIvSlaIDEHWbrBczXh/hBbFQQnzPW
 ik0N8iAFxVEdtdvPXD4psIW2jA==
X-Google-Smtp-Source: AK7set+2AYcvaDaYBbJMsQQsTRDIh6wjQqitOTI2wGFmjhd3GI72jKoLotJXOEXegsM3xFkg19IggA==
X-Received: by 2002:a17:90b:3906:b0:234:7ccf:3c7c with SMTP id
 ob6-20020a17090b390600b002347ccf3c7cmr8319993pjb.9.1677475875327; 
 Sun, 26 Feb 2023 21:31:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 66/76] target/sparc: Drop get_temp_i32
Date: Sun, 26 Feb 2023 19:24:55 -1000
Message-Id: <20230227052505.352889-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:18 -0000

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 2b4af692f6..bdf464f802 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -84,8 +84,6 @@ typedef struct DisasContext {
 
     uint32_t cc_op;  /* current CC operation */
     sparc_def_t *def;
-    TCGv_i32 t32[3];
-    int n_t32;
 #ifdef TARGET_SPARC64
     int fprs_dirty;
     int asi;
@@ -129,14 +127,6 @@ static int sign_extend(int x, int len)
 
 #define IS_IMM (insn & (1<<13))
 
-static inline TCGv_i32 get_temp_i32(DisasContext *dc)
-{
-    TCGv_i32 t;
-    assert(dc->n_t32 < ARRAY_SIZE(dc->t32));
-    dc->t32[dc->n_t32++] = t = tcg_temp_new_i32();
-    return t;
-}
-
 static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 {
 #if defined(TARGET_SPARC64)
@@ -153,7 +143,7 @@ static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 /* floating point registers moves */
 static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
 {
-    TCGv_i32 ret = get_temp_i32(dc);
+    TCGv_i32 ret = tcg_temp_new_i32();
     if (src & 1) {
         tcg_gen_extrl_i64_i32(ret, cpu_fpr[src / 2]);
     } else {
@@ -175,7 +165,7 @@ static void gen_store_fpr_F(DisasContext *dc, unsigned int dst, TCGv_i32 v)
 
 static TCGv_i32 gen_dest_fpr_F(DisasContext *dc)
 {
-    return get_temp_i32(dc);
+    return tcg_temp_new_i32();
 }
 
 static TCGv_i64 gen_load_fpr_D(DisasContext *dc, unsigned int src)
@@ -5516,7 +5506,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         break;
                     }
 #endif
-                    cpu_dst_32 = get_temp_i32(dc);
+                    cpu_dst_32 = tcg_temp_new_i32();
                     tcg_gen_qemu_ld_i32(cpu_dst_32, cpu_addr,
                                         dc->mem_idx, MO_TEUL);
                     gen_helper_ldfsr(cpu_fsr, cpu_env, cpu_fsr, cpu_dst_32);
@@ -5762,14 +5752,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     gen_exception(dc, TT_NCP_INSN);
     goto egress;
 #endif
- egress:
-    if (dc->n_t32 != 0) {
-        int i;
-        for (i = dc->n_t32 - 1; i >= 0; --i) {
-            tcg_temp_free_i32(dc->t32[i]);
-        }
-        dc->n_t32 = 0;
-    }
+ egress:;
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


