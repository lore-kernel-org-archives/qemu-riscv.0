Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EB2EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:13:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFB4v-0006qH-FK; Fri, 30 Jun 2023 06:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB4l-0006bF-FX
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:10:03 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB4f-0000up-2f
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:10:03 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1b055510c9dso1260743fac.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688119767; x=1690711767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VdgCpdGNCnRHbRMj8PAj04MsFdIIUW9yhq0HzvRhPPA=;
 b=VX3AeTG0MIVNF8WquM2R/MVgbUW6m4/PFVhwnsJcQWPd9oEnFmzLIoiinLgPSItdEw
 +T/lnh7Q18vR6qpmHcrsbnCboaQxrLMOWo4kvb3Vhs8WbsVHXQSdKf2dJ+s4gykjXxDw
 iQ82HT0llwjROjiIBszOTjTVZ55ZqcChMU2yjP1TE0tyi1EYwln+y8iwJiuAKeK11L6Y
 OlT1CtwJfdKoCeYoJTuuzc+wXSgPj2l4W7/+SWOKVEQnDfDdt9KfTHId2FlIM4uJsDgu
 o2SCP3mAwXAzgdbhG0YSMMpU7VCjs4EBBU6rddaa5t7RGbgwDy27c55s6VBRU47A+2/J
 JFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688119767; x=1690711767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdgCpdGNCnRHbRMj8PAj04MsFdIIUW9yhq0HzvRhPPA=;
 b=XEcrV/AztY5R5kqkHleIJ2d/tAcTtAoP8YqHrrdXxgga82/oNx9VGpzczU0BngKx4B
 FbgBKaQyiKwMb8BymTL3QDGIqSrMrxlPIlbE3oRCpDWG+VPd9bceplQgBNcpbSlpr6J1
 odYgszD0+CBV41Zfn+CeTHl/i0jBXap+ziTPuYwl58Ark9UaRRPHTKSG7TK2IDsrtPcF
 WBBn6X2KSM/r9QKauC61jHLq7cceTywQJKM5niAnJUCExpTOmmfOLCtNG/sf2Rph+GwR
 VftCsgJcD3REX+o/CCsNK8V5I8yHv6iWfkwGmafz3nI2HbwGBhrwBFpNInOkwdx8dCcq
 8DRg==
X-Gm-Message-State: ABy/qLY+NS8uPBwAYlvG95mRp19EfbOFnmvi1zJNE34PjvDmNXmxehps
 PZMWuDZGz/hb6wSO+plq5RkgNg==
X-Google-Smtp-Source: ACHHUZ5d9cnDIkVel1MrWpeWSQ+oe5oxU++hx4bxTdqjpFR9EWbYozTXujuMnNa87ZtPzSdKHM4CAg==
X-Received: by 2002:a05:6870:d98:b0:1b0:3118:1e83 with SMTP id
 mj24-20020a0568700d9800b001b031181e83mr2771845oab.49.1688119766806; 
 Fri, 30 Jun 2023 03:09:26 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 eh18-20020a056870f59200b001a663e49523sm8707467oab.36.2023.06.30.03.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 03:09:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 20/20] target/riscv/kvm.c: read/write (cbom|cboz)_blocksize
 in KVM
Date: Fri, 30 Jun 2023 07:08:11 -0300
Message-ID: <20230630100811.287315-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630100811.287315-1-dbarboza@ventanamicro.com>
References: <20230630100811.287315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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

If we don't set a proper cbom_blocksize|cboz_blocksize in the FDT the
Linux Kernel will fail to detect the availability of the CBOM/CBOZ
extensions, regardless of the contents of the 'riscv,isa' DT prop.

The FDT is being written using the cpu->cfg.cbom|z_blocksize attributes,
so let's expose them as user properties like it is already done with
TCG.

This will also require us to determine proper blocksize values during
init() time since the FDT is already created during realize(). We'll
take a ride in kvm_riscv_init_multiext_cfg() to do it. Note that we
don't need to fetch both cbom and cboz blocksizes every time: check for
their parent extensions (icbom and icboz) and only read the blocksizes
if needed.

In contrast with cbom|z_blocksize properties from TCG, the user is not
able to set any value that is different from the 'host' value when
running KVM. KVM can be particularly harsh dealing with it: a ENOTSUPP
can be thrown for the mere attempt of executing kvm_set_one_reg() for
these 2 regs.

Hopefully we don't need to call kvm_set_one_reg() for these regs.
We'll check if the user input matches the host value in
kvm_cpu_set_cbomz_blksize(), the set() accessor for both blocksize
properties. We'll fail fast since it's already known to not be
supported.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index f048135cd3..56d8aa9b17 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -276,6 +276,42 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
     kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
 }
 
+static KVMCPUConfig kvm_cbom_blocksize = {
+    .name = "cbom_blocksize",
+    .offset = CPUCFG(cbom_blocksize),
+    .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)
+};
+
+static KVMCPUConfig kvm_cboz_blocksize = {
+    .name = "cboz_blocksize",
+    .offset = CPUCFG(cboz_blocksize),
+    .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)
+};
+
+static void kvm_cpu_set_cbomz_blksize(Object *obj, Visitor *v,
+                                      const char *name,
+                                      void *opaque, Error **errp)
+{
+    KVMCPUConfig *cbomz_cfg = opaque;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t value, *host_val;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    host_val = kvmconfig_get_cfg_addr(cpu, cbomz_cfg);
+
+    if (value != *host_val) {
+        error_report("Unable to set %s to a different value than "
+                     "the host (%u)",
+                     cbomz_cfg->name, *host_val);
+        exit(EXIT_FAILURE);
+    }
+
+    cbomz_cfg->user_set = true;
+}
+
 static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
 {
     CPURISCVState *env = &cpu->env;
@@ -329,6 +365,14 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
                             kvm_cpu_set_multi_ext_cfg,
                             NULL, multi_cfg);
     }
+
+    object_property_add(cpu_obj, "cbom_blocksize", "uint16",
+                        NULL, kvm_cpu_set_cbomz_blksize,
+                        NULL, &kvm_cbom_blocksize);
+
+    object_property_add(cpu_obj, "cboz_blocksize", "uint16",
+                        NULL, kvm_cpu_set_cbomz_blksize,
+                        NULL, &kvm_cboz_blocksize);
 }
 
 static int kvm_riscv_get_regs_core(CPUState *cs)
@@ -644,6 +688,24 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
     env->misa_ext = env->misa_ext_mask;
 }
 
+static void kvm_riscv_read_cbomz_blksize(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
+                                         KVMCPUConfig *cbomz_cfg)
+{
+    CPURISCVState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    int ret;
+
+    reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
+                              cbomz_cfg->kvm_reg_id);
+    reg.addr = (uint64_t)kvmconfig_get_cfg_addr(cpu, cbomz_cfg);
+    ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
+    if (ret != 0) {
+        error_report("Unable to read KVM reg %s, error %d",
+                     cbomz_cfg->name, ret);
+        exit(EXIT_FAILURE);
+    }
+}
+
 static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
 {
     CPURISCVState *env = &cpu->env;
@@ -675,6 +737,14 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
 
         kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
     }
+
+    if (cpu->cfg.ext_icbom) {
+        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
+    }
+
+    if (cpu->cfg.ext_icboz) {
+        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cboz_blocksize);
+    }
 }
 
 void kvm_riscv_init_user_properties(Object *cpu_obj)
-- 
2.41.0


