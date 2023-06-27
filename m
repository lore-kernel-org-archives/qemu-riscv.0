Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C17DEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 16:33:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEBc3-0003Uy-Vl; Tue, 27 Jun 2023 12:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBc2-0003Th-5E
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:32:18 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBbz-0004lZ-1Z
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:32:16 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1b06c978946so402602fac.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687883534; x=1690475534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYM0A7uhWQTD7Fcgtx52OKl1AAN477E4boZNXUg2Gdg=;
 b=dvreN359J3aaZr7Ksm6tIgAWf6ITUFd70jmQIhuByoRW2Ox3orSbZfSfJhVWeV6WEG
 43n4DAyBhWoRAhKGtJNgxhOW8aHUWWE1+8wm1mX9cA5/dAZuGy0Xe6qX1auI6KoHF2N4
 yyPfBss14nctudATrMSWOeNaCPD6RV/Xq3x3XWMtHBtZxdU0BOSHwoNt09847a/BRDhP
 LV+mv8NY05HBNcUM5WBA4lNxpxQcz/vyrh1D0lWStHq3yizWdi4wRTeDQKZxKWkgYl2/
 GAJrEeXakFkug38awecmgcMysfawAYCKsuHIb7opugczISBV1w011iF2HGKfkVZnqWR9
 4Bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687883534; x=1690475534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYM0A7uhWQTD7Fcgtx52OKl1AAN477E4boZNXUg2Gdg=;
 b=Ey1RO+NVAw472nwQWpD0dWCBt5VFmLpxbjUUPw+7qyZ460e3+e2hPYJxJOyEhRWFsV
 nLIPDj9qr9sk7jxtKjFtbxSgHl46jY95u/1Q+57h/0a6dektx8yaM4tGKgxrDiMwUdKk
 ebWhIxcXFSV8bjm2m3N6u20AWUMz2FzYZMNxjLA9X/6AcBZqfTq4oMpTVRql2928NJA9
 NyWwQLlMaAXlNSUVcStEJlzBWDBLyvTukdUHgeq7CnmS01WoHZIt4PVhwC9awEh4idMa
 EhQIJLgHF3DOuzpSaSqmQtvkLhJAR9eW+kEC2077pC3Ks5MqEfU2Q4yOFR5ZzxDNoJTu
 Uljg==
X-Gm-Message-State: AC+VfDx11zQS9RHpmgizefkbjJkxSrGJMYxOXtqZU+HZe4bEzMLmx/0K
 +SNlHY0xFZFQYo4WPob7DTc8wQ==
X-Google-Smtp-Source: ACHHUZ6qJireGY4ZkLx0ENrSstUca8TuTjQmz0IdTo357citMDHYGv5r6KpY8lzP5Fd3ksp9AkSSfA==
X-Received: by 2002:a05:6870:4155:b0:1a2:8e53:c418 with SMTP id
 r21-20020a056870415500b001a28e53c418mr28098404oad.57.1687883533706; 
 Tue, 27 Jun 2023 09:32:13 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 gu17-20020a056870ab1100b001a3093ec23fsm5254134oab.32.2023.06.27.09.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 09:32:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 01/19] target/riscv: skip features setup for KVM CPUs
Date: Tue, 27 Jun 2023 13:31:45 -0300
Message-ID: <20230627163203.49422-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627163203.49422-1-dbarboza@ventanamicro.com>
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
index fb8458bf74..e515dde208 100644
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
@@ -1308,20 +1317,12 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
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
@@ -1356,7 +1357,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
-    cs->tcg_cflags |= CF_PCREL;
+    CPU(dev)->tcg_cflags |= CF_PCREL;
 
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
@@ -1369,6 +1370,28 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
2.41.0


