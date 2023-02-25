Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqjy-0000jI-Fa
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjL-0006UE-8B
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:38 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjF-0003Sl-7y
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:34 -0500
Received: by mail-pf1-x431.google.com with SMTP id ce7so836340pfb.9
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDr/G0N/cf+m+hkGWa1ktDxEpYaGWUpfy88lZunNdyw=;
 b=EOcCQbyrefHbsIPR+5g4rDbR23GKpsshBvFSIO3044iD+lg07s+ttW/dAG07d7I7fV
 pErL4MmEn9DcuLUSMwyEcLTUOp0anSWgVW3p40bv2ThvEZ/z0tXvTHoz1tXOXTmoQQ7A
 bobYBXU43SjNQRHJ5/E18ZAB53lozqQz24c1lGzWGq5FiEPs4F5BBYWJEpmCsmkyA7qN
 iub4s0Hq/vbjePWQnl8OfyYayNyxYAD/Rf8dUgGboSaplaKTXUmWr9GwwaG09QsOSt5J
 PrR1Cb/DrOy3UsXTXczIpLzqPZJxyP0mwjcvLHUsuiBjUv7axmkCOm3YqEGzrm9BxXw/
 X1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDr/G0N/cf+m+hkGWa1ktDxEpYaGWUpfy88lZunNdyw=;
 b=ZuzKJEzEIYkCsfe/whTG79FMeUHGuLWffkSZh9o9svifodJHLOGnTV8HOBf50hJBoY
 DDWHpAMVH/LmNP02yDb6m7/ineIqmOFCvDMm/tnE4ZAkQbKhHtPZRjNI95sAuvngbdID
 RpF3NmkHrjVRakx8pMLDcQpd41kK7NLpi2aeJVdBZ0kPpY1AYZTPISdJLECJrfwDHEMO
 OlBIwSkIObOqAqrC/URFb8z+WMZ0w7pN0pmSFcW055XLJ2bL8RsKzcohnMga5lRtLUm/
 /zoivPg8viYpJ2XUUABHnJl6mYvrQvyqCAho+J1jZZGHZlKTpHJGECkb0///dzd032qC
 RPqw==
X-Gm-Message-State: AO0yUKVlAkz1ieRW6WZHUMa14ldCIFWoPDUnd9E7U3Y/mZVE3710Qpqr
 pTby3i7sYgWAZOT3F1xIKY2i6g==
X-Google-Smtp-Source: AK7set/p0jZiamtYV7Z7uvZo8QhZqalzXarDFSTQcnEXwtc+ExaxG4GPPEOQwzpR2248bUBtLBVoWQ==
X-Received: by 2002:a62:5105:0:b0:5b6:c62e:7d4f with SMTP id
 f5-20020a625105000000b005b6c62e7d4fmr15671817pfb.8.1677316824614; 
 Sat, 25 Feb 2023 01:20:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 66/76] target/sparc: Drop get_temp_i32
Date: Fri, 24 Feb 2023 23:14:17 -1000
Message-Id: <20230225091427.1817156-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:40 -0000

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


