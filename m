Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0GT-0008Ae-Cy
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GR-00088O-Ix
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:55 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GP-0002SF-Kb
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:55 -0500
Received: by mail-oi1-x230.google.com with SMTP id bj30so13127350oib.6
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQEp3uxgQUjVhkMRfKKD7zfqhzNbCepUcFSG6WZW69g=;
 b=hoFT0jcsvjYZGrb/8q0gJpgX7p1THMyQdVdCOBAHXWKgiDMz8HygLzCf3LQTw2wdHr
 W0m3c4b/iK5RRwZ2vk4x4QB4LXfXm/U1/RRgcBSa3hUVyOwV8l1CE66IsFBndVFtohOo
 9J2zkVXGSoIkV0yuRdkTT2FJtvOvIAPcf+550fQ7qwzQrftTrpNG9QRpLH5v0X/PrfHk
 0gfley302IySTnGClqzd9GKVY0v63AqrALCI0lSrh0OVutJ2dnAwmmyGeVSOAdo4FHaO
 JQ21qivdRLehtD5Zv2wxq9syReC4OEsCd8ZdjrQLZNUrZepwUG+axBqMLF9YzfrRcPQ/
 vJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQEp3uxgQUjVhkMRfKKD7zfqhzNbCepUcFSG6WZW69g=;
 b=Ik16//8b2ikPxyzBi4bUnHqajiY6DPHL8IZFJBYcHkkh6lWJg4LF4we2ABQsH5ZPh2
 0ug/X91WxasCD53BJW8bwwujUZm8LdVaa5FwggQmO7h9TBF80YFogLpehE3wUJjA5uXY
 oQvqZ3CN5JQM6IprHF7Bcb9Mq69DI1wVtUmPEyVmVqyg4/nYgfFJoYPOFRgyiEg6wTtR
 MTMHtgTPT1nlVu+/9unrn4IrlgWwvikEng4sVe3qSX8r9PXrctI9ZBAZjjq0UGbM0/Yx
 GwT3sAwNyCfRWamCLPzreuzp98nzIdhThW631Nzbm6tP63gvB12dR0K00Aa3g7V7jsTX
 OECA==
X-Gm-Message-State: AO0yUKWiXR622aIsFnaJAPFBU8JwJoYEC8xUJ9cSBcauVACAVzAAp+7M
 OHY3qRo/jOAYRJhdn95mD1zcwg==
X-Google-Smtp-Source: AK7set8EXWbpfykLGF6ctYqEuKejbP7+RJXT6uzBIC+3/2Ak8l5LDext1qgmEEE2nmmIV1AioBYfPg==
X-Received: by 2002:a05:6808:41:b0:383:f380:868e with SMTP id
 v1-20020a056808004100b00383f380868emr718164oic.34.1678306792976; 
 Wed, 08 Mar 2023 12:19:52 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 07/17] target/riscv/cpu.c: remove cfg setup from
 riscv_cpu_init()
Date: Wed,  8 Mar 2023 17:19:15 -0300
Message-Id: <20230308201925.258223-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 20:19:55 -0000

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
index e2cd55320c..499738d2dd 100644
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
 
@@ -1357,11 +1398,6 @@ static void riscv_cpu_init(Object *obj)
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


