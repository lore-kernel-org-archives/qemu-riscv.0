Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbnGS-0001BY-J6
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 13:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGM-00012X-WE
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGK-0006Dd-7s
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id np13so9406909pjb.4
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqYHtG7U6Thazj4+tYJjUHiaULEjGKehA71xuneoPd8=;
 b=lUftEJfOO9og9QvDBw6eIdRfZxb/xiM04IiPT402HFoPju69kJcnsqanyLDqgDL1Tf
 y2n0617pXghIbQSUT2BzNLZrx2z9bRDQrmcBc8iyZHRRoemxYs4Q3yV1DAtahQMfR3/k
 kDepu+KB1ZtESfa40gwmvRKUx6OFHm1iQgrB4zOe6pejD3Mamh1CF0WerCrniFDWmRri
 Gk/p4RtrSsITl2A5EZ3WO41cda9I52QdDyMIBSItCKLokmVxa5tarAGeve/8WH7rFZZL
 MC7JQ7l/d0czjccFEJ9Jzmn2OgZbTixlzNDKpTC3cZyoDbjCfIn2b2MPqOeLTTFHFlUE
 zHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqYHtG7U6Thazj4+tYJjUHiaULEjGKehA71xuneoPd8=;
 b=CjKaxasEfl4iYAr27lkaJarfZzk3ZbkaXP1pw1ARsUnEzl1bhIT0qxXziDpMcO4P1D
 OokOpoKbkMxnyMKvh+Xqwc80GLltpjKxXlJ54P0Lt6mlt05t7i7fU7mCFkOpqby/e0bD
 5QDWYTe+A51nwEDOuuvnPAP7XrW21uZ9WWxW+lKf9CyuwZtttSNoljt29v+gW5/P5Ich
 VYqlJQSW1FHwdDC6ykwnthZEQiFKX2+SBNYwsfToFoLN8W4PoQHap8xto8vwwCCu+MZ9
 mJJAP9/1//eidZQfyTazIaDA+1ev+9KUShdcvuYL4Gbhy8PHGjbD2h5YByIjqBlSSiH2
 YsWA==
X-Gm-Message-State: AOAM533acX5l0NbwpOzzLpfMe5g45QajA78afnUWrmAYPyn2P6NQtgFr
 SKA1xa6+7ozlplocznoxaC2eiQ==
X-Google-Smtp-Source: ABdhPJw6jLHMum4U97cIcswfFr+Ui9rEP0s+5JcHAM8x68mjK7dvaxNyRfnTMJXw3qr9qe9LcQbsow==
X-Received: by 2002:a17:90b:350f:: with SMTP id
 ls15mr21592887pjb.220.1634404462190; 
 Sat, 16 Oct 2021 10:14:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com, frank.chang@sifive.com
Subject: [PATCH v3 08/14] target/riscv: Replace is_32bit with get_xl/get_xlen
Date: Sat, 16 Oct 2021 10:14:06 -0700
Message-Id: <20211016171412.3163784-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 17:14:27 -0000

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


