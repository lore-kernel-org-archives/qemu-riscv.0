Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7r5-0005lR-Ak
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7r4-0005l9-Gy
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:30 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7r2-0002ti-O1
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:30 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 t10-20020a9d774a000000b00698d7d8d512so588671otl.10
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1KnuQqgygOO2YMozmY3X/7U/lNxPcvXX1UiChgZSKA=;
 b=DaoPeFH5NyIpgc9gQtfxzqs1cG+4y9U9QGI06mj/tsjmDMMUaKm6r0SB2Z8e5Rc4W8
 VXY4kIUUmkd9XVEmtBV70sEgjfwISkUn8SpQrKWLocbEoeQACxCB57kj5bjkUp+WaU2c
 EFfPOvbbjJyRfHD9HpNvO0eeTumxA/Bbfy3xHHSiPCQXzkgDncncUxezNRFHvWA6KdKZ
 jvLyvpndoT82A/Q6z1n0CJuHgj/H4YJWQEkxR68I04GVOtwWOWFDQHBwk0li3mOghiEL
 JSIg8saxPXLEsZc05PHiXl2RmuUg/BoZ7fSa2H7k3JEYOP8fyAq0dnGWuHXidcnL0+Zd
 2+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1KnuQqgygOO2YMozmY3X/7U/lNxPcvXX1UiChgZSKA=;
 b=lYXtvChP5f8EPd2dd73vdAODlJ7IxrkFxdbZZQ2H6WOI9t5t8j2WmS7qo61Mg5+ev9
 Pwy3crtvz1JvZJRp6NE6FEwCKH+iC7rqh+vNBnxFK+4ib2aBuV/pIqL0vFjYeNtO7947
 INXJRMb+bIEoXwO0H4RUrLxlEnJsvzWhZKGhdEV2bZLvMpYYL0OVlxoeuV7YGRjU+RS7
 GniqqGrYvuGT9sN1dtbhjH4YzpaqNR3QtMZi7R0S1SDVwcMmj+nuJMsZL8XBUjomokS7
 OS55aCufOX+dtHT/C38L7tkaxLM51zm1dVhO9bFA1gX0ynhObOcCAoHoq7GLTjgUnXw2
 A6Jw==
X-Gm-Message-State: AO0yUKUOzXxAhDst583dviJs1wQtxswLy1B25TIr3yC4wrcAHhUhHD5p
 N/iWd01/oIinO3D7khivE7mfaA==
X-Google-Smtp-Source: AK7set+1HaF5LMbRnzuvZfjiOtl0SQjMNrrRQ4cDaJ4lD5zdFgzspwQlvkxasec2EfcKmJDKJC6NwA==
X-Received: by 2002:a05:6830:912:b0:693:d263:5976 with SMTP id
 v18-20020a056830091200b00693d2635976mr11251364ott.1.1678812627734; 
 Tue, 14 Mar 2023 09:50:27 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 11/26] target/riscv/cpu.c: set cpu config in
 set_misa()
Date: Tue, 14 Mar 2023 13:49:33 -0300
Message-Id: <20230314164948.539135-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:30 -0000

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
index 36c55abda0..7841676473 100644
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
index 76f81c6b68..ebe0fff668 100644
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


