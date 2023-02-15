Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSMyX-0007y1-JN
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 13:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyQ-0007sk-Va
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:48 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyO-0007wf-Uj
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:46 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-16cc1e43244so19846032fac.12
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 10:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztd1b1aEAN7YodigTUG6Ro/lcZCclFr+SzJZ6tToCaI=;
 b=Pu55rwRByNtTYPjjpdQkaIgwolVW2n2+TwhxLZwIi30skV0hSLHPaWhBhd/fWCRCnp
 6stZ4sv2rLzNLFFjqVDZriFbas+ABj0JiBM383JxAs1GDYc5/72L+KNmSOSw/QiEyJWT
 34/UWEGnXY+OuIMhzHbxP0Bc4waNqn889QmeqE79Xsf05EQkHsJ+PgO7XNa0aLtQnz0k
 2i9J5TLfoN6qBRVd8noUlTJu32QmHulNHIQ6cDcatICYuRRZ4+TVD4v5mpdMV/EYl/+I
 dvLia8sOjI/mvTB96/9OjvEXxlnoqDBpMD8ZQznTQ6uEDpH/Z3LTGupRRv5AhN0L7SY4
 GRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ztd1b1aEAN7YodigTUG6Ro/lcZCclFr+SzJZ6tToCaI=;
 b=3uIlUJwQ0TGrO+d63pRw9StaootSRORPvDXnbGuUG+vKuzdI1zri9I5OUcuGFpEoSE
 weI8tS3wp2g/Blskena4BUiOY3joXRjv17/O8HoroHENYoXsUFBZB6OTDw2e8YOvhs57
 ibA/8FNalN9Pjq5n+XBtYU/gW78cOx+S/yZ5toZgfiOUSlFe0YUgIi+75bvzFM/dVq4r
 DOE/HvcXBZmjYpCQE7AorVdWVfjT5LzX+UNqL+DQ3oj/nT2Vz/z3e44LguKwcbYTJxhT
 uS65amup053/iqxG092Eh3XaWukWN76HxWmgSnaYXHaogc8FMQ8jOWq2y5aE8URNFvcd
 d3Ug==
X-Gm-Message-State: AO0yUKXgjohDOAAQaIhil+pp7v4Ms8XGiFuQP3uHXFHuciSJT2tyfu0o
 /Y0nnXA+NxqO71/Fp4l287mVoQ==
X-Google-Smtp-Source: AK7set8zVcpyQ9jSKXFsng+Jx/9trVpoLF0GOK2Fc3P6Xd0zhwde4ZgR38SZu1dSs/VtCm0e3+QAWA==
X-Received: by 2002:a05:6870:fb8b:b0:16e:c7d:c657 with SMTP id
 kv11-20020a056870fb8b00b0016e0c7dc657mr1859450oab.49.1676487463817; 
 Wed, 15 Feb 2023 10:57:43 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 04/10] target/riscv: remove RISCV_FEATURE_DEBUG
Date: Wed, 15 Feb 2023 15:57:20 -0300
Message-Id: <20230215185726.691759-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 18:57:50 -0000

RISCV_FEATURE_DEBUG will always follow the value defined by
cpu->cfg.debug flag. Read the flag instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c        | 6 +-----
 target/riscv/cpu.h        | 1 -
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/machine.c    | 3 +--
 5 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 93b52b826c..e34a5e3f11 100644
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
index 368a522b5b..7326aaed27 100644
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
index 5bd4cdbef5..287792d6d6 100644
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


