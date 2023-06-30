Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED130EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:09:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFB3z-0005bp-7g; Fri, 30 Jun 2023 06:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB3r-0005QP-7A
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:09:08 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB3o-0000qC-BP
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:09:05 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-19a427d7b57so1249602fac.2
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 03:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688119743; x=1690711743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LaoXRj5GeVqv8FWfywQJXC4kH9xEnXXPplACV+RhCw=;
 b=VUuMdw7zhFBRxIOCvPkDSMYT8zKC9M9DtySEGZ4TXwYiXRq3g2gLkT+oevcHROvPgJ
 CIVWMHV05kHnZsQ88AZvxoMVxstQsxJH8LHsFqxkXOY7NjpZwLOG9dHst1YivaP5bCEH
 XwswH+yLl8JPS3digT8SeS2XzkzrPmMVpI/xVpzISmZc3MAT9iyRhdDcpZANJsFn2aNQ
 vTnEuSaxOwXpFotEG7BXHvHJlOCL/Z8ER7LVLV0YD+m1O7yvRSijx2TowyAV+LZozarZ
 uKkvX3IfggArXgoHBtFPgrCyCrZanJW9ICAG4L1xQM2M+/EfF0Ay7Le4I37U2TrIa39T
 9hJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688119743; x=1690711743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LaoXRj5GeVqv8FWfywQJXC4kH9xEnXXPplACV+RhCw=;
 b=aBT6uFcwbCEaxPOdc4fP8XTb9FiNsY2hudyQOA6eHPdcOkbkXljKkeuw2fxiNnJRsr
 0Jy5nwjXcamlLyWWrjpMR++X6OBaYRtTkw/MT3e61s7dKxUz6YCDfCCZSrNk6yCR+h3V
 XH+ND2k46gp+u8iSdkQcSOH3Bje7scxDvPz1uTMgP2YfS06fGfjWQXnbMZ1kZFK/H8hQ
 mV+MqFiTE4Bs5hTOmifruEU+cjUxu+4BaMFShAZjRVYYA5LYlgftcm0MHBiVyhUUh/Ve
 Qwg2ZLI6HcUJB2nqesywHFdwczluIpEfvurGVJbjYs0p+L0I9fTAljG3BJGna3eNvMgi
 ncFw==
X-Gm-Message-State: AC+VfDz3Co+MzXAHq1xZjNnQEnFY66qvkbK8XSAv83e15xFuhzFDkhdM
 +82hWV42oHxupRuuKGcdFiq91jyyjtJHSngaBDM=
X-Google-Smtp-Source: APBJJlGNzVMRyObLZSzGOO7zcItztiuQ7PE2e5dnWyX7qP9iDzzqlA9HCUjWCzbyf7oiNXl+Z9p8Hw==
X-Received: by 2002:a05:6871:8a5:b0:1b0:7ef4:2a3d with SMTP id
 r37-20020a05687108a500b001b07ef42a3dmr2587450oaq.6.1688119743343; 
 Fri, 30 Jun 2023 03:09:03 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 eh18-20020a056870f59200b001a663e49523sm8707467oab.36.2023.06.30.03.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 03:09:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 13/20] target/riscv/kvm.c: update KVM MISA bits
Date: Fri, 30 Jun 2023 07:08:04 -0300
Message-ID: <20230630100811.287315-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630100811.287315-1-dbarboza@ventanamicro.com>
References: <20230630100811.287315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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

Our design philosophy with KVM properties can be resumed in two main
decisions based on KVM interface availability and what the user wants to
do:

- if the user disables an extension that the host KVM module doesn't
know about (i.e. it doesn't implement the kvm_get_one_reg() interface),
keep booting the CPU. This will avoid users having to deal with issues
with older KVM versions while disabling features they don't care;

- for any other case we're going to error out immediately. If the user
wants to enable a feature that KVM doesn't know about this a problem that
is worth aborting - the user must know that the feature wasn't enabled
in the hart. Likewise, if KVM knows about the extension, the user wants
to enable/disable it, and we fail to do it so, that's also a problem we
can't shrug it off.

In the case of MISA bits we won't even try enabling bits that aren't
already available in the host. The ioctl() is so likely to fail that
it's not worth trying. This check is already done in the previous patch,
in kvm_cpu_set_misa_ext_cfg(), thus we don't need to worry about it now.

In kvm_riscv_update_cpu_misa_ext() we'll go through every potential user
option and do as follows:

- if the user didn't set the property or set to the same value of the
host, do nothing;

- Disable the given extension in KVM. Error out if anything goes wrong.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index c55d0ec7ab..7afd6024e6 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -162,6 +162,41 @@ static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
                "enabled in the host", misa_ext_cfg->name);
 }
 
+static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
+{
+    CPURISCVState *env = &cpu->env;
+    uint64_t id, reg;
+    int i, ret;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
+        KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
+        target_ulong misa_bit = misa_cfg->offset;
+
+        if (!misa_cfg->user_set) {
+            continue;
+        }
+
+        /* If we're here we're going to disable the MISA bit */
+        reg = 0;
+        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
+                              misa_cfg->kvm_reg_id);
+        ret = kvm_set_one_reg(cs, id, &reg);
+        if (ret != 0) {
+            /*
+             * We're not checking for -EINVAL because if the bit is about
+             * to be disabled, it means that it was already enabled by
+             * KVM. We determined that by fetching the 'isa' register
+             * during init() time. Any error at this point is worth
+             * aborting.
+             */
+            error_report("Unable to set KVM reg %s, error %d",
+                         misa_cfg->name, ret);
+            exit(EXIT_FAILURE);
+        }
+        env->misa_ext &= ~misa_bit;
+    }
+}
+
 static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
 {
     int i;
@@ -632,8 +667,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     if (!object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
         ret = kvm_vcpu_set_machine_ids(cpu, cs);
+        if (ret != 0) {
+            return ret;
+        }
     }
 
+    kvm_riscv_update_cpu_misa_ext(cpu, cs);
+
     return ret;
 }
 
-- 
2.41.0


