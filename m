Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf70g-0006zD-Vj
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70f-0006z2-24
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:45 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70S-0007MC-Mx
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:44 -0400
Received: by mail-qt1-x82a.google.com with SMTP id ga7so5870755qtb.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LxDIouyTmW6CIiqQuxLm5ivPOp4dewieXsHrUESWZw=;
 b=mQVuOcG5L8T5ElugFebjoJfPp+Nnf9IOSJCKX1gFpbnmryQbF/9DqFiyLlmQm1ENQY
 H3SQfmG/dgFZf9UvsvDvQEaOfpBwrDqomGwjF2nLxokHcmo7wPSUFtjr7xaEHbHYAs/w
 Ixse4Eif3XvT7G+tRxYy2nwzz7X7pY3GbXGd/ThI10aPUfMMpW8Ungcz6cHy1XCq6DI/
 NiohQo7PpmHiyAYo2fj12iiEVDxxOg08B34QPXlq+eEEYyucbdH8zG6W8n9F2CRSxXxg
 MpoARGUsf+S0BFtrIBi9cc3Qh19vgBIakW0ihj5kpotzo0gx1Pcy0n5y/XhQ/luRRODE
 Ut8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1LxDIouyTmW6CIiqQuxLm5ivPOp4dewieXsHrUESWZw=;
 b=qvPHv744dxXXYfEZtoxbSfgpR0fpVhthubVr8FPRvy/XjJ229b4hJM2KLsm4i/Tg6O
 +GsTaxgLsTaZDaWxi2hMImhnManex5zmzqF3nMs7klwrYf7Ya9MpR5R885b3AA3O8rbo
 UftnLl5iu4OsKfR3Dq/rcRON7XAIj+JPFOVq6Dd+ujV7aXotWlsfnOMYJ6+R0sPn623i
 lzO8j72Mw9WU2CA//mPiGpfEF1fF2fRIlIYsur9c4neT+rWrPXA1R4TcbSfq55vNxPXD
 Hed2Q9s/6h4t6oJca5oo4DrYMQsBi0ZHdmcrEzbl4Iivu3uvX7Fl86XmJAYgFsidTrFC
 LFqg==
X-Gm-Message-State: AO0yUKXWc+jjfOCQnyRG99NgKDwjgJbJ0ihCrwjDhoGvH94gk51I+70j
 QHQjrWeTdXuZhoTMPbrFScrbKZW2h5qkKfnzp/o=
X-Google-Smtp-Source: AK7set/P471p85eNNIq/kt/C2NQjLb4iICt+H8J3sleVrUvgS36YJgvGwd8S7u3BwX6JOFk2H5op1A==
X-Received: by 2002:a05:6870:c0d5:b0:17e:8727:1fcc with SMTP id
 e21-20020a056870c0d500b0017e87271fccmr1019499oad.4.1679523650281; 
 Wed, 22 Mar 2023 15:20:50 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 09/25] target/riscv/cpu.c: remove cfg setup from
 riscv_cpu_init()
Date: Wed, 22 Mar 2023 19:19:48 -0300
Message-Id: <20230322222004.357013-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qt1-x82a.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:32:45 -0000

We have 4 config settings being done in riscv_cpu_init(): ext_ifencei,
ext_icsr, mmu and pmp. This is also the constructor of the "riscv-cpu"
device, which happens to be the parent device of every RISC-V cpu.

The result is that these 4 configs are being set every time, and every
other CPU should always account for them. CPUs such as sifive_e need to
disable settings that aren't enabled simply because the parent class
happens to be enabling it.

Moving all configurations from the parent class to each CPU will
centralize the config of each CPU into its own init(), which is clearer
than having to account to whatever happens to be set in the parent
device. These settings are also being set in register_cpu_props() when
no 'misa_ext' is set, so for these CPUs we don't need changes. Named
CPUs will receive all cfgs that the parent were setting into their
init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fef55d7d79..c7b6e7b84b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -325,7 +325,8 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
 
 static void riscv_any_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
 #if defined(TARGET_RISCV32)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #elif defined(TARGET_RISCV64)
@@ -340,6 +341,12 @@ static void riscv_any_cpu_init(Object *obj)
 
     env->priv_ver = PRIV_VERSION_LATEST;
     register_cpu_props(obj);
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 }
 
 #if defined(TARGET_RISCV64)
@@ -358,13 +365,20 @@ static void rv64_base_cpu_init(Object *obj)
 
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv64_sifive_e_cpu_init(Object *obj)
@@ -375,10 +389,14 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
-    cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv64_thead_c906_cpu_init(Object *obj)
@@ -411,6 +429,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_SV39);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv128_base_cpu_init(Object *obj)
@@ -447,7 +469,8 @@ static void rv32_base_cpu_init(Object *obj)
 
 static void rv32_sifive_u_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
 
     register_cpu_props(obj);
@@ -455,6 +478,12 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv32_sifive_e_cpu_init(Object *obj)
@@ -465,10 +494,14 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
-    cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv32_ibex_cpu_init(Object *obj)
@@ -479,11 +512,15 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_11_0;
-    cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
     cpu->cfg.epmp = true;
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
@@ -494,10 +531,14 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
-    cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.pmp = true;
 }
 #endif
 
@@ -1384,11 +1425,6 @@ static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    cpu->cfg.ext_ifencei = true;
-    cpu->cfg.ext_icsr = true;
-    cpu->cfg.mmu = true;
-    cpu->cfg.pmp = true;
-
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-- 
2.39.2


