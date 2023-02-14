Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0uk-0005kv-8m
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0ui-0005jO-Ub
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:28 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uh-0005A5-2c
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:28 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 x26-20020a056830115a00b0068bbc0ee3eeso4990649otq.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ka44EYy7PipAO/fIo0ishkZ9VZTsP5hKLSvm/Wxq+MU=;
 b=UFmv6LW3paBOSKlyYS8wZHjkW/rvTD2Vk1w0OodxfMAx7wvabp0FY7Vj/wRV3UkbWS
 XGRtjTdLbDArci7Kfr5BrFbnF57VwTTg1L3rqZBwql0v0203XlksVVapBUU+Ppjfw22T
 5F4lhtg6W1wrHcbrCV3kpiicbf+8FVl6Uh7kIyHn4LOfVtw1Lik8SCDW/JSe5TzEg5Ru
 70vVUt0DfAQKH9OqAKhVxYavz0yb3ZKUiy4j1qO0mJriPvpicDEBvT8+NkcJsCaPzO57
 NO+5EFrzGckki97PA7FD33GrhMJvm2exAVlGeajdeYJw51A0WbvbVujBcfSuGl5F2W9C
 EQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ka44EYy7PipAO/fIo0ishkZ9VZTsP5hKLSvm/Wxq+MU=;
 b=Bo43wzW0PdMDSr51uotTtSJp7mjLTu/7FkHUw+54ke++UitR8oNTSRvIPGeUd2wuCk
 /Ve9hOnX1zYDHRpc+zjiekATx451+bikIloBikIdFrjevgp6lNKJRYByoDZ9Z3Zo3B8+
 7uQB18JQS/E3UfLuwtoPCo9OCA6elEq2YaW2UDgejz+ydVOGVEiBWRK84frJlp/bzbef
 4CO+qGTtiY0F4x/SBqn/DJph6WDhavLpsWcA6OLuZEDKZju5/McIZTgN0Vfb2/f9CxjM
 /GL+wow0CO4UiW0OciZOZjOugO2NaKCAfDDlpCjjue+2mRE+JZPvxzyDqKuL3qW7e4ZM
 yk1g==
X-Gm-Message-State: AO0yUKUSCxJfXZ5H950vLDWWXggs7C+AKjORisPDyAcWFOr0xvQTitUy
 knAxF/1J8n7l8yBO4Bae8OFgdw==
X-Google-Smtp-Source: AK7set/McvBiylJXICAWM44FkxZHseYk1WYGcSpClUDSeGFyl79FwqS5jIMN8Mi5g7YvvMdmIYFxzw==
X-Received: by 2002:a9d:7613:0:b0:68d:53d5:f7d2 with SMTP id
 k19-20020a9d7613000000b0068d53d5f7d2mr1408845otl.31.1676402665831; 
 Tue, 14 Feb 2023 11:24:25 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:25 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 08/11] target/riscv: remove RISCV_FEATURE_PMP
Date: Tue, 14 Feb 2023 16:23:53 -0300
Message-Id: <20230214192356.319991-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:29 -0000

RISCV_FEATURE_PMP is being set via riscv_set_feature() by mirroring the
cpu->cfg.pmp flag. Use the flag instead.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c        | 4 ----
 target/riscv/cpu.h        | 1 -
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/machine.c    | 3 +--
 target/riscv/op_helper.c  | 2 +-
 target/riscv/pmp.c        | 2 +-
 7 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 430b6adccb..a803395ed1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -923,10 +923,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
 
-    if (cpu->cfg.pmp) {
-        riscv_set_feature(env, RISCV_FEATURE_PMP);
-    }
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0de11fd41..62919cd5cc 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -87,7 +87,6 @@
    so a cpu features bitfield is required, likewise for optional PMP support */
 enum {
     RISCV_FEATURE_MMU,
-    RISCV_FEATURE_PMP,
 };
 
 /* Privileged specification version */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4cdd247c6c..15d9542691 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -706,7 +706,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
     pmp_priv_t pmp_priv;
     int pmp_index = -1;
 
-    if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
+    if (!riscv_cpu_cfg(env).pmp) {
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 223162af5e..356cf3c04f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -419,7 +419,7 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
 
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
-    if (riscv_feature(env, RISCV_FEATURE_PMP)) {
+    if (riscv_cpu_cfg(env).pmp) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 4634968898..67e9e56853 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -27,9 +27,8 @@
 static bool pmp_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
-    CPURISCVState *env = &cpu->env;
 
-    return riscv_feature(env, RISCV_FEATURE_PMP);
+    return cpu->cfg.pmp;
 }
 
 static int pmp_post_load(void *opaque, int version_id)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 48f918b71b..f34701b443 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -195,7 +195,7 @@ target_ulong helper_mret(CPURISCVState *env)
     uint64_t mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
 
-    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+    if (riscv_cpu_cfg(env).pmp &&
         !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index bb54899635..1e7903dffa 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -265,7 +265,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
         }
     }
 
-    if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
+    if (!riscv_cpu_cfg(env).pmp || (mode == PRV_M)) {
         /*
          * Privileged spec v1.10 states if HW doesn't implement any PMP entry
          * or no PMP entry matches an M-Mode access, the access succeeds.
-- 
2.39.1


