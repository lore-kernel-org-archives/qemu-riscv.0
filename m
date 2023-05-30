Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC441C77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 19:48:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45Il-0006RS-SP; Tue, 30 May 2023 15:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45Il-0006R1-2L
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:46:39 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45Ij-0004F2-Bo
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:46:38 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-19f09321191so3408448fac.2
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 12:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685475996; x=1688067996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QS1DGxToErlST7DIPVOrtAe0U4ury3VVrsLqKkjgUmA=;
 b=nbbOZJSq0xLiNLRIK/EEnwTLSUJ+rz+ZkjI8g5numGuCnlCHsp+SNeYttB2OMf1ZWY
 x5/CuRNkz5gfieGqRnqV9g5YFCTN3HhOVXEsG1Bp4kBT7q/IfvdzvHZJKtJko6HUB2Dd
 xG8xYYv82yOu99mXCNHXj1qUeiNKtyWgdjynLIXEgIKg/TOetXdPnr4Sx4MkDI102QHU
 84++znJOndBv5Yh1XcmhZoeVNc/j4YScZiCN+QZQq1I4/UzZHbBtlU4atNjytcNGJtE5
 UDFhehEKZdURoDxIMuyE3vk0Igg+d3w0EhvMn36yVZNWtPttQFEFzi9vKNwY53FndERc
 ftkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685475996; x=1688067996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QS1DGxToErlST7DIPVOrtAe0U4ury3VVrsLqKkjgUmA=;
 b=BI4sSLGv1ju8XFr+7eh9nXkWtX/5BmwDbEDI6sRfofiZaGIMUKkIUWGxWHlxwOR0nB
 M6NCvAmapdL398PJaymrNREzYl1k7UyIArKg2A5InYabhObVa3OVLDvxwVkbo6xglaVr
 wV3VzgYJC4xkNNH0DLO+RiRgsnY5GKl7J/b+ZehKSar08S/H8u8tWmmaPlIuyP/qN4Cl
 01xNrNJ11BrkHmw9sMCB7sHnVjklMzcqji5aMhxVLZng8Sz8L5hxCRyFP3EUMQTxi3y6
 uuA5gVz3fGmYkKNbK8+voYy6e7tRcGvQSl37l82XCuXiPFdElGwIomwzyToA3spi2zL8
 wctQ==
X-Gm-Message-State: AC+VfDwglCSq9sTLKmMWWXe2IhTSb0IzUUiDEt2oj93Tbif1pj9YAbqD
 gi4RkqCZimK8BHYZHIaIYX/cNQ==
X-Google-Smtp-Source: ACHHUZ4r0WWYtsm5Bl52e9SbsZ/Vt+3ACC3A8dNkTmlqcZBTdpTMv4iJ4V2Jjabi7//3qQnjHBF8nQ==
X-Received: by 2002:a05:6870:a2d5:b0:19e:ae04:95ae with SMTP id
 w21-20020a056870a2d500b0019eae0495aemr1870683oak.40.1685475996014; 
 Tue, 30 May 2023 12:46:36 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (200-162-225-121.static-corp.ajato.com.br. [200.162.225.121])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056870a48300b0019fa8728b05sm342214oal.39.2023.05.30.12.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:46:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 01/16] target/riscv: skip features setup for KVM CPUs
Date: Tue, 30 May 2023 16:46:08 -0300
Message-Id: <20230530194623.272652-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530194623.272652-1-dbarboza@ventanamicro.com>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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
---
 target/riscv/cpu.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 938c7bd87b..72f5433776 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -331,6 +331,15 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
 }
 #endif
 
+static bool riscv_running_KVM(void)
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
@@ -1295,20 +1304,12 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
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
@@ -1354,6 +1355,28 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
+    if (!riscv_running_KVM()) {
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


