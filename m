Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0GZ-0008DZ-Cn
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GX-0008Cj-Lc
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:20:01 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GW-0002Wu-0v
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:20:01 -0500
Received: by mail-oi1-x22a.google.com with SMTP id bp19so8341oib.4
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CwNWHsFbNT1Xg+X7KE2JYFVcnaWt4G8P4YU3bP/dFoY=;
 b=mkPkr3W10LDd5TooDjO+kNMCFA+X0kXlB9o5ApCA8G4KOsbZjlbxzPIsnf5s0i4IY8
 QNYMuF25AiS02Jn3EOnXYr0R8b4vvlncGNpmxds6YXU3knyaYO/Gak2j+8JyFe0+fY+6
 KxLhmAH89WgruaGzUWVJzdx4dkRd8pHW8yyzau5P9w+MWlZ49HS510UOF0T2KI23iVMS
 UWahU8l4ZtddoJRRlCvtD71b4UVaNPEPhKe8w854f1Ox1FO3GVcfp6eo+vVvuNfUHKAX
 R0yzx/9bFYo9AkE/rG7dWczLY4cc7LGkdmczlp5DENTc48kW3Pb5II2pGmTxLElPFK2p
 l7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CwNWHsFbNT1Xg+X7KE2JYFVcnaWt4G8P4YU3bP/dFoY=;
 b=6J3HAB5tfRJmlb2hJyR+SwKnkVLYwkEj8z9zPbp95cJVotPTDs5Q6jE8Gc2knMnU5/
 8sfdxq1lZpS0TnidBUChAx7Yzm4oXXNCfjUU/8fcCoB4atTMLHCI01nFOR0hKUKOnCZs
 dj0SkiW+5qs++1aQ7HGPYbuodzUkSobTYlmzIF2RHKJx6GFwHmB0UeWlA5GKaP5PTIg+
 ghE4+Oqs57OwtaX6LRJC9IxGQTKBN0qsFzTFv7SZ+HldECJsSwWIIKOyf37muSohcBht
 a698xSCcwN3tYUQRs20RnoHcVYcQmHnjV++zts621Yp5IBLFukLZtxOz6CFGOT0KInx/
 j7Iw==
X-Gm-Message-State: AO0yUKWnNhNNQVsiRV7atjWJAXdzrs3/+I+71jTbTv4tZMLbUS8Rkc0D
 3X42dY53cVAOP3m0ffIh+NIW/g==
X-Google-Smtp-Source: AK7set9KFEpNOy83PMXQl03JmaI2NL4gJpfQzZMsHX7ea2n/5piTLgPrGp2dviscQo9KcOnpeQIVAg==
X-Received: by 2002:aca:6504:0:b0:37f:ac0a:f4d5 with SMTP id
 m4-20020aca6504000000b0037fac0af4d5mr9405291oim.3.1678306798765; 
 Wed, 08 Mar 2023 12:19:58 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:58 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 09/17] target/riscv/cpu.c: set cpu config in set_misa()
Date: Wed,  8 Mar 2023 17:19:17 -0300
Message-Id: <20230308201925.258223-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 20:20:01 -0000

set_misa() is setting all 'misa' related env states and nothing else.
But other functions, namely riscv_cpu_validate_set_extensions(), uses
the config object to do its job.

This creates a need to set the single letter extensions in the cfg
object to keep both in sync. At this moment this is being done by
register_cpu_props(), forcing every CPU to do a call to this function.

Let's beef up set_misa() and make the function do the sync for us. This
will relieve named CPUs to having to call register_cpu_props(), which
will then be redesigned to a more specialized role next.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++--------
 target/riscv/cpu.h |  4 ++--
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dc6e444219..08bdf861db 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -236,8 +236,40 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 
 static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
 {
+    RISCVCPU *cpu;
+
     env->misa_mxl_max = env->misa_mxl = mxl;
     env->misa_ext_mask = env->misa_ext = ext;
+
+    /*
+     * ext = 0 will only be a thing during cpu_init() functions
+     * as a way of setting an extension-agnostic CPU. We do
+     * not support clearing misa_ext* and the ext_N flags in
+     * RISCVCPUConfig in regular circunstances.
+     */
+    if (ext == 0) {
+        return;
+    }
+
+    /*
+     * We can't use riscv_cpu_cfg() in this case because it is
+     * a read-only inline and we're going to change the values
+     * of cpu->cfg.
+     */
+    cpu = env_archcpu(env);
+
+    cpu->cfg.ext_i = ext & RVI;
+    cpu->cfg.ext_e = ext & RVE;
+    cpu->cfg.ext_m = ext & RVM;
+    cpu->cfg.ext_a = ext & RVA;
+    cpu->cfg.ext_f = ext & RVF;
+    cpu->cfg.ext_d = ext & RVD;
+    cpu->cfg.ext_v = ext & RVV;
+    cpu->cfg.ext_c = ext & RVC;
+    cpu->cfg.ext_s = ext & RVS;
+    cpu->cfg.ext_u = ext & RVU;
+    cpu->cfg.ext_h = ext & RVH;
+    cpu->cfg.ext_j = ext & RVJ;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -340,7 +372,6 @@ static void riscv_any_cpu_init(Object *obj)
 #endif
 
     env->priv_ver = PRIV_VERSION_LATEST;
-    register_cpu_props(obj);
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_ifencei = true;
@@ -368,7 +399,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
@@ -387,7 +417,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -472,8 +501,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
@@ -492,7 +519,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -510,7 +536,6 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_11_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -529,7 +554,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index af2e4b7695..f8baedd9c7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,8 +66,8 @@
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 /*
- * Consider updating register_cpu_props() when adding
- * new MISA bits here.
+ * Consider updating set_misa() when adding new
+ * MISA bits here.
  */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */
-- 
2.39.2


