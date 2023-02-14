Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0ub-0005XW-Oj
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uZ-0005Vi-N6
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:20 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uY-000568-1g
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:19 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 r34-20020a05683044a200b0068d4a8a8d2dso4968987otv.12
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSAzqaSYL5/ApSwg4ieH2LYrwhy5su5BFmAjUbkMNYM=;
 b=YLjr9BbcSfOzghpq28xjKBCjdU1y35DTjPOhksQd8gg6fghHRUxHYzNlU/flkKi00z
 hvHyIj/F6JC8jH3btwm65D/ZdBEVDqLHu0ijWtX0FuunK0m+06kuim5Ac5Jc95+Fhp7w
 pLWPT9XSTvxersj1IoxK7jX8TvNSRoIti+JlcD93KsZxhfkcERp6fww9URz7oUHUctpA
 m7qugF/o/5kSMOpMUAS31s5urIZhG9M2WUGGgeML+XUKd/77AD5+XkrP7Nmp7323u32Z
 zHUkZ0q1dxKD0q4aJYV1f1O7Gdg9OTU5gVjIp5FBK4stN1xLWUAROyj1UP5MTFrD2Psb
 hv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSAzqaSYL5/ApSwg4ieH2LYrwhy5su5BFmAjUbkMNYM=;
 b=qNK6iOCLhWzEB4+woEMQZnUIqwozyklhX4ZZEjlvLmHG6Ncnfc7+jwq11UCL41eGkU
 x7HPnVpt8baM19eBkdnO0qqQou5n+nnAwEhufRxv1b5uZvoiglGttFsdSqy1P+x42MZ0
 guZbvZWMyfcHQ9E4d6sPUhHjikLraZ7YIj9x2SCmWCF3y1LTRspv5uJ65NfHR+jKzEpZ
 FWO6UziPzCHmNF8BdYsFu9P5m5dW5PwsF3uVdgO3lf+J2mvMQRvhHp6Vd/pf2lFelyBY
 iw/Qm9wDAyA9fHtSh4Z6G3GksS8UL/+9YtaaC876KNNW1Z7bIUfc/axbYG0Qe97iuppt
 8O4w==
X-Gm-Message-State: AO0yUKWrvzNK5pTSObiItMiz/lLieojRKcoIL3gfkb2H11/u95s6mfl4
 UNZKuKunZaIZ3KQaMxhlr71LQg==
X-Google-Smtp-Source: AK7set8fYqNwTW1E1jd/Iz/H33K4sos7EQeYTRMFyKviMvcp0iLEbyAIlGoUmPQMXqodKN67ynIgMg==
X-Received: by 2002:a05:6830:15:b0:688:4899:4a23 with SMTP id
 c21-20020a056830001500b0068848994a23mr1899167otp.11.1676402657469; 
 Tue, 14 Feb 2023 11:24:17 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:17 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 05/11] target/riscv: remove RISCV_FEATURE_DEBUG
Date: Tue, 14 Feb 2023 16:23:50 -0300
Message-Id: <20230214192356.319991-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:20 -0000

RISCV_FEATURE_DEBUG will always follow the value defined by
cpu->cfg.debug flag. Read the flag instead.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c        | 6 +-----
 target/riscv/cpu.h        | 1 -
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/machine.c    | 3 +--
 5 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 69fb9e123f..272cf1a8bf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -637,7 +637,7 @@ static void riscv_cpu_reset_hold(Object *obj)
     set_default_nan_mode(1, &env->fp_status);
 
 #ifndef CONFIG_USER_ONLY
-    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+    if (cpu->cfg.debug) {
         riscv_trigger_init(env);
     }
 
@@ -935,10 +935,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (cpu->cfg.debug) {
-        riscv_set_feature(env, RISCV_FEATURE_DEBUG);
-    }
-
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 00a464c9c4..46de6f2f7f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_DEBUG
 };
 
 /* Privileged specification version */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ad8d82662c..4cdd247c6c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -105,7 +105,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
     }
-    if (riscv_feature(env, RISCV_FEATURE_DEBUG) && !icount_enabled()) {
+    if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e949e6248a..120a0541bb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -437,7 +437,7 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 
 static RISCVException debug(CPURISCVState *env, int csrno)
 {
-    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+    if (riscv_cpu_cfg(env).debug) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c6ce318cce..4634968898 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -226,9 +226,8 @@ static const VMStateDescription vmstate_kvmtimer = {
 static bool debug_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
-    CPURISCVState *env = &cpu->env;
 
-    return riscv_feature(env, RISCV_FEATURE_DEBUG);
+    return cpu->cfg.debug;
 }
 
 static int debug_post_load(void *opaque, int version_id)
-- 
2.39.1


