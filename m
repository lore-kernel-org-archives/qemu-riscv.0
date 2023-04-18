Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pokZY-0007CB-JX
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 08:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pokZW-0007Bh-N0
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 08:36:34 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pokZU-0005ak-UR
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 08:36:34 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6a5f21a231eso379380a34.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681821391; x=1684413391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+nGHRdv49T55prH8TYU393gIbTei1AcH5U5Z4MPnem0=;
 b=YaVAdUAnxOlfqQESRSIjvetuOpSsT3ItCAWGYUxmoL6342WhN9PtrO4crqqVG++Ncl
 u/A4b0fLKVcNcl5Kf6ErkyfSoJRWj4lgQVegUN3CijTCZD7WDzTBiqf803ytmgME/DrA
 4A5rGQ8dOJS+ffrR8NMLSGGWyqSlEjIEMjY1gsRNi73U+elvLi65scbpxw0Cc7pMu3E/
 bdGO1RMbHkt10wp9bhjoSvwJtIXp4IBBj3xxMp07mjHnORjoN3icZKBiDsNeBLiBQ2a2
 wiSQhm/IzRfuROPFniO3lcXO3ioeSSvby127uvGjyV982/q6bQI+SzgQfbJpRDYg+c27
 TATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681821391; x=1684413391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+nGHRdv49T55prH8TYU393gIbTei1AcH5U5Z4MPnem0=;
 b=TBLwb3Po5/T1dCmBkjIJhO3gC24Dm7vP3jiwHRfPdNzcKGgSm0VkkAtIWOGhV5dy/3
 6gkLBdu89MvMo8YyHL4IRqbHsI9fVhxyUlz8Boitti//PuDg8a7+3Gk3WCTGLEj2Npoo
 vZVFSOU8sK749XBwxejSxu24bPCgVV/4NHgCV9MuMnCPjxiUpMi6+00KReh4XWzQdppm
 i7MVOACoudTh2NXBEWLfXamTcDd86Ctcl+ZWvsuKPPFujLCfFOlWnpZVMdB9T8Kj+U8E
 URmEUdW0F049n/i9mZ/soPuPMgnMu3RGoWNlp8bdfDmE2EMf+ab99SvHtUdhJUymoNnw
 5K6g==
X-Gm-Message-State: AAQBX9dXib2OiZ06pkBXOCuzpS4wlAfbTTZK26QARUEnOjOoSW/Sl6mZ
 8EQdYShhqnLZKjlXGkGOo9eGGQ==
X-Google-Smtp-Source: AKy350a5evw/N3Yqi4WOgQDpMqzV/c3Bb0I6CiY0gdAChGjCq+Z8lhDU6VG28xfl6U3o9EUY8ak77g==
X-Received: by 2002:a05:6871:84:b0:177:81bb:1b1b with SMTP id
 u4-20020a056871008400b0017781bb1b1bmr1090100oaa.40.1681821391327; 
 Tue, 18 Apr 2023 05:36:31 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 du3-20020a0568703a0300b001723a2e84b6sm5613827oab.6.2023.04.18.05.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:36:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Rahul Pathak <rpathak@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] target/riscv: add Ventana's Veyron V1 CPU
Date: Tue, 18 Apr 2023 09:36:24 -0300
Message-Id: <20230418123624.16414-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Apr 2023 12:36:34 -0000

From: Rahul Pathak <rpathak@ventanamicro.com>

Add a virtual CPU for Ventana's first CPU named veyron-v1. It runs
exclusively for the rv64 target. It's tested with the 'virt' board.

CPU specs and general information can be found here:

https://www.nextplatform.com/2023/02/02/the-first-risc-v-shot-across-the-datacenter-bow/

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h      |  1 +
 target/riscv/cpu.c          | 38 +++++++++++++++++++++++++++++++++++++
 target/riscv/cpu_vendorid.h |  4 ++++
 3 files changed, 43 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index b29090ad86..04af50983e 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -41,6 +41,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
 #define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
+#define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
 #if defined(TARGET_RISCV32)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index befa64528f..db0875fb43 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -422,6 +422,43 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 #endif
 }
 
+static void rv64_veyron_v1_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU | RVH);
+    env->priv_ver = PRIV_VERSION_1_12_0;
+
+    /* Enable ISA extensions */
+    cpu->cfg.mmu = true;
+    cpu->cfg.ext_icbom = true;
+    cpu->cfg.cbom_blocksize = 64;
+    cpu->cfg.cboz_blocksize = 64;
+    cpu->cfg.ext_icboz = true;
+    cpu->cfg.ext_smaia = true;
+    cpu->cfg.ext_ssaia = true;
+    cpu->cfg.ext_sscofpmf = true;
+    cpu->cfg.ext_sstc = true;
+    cpu->cfg.ext_svinval = true;
+    cpu->cfg.ext_svnapot = true;
+    cpu->cfg.ext_svpbmt = true;
+    cpu->cfg.ext_smstateen = true;
+    cpu->cfg.ext_zba = true;
+    cpu->cfg.ext_zbb = true;
+    cpu->cfg.ext_zbc = true;
+    cpu->cfg.ext_zbs = true;
+    cpu->cfg.ext_XVentanaCondOps = true;
+
+    cpu->cfg.mvendorid = VEYRON_V1_MVENDORID;
+    cpu->cfg.marchid = VEYRON_V1_MARCHID;
+    cpu->cfg.mimpid = VEYRON_V1_MIMPID;
+
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_SV48);
+#endif
+}
+
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -1827,6 +1864,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,        rv64_veyron_v1_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
 #endif
 };
diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
index a5aa249bc9..96b6b9c2cb 100644
--- a/target/riscv/cpu_vendorid.h
+++ b/target/riscv/cpu_vendorid.h
@@ -3,4 +3,8 @@
 
 #define THEAD_VENDOR_ID         0x5b7
 
+#define VEYRON_V1_MARCHID       0x8000000000010000
+#define VEYRON_V1_MIMPID        0x111
+#define VEYRON_V1_MVENDORID     0x61f
+
 #endif /*  TARGET_RISCV_CPU_VENDORID_H */
-- 
2.40.0


