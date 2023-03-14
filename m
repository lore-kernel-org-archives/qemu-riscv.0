Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7rA-0005nt-Tw
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7r8-0005mc-JP
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:34 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7r6-0002uy-Pq
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:34 -0400
Received: by mail-oi1-x231.google.com with SMTP id w133so108805oib.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CguAyFnXN900gJ747DQtBtymkQ6WmWSHf4CsQ4yPU5I=;
 b=jZvCh3f5R397M3w+Rc5N9aH52D5cDrJGyeefBkReTZhYY+y2rIWtIciMQrkoMMNE6f
 77OG3ZOEmywoD3lC8QS2ashfDnI180QGkgARWr3FFf2aU2bbKlhPrgAAdUEjWdqPYwYZ
 sxzsYBDpq4Svh56TLp6NOJw6x2qESjLQbteaH6HFk+Ga1spFdX8MrB6dOmv4OIUI8Dzd
 oChagtBqr0f+qmup70dkOQC1MAsTW8Zjs4H7pgkcwlCsm7P/OP4xiJgu8naPZ+cBPCgh
 cjmdtEMf2kA8C1bBcG3ljiygbpgzKTDtZIbWBDaK58dGhvdXdEkIjOUPj1HMUGQWoAGe
 iQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CguAyFnXN900gJ747DQtBtymkQ6WmWSHf4CsQ4yPU5I=;
 b=Y2dZI8FC+5ZSZEx9DBuVgKGNg2uqHYgYcuDo7q5daCJ2OQCgRWEbC5fB3diotNt5mA
 arSW05y00toZ+7MVjlWxcxQPQ0NRqsdihSEz1PryrTxL6pvQ6j4ieTZmthcIS/VK63lG
 w1ToMZIIoDZFi34Iad5hZrhVON4XNzxfWMSyOEPUgRKJfdc5BTO8B7QjYwhyvr6Jj8qt
 WRnxjUBU5rXF7brzrxFS1sCLGJ5QiYURQ+5YTXYTONOcCSYVuXPFwoF8Pt0t5YXmFpOD
 sA7Agj0f1UtGmjlNoIms0QtNxU0nyIzeL1UGiwFlaP5EKRtdQCuqj7hOIE7MRBgPxg4M
 GWlA==
X-Gm-Message-State: AO0yUKVyuNlwLqLhvTL4oFrxZYmZ20/wurM7EeDNTEg3BlGYhWDhyP8p
 l834NGHj/ZhgKFWU8uVCsfVZvQ==
X-Google-Smtp-Source: AK7set9yrCyWA4Ns7p2siXy+faTCMHM8pblMB0143VcuPCbKZMO94Y8hIKJvAIPHtJuTXBNt7osynA==
X-Received: by 2002:aca:d09:0:b0:384:36f2:5109 with SMTP id
 9-20020aca0d09000000b0038436f25109mr17433185oin.6.1678812630648; 
 Tue, 14 Mar 2023 09:50:30 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 12/26] target/riscv/cpu.c: redesign
 register_cpu_props()
Date: Tue, 14 Mar 2023 13:49:34 -0300
Message-Id: <20230314164948.539135-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:34 -0000

Now that the function is a no-op if 'env.misa_ext != 0', and no one that
are setting misa_ext != 0 is calling it because set_misa() is setting
the cpu cfg accordingly, remove the now deprecated code and rename the
function to register_generic_cpu_props().

This function is now doing exactly what the name says: it is creating
user-facing properties to allow changes in the CPU cfg via the QEMU
command line, setting default values if no user input is provided.

Note that there's the possibility of a CPU to set a certain misa value
and, at the same, also want user-facing flags and defaults from this
function. This is not the case since commit 26b2bc58599c ("target/riscv:
Don't expose the CPU properties on names CPUs"), but given that this is
also a possibility, clarify in the function that using this function
will overwrite existing values in cpu->cfg.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 48 ++++++++++------------------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7841676473..6b5096d25e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -221,7 +221,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(Object *obj);
+static void register_generic_cpu_props(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -386,7 +386,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -475,7 +475,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -488,7 +488,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -575,7 +575,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
 }
 #endif
 
@@ -1557,44 +1557,16 @@ static Property riscv_cpu_extensions[] = {
 };
 
 /*
- * Register CPU props based on env.misa_ext. If a non-zero
- * value was set, register only the required cpu->cfg.ext_*
- * properties and leave. env.misa_ext = 0 means that we want
- * all the default properties to be registered.
+ * Register generic CPU props with user-facing flags declared
+ * in riscv_cpu_extensions[].
+ *
+ * Note that this will overwrite existing values in cpu->cfg.
  */
-static void register_cpu_props(Object *obj)
+static void register_generic_cpu_props(Object *obj)
 {
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
-    /*
-     * If misa_ext is not zero, set cfg properties now to
-     * allow them to be read during riscv_cpu_realize()
-     * later on.
-     */
-    if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_i = misa_ext & RVI;
-        cpu->cfg.ext_e = misa_ext & RVE;
-        cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_a = misa_ext & RVA;
-        cpu->cfg.ext_f = misa_ext & RVF;
-        cpu->cfg.ext_d = misa_ext & RVD;
-        cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_c = misa_ext & RVC;
-        cpu->cfg.ext_s = misa_ext & RVS;
-        cpu->cfg.ext_u = misa_ext & RVU;
-        cpu->cfg.ext_h = misa_ext & RVH;
-        cpu->cfg.ext_j = misa_ext & RVJ;
-
-        /*
-         * We don't want to set the default riscv_cpu_extensions
-         * in this case.
-         */
-        return;
-    }
-
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
-- 
2.39.2


