Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mccZQ-0004uY-AK
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZD-0004hE-UW
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:20 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZA-0001hq-Ui
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:19 -0400
Received: by mail-pl1-x62d.google.com with SMTP id t11so12401080plq.11
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 17:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=edH/POVbw08zofw7DVs7aX5K2Qy9VoOU3+jO1Dt/KD8=;
 b=hIrPs1TDpOsgg1x1CJH8gJOIwQo+N/4Bn9Lm2oxdtvDghlaLGnmG0jiSTOBa3UM9u7
 idiEWUgl4bWpAqdnAINX841WZOpXJWpepK21EoS6YToV7UlYkBudKNtBiZ0W15NNgar7
 fFbzxwysWPLasm1cunHch+zYw/Nks4orrhh54AISHBDgiylSsUTOxj1EIN1TcGzwabH9
 JxJXAq29aXcscFwBImqrU2T094nZI2gYFepjL+FVDXIExQcnaoKYynoesmReaFrl0QaU
 /KlrgWfJqp33IKTma6KsADpo/EZYMH1Unb21ZlcbtSHJKXwiDjMAQz82lSQqEZXrcGB5
 06sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edH/POVbw08zofw7DVs7aX5K2Qy9VoOU3+jO1Dt/KD8=;
 b=Xr4fmi+9o8d8i/c9F6lW02gbgDHMtLqU8EpppBe0fMbTDJEgOIrg+DQa6JGKFFaGoJ
 G6f3JTkCGv/G+LwULmlanQo5D4dheCePdMTTWhJyIV3C6ZNXQz1wEiuDyhcD/nEHjaGd
 We+8KdS+cCk6MmarXGhhI4r9tQ+k01NF4lnNJNNurSr9KkQ8czE/+uP2k837QYraYIND
 lslTtRnu1sStpu0vzTsPZlW891bkmHn+RmMMQ27XGxk2XzKpXgXM+YuUk8rv8xxx56X1
 5caYv465XeV8c8Ny/pbCsSeH4E4qRftxbX4y8SWezIlT1h4CTAuTcDNXCIkn1LWKR1/b
 /vDA==
X-Gm-Message-State: AOAM533DKj18FOkubveAlOJK6x/0H0qUSPsCjNbLxiRPQun2BSjqUz5n
 QYUGtGXqt6sFtkooRLEq5LDEHw==
X-Google-Smtp-Source: ABdhPJxgvK87HOOW4OEN9XWqCFaLTvMbkcPL1cfAyYyWwnr4RYUzh/LZC3zDKeq+oDpfVd6PKpOSZA==
X-Received: by 2002:a17:90b:390d:: with SMTP id
 ob13mr2366528pjb.49.1634601675516; 
 Mon, 18 Oct 2021 17:01:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v4 08/16] target/riscv: Replace is_32bit with get_xl/get_xlen
Date: Mon, 18 Oct 2021 17:01:00 -0700
Message-Id: <20211019000108.3678724-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 00:01:20 -0000

In preparation for RV128, replace a simple predicate
with a more versatile test.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f7634c175a..3f1abbac5c 100644
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
@@ -257,7 +260,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+    target_ulong sd = get_xl(ctx) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
 
     if (ctx->mstatus_fs != MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
@@ -316,16 +319,16 @@ EX_SH(12)
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


