Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psRL8-0004Se-V1
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 12:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRL6-0004SD-CH
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 12:52:56 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRL4-0005uQ-7I
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 12:52:56 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-38c35975545so159674b6e.1
 for <qemu-riscv@nongnu.org>; Fri, 28 Apr 2023 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682700771; x=1685292771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8xSQqNZwWMr4Yif3IiQuGJNixlUe2bQ/ExkAYT0s5g=;
 b=n+KCQ7Z1Ks+4927ICY48gWNPUYE56GEtwtGetZf1jVvO2eHQfrm/AnlWujBSZ8aMGV
 d4rwlFzrzxukBvt4IiXXAVURPm8hxvCLNj6g3gPtGqMPup8+1BjQ9oovLlsG9bcVCKqN
 oMtKDlaZ8+eSROvRMVH596VVwmsPcSX2Skmmfyur78JH7GmLECn2kzoq+6Ectqpb400U
 h4Cmw9tJAY2M3itL+ABhYQe2S/SfvvcFt4KsKPlWETbJ/l1dU7666UFWtOfNXbjE6if5
 csNoeWMr00GsH9hm34pDkAkC4sYcv2+QLRRvw0UKpnJno4XyWVPw8OmVu79wl/EZFS99
 ym/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700771; x=1685292771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W8xSQqNZwWMr4Yif3IiQuGJNixlUe2bQ/ExkAYT0s5g=;
 b=TVNFfzCw4hfulSUuWk+Na7sJbClNbJF9/CApQaaEsQPcYeE1BbhpX7dCuHIyJEFbxx
 V+ILwYwLs4rSz05xv8JgM4htMjejvt0k0MesPgb6ASdoyMZo/x15soU0CuDDUu+9TXHX
 cVy64b2OIyVXd0CotsL1SCLXOLxrUtM2M3D3VSTfXX/HyY20/eclsWcN5N8Lqpe99kN9
 iMetwnX2abiE5a+n3zTzH9bTA/BncdlAbe7a0n46sGjxKQNUgBc/9e897ZHdn9/EvI9Q
 Oi7JHJmYiVspUYhZA4N+VIVcS21oUIBR1U4IpH+LcRqity1oZjwLlhOjsGWE4Ci2aHi9
 d4oA==
X-Gm-Message-State: AC+VfDw+twLZn9TNSeRKl8jJIQMAavJB7PcfDt3PzcjLIeXIOF/cB+N2
 iyKleUqAYUK1lcZaAFjv9QP/EQ==
X-Google-Smtp-Source: ACHHUZ4JikU1Ef368MlsO3lAF5uPDfeufWor5dQoiLi4KNxjUXvyERJbZC3GE16EsL+6iM3iKx1jpw==
X-Received: by 2002:aca:170c:0:b0:38e:285e:99ec with SMTP id
 j12-20020aca170c000000b0038e285e99ecmr2676710oii.4.1682700771223; 
 Fri, 28 Apr 2023 09:52:51 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 c10-20020a4a4f0a000000b005462a25c4f9sm9665764oob.9.2023.04.28.09.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:52:50 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 3/4] target/riscv: check smstateen fcsr flag
Date: Fri, 28 Apr 2023 22:22:10 +0530
Message-Id: <20230428165212.2800669-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428165212.2800669-1-mchitale@ventanamicro.com>
References: <20230428165212.2800669-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 16:52:56 -0000

If misa.F and smstateen_fcsr_ok flag are clear then all the floating
point instructions must generate an appropriate exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvd.c.inc   | 13 ++++++---
 target/riscv/insn_trans/trans_rvf.c.inc   | 24 ++++++++++++++---
 target/riscv/insn_trans/trans_rvzfh.c.inc | 32 +++++++++++++++--------
 3 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 2c51e01c40..d9e0cf116f 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -18,10 +18,15 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#define REQUIRE_ZDINX_OR_D(ctx) do { \
-    if (!ctx->cfg_ptr->ext_zdinx) { \
-        REQUIRE_EXT(ctx, RVD); \
-    } \
+#define REQUIRE_ZDINX_OR_D(ctx) do {           \
+    if (!has_ext(ctx, RVD)) {                  \
+        if (!ctx->cfg_ptr->ext_zdinx) {        \
+            return false;                      \
+        }                                      \
+        if (!smstateen_fcsr_check(ctx)) {      \
+            return false;                      \
+        }                                      \
+    }                                          \
 } while (0)
 
 #define REQUIRE_EVEN(ctx, reg) do { \
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index b2de4fcf3f..e4d9834237 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,10 +24,26 @@
             return false; \
 } while (0)
 
-#define REQUIRE_ZFINX_OR_F(ctx) do {\
-    if (!ctx->cfg_ptr->ext_zfinx) { \
-        REQUIRE_EXT(ctx, RVF); \
-    } \
+static inline bool smstateen_fcsr_check(DisasContext *ctx)
+{
+#ifndef CONFIG_USER_ONLY
+    if (!ctx->smstateen_fcsr_ok) {
+        ctx->virt_inst_excp = ctx->virt_enabled;
+        return false;
+    }
+#endif
+    return true;
+}
+
+#define REQUIRE_ZFINX_OR_F(ctx) do {           \
+    if (!has_ext(ctx, RVF)) {                  \
+        if (!ctx->cfg_ptr->ext_zfinx) {        \
+            return false;                      \
+        }                                      \
+        if (!smstateen_fcsr_check(ctx)) {      \
+            return false;                      \
+        }                                      \
+    }                                          \
 } while (0)
 
 #define REQUIRE_ZCF(ctx) do {                  \
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 74dde37ff7..e228ae28a5 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -16,28 +16,38 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#define REQUIRE_ZFH(ctx) do { \
+#define REQUIRE_ZFH(ctx) do {          \
     if (!ctx->cfg_ptr->ext_zfh) {      \
-        return false;         \
-    }                         \
-} while (0)
-
-#define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
-    if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
         return false;                  \
     }                                  \
 } while (0)
 
+#define REQUIRE_ZHINX_OR_ZFH(ctx) do {                \
+    if (!ctx->cfg_ptr->ext_zfh) {                     \
+        if (!ctx->cfg_ptr->ext_zhinx) {               \
+            return false;                             \
+        }                                             \
+        if (!smstateen_fcsr_check(ctx)) {             \
+            return false;                             \
+        }                                             \
+    }                                                 \
+} while (0)
+
 #define REQUIRE_ZFHMIN(ctx) do {              \
     if (!ctx->cfg_ptr->ext_zfhmin) {          \
         return false;                         \
     }                                         \
 } while (0)
 
-#define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
-    if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { \
-        return false;                                        \
-    }                                                        \
+#define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {             \
+    if (!ctx->cfg_ptr->ext_zfhmin) {                     \
+        if (ctx->cfg_ptr->ext_zhinxmin) {                \
+            return false;                                \
+        }                                                \
+        if (!smstateen_fcsr_check(ctx)) {                \
+            return false;                                \
+        }                                                \
+    }                                                    \
 } while (0)
 
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
-- 
2.34.1


