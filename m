Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmCc-0000wo-3D
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 08:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCU-0000ga-Ho
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:50 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCS-0001xH-CL
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:50 -0400
Received: by mail-oi1-x233.google.com with SMTP id bm2so6222173oib.4
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679921027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytCsdO2qt4E+YWGo/+oG6BWbmPNF3ykb1weTQ7hLL8s=;
 b=njkB0VTIgHUOmdFMXiSQBp7mwnapVFSP/tnGRaxujZJigcWBtSXRVfaD+PL6cVIQeo
 Nl7haJTg3I3SVeDkC8Wkeiyx4xab7dLQLeqkzgvEsITUS7her0mxNczODtnfUmI4bgeP
 5s4yN2r+fPHVVPg0L391GVnQdg/mJhsf0Ogcv/dz5pFeL3Hu4j6Z6poarunFs6MFRgwd
 mV8TotAfQr+p9f3uBhaRXW7Vjczv+utaztCa1Vb44cLXAWDTihKZdCWYSYHAErYeLF07
 o6lfIcmG9Cw1PP6fJgHKMjjJKXLQ+2u//Fu2B4xWl4k4+KLtpQGmdd0LoZ+x9iA8NRYs
 /b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytCsdO2qt4E+YWGo/+oG6BWbmPNF3ykb1weTQ7hLL8s=;
 b=Uz3O0fopn8jIm7zJnu2zyBsQDp8ASC4+NLaqc2IteoffDCzzlVdew1OVva3zhujFq9
 +/qMdKLv7Y3UG7nnVVKqMswgTlq7cp6rKZjVXy5q7MgURpGsig6AEF9jCt5sDc+7bFR/
 i4X5s0KJ4YVTw3+he5+uJEwp0cvfH9K9AmmbRZLD30QOt7IOTtCp1zD891AaQq4Pl5NN
 jIqk6K6xGw1oqkYqhht99LtYSQulX02cYCLoGdj6u8yYF7KGy6CaIPsrTWO8lhM6f+k2
 YU8nsqzp0BCdHvIuCx83alwwr6IWTb5lKfyHG6Y+2CA7tQOSkJuPfzzFR6CGQl3ckkTl
 WC1Q==
X-Gm-Message-State: AAQBX9cM7VH+WsR5YQZBbcHxV9v8pIY60J9FxOOdrRdHC+Du05CPHdP3
 Gry7A6JxnW32GeeZJKfr54wtFQ==
X-Google-Smtp-Source: AKy350Z/VwunFjYdXljdZumLmj3k/vSe7L4SnGYKts1APFBWiX+I7l9Sz9vvN34JZ4mEeYYHxLgCcw==
X-Received: by 2002:a54:4813:0:b0:389:1e16:7aad with SMTP id
 j19-20020a544813000000b003891e167aadmr2023843oij.41.1679921027558; 
 Mon, 27 Mar 2023 05:43:47 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 18/19] target/riscv: add RVG and remove cpu->cfg.ext_g
Date: Mon, 27 Mar 2023 09:42:46 -0300
Message-Id: <20230327124247.106595-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 12:43:50 -0000

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
index 3078d1a097..01755036f0 100644
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
@@ -1403,6 +1401,8 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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


