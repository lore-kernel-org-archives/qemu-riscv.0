Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWFb-0001Ix-Aj
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFL-0001Au-Rt
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFI-0006Z8-6W
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:33 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46337)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWFG-0006Tr-Cm
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:31 -0400
Received: by mail-pg1-f193.google.com with SMTP id v9so1157646pgr.13
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=93jKVryLi5S9dNljnJoTk5o5gCPNFkrJiDJGBHe6zKM=;
 b=Uf0q5Npd+eHTB1xJMGUIyqdx4AS6CTlV1AB2xkNsT3bWlwTuqjNt7+Uzr0M73//2MR
 MnpDc05YRd1ZQ2PSTfdVUdg6lGz3foZ7FiinWHGctDVZcC0OpJpjbz+2A069wURyUvbi
 X/rDPkFkHqrBsN+LH7AvsEXAPzTITAyCtPHUQixCr44d9Q5tjwXAEYiXEuaFeX4walpL
 rNs0ObYotdgYDFgWzGZ+hzaW3y3lTnvzIOpaWEN4JZCReOy0UQGNVnDXW7kZArNwv+C2
 5CiGJTtcZcvgcuQH69dt3s5NM9lQxzNpJVnt+lBCI/lbxMAUGIBCOB3Gqdgajnqnz973
 yNhg==
X-Gm-Message-State: APjAAAUmi8rXtkG5kFUQ/t/TdlyWp1NnQ9EG7TLYiGUE3c/DoSbCto2V
 ns9t+FYoB1A/IKh/Qe9YSOq7C8xi1WIzvQ==
X-Google-Smtp-Source: APXvYqyrKLI7p81HFT6sRxq+xeNUpt9hOoVsGXvZvMPW7IhLAiS3X5Bp2LOXJnZ+QPmNNU7E5hkifA==
X-Received: by 2002:a63:dc50:: with SMTP id f16mr4318555pgj.447.1561649004254; 
 Thu, 27 Jun 2019 08:23:24 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id s12sm3367191pfe.143.2019.06.27.08.23.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:23 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:38 -0700
Message-Id: <20190627152011.18686-2-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
Subject: [Qemu-riscv] [PULL 01/34] target/riscv: Allow setting ISA
 extensions via CPU props
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jun 2019 15:23:39 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

This patch allows us to enable/disable the RISC-V ISA extensions from
the QEMU command line. This works with the rv32 and rv64 machines. The
idea is that in the future we can now add extensions and leave them
disabled by default until enabled by the user.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 70 ++++++++++++++++++++++++++++++++++++++++++++--
 target/riscv/cpu.h | 11 ++++++++
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6f2b64422086..0632ac08cf35 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 
@@ -119,7 +120,8 @@ static void riscv_any_cpu_init(Object *obj)
 static void riscv_base32_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    /* We set this in the realise function */
+    set_misa(env, 0);
 }
 
 static void rv32gcsu_priv1_09_1_cpu_init(Object *obj)
@@ -156,7 +158,8 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
 static void riscv_base64_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    /* We set this in the realise function */
+    set_misa(env, 0);
 }
 
 static void rv64gcsu_priv1_09_1_cpu_init(Object *obj)
@@ -315,6 +318,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_10_0;
     int user_version = USER_VERSION_2_02_0;
+    target_ulong target_misa = 0;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -358,6 +362,58 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_feature(env, RISCV_FEATURE_PMP);
     }
 
+    /* If misa isn't set (rv32 and rv64 machines) set it here */
+    if (!env->misa) {
+        /* Do some ISA extension error checking */
+        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+            error_setg(errp,
+                       "I and E extensions are incompatible");
+                       return;
+       }
+
+       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
+                               cpu->cfg.ext_a & cpu->cfg.ext_f &
+                               cpu->cfg.ext_d)) {
+            warn_report("Setting G will also set IMAFD");
+            cpu->cfg.ext_i = true;
+            cpu->cfg.ext_m = true;
+            cpu->cfg.ext_a = true;
+            cpu->cfg.ext_f = true;
+            cpu->cfg.ext_d = true;
+        }
+
+        /* Set the ISA extensions, checks should have happened above */
+        if (cpu->cfg.ext_i) {
+            target_misa |= RVI;
+        }
+        if (cpu->cfg.ext_e) {
+            target_misa |= RVE;
+        }
+        if (cpu->cfg.ext_m) {
+            target_misa |= RVM;
+        }
+        if (cpu->cfg.ext_a) {
+            target_misa |= RVA;
+        }
+        if (cpu->cfg.ext_f) {
+            target_misa |= RVF;
+        }
+        if (cpu->cfg.ext_d) {
+            target_misa |= RVD;
+        }
+        if (cpu->cfg.ext_c) {
+            target_misa |= RVC;
+        }
+        if (cpu->cfg.ext_s) {
+            target_misa |= RVS;
+        }
+        if (cpu->cfg.ext_u) {
+            target_misa |= RVU;
+        }
+
+        set_misa(env, RVXLEN | target_misa);
+    }
+
     riscv_cpu_register_gdb_regs_for_features(cs);
 
     qemu_init_vcpu(cs);
@@ -379,6 +435,16 @@ static const VMStateDescription vmstate_riscv_cpu = {
 };
 
 static Property riscv_cpu_properties[] = {
+    DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
+    DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
+    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
+    DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
+    DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
+    DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
+    DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
+    DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
+    DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
+    DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("user_spec", RISCVCPU, cfg.user_spec),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6c5de37b2520..b47cde501766 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -211,6 +211,17 @@ typedef struct RISCVCPU {
 
     /* Configuration Settings */
     struct {
+        bool ext_i;
+        bool ext_e;
+        bool ext_g;
+        bool ext_m;
+        bool ext_a;
+        bool ext_f;
+        bool ext_d;
+        bool ext_c;
+        bool ext_s;
+        bool ext_u;
+
         char *priv_spec;
         char *user_spec;
         bool mmu;
-- 
2.21.0


