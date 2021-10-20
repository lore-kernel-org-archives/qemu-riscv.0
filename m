Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md26U-0006rD-Az
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26S-0006la-2H
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26Q-00012v-8T
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:19 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w17so3283418plg.9
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqYHtG7U6Thazj4+tYJjUHiaULEjGKehA71xuneoPd8=;
 b=XQwFxjjPPEYf8nQbLsmMSXt9YdIBCFiR/h040uAcy0bX2lHy+Bzn75A4qsjOZg2aPX
 HUo07YLRtLeWJGqp95wy1HMZtwvenSz5PoFtnHwaZHljJSecRQ6Kh2FRRkH0vACfc1ol
 sOpK56AIIr5T1efzOXbEj9xwt1aXpcKwAXfWcE+nmfvBYt5CPqajCO0qR64FxIRLc4ti
 0Ei4sHtf40S8Ygo3hvJ+XU5KbOdWB0Zxkoet6oqu3ud6uXUmGbevu97zwAaKSQz+7a8k
 hPAZ5nsglOTeFpvCubkIb3sbKrpioz/8B715m+SE1M61+CZBiqsRZsnbmACuo8lZSvsL
 36PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqYHtG7U6Thazj4+tYJjUHiaULEjGKehA71xuneoPd8=;
 b=qrSWuVXxtJVxhBX3b0d9bEzTSIe+vOLqH2a5HYe8KVglk4Tkmhq0O1lXVE5doM4wkT
 pCUm0qDBZsbuj5pAEwbhZeA7N55AcyrCnBbqD+a1iIvki0quohWsTeKV9MJu39Sos1D2
 Bj/AXvUZwb7ZwII4cJMaxYzIC0KRMKoMdw5F15fuTWmPAau52eaEIpMf2OGGUgg5xhGU
 7jugthFnlwVrzE3dP3ysVQF3+cjOfXoYBYX/Ozif1WAxbyOPb9AzsqXY1/LCw/tMUKco
 EJnsA8pNERpPP/UcKGRbx/aHtrSZbZbjE4ZQRFNILPolfDu3wD02EjN/a4+wmCR1v+2k
 LA4Q==
X-Gm-Message-State: AOAM533x1qcRqB5QJgrzvCB9lYtY+r/diJ61JDJop4tHpPzhCvZFyHxj
 3PaHaYA+3VQ7rFjz5auQcTww3w==
X-Google-Smtp-Source: ABdhPJytsmID8/aRSwBtwfzQUY7X48SKDjGayfn2n1EtSbNto15hEn8eMR8R5wUmquKDTdIAP4uN0w==
X-Received: by 2002:a17:90a:7893:: with SMTP id
 x19mr4338245pjk.197.1634699836661; 
 Tue, 19 Oct 2021 20:17:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v6 08/15] target/riscv: Replace is_32bit with get_xl/get_xlen
Date: Tue, 19 Oct 2021 20:17:02 -0700
Message-Id: <20211020031709.359469-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 03:17:20 -0000

In preparation for RV128, replace a simple predicate
with a more versatile test.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7e7bb67d15..2624d65fc2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -91,16 +91,19 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 }
 
 #ifdef TARGET_RISCV32
-# define is_32bit(ctx)  true
+#define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
-# define is_32bit(ctx)  false
+#define get_xl(ctx)    MXL_RV64
 #else
-static inline bool is_32bit(DisasContext *ctx)
-{
-    return ctx->xl == MXL_RV32;
-}
+#define get_xl(ctx)    ((ctx)->xl)
 #endif
 
+/* The word size for this machine mode. */
+static inline int __attribute__((unused)) get_xlen(DisasContext *ctx)
+{
+    return 16 << get_xl(ctx);
+}
+
 /* The word size for this operation. */
 static inline int oper_len(DisasContext *ctx)
 {
@@ -282,7 +285,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+    target_ulong sd = get_xl(ctx) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
 
     if (ctx->mstatus_fs != MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
@@ -341,16 +344,16 @@ EX_SH(12)
     }                              \
 } while (0)
 
-#define REQUIRE_32BIT(ctx) do { \
-    if (!is_32bit(ctx)) {       \
-        return false;           \
-    }                           \
+#define REQUIRE_32BIT(ctx) do {    \
+    if (get_xl(ctx) != MXL_RV32) { \
+        return false;              \
+    }                              \
 } while (0)
 
-#define REQUIRE_64BIT(ctx) do { \
-    if (is_32bit(ctx)) {        \
-        return false;           \
-    }                           \
+#define REQUIRE_64BIT(ctx) do {    \
+    if (get_xl(ctx) < MXL_RV64) {  \
+        return false;              \
+    }                              \
 } while (0)
 
 static int ex_rvc_register(DisasContext *ctx, int reg)
-- 
2.25.1


