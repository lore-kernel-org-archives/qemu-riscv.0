Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSdwo-0004LK-5I
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwk-0004K6-Ld
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:12 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwi-0002CK-9i
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:09 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 z25-20020a4ad1b9000000b00517affa07c0so201788oor.7
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 05:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zeLc19rvg9BNm7u7QZh1b1577pYy8eBeQfNkS++7q68=;
 b=Q43FJsdCTcuMUuVaJCtZrsTu/ThCKaXN3hVBdSB93P4ccqN2jcXt75HAMRYhYqKQ1t
 txhh6lTHVubdoHOtnEZAYsxRXKYzKIrEjSj60kAdd+GgmEq3aC8rIS4DYwuH6wQ1ZggQ
 d7+H+0fRGVgqqx19eYLaejCCwtscuU8LJ+P7XHSZU1gtkDYUYfVz1zOvUxyt2kzuR5Hv
 2wkw5TJ1WImYVTYP3eiEPorbAsQ/GFZ1RjM/3/52acCFC2oixu2gPansS9wTi81VemyC
 yc+sl5a6c/pnJmqn6LR2Wfew8kV7rFw8d2JnRMw0HPLKfbD6op0eaUyKJoKVcxaz2cAa
 eNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zeLc19rvg9BNm7u7QZh1b1577pYy8eBeQfNkS++7q68=;
 b=eWh0U2txCmxY6LZrWcZQox3ZmupD9V6SIUTOxiGxeQO6lHXh9Y6NGJropP8NKUrzCh
 ITyqhwljD9qDbThXlypVtUQpu7pnVo8ISBUiuo+4WWRSm+M7iumK7ydMo4x9KdNCQ9nd
 sAzIq01sOjSzpvSQPuG1fhK7/jA1Dff9nE7PNyi7pThbPsZVMVCCJNU7ObKFcAQte8Ga
 UisbVsRgcMoQWNQ5d4MXlqxP6sd3Yoj1EQim7nsrULIpVq0/Mt3nhMEYzSNMHWQieOh5
 yCsdWb8sBAzJoV9dISu48xpm3mGvNbN8x+DZs7dMeuidUQ+MD4zI1PaWAkp39FYsDaHg
 xTpA==
X-Gm-Message-State: AO0yUKXcxnXtGHM0qusi5ykwMCWBLwYRKH1VlQElOX5+Q0xG4VkJoKPH
 2u24EKsz8+vbBTSne1s+e7IDPw==
X-Google-Smtp-Source: AK7set9+Nu0mNXuZizOU2I8fAQFO83E9OjuhJjFB33Sz1rc74IQZKbxzGhq9iRzTmJG9TjJ5DGnqCQ==
X-Received: by 2002:a4a:9669:0:b0:516:f374:443f with SMTP id
 r38-20020a4a9669000000b00516f374443fmr2272182ooi.8.1676552706797; 
 Thu, 16 Feb 2023 05:05:06 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:06 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 04/10] target/riscv: remove RISCV_FEATURE_DEBUG
Date: Thu, 16 Feb 2023 10:04:38 -0300
Message-Id: <20230216130444.795997-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 13:05:12 -0000

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


