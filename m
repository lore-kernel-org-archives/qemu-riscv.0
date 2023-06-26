Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF11EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 22:04:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDuIq-0003Wt-5c; Mon, 26 Jun 2023 18:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuIE-0001vT-Ab
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:02:43 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuIB-0005wJ-Fd
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:02:41 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6b867acbf6dso112499a34.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687816958; x=1690408958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIsSwZv0+6HkvL9zAUnCljJ7f9IbfLIHWBAcagEC0B4=;
 b=FIjLFWVDovckRn+ldedJKUE8CnQEYbUap9VVbIfQ7aex4/7yuCYBucSba5ajmu0Kz0
 mIShoOK/nHItEA6O8jjyAehgFa2YbadRgokcI45TXS0Z4zTyxSUMWZ2S3txNeD8p8bvH
 Sf83McN+uWsIDZbLiDeEtXS6sfRFetSHyEDoNIaic8T9RWdx0bHaCEuEO2ppEJXIKLmp
 0X0gQ8vArzx/B2RqfX2pZTvJKRh/TG6M/8hf7yIqHjUHWUQKWQUX/XsMYltco94gpEM8
 rXKMliJJ+Pl1wcWovDxrb8yRs+secfv03DmRnfCNHm3BNgNf4JiJibjki7RUCnnCq/It
 2aBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687816958; x=1690408958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xIsSwZv0+6HkvL9zAUnCljJ7f9IbfLIHWBAcagEC0B4=;
 b=YJlv2K9QxA0hgDGynMmrxOV5eP/fEBplHnfHac25bXWWs9TikmZHeTQj25lG0f6z/y
 at3gpE1ocdqPuYYtwPsWMyEAqxEPyShhwfFtvMsSg0tbiFw3c0JCV9ShHoYP7TMkha3X
 D+L4fqi9e1b03Jv5WEs6pLskNY44xXrpfZfAS+9X5m/5wzHl445lpWF8iLsUmROf17PA
 Esx5x4/iF7ffHcncy89tZEAuzIrFD+ZxrVWZyuS0NRyuwh1LTqUZV5M4q7F591nZW80/
 meblXbJI7CHH0VJP9FdbhoIbAmaZE9Ssnf4CfDkAc9CCph16Eqg8W9sytpSp0I/oK8SQ
 hUsg==
X-Gm-Message-State: AC+VfDwv96PnGmP/sW26y4fF9k8DY7XcJvXIzwHMkWKGYF/F9HR70JIK
 JPImGO32VHYjI01OM7oAQUiQuQ==
X-Google-Smtp-Source: ACHHUZ4AjjxLYOHYjdATZJcWSVSv33EQQB3RHZh+cHLPW3Cu2i4R3dO7dJ8N0kK1D/1agIa8sa6YDA==
X-Received: by 2002:a05:6870:d88f:b0:1b0:49a7:c283 with SMTP id
 dv15-20020a056870d88f00b001b049a7c283mr1634186oab.29.1687816957812; 
 Mon, 26 Jun 2023 15:02:37 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056870a10c00b001b03fbfa0c5sm1831419oae.39.2023.06.26.15.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 15:02:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 08/19] target/riscv: handle mvendorid/marchid/mimpid for
 KVM CPUs
Date: Mon, 26 Jun 2023 19:01:58 -0300
Message-ID: <20230626220209.22142-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626220209.22142-1-dbarboza@ventanamicro.com>
References: <20230626220209.22142-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
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

After changing user validation for mvendorid/marchid/mimpid to guarantee
that the value is validated on user input time, coupled with the work in
fetching KVM default values for them by using a scratch CPU, we're
certain that the values in cpu->cfg.(mvendorid|marchid|mimpid) are
already good to be written back to KVM.

There's no need to write the values back for 'host' type CPUs since the
values can't be changed, so let's do that just for generic CPUs.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index cd2974c663..602727cdfd 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -495,6 +495,33 @@ void kvm_arch_init_irq_routing(KVMState *s)
 {
 }
 
+static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
+{
+    CPURISCVState *env = &cpu->env;
+    uint64_t id;
+    int ret;
+
+    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
+                          KVM_REG_RISCV_CONFIG_REG(mvendorid));
+    ret = kvm_set_one_reg(cs, id, &cpu->cfg.mvendorid);
+    if (ret != 0) {
+        return ret;
+    }
+
+    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
+                          KVM_REG_RISCV_CONFIG_REG(marchid));
+    ret = kvm_set_one_reg(cs, id, &cpu->cfg.marchid);
+    if (ret != 0) {
+        return ret;
+    }
+
+    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
+                          KVM_REG_RISCV_CONFIG_REG(mimpid));
+    ret = kvm_set_one_reg(cs, id, &cpu->cfg.mimpid);
+
+    return ret;
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     int ret = 0;
@@ -513,6 +540,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     env->misa_ext = isa;
 
+    if (!object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
+        ret = kvm_vcpu_set_machine_ids(cpu, cs);
+    }
+
     return ret;
 }
 
-- 
2.41.0


