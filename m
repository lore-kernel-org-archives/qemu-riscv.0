Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4471FEB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:13:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8U-00006v-Kd; Mon, 07 Aug 2023 23:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8S-0008UF-3w
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:52 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8N-00007H-06
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:51 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686efb9ee3cso5007892b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464305; x=1692069105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwVZg9hVOfGDgVMD4IfH/Lu9ETTwX49JH509UmpkQ5U=;
 b=zdi+vdYUKqVD4md4pO4hM60Rx5DjLh3UpZNCYfOuqIM9meR62pck88lIGnbJmZSfZY
 p8BQaWzLo3XuyLy4t7N39DDQ1LUkZOTUjx9sJ/csxmhRILFM0tLAQy8WsC0sZQ//34x7
 5e5DrdtCP99xFuzJlpjJuZz096ipSDns89mgvzRIAvwABxRyLZ29oK4Euhilk4RZivj+
 p2YL9eGXZ2r1q45F3YahyqRTSv4i4+qtKWlf6u9IQoVVKT9V3NOtaeh+PY/VA/XTfa2A
 6MJN5HRJYx+T0FQ53MsKzJt7xlKfnw/GAr92PLv11bhFYLDikjVsbnRewmZJ+YUy6W/h
 HsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464305; x=1692069105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwVZg9hVOfGDgVMD4IfH/Lu9ETTwX49JH509UmpkQ5U=;
 b=G0CaLQFPTyvH/ZoSQ1YSYVJNu/fZgM0VbNqOrl9FFkuIl0TcflnnVPq4+SVkb5BfS5
 C6rtfNlyL3ffxFRSVWF4AkJKMqOcz5NzIVEcqrEUErdTKGtZl2ULM0pNmUtJYvjyj0iO
 mODXzL3Oa5sUY5Fw80mcIqAB63tkfrJ5WWXfms56WTIWm96w5w+jS4AK6MIydkA9469e
 +eSvJkd7J4pTxwoJXp2TM0NgpMPTP+9Jpcl40T0xPZxdRuUKJwsbTM4qvlaFR4eMO0nH
 UkU5mFfdLdN0rz3Oo/Q7K1XCnvIHcEUKlOHriAn70qo7kJAjSJNLBx3Ub4+p3XcI3Bqi
 tthQ==
X-Gm-Message-State: AOJu0Yw69qEErxwF75C40fhWv7zydOyxqSR3zsa8nC9rN6qPNPoyKdCO
 7T4F8lrOcPFuHf+rDhW+Yw6f9A==
X-Google-Smtp-Source: AGHT+IGo5yw1XN0sRPdJVoDmpfz2Fox+O65NKlgnIwCWxAorEY99CKdrs5W7XL8hbJrXEVtEduP+wg==
X-Received: by 2002:a05:6a00:194a:b0:687:596e:fa6a with SMTP id
 s10-20020a056a00194a00b00687596efa6amr13511148pfk.16.1691464305563; 
 Mon, 07 Aug 2023 20:11:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 01/24] tcg: Introduce negsetcond opcodes
Date: Mon,  7 Aug 2023 20:11:20 -0700
Message-Id: <20230808031143.50925-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Introduce a new opcode for negative setcond.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/tcg-ops.rst       |  6 ++++++
 include/tcg/tcg-op-common.h  |  4 ++++
 include/tcg/tcg-op.h         |  2 ++
 include/tcg/tcg-opc.h        |  2 ++
 include/tcg/tcg.h            |  1 +
 tcg/aarch64/tcg-target.h     |  2 ++
 tcg/arm/tcg-target.h         |  1 +
 tcg/i386/tcg-target.h        |  2 ++
 tcg/loongarch64/tcg-target.h |  3 +++
 tcg/mips/tcg-target.h        |  2 ++
 tcg/ppc/tcg-target.h         |  2 ++
 tcg/riscv/tcg-target.h       |  2 ++
 tcg/s390x/tcg-target.h       |  2 ++
 tcg/sparc64/tcg-target.h     |  2 ++
 tcg/tci/tcg-target.h         |  2 ++
 tcg/optimize.c               | 41 +++++++++++++++++++++++++++++++++++-
 tcg/tcg-op.c                 | 36 +++++++++++++++++++++++++++++++
 tcg/tcg.c                    |  6 ++++++
 18 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 6a166c5665..fbde8040d7 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -498,6 +498,12 @@ Conditional moves
        |
        | Set *dest* to 1 if (*t1* *cond* *t2*) is true, otherwise set to 0.
 
+   * - negsetcond_i32/i64 *dest*, *t1*, *t2*, *cond*
+
+     - | *dest* = -(*t1* *cond* *t2*)
+       |
+       | Set *dest* to -1 if (*t1* *cond* *t2*) is true, otherwise set to 0.
+
    * - movcond_i32/i64 *dest*, *c1*, *c2*, *v1*, *v2*, *cond*
 
      - | *dest* = (*c1* *cond* *c2* ? *v1* : *v2*)
diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index be382bbf77..a53b15933b 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -344,6 +344,8 @@ void tcg_gen_setcond_i32(TCGCond cond, TCGv_i32 ret,
                          TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_setcondi_i32(TCGCond cond, TCGv_i32 ret,
                           TCGv_i32 arg1, int32_t arg2);
+void tcg_gen_negsetcond_i32(TCGCond cond, TCGv_i32 ret,
+                            TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_movcond_i32(TCGCond cond, TCGv_i32 ret, TCGv_i32 c1,
                          TCGv_i32 c2, TCGv_i32 v1, TCGv_i32 v2);
 void tcg_gen_add2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 al,
@@ -540,6 +542,8 @@ void tcg_gen_setcond_i64(TCGCond cond, TCGv_i64 ret,
                          TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_setcondi_i64(TCGCond cond, TCGv_i64 ret,
                           TCGv_i64 arg1, int64_t arg2);
+void tcg_gen_negsetcond_i64(TCGCond cond, TCGv_i64 ret,
+                            TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_movcond_i64(TCGCond cond, TCGv_i64 ret, TCGv_i64 c1,
                          TCGv_i64 c2, TCGv_i64 v1, TCGv_i64 v2);
 void tcg_gen_add2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 al,
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index d63683c47b..80cfcf8104 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -200,6 +200,7 @@ DEF_ATOMIC2(tcg_gen_atomic_umax_fetch, i64)
 #define tcg_gen_brcondi_tl tcg_gen_brcondi_i64
 #define tcg_gen_setcond_tl tcg_gen_setcond_i64
 #define tcg_gen_setcondi_tl tcg_gen_setcondi_i64
+#define tcg_gen_negsetcond_tl tcg_gen_negsetcond_i64
 #define tcg_gen_mul_tl tcg_gen_mul_i64
 #define tcg_gen_muli_tl tcg_gen_muli_i64
 #define tcg_gen_div_tl tcg_gen_div_i64
@@ -317,6 +318,7 @@ DEF_ATOMIC2(tcg_gen_atomic_umax_fetch, i64)
 #define tcg_gen_brcondi_tl tcg_gen_brcondi_i32
 #define tcg_gen_setcond_tl tcg_gen_setcond_i32
 #define tcg_gen_setcondi_tl tcg_gen_setcondi_i32
+#define tcg_gen_negsetcond_tl tcg_gen_negsetcond_i32
 #define tcg_gen_mul_tl tcg_gen_mul_i32
 #define tcg_gen_muli_tl tcg_gen_muli_i32
 #define tcg_gen_div_tl tcg_gen_div_i32
diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index acfa5ba753..5044814d15 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -46,6 +46,7 @@ DEF(mb, 0, 0, 1, 0)
 
 DEF(mov_i32, 1, 1, 0, TCG_OPF_NOT_PRESENT)
 DEF(setcond_i32, 1, 2, 1, 0)
+DEF(negsetcond_i32, 1, 2, 1, IMPL(TCG_TARGET_HAS_negsetcond_i32))
 DEF(movcond_i32, 1, 4, 1, IMPL(TCG_TARGET_HAS_movcond_i32))
 /* load/store */
 DEF(ld8u_i32, 1, 1, 1, 0)
@@ -111,6 +112,7 @@ DEF(ctpop_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ctpop_i32))
 
 DEF(mov_i64, 1, 1, 0, TCG_OPF_64BIT | TCG_OPF_NOT_PRESENT)
 DEF(setcond_i64, 1, 2, 1, IMPL64)
+DEF(negsetcond_i64, 1, 2, 1, IMPL64 | IMPL(TCG_TARGET_HAS_negsetcond_i64))
 DEF(movcond_i64, 1, 4, 1, IMPL64 | IMPL(TCG_TARGET_HAS_movcond_i64))
 /* load/store */
 DEF(ld8u_i64, 1, 1, 1, IMPL64)
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0875971719..f00bff9c85 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -104,6 +104,7 @@ typedef uint64_t TCGRegSet;
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        0
 #define TCG_TARGET_HAS_mulsh_i64        0
+#define TCG_TARGET_HAS_negsetcond_i64   0
 /* Turn some undef macros into true macros.  */
 #define TCG_TARGET_HAS_add2_i32         1
 #define TCG_TARGET_HAS_sub2_i32         1
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index ce64de06e5..6080fddf73 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -94,6 +94,7 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
+#define TCG_TARGET_HAS_negsetcond_i32   0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_div_i64          1
@@ -129,6 +130,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
+#define TCG_TARGET_HAS_negsetcond_i64   0
 
 /*
  * Without FEAT_LSE2, we must use LDXP+STXP to implement atomic 128-bit load,
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index c649db72a6..b076d033a9 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -122,6 +122,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_div_i32          use_idiv_instructions
 #define TCG_TARGET_HAS_rem_i32          0
+#define TCG_TARGET_HAS_negsetcond_i32   0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_qemu_ldst_i128   0
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 2a2e3fffa8..41df0e5ae1 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -156,6 +156,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_negsetcond_i32   0
 
 #if TCG_TARGET_REG_BITS == 64
 /* Keep 32-bit values zero-extended in a register.  */
@@ -193,6 +194,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        1
 #define TCG_TARGET_HAS_muluh_i64        0
 #define TCG_TARGET_HAS_mulsh_i64        0
+#define TCG_TARGET_HAS_negsetcond_i64   0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 #else
 #define TCG_TARGET_HAS_qemu_st8_i32     1
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 26f1aab780..ce8fa3507e 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -118,6 +118,7 @@ typedef enum {
 #define TCG_TARGET_HAS_ctpop_i32        0
 #define TCG_TARGET_HAS_brcond2          0
 #define TCG_TARGET_HAS_setcond2         0
+#define TCG_TARGET_HAS_negsetcond_i32   0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 /* 64-bit operations */
@@ -157,6 +158,8 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
+#define TCG_TARGET_HAS_negsetcond_i64   0
+
 #define TCG_TARGET_HAS_qemu_ldst_i128   0
 
 #define TCG_TARGET_DEFAULT_MO (0)
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index dd2efa795c..68e6cc33cc 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -128,6 +128,7 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_bswap32_i32      1
+#define TCG_TARGET_HAS_negsetcond_i32   0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_add2_i32         0
@@ -150,6 +151,7 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_mulsh_i64        1
 #define TCG_TARGET_HAS_ext32s_i64       1
 #define TCG_TARGET_HAS_ext32u_i64       1
+#define TCG_TARGET_HAS_negsetcond_i64   0
 #endif
 
 /* optional instructions detected at runtime */
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 9a41fab8cc..ba4fd3eb3a 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -101,6 +101,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
+#define TCG_TARGET_HAS_negsetcond_i32   0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
@@ -141,6 +142,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
+#define TCG_TARGET_HAS_negsetcond_i64   0
 #endif
 
 #define TCG_TARGET_HAS_qemu_ldst_i128   \
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index e1d8110ee4..b2961fec8e 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -120,6 +120,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_ctpop_i32        have_zbb
 #define TCG_TARGET_HAS_brcond2          1
 #define TCG_TARGET_HAS_setcond2         1
+#define TCG_TARGET_HAS_negsetcond_i32   0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_movcond_i64      1
@@ -158,6 +159,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
+#define TCG_TARGET_HAS_negsetcond_i64   0
 
 #define TCG_TARGET_HAS_qemu_ldst_i128   0
 
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 9a405003b9..24e207c2d4 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -104,6 +104,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
+#define TCG_TARGET_HAS_negsetcond_i32 0
 #define TCG_TARGET_HAS_qemu_st8_i32   0
 
 #define TCG_TARGET_HAS_div2_i64       1
@@ -138,6 +139,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_muls2_i64      HAVE_FACILITY(MISC_INSN_EXT2)
 #define TCG_TARGET_HAS_muluh_i64      0
 #define TCG_TARGET_HAS_mulsh_i64      0
+#define TCG_TARGET_HAS_negsetcond_i64 0
 
 #define TCG_TARGET_HAS_qemu_ldst_i128 1
 
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index d454278811..1faadc704b 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -112,6 +112,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_negsetcond_i32   0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_extrl_i64_i32    1
@@ -149,6 +150,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        use_vis3_instructions
 #define TCG_TARGET_HAS_mulsh_i64        0
+#define TCG_TARGET_HAS_negsetcond_i64   0
 
 #define TCG_TARGET_HAS_qemu_ldst_i128   0
 
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 37ee10c959..ca18ddaaad 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -73,6 +73,7 @@
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
+#define TCG_TARGET_HAS_negsetcond_i32   0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
@@ -114,6 +115,7 @@
 #define TCG_TARGET_HAS_mulu2_i64        1
 #define TCG_TARGET_HAS_muluh_i64        0
 #define TCG_TARGET_HAS_mulsh_i64        0
+#define TCG_TARGET_HAS_negsetcond_i64   0
 #else
 #define TCG_TARGET_HAS_mulu2_i32        1
 #endif /* TCG_TARGET_REG_BITS == 64 */
diff --git a/tcg/optimize.c b/tcg/optimize.c
index d2156367a3..0b4590ec7a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1530,14 +1530,22 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
     if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
         uint64_t tv = arg_info(op->args[3])->val;
         uint64_t fv = arg_info(op->args[4])->val;
-        TCGOpcode opc;
+        TCGOpcode opc, negopc = 0;
 
         switch (ctx->type) {
         case TCG_TYPE_I32:
             opc = INDEX_op_setcond_i32;
+            if (TCG_TARGET_HAS_negsetcond_i32) {
+                negopc = INDEX_op_negsetcond_i32;
+            }
+            tv = (int32_t)tv;
+            fv = (int32_t)fv;
             break;
         case TCG_TYPE_I64:
             opc = INDEX_op_setcond_i64;
+            if (TCG_TARGET_HAS_negsetcond_i64) {
+                negopc = INDEX_op_negsetcond_i64;
+            }
             break;
         default:
             g_assert_not_reached();
@@ -1549,6 +1557,14 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
         } else if (fv == 1 && tv == 0) {
             op->opc = opc;
             op->args[3] = tcg_invert_cond(cond);
+        } else if (negopc) {
+            if (tv == -1 && fv == 0) {
+                op->opc = negopc;
+                op->args[3] = cond;
+            } else if (fv == -1 && tv == 0) {
+                op->opc = negopc;
+                op->args[3] = tcg_invert_cond(cond);
+            }
         }
     }
     return false;
@@ -1759,6 +1775,26 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_negsetcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[3];
+    int i;
+
+    if (swap_commutative(op->args[0], &op->args[1], &op->args[2])) {
+        op->args[3] = cond = tcg_swap_cond(cond);
+    }
+
+    i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
+    if (i >= 0) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], -i);
+    }
+
+    /* Value is {0,-1} so all bits are repititions of the sign. */
+    ctx->s_mask = -1;
+    return false;
+}
+
+
 static bool fold_setcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[5];
@@ -2216,6 +2252,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(setcond):
             done = fold_setcond(&ctx, op);
             break;
+        CASE_OP_32_64(negsetcond):
+            done = fold_negsetcond(&ctx, op);
+            break;
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 7aadb37756..76d2377669 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -276,6 +276,21 @@ void tcg_gen_setcondi_i32(TCGCond cond, TCGv_i32 ret,
     tcg_gen_setcond_i32(cond, ret, arg1, tcg_constant_i32(arg2));
 }
 
+void tcg_gen_negsetcond_i32(TCGCond cond, TCGv_i32 ret,
+                            TCGv_i32 arg1, TCGv_i32 arg2)
+{
+    if (cond == TCG_COND_ALWAYS) {
+        tcg_gen_movi_i32(ret, -1);
+    } else if (cond == TCG_COND_NEVER) {
+        tcg_gen_movi_i32(ret, 0);
+    } else if (TCG_TARGET_HAS_negsetcond_i32) {
+        tcg_gen_op4i_i32(INDEX_op_negsetcond_i32, ret, arg1, arg2, cond);
+    } else {
+        tcg_gen_setcond_i32(cond, ret, arg1, arg2);
+        tcg_gen_neg_i32(ret, ret);
+    }
+}
+
 void tcg_gen_muli_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
 {
     if (arg2 == 0) {
@@ -1567,6 +1582,27 @@ void tcg_gen_setcondi_i64(TCGCond cond, TCGv_i64 ret,
     }
 }
 
+void tcg_gen_negsetcond_i64(TCGCond cond, TCGv_i64 ret,
+                            TCGv_i64 arg1, TCGv_i64 arg2)
+{
+    if (cond == TCG_COND_ALWAYS) {
+        tcg_gen_movi_i64(ret, -1);
+    } else if (cond == TCG_COND_NEVER) {
+        tcg_gen_movi_i64(ret, 0);
+    } else if (TCG_TARGET_HAS_negsetcond_i64) {
+        tcg_gen_op4i_i64(INDEX_op_negsetcond_i64, ret, arg1, arg2, cond);
+    } else if (TCG_TARGET_REG_BITS == 32) {
+        tcg_gen_op6i_i32(INDEX_op_setcond2_i32, TCGV_LOW(ret),
+                         TCGV_LOW(arg1), TCGV_HIGH(arg1),
+                         TCGV_LOW(arg2), TCGV_HIGH(arg2), cond);
+        tcg_gen_neg_i32(TCGV_LOW(ret), TCGV_LOW(ret));
+        tcg_gen_mov_i32(TCGV_HIGH(ret), TCGV_LOW(ret));
+    } else {
+        tcg_gen_setcond_i64(cond, ret, arg1, arg2);
+        tcg_gen_neg_i64(ret, ret);
+    }
+}
+
 void tcg_gen_muli_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
 {
     if (arg2 == 0) {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ddfe9a96cb..b7f8f007ca 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1879,6 +1879,8 @@ bool tcg_op_supported(TCGOpcode op)
     case INDEX_op_sar_i32:
         return true;
 
+    case INDEX_op_negsetcond_i32:
+        return TCG_TARGET_HAS_negsetcond_i32;
     case INDEX_op_movcond_i32:
         return TCG_TARGET_HAS_movcond_i32;
     case INDEX_op_div_i32:
@@ -1977,6 +1979,8 @@ bool tcg_op_supported(TCGOpcode op)
     case INDEX_op_extu_i32_i64:
         return TCG_TARGET_REG_BITS == 64;
 
+    case INDEX_op_negsetcond_i64:
+        return TCG_TARGET_HAS_negsetcond_i64;
     case INDEX_op_movcond_i64:
         return TCG_TARGET_HAS_movcond_i64;
     case INDEX_op_div_i64:
@@ -2510,11 +2514,13 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
             switch (c) {
             case INDEX_op_brcond_i32:
             case INDEX_op_setcond_i32:
+            case INDEX_op_negsetcond_i32:
             case INDEX_op_movcond_i32:
             case INDEX_op_brcond2_i32:
             case INDEX_op_setcond2_i32:
             case INDEX_op_brcond_i64:
             case INDEX_op_setcond_i64:
+            case INDEX_op_negsetcond_i64:
             case INDEX_op_movcond_i64:
             case INDEX_op_cmp_vec:
             case INDEX_op_cmpsel_vec:
-- 
2.34.1


