Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSh10-00007w-44
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh0y-0008Uz-5a
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:21:44 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh0w-00063L-G7
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:21:43 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-16e2c22c3baso3092905fac.8
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zeLc19rvg9BNm7u7QZh1b1577pYy8eBeQfNkS++7q68=;
 b=SLksprB9WShuzZA1//4KSOM0lCFgf5VqXYZZfXe83kxhlNb5IbjbP947ABVXvNNnEg
 WzcWpDLWcDqoCA+Yra+xS9cRDyVBDgvJ5Td0DLT/9kHLDPOHipNTw5TPcuWibwQpNElb
 dIF1tSwcCMnTlCImYF1Hjr18ou+svLeWowGA7JkpWQx6aUeK12DC9qcLf7m1gcpt3IHB
 aIg3u4txnq7GoYeo2eodFjmm+DfdAGiISLjSDV8p/IWWOyiy3496FY40q/jerN6tNKyT
 veShCyrWrJSCJGUMXZ1JiJtmygI5NsedTjI4DGzMFoleqELCMd92cN17N6LTk65R+y9Y
 ARSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zeLc19rvg9BNm7u7QZh1b1577pYy8eBeQfNkS++7q68=;
 b=zC31zQ2d0itSuy1lz7AHsBlh/Kw7nQwmaz595WEG9nCzmaDcJFT0jKYR9Ynm1IOAXs
 yPpscx+HsfgXvdfRmbOFCxZ25q+1ooAlZkQdoYEfLiGmAduSIRB+NPR+nH1hmhQz/h0h
 3WWtiuGKJdp56G6PIdXT5F7EC1gtXAKWUOd1lNx1s8pu2PKpQmf2Z0CwciAv6mjcP95D
 dyRiUz7dqidmE7TVnylLJm56CJxPtNlLtx82r+GC64qJosp35dN5HNFBlPODOI/4wStp
 QtVAdRUtIv1gLybhfkFqijK2vdXowDkpy9tfeakPvOiLo8tgsEYx8OXJ3IcWDa/19pIQ
 7dxA==
X-Gm-Message-State: AO0yUKU7VSvm7S24DcT42CI2DDdH0hXcOxPGyCr4cbablboAW+wU8mdp
 4qX4VR1l8PHIl9tKIHuJzC/d9Q==
X-Google-Smtp-Source: AK7set95ceZoASd8qsGKLKrv6PKnHuOyLvKE0Ro6kG5oblULH7R7AbMUbvTHWw8iWz3bb/qICvII5g==
X-Received: by 2002:a05:6870:82ac:b0:16d:e6f9:c20f with SMTP id
 q44-20020a05687082ac00b0016de6f9c20fmr3678168oae.54.1676564501500; 
 Thu, 16 Feb 2023 08:21:41 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056870e15100b001600797d1b5sm693029oaa.41.2023.02.16.08.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:21:41 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 3/9] target/riscv: remove RISCV_FEATURE_DEBUG
Date: Thu, 16 Feb 2023 13:21:20 -0300
Message-Id: <20230216162126.809482-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216162126.809482-1-dbarboza@ventanamicro.com>
References: <20230216162126.809482-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 16:21:44 -0000

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
index f7862ff4a4..90dc28e22e 100644
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


