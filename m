Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73793EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 22:09:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDuJS-0005pQ-P6; Mon, 26 Jun 2023 18:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuIm-00033h-5D
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:03:16 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuIg-00063X-JF
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:03:15 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1a998a2e7a6so3858063fac.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 15:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687816989; x=1690408989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwNYLTnjDH55+T5jdeMBAZYd/K+t4SWriNEQAkVXv6M=;
 b=OGf3OzRltt37487TmFxgnEq2mvTM/6yxmmYNzBwOfHP47iliJ2EL4iVvaQRmEfDfGi
 rrcoYzm4FO40ns6mx+v+em/Kl/YYYJ9q6I8+ftpBmJ/iKcDvWtX9VxBc/gMYt760nlre
 R8/Fj4/uih5Xbqb6JLiOdNMCuvYFK+gjZDubvqPLr1B/p+5Je/CpG6aYT3kSZnI9CF8a
 kk8axrDw1UdJFmitLe1TLVTfNqxr78DIWvkb9TLmTIqRRFWowFl/DJ4DLOk2wisRmk05
 K6wqyQTAMwO9KlMafAOf+f/NHEF3L30kbfpxq0JzUdrHVS8SujqyiNz+LJdBRePWxPv3
 nhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687816989; x=1690408989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwNYLTnjDH55+T5jdeMBAZYd/K+t4SWriNEQAkVXv6M=;
 b=ZwlSuCH0DwN2wUIbH0PCZcHf7CUbZWcfjKpoLpC4Nc4ZxS63nLuzV01LbtgqWFADcc
 QWJlkx7tfhV70EEBaXPuFzxCRUpMvrOImB5yv7A6rVX3tBorLPMJCFFJlCU2UR3Wu/ys
 lk0BEAw9VfAf1+VD2oOYG9uSDTffD88njB5d82Og0v2ig50WMOSiCWCIqUJT4qxSFi9v
 c9qdm7r3TYl7t6s9EoDj27qgk9kUbTmbWQPpYlLQ2vk0LJnftueimoH5kJrS8frnC1ep
 XpNvGqtQyK0WzLkR4T33dEzNXnjDuUGpsFkNhXGZxNhlcJLvXW7IWoysxO8u1Wf5dyfn
 E3ww==
X-Gm-Message-State: AC+VfDyifTks8TqfDLmwkPkXQDtl/MSB9hFkbVnEyNAcbpfJBmpXhgQ3
 pJnud8Wj4tcDNg32drFQ/mp++g==
X-Google-Smtp-Source: ACHHUZ7DFwoifTLCPOjNMdRX0YGDqkgLPPzyfk5P61ivS4OUtqZZyq36l7oJN2czvfdApqHuGJDaEw==
X-Received: by 2002:a05:6870:7384:b0:1a2:ffb5:cd73 with SMTP id
 z4-20020a056870738400b001a2ffb5cd73mr21395719oam.38.1687816989107; 
 Mon, 26 Jun 2023 15:03:09 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056870a10c00b001b03fbfa0c5sm1831419oae.39.2023.06.26.15.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 15:03:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 19/19] target/riscv/kvm.c: read/write (cbom|cboz)_blocksize
 in KVM
Date: Mon, 26 Jun 2023 19:02:09 -0300
Message-ID: <20230626220209.22142-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626220209.22142-1-dbarboza@ventanamicro.com>
References: <20230626220209.22142-1-dbarboza@ventanamicro.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In contrast with cbom/z_blocksize properties from TCG, the user is not
able to set any value that is different from the 'host' value when
running KVM. KVM can be particularly harsh dealing with it: a ENOTSUPP
can be thrown for the mere attempt of executing kvm_set_one_reg() for
these 2 regs.

Hopefully, we don't need to call kvm_set_one_reg() for these regs.
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
index e8f6683030..58ce42b322 100644
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


