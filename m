Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvg0-0006ux-7M
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfz-0006ox-C0
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:55 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfx-0000K8-Ix
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:55 -0400
Received: by mail-oi1-x22f.google.com with SMTP id bj20so7636898oib.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLEs2Nmz1iGMdiBUVszFLnH2vBbUhQhLIez3jXs4sjM=;
 b=EnElbSi0j6erZ3C8V4rXquglJced56KS2zNWBCMo01o7pNmvw5/wU2uajoTWQrUzdA
 6Uw48DqTZgD3yja9LQb3XYx8eY0YBd43GANcPgLhpBZdjoUSCbjuw7P+mWVAp5LmSeVb
 WSjq9hmeYUzGzXKCOeV592jvW4kCYb0OEypzsPJYCoOEvWbk/nGd/1KRM6mTSAL6mN+0
 uKaOjlR+uDFjzylStUgSfwVosH1PBJliBeKqHC4OFnrLVg5scHwPJitjkAyV3rIWBDSM
 kBjFJOkvPQoAtLk2rt4vUOEMItuHZf/vZ1FsiJwMsrBN5vF7+Eq/qkwI+Eom1Ki4F9we
 DPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LLEs2Nmz1iGMdiBUVszFLnH2vBbUhQhLIez3jXs4sjM=;
 b=zQnnxfsRrh54BOMGjpnNoKPkbti0xUs+/lHNYz0xBvlA4i1P/00ZnhD2XHB4WhgwGG
 CPikLFxgsjLLaDh1apAWNTOdF4eKEhcyE5cG+7pelv5B1nHpnnFy3WnsDBcH/3b4CU9t
 Y5E0yWwlAIgJB/GcXo9lVL8WLWSm3rId+OAwWloNhdAexxKdyDlNd1C3pJ2ZVuUBl0c2
 2fG4F98SCgnCINncb9DPWB+gwaAYBnYkMMJSBIe0LKlGY0A3Em1+x2GKoQ/1EbD4rcC4
 oMWZAaAuC2G2Si52+VhHvknMkH0Hlhkx5UBEV+xp6AnNXXUJ1wVy8GIKV1LqcVgH/hwY
 n7LA==
X-Gm-Message-State: AAQBX9cPMlPuzodhbEVcucrskB1v6lrGHbae3jaxSMP9Kj+02izyy4ma
 VLez9m/0FEe8o7AjCYzWFEfsuA==
X-Google-Smtp-Source: AKy350ZPc5TYrGmdHQOYd6P+X6SAyWVgjJV3J8Ni+C81/OP1QMMnJXX/T5g3dl5Hw44Nb69KcPGWSw==
X-Received: by 2002:aca:2b17:0:b0:388:fff3:61e6 with SMTP id
 i23-20020aca2b17000000b00388fff361e6mr2710507oik.38.1679957452346; 
 Mon, 27 Mar 2023 15:50:52 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 18/19] target/riscv: add RVG and remove cpu->cfg.ext_g
Date: Mon, 27 Mar 2023 19:49:33 -0300
Message-Id: <20230327224934.363314-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 22:50:55 -0000

We're still have one RISCVCPUConfig MISA flag, 'ext_g'. We'll remove it
the same way we did with the others: create a "g" RISCVCPUMisaExtConfig
property, remove the old "g" property, remove all instances of 'cfg.ext_g'
and use riscv_has_ext(env, RVG).

The caveat is that we don't have RVG, so add it. RVG will be used right
off the bat in set_misa() of rv64_thead_c906_cpu_init() because the CPU is
enabling G via the now removed 'ext_g' flag.

After this patch, there are no more MISA extensions represented by flags
in RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 17 ++++++++---------
 target/riscv/cpu.h |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 07097ca3fd..a0c009df4a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -397,10 +397,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
-    cpu->cfg.ext_g = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
     cpu->cfg.ext_xtheadba = true;
@@ -808,12 +807,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
 
     /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) &&
-                            riscv_has_ext(env, RVM) &&
-                            riscv_has_ext(env, RVA) &&
-                            riscv_has_ext(env, RVF) &&
-                            riscv_has_ext(env, RVD) &&
-                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
+    if (riscv_has_ext(env, RVG) &&
+        !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
+          riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
+          riscv_has_ext(env, RVD) &&
+          cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
@@ -1403,6 +1401,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVJ, .enabled = false},
     {.name = "v", .description = "Vector operations",
      .misa_bit = RVV, .enabled = false},
+    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
+     .misa_bit = RVG, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1425,7 +1425,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c0280ace2a..ce92e8393d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVJ RV('J')
+#define RVG RV('G')
 
 
 /* Privileged specification version */
@@ -418,7 +419,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_g;
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
-- 
2.39.2


