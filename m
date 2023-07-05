Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D83EEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 21:44:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHAER-0004l6-1E; Wed, 05 Jul 2023 17:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAEM-0004kK-QD
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:13 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAEK-0001aG-M7
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:10 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-563531a3ad2so4963734eaf.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688593207; x=1691185207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dzsnYR034KDJ8Bk8jT9IC3VF7Gf7HsQ5csZ2zr9bQz0=;
 b=glTsrFjA2ZjLn7AGqHQ4wMDfL2MOaxUDarM069t/FdOU8sh4z0quHJYEJXX/vHckBq
 HoVfPLRh+xxC+qO4T6lRo1i5cLuKpnF0r1A2mXY17+FFbOIl0gTZpU3L1t/zb4UR/AtW
 D4VBsA4MGzCyLcHMS8i2lQYxdolpqWyz8G/HHdnrL82H+aRzHMFHP5NeOoKxEZPcL0M/
 iImT/5H8WgqdUeTWuOnJLb788RvQ4ZWDkMFXlTz77Hj+vfGQbHUnUzdvX3wBSQ2VsE/P
 V5EdNzA5oBx7V3YPEf8CoK0Qi4tok/qmcnprHXC7YjP0PQVbZjYs5zwWHyjVyM8WeOCu
 902Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688593207; x=1691185207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dzsnYR034KDJ8Bk8jT9IC3VF7Gf7HsQ5csZ2zr9bQz0=;
 b=lfpqvDxmoKBgfsQMLrQVCCZe7YyhKjtmLUZ1rtKre9FCfa3KQBWqzOcRkNoQyXySkc
 yt99s9OaxbcqMelP9ajbif7chJgXgYM44GlgN93KLHR/IhQaxn8G4cMz7EA5FX3IzI1V
 7zVZvAcU39lxyz3w8XeUMfjYjm1KPq5Knohmsg3Mk/r9r2m2cZZXxCv6ujY2ptq5atly
 ki+aU61JtorNG0PKXbQPQ4ViKXbyzVi2IvsFlErlBv8VbnSfyTxn6NnK6yY0mOs+ZO9Q
 bI6Dl+KWPs87B0mlA+rGkqnKwI2+1H+jPrBm8P1S0zbaou4b5qcHGraO8PxzZi2timpK
 YBLw==
X-Gm-Message-State: ABy/qLYldMvefKXivQDD1SlEh4UbGg/wcxFNeHsicq64MXpkHompnvIC
 wfLeG6gxU6Kf8lqQURIyZVHeuw==
X-Google-Smtp-Source: APBJJlHKBuNIJndYOpIYO9vK3kRHcr9dKlua743dtcm/eikDditW6rovkML4RCcRYYfBAQfkLG4BfQ==
X-Received: by 2002:a4a:45ce:0:b0:563:4f17:ff4c with SMTP id
 y197-20020a4a45ce000000b005634f17ff4cmr6385ooa.7.1688593207092; 
 Wed, 05 Jul 2023 14:40:07 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a4add01000000b0056665a16536sm70764oou.30.2023.07.05.14.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 14:40:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 01/20] target/riscv: skip features setup for KVM CPUs
Date: Wed,  5 Jul 2023 18:39:36 -0300
Message-ID: <20230705213955.429895-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705213955.429895-1-dbarboza@ventanamicro.com>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

As it is today it's not possible to use '-cpu host' if the RISC-V host
has RVH enabled. This is the resulting error:

$ ./qemu/build/qemu-system-riscv64 \
    -machine virt,accel=kvm -m 2G -smp 1 \
    -nographic -snapshot -kernel ./guest_imgs/Image  \
    -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
    -append "earlycon=sbi root=/dev/ram rw" \
    -cpu host
qemu-system-riscv64: H extension requires priv spec 1.12.0

This happens because we're checking for priv spec for all CPUs, and
since we're not setting  env->priv_ver for the 'host' CPU, it's being
default to zero (i.e. PRIV_SPEC_1_10_0).

In reality env->priv_ver does not make sense when running with the KVM
'host' CPU. It's used to gate certain CSRs/extensions during translation
to make them unavailable if the hart declares an older spec version. It
doesn't have any other use. E.g. OpenSBI version 1.2 retrieves the spec
checking if the CSR_MCOUNTEREN, CSR_MCOUNTINHIBIT and CSR_MENVCFG CSRs
are available [1].

'priv_ver' is just one example. We're doing a lot of feature validation
and setup during riscv_cpu_realize() that it doesn't apply to KVM CPUs.
Validating the feature set for those CPUs is a KVM problem that should
be handled in KVM specific code.

The new riscv_cpu_realize_tcg() helper contains all validation logic that
are applicable to TCG CPUs only. riscv_cpu_realize() verifies if we're
running TCG and, if it's the case, proceed with the usual TCG realize()
logic.

[1] lib/sbi/sbi_hart.c, hart_detect_features()

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fd647534cf..6232e6513b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,7 @@
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "kvm_riscv.h"
 #include "tcg/tcg.h"
 
@@ -1386,20 +1387,12 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
     }
 }
 
-static void riscv_cpu_realize(DeviceState *dev, Error **errp)
+static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
 {
-    CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(dev);
     CPURISCVState *env = &cpu->env;
-    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
     riscv_cpu_validate_misa_mxl(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1434,7 +1427,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
-    cs->tcg_cflags |= CF_PCREL;
+    CPU(dev)->tcg_cflags |= CF_PCREL;
 
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
@@ -1447,6 +1440,28 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
      }
 #endif
+}
+
+static void riscv_cpu_realize(DeviceState *dev, Error **errp)
+{
+    CPUState *cs = CPU(dev);
+    RISCVCPU *cpu = RISCV_CPU(dev);
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
+    Error *local_err = NULL;
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (tcg_enabled()) {
+        riscv_cpu_realize_tcg(dev, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
 
     riscv_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
-- 
2.41.0


