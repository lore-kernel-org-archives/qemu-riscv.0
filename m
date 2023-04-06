Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTyw-0001eF-GN
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyp-0001QB-GT
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:05:04 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyn-0000dq-Iq
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:05:03 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17aaa51a911so43230322fac.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2dnARg6F+1M5N4kesIx/7lK61VGskg0uBXfjuGkWyQw=;
 b=GehDbJeZOE6m0tXy1ITV35kss17z130eIf5ZYSMHv/BRM+XHL40z2Y73w6uuztd0B6
 Upol5z4ldx+8q/LYWtmS6/lfux7w1S2rcIFarUBJG+KpNyfTFGx2b6wdHIkCCEGsvC3y
 QO6exmvGkZDuBlc9NIS84ut1iOLtnPCi5y8fn+9A3x7GImR6T0kDrfuWfoe75i61pMHF
 Rw0nfekDDUsoONKWM4O8/X+lfmLvqUHBGI1KNNhoRDJnJvZMOoQBNIYx85BJZAnODoQB
 I9FAXcvWeAnxd+i3kkwkweade8UwM85rBVkfFLYfEW3mBT3b7ZFISkJLyo9lbaXovA6w
 igBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dnARg6F+1M5N4kesIx/7lK61VGskg0uBXfjuGkWyQw=;
 b=0rUM4cYCzAxlsZLP3Sgb5WIbz8ZgjptCfJnoVFJsNLqR9h/gDZ8evhx5df/KttRYJJ
 jeczV4J4b7s502YF5ItJVCd6as7KeVcWF7RSai0s7S+a0p7A8JXDxlqgmQ8lxxStq+lv
 UPbSPRcUgP/DIwwgQwBSLY9rCZ3pzZ/Akfw0Ks6lC5jtTGwf9jzkICX3CXNnbtbNFWve
 5jlh7jpZbmvLHFlVB+jMqx+YhWI27pppIYPwjaO0NI1FIaUpb4CAzsERKd+hzgL44WHf
 eKAkPzFYHGzxT9Hy4fyNQCbKd0sxIDWcb32WDIzkcpeMmeAWVJbZte+Hd2G95DsbngvH
 nunQ==
X-Gm-Message-State: AAQBX9e/BMdBXrT0J3HHLvTohzVHmKkJwOpxqoJ2/5TrkzMlYc3mH7kJ
 +tSSDdKxTkm5hrPvRKM1v7Tiew==
X-Google-Smtp-Source: AKy350ZUaAFKEWbsjii8HaMQgAU8ApgCWVV8pA68iw43SgQqk2gSjSY7F9VgRs6IE9A5yjFy1XblIA==
X-Received: by 2002:a05:6870:b28f:b0:183:cc50:f771 with SMTP id
 c15-20020a056870b28f00b00183cc50f771mr116038oao.25.1680804298491; 
 Thu, 06 Apr 2023 11:04:58 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 19/20] target/riscv: add RVG and remove cpu->cfg.ext_g
Date: Thu,  6 Apr 2023 15:03:50 -0300
Message-Id: <20230406180351.570807-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:05:05 -0000

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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 17 ++++++++---------
 target/riscv/cpu.h |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b005bcb786..143079a8df 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -403,10 +403,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
-    cpu->cfg.ext_g = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
     cpu->cfg.ext_xtheadba = true;
@@ -814,12 +813,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1462,6 +1460,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVJ, .enabled = false},
     {.name = "v", .description = "Vector operations",
      .misa_bit = RVV, .enabled = false},
+    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
+     .misa_bit = RVG, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1484,7 +1484,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e011cf6ca4..070547234b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVJ RV('J')
+#define RVG RV('G')
 
 
 /* Privileged specification version */
@@ -422,7 +423,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_g;
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
-- 
2.39.2


