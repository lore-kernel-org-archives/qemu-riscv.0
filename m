Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf70e-0006yo-QS
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70c-0006ye-Ss
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:42 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6yO-0007Ee-NG
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:42 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5419d4c340aso363921837b3.11
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADt/jKeQIFnLBYxR5tPJNl8bZeJArajSApuG78AxbMA=;
 b=RJXBX1RdtGXAwToCqFu/cgXB7UxfInPZnYdo4dtk/GO/vvTO+9TQRYmnHvHNh3A4KV
 h/ta9WO4SD0YTJhBJdH+0Z2+poKbM1c4xZg9tFyjjaUP/hMmv7A+Ic8M5G4LMzWEleYq
 gYtjU7nCy96Iz1DtbPIU+HpCLYwxD9OlHiSLXSo5RFG9lNSYQ80suwhTXJOWN8UtD49b
 vYWu+UP12WNzAB9WXNoATrdlcM0sC8ZUbfnoFx9++5PeGZHg3HFUmaUFWZ9AbSQua+l1
 fBJW+Rumjm2C4yzSFWHEa120QzJzaoZCzLCLbaM4oOrpDF8u4W0mwvsK7Z1igPMomKmJ
 x1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ADt/jKeQIFnLBYxR5tPJNl8bZeJArajSApuG78AxbMA=;
 b=OTIdPTRxzgafJ/cRuciSrPl7H7hRfKkmXttEOGhsLtddbt0WfyAWP5yjxJ5k1iyfpm
 Bab4hLoHy9s5ECjPvmaOD4scuM4EEal2OFWRmd411KWGEK0jqpv07K2qnyOP1Kfr6RbH
 chDxX9W9bmXWR4sD4YHyMby+26cfDDajOhg5VDGhgPZ8YBDPY+VmlVmrOcJWgsIDRiRc
 5BolyLeHSh3tXxjkmt/OuenzchGcDdxf2vipDwW8f9R4hH+t9Q8rHf7B5BgFEBDOkZC8
 zsnagq6YaUV5X3mpGI7S75RPvMgZZBQzcIXTzCLW8PI3nhvBObh6UVUPmgBcIteE3Yla
 gyDw==
X-Gm-Message-State: AAQBX9eJumDnObd4FDX+lhcROelXOCdLjaO8YzNpr0+ifXhUzbrdC+sa
 uqf6Jk7KLzM7h9d0ZfpiKzPjLazLUDxiBFw8ufQ=
X-Google-Smtp-Source: AK7set+AgrGvhJBvxnyRlSPOPa1DgU7o/ZJ2Xno/P28y18PqR0t/YF/WSZy21pH55ElzsGODTFzbWA==
X-Received: by 2002:a05:6870:ecaa:b0:17b:2054:38f0 with SMTP id
 eo42-20020a056870ecaa00b0017b205438f0mr884271oab.25.1679523668565; 
 Wed, 22 Mar 2023 15:21:08 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 15/25] target/riscv/cpu.c: split RVG code from
 validate_set_extensions()
Date: Wed, 22 Mar 2023 19:19:54 -0300
Message-Id: <20230322222004.357013-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112e.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:32:43 -0000

We can set all RVG related extensions during realize time, before
validate_set_extensions() itself. Put it in a separated function so the
validate function already uses the updated state.

Note that we're setting both cfg->ext_N and env->misa_ext bits, instead
of just setting cfg->ext_N. The intention here is to start syncing all
misa_ext operations with its cpu->cfg flags, in preparation to allow for
the validate function to operate using a misa_ext. This doesn't make any
difference for the current code state, but will be a requirement for
write_misa() later on.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f41888baa0..a7bad518be 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -281,6 +281,36 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
     return ext;
 }
 
+static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    RISCVCPUConfig *cfg = &cpu->cfg;
+
+    if (!(cfg->ext_i && cfg->ext_m && cfg->ext_a &&
+          cfg->ext_f && cfg->ext_d &&
+          cfg->ext_icsr && cfg->ext_ifencei)) {
+
+        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
+        cfg->ext_i = true;
+        env->misa_ext |= RVI;
+
+        cfg->ext_m = true;
+        env->misa_ext |= RVM;
+
+        cfg->ext_a = true;
+        env->misa_ext |= RVA;
+
+        cfg->ext_f = true;
+        env->misa_ext |= RVF;
+
+        cfg->ext_d = true;
+        env->misa_ext |= RVD;
+
+        cfg->ext_icsr = true;
+        cfg->ext_ifencei = true;
+    }
+}
+
 static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
                                        uint32_t misa_ext)
 {
@@ -1033,21 +1063,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                            cpu->cfg.ext_d &&
-                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
-        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_i = true;
-        cpu->cfg.ext_m = true;
-        cpu->cfg.ext_a = true;
-        cpu->cfg.ext_f = true;
-        cpu->cfg.ext_d = true;
-        cpu->cfg.ext_icsr = true;
-        cpu->cfg.ext_ifencei = true;
-    }
-
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
@@ -1290,6 +1305,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(dev);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
+    CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1310,6 +1326,20 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_g) {
+        riscv_cpu_enable_g(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        /*
+         * Sync env->misa_ext_mask with the new
+         * env->misa_ext val.
+         */
+        env->misa_ext_mask = env->misa_ext;
+    }
+
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.39.2


