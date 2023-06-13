Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF426EB64D8
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 21:01:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9B6o-0001xf-JL; Tue, 13 Jun 2023 16:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B6n-0001xL-UF
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 16:59:21 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B6l-0006cq-Uv
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 16:59:21 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-55b3d77c9deso16848eaf.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686689958; x=1689281958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdlVCgCsofoU3sFhayk2xbcE3ncEw8ypwrBf9jIXxPE=;
 b=IikGr5frSWPiVYu+iUe//e1Jj8dnqyz5eb4uGSZPilsNlK6JqRE78EHkrcfMxOmqMt
 LK7gOOLGgTL11iyuTBEW/VEvfgldH2F3vlulagjn1P274tCQOeg4ZEQTgOBb1IEXmQXD
 44184uT1u41xjOLi4d8wIA7FQR0Of6J4ro8ucDSLoBAEj+on9L9BjtZ5lsGsXha69TZ1
 dcqR786B4vW8VJsZUwkdiZSbWhSZ9gxCVUPc7JzFw5OLVSfUqn3GwvMniO10BuTwur7W
 7y9GPGRgya9uY06GMWsiO/JYlI+P7JP8lkyvmYgOVAZSGSJmw75GDkZKqB9/Mgo4/Cwq
 s7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686689958; x=1689281958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hdlVCgCsofoU3sFhayk2xbcE3ncEw8ypwrBf9jIXxPE=;
 b=CT3CxqQE6GWdauNPvQvsVvbdiPyOhsUeuPzjCGVTAZxzWbn22VmmPJ5wiwUdtTNk0v
 s/EW3ELFtspUspRLsViZ+gFJ7HiFZYc2wNif+sdbGwMko8P5kxFSzNChGqA/Lj95GK9U
 iIiWJCSZaRycj9BvE6uqryrwbFe4lreba+xAmNxLKFj4scdEuu13wORVlSQwY6lU0H7N
 XMyjAt/pW8QTLjZcXmRAdwsdAqVwzQiroVyFzx3UlSS5H4WNIsO3SVcU2dwutOygqO1m
 Ui7HpcNlfHvNdXm53WsIFvC1ralpFnyhpXojFTCVGp/7tNtBoR/g78BpuOmuaiqJElLE
 7+ig==
X-Gm-Message-State: AC+VfDzRoOzHxslTpCJBHAxPIFv0OqfnDAUpdDg6WnVmFwC1Xg1vlOY/
 v0hP3oO/XXKm8sREH5igF9+eSA==
X-Google-Smtp-Source: ACHHUZ46jxEeCBMk6z7agJztuoSYzJJmkWes2zncx0Xz3LKaHYu4/u6wiAbIihW5+BAcGZS/WisMRA==
X-Received: by 2002:a05:6808:1881:b0:39c:7b95:ddc0 with SMTP id
 bi1-20020a056808188100b0039c7b95ddc0mr9937942oib.35.1686689958378; 
 Tue, 13 Jun 2023 13:59:18 -0700 (PDT)
Received: from grind.. ([177.170.117.210]) by smtp.gmail.com with ESMTPSA id
 q82-20020acaf255000000b003982a8a1e3fsm5619514oih.51.2023.06.13.13.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:59:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 01/18] target/riscv: skip features setup for KVM CPUs
Date: Tue, 13 Jun 2023 17:58:40 -0300
Message-Id: <20230613205857.495165-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613205857.495165-1-dbarboza@ventanamicro.com>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
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

$ sudo ./qemu/build/qemu-system-riscv64 \
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
and setup during riscv_cpu_realize() that it doesn't apply KVM CPUs.
Validating the feature set for those CPUs is a KVM problem that should
be handled in KVM specific code.

The new riscv_cpu_realize_features() helper contains all validation
logic that are not applicable to KVM CPUs. riscv_cpu_realize() verifies
if we're dealing with a KVM CPU and, if not, execute the new helper to
proceed with the usual realize() logic for all other CPUs.

[1] lib/sbi/sbi_hart.c, hart_detect_features()

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 881bddf393..e904018644 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -331,6 +331,15 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
 }
 #endif
 
+static bool riscv_running_kvm(void)
+{
+#ifndef CONFIG_USER_ONLY
+    return kvm_enabled();
+#else
+    return false;
+#endif
+}
+
 static void riscv_any_cpu_init(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
@@ -1304,20 +1313,12 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
     }
 }
 
-static void riscv_cpu_realize(DeviceState *dev, Error **errp)
+static void riscv_cpu_realize_features(DeviceState *dev, Error **errp)
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
@@ -1352,7 +1353,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
-    cs->tcg_cflags |= CF_PCREL;
+    CPU(dev)->tcg_cflags |= CF_PCREL;
 
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
@@ -1365,6 +1366,28 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
+    if (!riscv_running_kvm()) {
+        riscv_cpu_realize_features(dev, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
 
     riscv_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
-- 
2.40.1


