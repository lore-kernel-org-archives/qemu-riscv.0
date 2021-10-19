Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcqz1-00058K-C6
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 11:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyz-000529-Ln
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqys-0007YG-Of
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:53 -0400
Received: by mail-pl1-x630.google.com with SMTP id i5so7665448pla.5
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=edH/POVbw08zofw7DVs7aX5K2Qy9VoOU3+jO1Dt/KD8=;
 b=WDn2ev7F8Y+8lBeRgNTY4J3JqABh1A4rHd9wV5zuPgz2ye5a4mAOq6jnE8XbQZEgPc
 2c19grunndK0SMTrpswRNUo6CQNZanENPPpakHIgZzGrKlulsTum/S/1I3UAEUGyzC/u
 hplB+rdkPwrtgNzjU9eSWVZQ0kXOh7FnubsHDIb18wTBJ6TN9swlMUx9jjo10nlM6Aov
 KF4eau/jDSmZoxV7FrCpBUvjZ4UcvIVEgfHewajDm3bOACQpQtQauMNevA35034E5JRI
 2xjHVI2QX81J0HF66QcVQBPAczf5KLOdzXWaIG8a69M5daH685dlfEi08hX9XC+NILzW
 H7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edH/POVbw08zofw7DVs7aX5K2Qy9VoOU3+jO1Dt/KD8=;
 b=oxJgTpo5wo4UXIL4YNFUJiGRGkU9bbPR22mX2XmZoER+DcNc80Xjmiz9gGqKs5FD+d
 lGd9iz1//DuvAecyGj+DPuwomNZ+ehL0D2DH1VfUSEayOWjEuqMRtPel/+yUDu37EeBL
 rdwfJq6V65Uj8UQkFhfwqCxcX71+LwAfMUoq0ayIrRtfNI9eg662yNLDTCbveiX28TCW
 UE29hy7/A2aynogbVGYCCbkmj8XanLI8FbWufpOq1H+7XyJ8KManNJGpl43tgfnP3HI/
 Aim2CTTylPtfxk5muqLKxKk0BfPtI7JfDRs7Fipe7hxXXM7/Wrl81y+Ak5Qi4opc9095
 S0Ew==
X-Gm-Message-State: AOAM533hcHI58+WVMpaWs6jbylGjR/lYK8tNaO8mxd+2z/OqEzvfI7DB
 GVrQL2dFcujVVPJ4S5criGLARw==
X-Google-Smtp-Source: ABdhPJw/20smaW1zeepkKBJTZ8/I8DPRw1BnMB4KMQdlUSH5ozO4C8Tl6r5DmCGM3gYBzu3YseQnzQ==
X-Received: by 2002:a17:90a:530f:: with SMTP id
 x15mr495525pjh.156.1634657085224; 
 Tue, 19 Oct 2021 08:24:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v5 08/16] target/riscv: Replace is_32bit with get_xl/get_xlen
Date: Tue, 19 Oct 2021 08:24:30 -0700
Message-Id: <20211019152438.269077-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 15:24:54 -0000

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


