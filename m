Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bf-0004Dl-Fu
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aw-0008Vl-EL
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:08:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aR-0005rc-CZ
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:08:09 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so29594165e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097647; x=1685689647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmKM8rjtmKZde67WpB0XICl6ZGDTJWgOM1OCctjceu0=;
 b=EL6STVPJiUSqzELjRYBDD6+uAVvIt23+Z7I11Gs8XARTyUru2JB8MBXM96Q+4HM2Od
 VxDXkrXYxnWUhlZcyW8VHpYcnVmf+y3U0vsM0vNl0c4zczAy3WZ8J+3/G0niZSSF/3XY
 1S9bSkbA0xgL9ukvDP8gs9ha5nIsn+46NUFElTk9FAVI2HuV/+jcwVjYarpYnVc4H/Z+
 NKdqtO6bpIkhlLiYwL4s/YTsLBqAQ03MnL4sMZyPCFFAbwINacqB2CuamiX7lqDuFagx
 UJJpnejI/1ztJr8O5LeWUzk7eI7edBKODtJVbgZTiUUCnB5Hx5RMj+TVMmtdXl3wj4so
 N8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097647; x=1685689647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MmKM8rjtmKZde67WpB0XICl6ZGDTJWgOM1OCctjceu0=;
 b=J7XEexCJXQ/3WOeSYyT9Gv3fGFQWB5T2t4ScVTooSCS3S/alAqJ9AktufjNnqlxlHW
 cL1lPgcwnYJW6sa+WSqtd74KHDKJnOX8iz+D47gayf60OC2WBmrTUrsxJCslm8zJHwbU
 GxsrvQxB3Q7fuh0tFM+WtLhb0ZjfwGDbDavxYTHauhTQwLyoYsqw1CDF1T6cx+QFydbB
 pKRhq7ppZthkXAHvaZ9Vfw4M5FQO8EvTfYek7dWpHmUeQqPDByl8sbfqLXiTxpUeHyrG
 Y8Ayap6PX+7ARYXa4MN5iCBhsXSrK3jRYfCKJx6D/hJwcdO94av67pnwRHB49+7/XtEw
 OEWg==
X-Gm-Message-State: AC+VfDw9EU2eB1zV314RenESfmzZknZrdj+662QDEc/+a9NWUpkLArXJ
 wPspT+Lwe42c8ZKpHWv+pi6gMYibGMp9hnqvw8Ef5A==
X-Google-Smtp-Source: ACHHUZ6k033h92ArDFP2NCEXxbrtCbQoAVCIp45xj+kipjc0JrCVErHef/m0TRHuOe0AKktI01BVfQ==
X-Received: by 2002:a7b:c4c1:0:b0:3f0:5519:9049 with SMTP id
 g1-20020a7bc4c1000000b003f055199049mr15033804wmk.8.1683097646818; 
 Wed, 03 May 2023 00:07:26 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 39/57] tcg: Introduce tcg_target_has_memory_bswap
Date: Wed,  3 May 2023 08:06:38 +0100
Message-Id: <20230503070656.1746170-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:08:14 -0000

Replace the unparameterized TCG_TARGET_HAS_MEMORY_BSWAP macro
with a function with a memop argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h         |  1 -
 tcg/arm/tcg-target.h             |  1 -
 tcg/i386/tcg-target.h            |  3 ---
 tcg/loongarch64/tcg-target.h     |  2 --
 tcg/mips/tcg-target.h            |  2 --
 tcg/ppc/tcg-target.h             |  1 -
 tcg/riscv/tcg-target.h           |  2 --
 tcg/s390x/tcg-target.h           |  2 --
 tcg/sparc64/tcg-target.h         |  1 -
 tcg/tcg-internal.h               |  2 ++
 tcg/tci/tcg-target.h             |  2 --
 tcg/tcg-op.c                     | 20 +++++++++++---------
 tcg/aarch64/tcg-target.c.inc     |  5 +++++
 tcg/arm/tcg-target.c.inc         |  5 +++++
 tcg/i386/tcg-target.c.inc        |  5 +++++
 tcg/loongarch64/tcg-target.c.inc |  5 +++++
 tcg/mips/tcg-target.c.inc        |  5 +++++
 tcg/ppc/tcg-target.c.inc         |  5 +++++
 tcg/riscv/tcg-target.c.inc       |  5 +++++
 tcg/s390x/tcg-target.c.inc       |  5 +++++
 tcg/sparc64/tcg-target.c.inc     |  5 +++++
 tcg/tci/tcg-target.c.inc         |  5 +++++
 22 files changed, 63 insertions(+), 26 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 3c0b0d312d..378e01d9d8 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -154,7 +154,6 @@ extern bool have_lse2;
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
-#define TCG_TARGET_HAS_MEMORY_BSWAP     0
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index def2a189e6..4c2d3332d5 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -150,7 +150,6 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
-#define TCG_TARGET_HAS_MEMORY_BSWAP     0
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 0421776cb8..8fe6958abd 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -240,9 +240,6 @@ extern bool have_atomic16;
 #include "tcg/tcg-mo.h"
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
-
-#define TCG_TARGET_HAS_MEMORY_BSWAP  have_movbe
-
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 17b8193aa5..75c3d80ed2 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -173,6 +173,4 @@ typedef enum {
 
 #define TCG_TARGET_NEED_LDST_LABELS
 
-#define TCG_TARGET_HAS_MEMORY_BSWAP 0
-
 #endif /* LOONGARCH_TCG_TARGET_H */
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 42bd7fff01..47088af9cb 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -205,8 +205,6 @@ extern bool use_mips32r2_instructions;
 #endif
 
 #define TCG_TARGET_DEFAULT_MO           0
-#define TCG_TARGET_HAS_MEMORY_BSWAP     0
-
 #define TCG_TARGET_NEED_LDST_LABELS
 
 #endif
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index af81c5a57f..d55f0266bb 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -179,7 +179,6 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
-#define TCG_TARGET_HAS_MEMORY_BSWAP     1
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index dddf2486c1..dece3b3c27 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -168,6 +168,4 @@ typedef enum {
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
-#define TCG_TARGET_HAS_MEMORY_BSWAP 0
-
 #endif
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index a05b473117..fe05680124 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -172,8 +172,6 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_BY_REF
 #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_BY_REF
 
-#define TCG_TARGET_HAS_MEMORY_BSWAP   1
-
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 7434cc99d4..f6cd86975a 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -154,7 +154,6 @@ extern bool use_vis3_instructions;
 #define TCG_AREG0 TCG_REG_I0
 
 #define TCG_TARGET_DEFAULT_MO (0)
-#define TCG_TARGET_HAS_MEMORY_BSWAP     1
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 0f1ba01a9a..67b698bd5c 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -126,4 +126,6 @@ static inline TCGv_i64 TCGV128_HIGH(TCGv_i128 t)
     return temp_tcgv_i64(tcgv_i128_temp(t) + o);
 }
 
+bool tcg_target_has_memory_bswap(MemOp memop);
+
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 7140a76a73..364012e4d2 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -176,6 +176,4 @@ typedef enum {
    We prefer consistency across hosts on this.  */
 #define TCG_TARGET_DEFAULT_MO  (0)
 
-#define TCG_TARGET_HAS_MEMORY_BSWAP     1
-
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 9101d334b6..85f22458c9 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2959,7 +2959,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     oi = make_memop_idx(memop, idx);
 
     orig_memop = memop;
-    if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
+    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
         memop &= ~MO_BSWAP;
         /* The bswap primitive benefits from zero-extended input.  */
         if ((memop & MO_SSIZE) == MO_SW) {
@@ -2996,7 +2996,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     memop = tcg_canonicalize_memop(memop, 0, 1);
     oi = make_memop_idx(memop, idx);
 
-    if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
+    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
         swap = tcg_temp_ebb_new_i32();
         switch (memop & MO_SIZE) {
         case MO_16:
@@ -3045,7 +3045,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     oi = make_memop_idx(memop, idx);
 
     orig_memop = memop;
-    if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
+    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
         memop &= ~MO_BSWAP;
         /* The bswap primitive benefits from zero-extended input.  */
         if ((memop & MO_SIGN) && (memop & MO_SIZE) < MO_64) {
@@ -3091,7 +3091,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     memop = tcg_canonicalize_memop(memop, 1, 1);
     oi = make_memop_idx(memop, idx);
 
-    if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
+    if ((memop & MO_BSWAP) && !tcg_target_has_memory_bswap(memop)) {
         swap = tcg_temp_ebb_new_i64();
         switch (memop & MO_SIZE) {
         case MO_16:
@@ -3168,11 +3168,6 @@ static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
     tcg_debug_assert((orig & MO_SIZE) == MO_128);
     tcg_debug_assert((orig & MO_SIGN) == 0);
 
-    /* Use a memory ordering implemented by the host. */
-    if (!TCG_TARGET_HAS_MEMORY_BSWAP && (orig & MO_BSWAP)) {
-        mop_1 &= ~MO_BSWAP;
-    }
-
     /* Reduce the size to 64-bit. */
     mop_1 = (mop_1 & ~MO_SIZE) | MO_64;
 
@@ -3202,6 +3197,13 @@ static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
     default:
         g_assert_not_reached();
     }
+
+    /* Use a memory ordering implemented by the host. */
+    if ((orig & MO_BSWAP) && !tcg_target_has_memory_bswap(mop_1)) {
+        mop_1 &= ~MO_BSWAP;
+        mop_2 &= ~MO_BSWAP;
+    }
+
     ret[0] = mop_1;
     ret[1] = mop_2;
 }
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 09c9ecad0f..8e5f3d3688 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1595,6 +1595,11 @@ typedef struct {
     TCGType index_ext;
 } HostAddress;
 
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return false;
+}
+
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_REG_TMP }
 };
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index eb0542f32e..e5aed03247 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1325,6 +1325,11 @@ typedef struct {
     bool index_scratch;
 } HostAddress;
 
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return false;
+}
+
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     /* We arrive at the slow path via "BLNE", so R14 contains l->raddr. */
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index e78d4d4aa7..7c72bf6684 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1776,6 +1776,11 @@ typedef struct {
     int seg;
 } HostAddress;
 
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return have_movbe;
+}
+
 /*
  * Because i686 has no register parameters and because x86_64 has xchg
  * to handle addr/data register overlap, we have placed all input arguments
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 20cb21b264..62bf823084 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -828,6 +828,11 @@ typedef struct {
     TCGReg index;
 } HostAddress;
 
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return false;
+}
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index fa0f334e8d..cd0254a0d7 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1141,6 +1141,11 @@ typedef struct {
     MemOp align;
 } HostAddress;
 
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return false;
+}
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 733f67c7a5..f0a4118bbb 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2017,6 +2017,11 @@ typedef struct {
     TCGReg index;
 } HostAddress;
 
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return true;
+}
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 415e6c6e15..37870c89fc 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -853,6 +853,11 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     tcg_debug_assert(ok);
 }
 
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return false;
+}
+
 /* We have three temps, we might as well expose them. */
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 3, .tmp = { TCG_REG_TMP0, TCG_REG_TMP1, TCG_REG_TMP2 }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index de8aed5f77..22f0206b5a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1574,6 +1574,11 @@ typedef struct {
     int disp;
 } HostAddress;
 
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return true;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
                                    HostAddress h)
 {
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 0237188d65..bb23038529 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1011,6 +1011,11 @@ typedef struct {
     TCGReg index;
 } HostAddress;
 
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return true;
+}
+
 /*
  * For softmmu, perform the TLB load and compare.
  * For useronly, perform any required alignment tests.
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e31640d109..89f693050c 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -964,3 +964,8 @@ static void tcg_target_init(TCGContext *s)
 static inline void tcg_target_qemu_prologue(TCGContext *s)
 {
 }
+
+bool tcg_target_has_memory_bswap(MemOp memop)
+{
+    return true;
+}
-- 
2.34.1


