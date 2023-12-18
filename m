Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD7DC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 20:45:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFKT4-00054o-GB; Mon, 18 Dec 2023 15:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFKSm-00050d-4p
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 15:43:44 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFKSj-0001sR-BQ
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 15:43:43 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5bcfc508d14so2940651a12.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 12:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702932220; x=1703537020; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0doA4Frlxb1MZjlKWbeqhjICgS6mp5GR5r4hSfWPbnU=;
 b=m0M8luMRfk0W5YyvH5Ho9Xj9jpN7YTlkPc4v0KyLTULdswl0c5+Xd0KERvVmtl+fxE
 m6tGNljGaD/9ZZCCwvIlxV775JOPKMN3TYsH+jblUE0MdjN51qrPHi5HVjHRBBsQMxSu
 T1Rd+/+ItskkP6iLc5gEiMBvol80DJBs3Rc5I8xCvCf/d70uWOMMdGDDocogibaxhH6t
 fBA/oGfW/vYPSFiOA/9i7lBNKbR+NtAdB8jF+0uu9tTkaV2ZljNqeLqzZup5i+NW1JLl
 3VmZNmhx6D9IgAFHzcivixljuntLyw7OB8GRH/Sw2A2upb3LovbWE6xgyIqAmoYQisTa
 aMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702932220; x=1703537020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0doA4Frlxb1MZjlKWbeqhjICgS6mp5GR5r4hSfWPbnU=;
 b=ZaXbnfbw5jmRvxXu6N1j4Nd7R0cKn7w3wchyEO5ZXUvFnhbn8FQqgqWsKtdO3x05Ao
 fVNoIW6eikh3YPTOWqvm3C92kGjSUGdNssT0f8k+7c4w//lfAeecskWGiTm0nmljViM/
 jxJ+T/zQQa2XtrSF3ydl0oCYGnZPAWagqZou4KcjOMuGHCkMl1oxkKj54KihFzCeFHUO
 rZ46gLy/N33SrMKCXt8MxX9peRRs7c3phGIFUdKlYlOYWaVDJ456Nnbe3tlb+4FysIZ4
 hDJAeqRvioOMKQ84s3TycMsFt/KeNifW9vTneOJ85RQkMjtJZOpZ67JepKdE310MZrcV
 NYvA==
X-Gm-Message-State: AOJu0Yyd47xoIsqFUs9rs7dTgMIXJus4nHUUIN6iLbMPqqmuipaQBdnu
 gRuXlvEUhes4r4Fgo3G5MaWYDVveJ/KVMScjIp8=
X-Google-Smtp-Source: AGHT+IFmMgf2/7fIYhujHQc/Bo1l/N96qMRLE+Q/wA2/qu/o/psc8ihKJ2sxM309UEgXZbxy2Thkyg==
X-Received: by 2002:a05:6a21:6da1:b0:190:5d48:ddd9 with SMTP id
 wl33-20020a056a216da100b001905d48ddd9mr22050758pzb.59.1702932220027; 
 Mon, 18 Dec 2023 12:43:40 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 x20-20020aa793b4000000b006ce7e65159bsm2627905pff.28.2023.12.18.12.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 12:43:39 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 4/4] target/riscv/kvm: add RVV and Vector CSR regs
Date: Mon, 18 Dec 2023 17:43:21 -0300
Message-ID: <20231218204321.75757-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218204321.75757-1-dbarboza@ventanamicro.com>
References: <20231218204321.75757-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x531.google.com
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

Add support for RVV and Vector CSR KVM regs vstart, vl and vtype.

Support for vregs[] requires KVM side changes and an extra reg (vlenb)
and will be added later.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm/kvm-cpu.c | 74 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 0298c5dd69..dfebcc1692 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -105,6 +105,10 @@ static uint64_t kvm_riscv_reg_id_u64(uint64_t type, uint64_t idx)
 
 #define RISCV_FP_D_REG(idx)  kvm_riscv_reg_id_u64(KVM_REG_RISCV_FP_D, idx)
 
+#define RISCV_VECTOR_CSR_REG(env, name) \
+    kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_VECTOR, \
+                           KVM_REG_RISCV_VECTOR_CSR_REG(name))
+
 #define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
     do { \
         int _ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
@@ -158,6 +162,7 @@ static KVMCPUConfig kvm_misa_ext_cfgs[] = {
     KVM_MISA_CFG(RVH, KVM_RISCV_ISA_EXT_H),
     KVM_MISA_CFG(RVI, KVM_RISCV_ISA_EXT_I),
     KVM_MISA_CFG(RVM, KVM_RISCV_ISA_EXT_M),
+    KVM_MISA_CFG(RVV, KVM_RISCV_ISA_EXT_V),
 };
 
 static void kvm_cpu_get_misa_ext_cfg(Object *obj, Visitor *v,
@@ -704,6 +709,65 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
     env->kvm_timer_dirty = false;
 }
 
+static int kvm_riscv_get_regs_vector(CPUState *cs)
+{
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+    target_ulong reg;
+    int ret = 0;
+
+    if (!riscv_has_ext(env, RVV)) {
+        return 0;
+    }
+
+    ret = kvm_get_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vstart), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->vstart = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vl), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->vl = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vtype), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->vtype = reg;
+
+    return 0;
+}
+
+static int kvm_riscv_put_regs_vector(CPUState *cs)
+{
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+    target_ulong reg;
+    int ret = 0;
+
+    if (!riscv_has_ext(env, RVV)) {
+        return 0;
+    }
+
+    reg = env->vstart;
+    ret = kvm_set_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vstart), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->vl;
+    ret = kvm_set_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vl), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->vtype;
+    ret = kvm_set_one_reg(cs, RISCV_VECTOR_CSR_REG(env, vtype), &reg);
+
+    return ret;
+}
+
 typedef struct KVMScratchCPU {
     int kvmfd;
     int vmfd;
@@ -1001,6 +1065,11 @@ int kvm_arch_get_registers(CPUState *cs)
         return ret;
     }
 
+    ret = kvm_riscv_get_regs_vector(cs);
+    if (ret) {
+        return ret;
+    }
+
     return ret;
 }
 
@@ -1041,6 +1110,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
+    ret = kvm_riscv_put_regs_vector(cs);
+    if (ret) {
+        return ret;
+    }
+
     if (KVM_PUT_RESET_STATE == level) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         if (cs->cpu_index == 0) {
-- 
2.43.0


