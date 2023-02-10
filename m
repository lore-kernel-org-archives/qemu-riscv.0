Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQTaB-0005Mz-JC
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 08:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa9-0005MV-NJ
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:53 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa8-0007Tq-2z
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:53 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so6677708fac.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Feb 2023 05:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRs4VzXLgz+2ta5fdh+bco0FgUBmM+avNnvHl5gY0EE=;
 b=QKeE3v7wLmBLcj0ZFh/H3GG0jqG+LasZJJtg4oPCDxz/8roP1pJ1SIG4vq9yEX51jw
 reNiSWSzWfQJJ3f07qChs+RZrV+4csVHYDZ/8YCXKq91zOO86YJ/KnauURxkl5LJCJok
 Kboax1q1eSuXRDKnRjssHDHYsGu67Y9tIePqnQj+fqZ/zd8WX/MN3dmcBLnzzGIoKCU7
 0NE/qWIiTigPDEogwGRf5hlNC+mst9loYpgCb11sRAJ9L0C4DMQn5sP2cdsSGAulnIHo
 9BdS7/U3WqQuiXuZ747kf4np6Gh8nzVn2KfuWtJOadT7fsQPDenqzzRhZACiEn98Bro6
 CUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRs4VzXLgz+2ta5fdh+bco0FgUBmM+avNnvHl5gY0EE=;
 b=A9RXEXcGO+XrVxvpMsPn/3SjQ09Gq5qKHTL/owibZAgMjIclAk2VQGmoDfIZSZyTXJ
 KGMJpnmbhLH8EKOdC5pGzJfF9AX+Heh0ByXaVwhy4NtwTbELJXqf1IoHra1jEqHiSN4e
 GXF0Ttk1C7ug3SHinqSgZCH5Jo+aKh2OtbsheNT4HsU6G3Muaupafe4UGMQAb2CX4VFh
 HkBtMaEHyDafZ/SrhpdmAjKfi5JBD5bdysX4D3qsb1cwI4+1tmPEp2sanMWVuf9J6NfV
 V+fvSOZIe+M8/6hdxPOihrWkcwkCnIPlvI2awpIyyaH0xOzfvoGJm4L7xW4IAzC5S/f6
 1ZnQ==
X-Gm-Message-State: AO0yUKViaZ1lI0tFcNB5QnIrH9M8ubXilLN8SFz1lt0tyo1Doyn1aWeC
 TDkNphhxDwgoHwaiECFfJbEePQ==
X-Google-Smtp-Source: AK7set8NVUckYX0uP0U/a0jkU3RhXpF+VV86bhBIxOUCgGzQTdf/hMdu+K4NfzIhWd27K63+PjFaHg==
X-Received: by 2002:a05:6870:d10d:b0:16a:b526:59a6 with SMTP id
 e13-20020a056870d10d00b0016ab52659a6mr4728524oac.43.1676036211523; 
 Fri, 10 Feb 2023 05:36:51 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:51 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 05/11] target/riscv: remove RISCV_FEATURE_DEBUG
Date: Fri, 10 Feb 2023 10:36:29 -0300
Message-Id: <20230210133635.589647-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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
X-List-Received-Date: Fri, 10 Feb 2023 13:36:53 -0000

RISCV_FEATURE_DEBUG will always follow the value defined by
cpu->cfg.debug flag. Read the flag instead.

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
index 4f9cc501b2..af4a44b33b 100644
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


