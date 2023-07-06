Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07889EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 10:18:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHM3z-0004tM-Nq; Thu, 06 Jul 2023 06:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM3y-0004sr-8v
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:14 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM3w-0006d1-OK
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:14 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b5d1498670so461257a34.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688638691; x=1691230691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIsSwZv0+6HkvL9zAUnCljJ7f9IbfLIHWBAcagEC0B4=;
 b=kf9443lYuUwXQkn4KqEl0YJu+NNwJuSBOnA8spt9nfNuTH3oCHuQlY7s84yFED5RLd
 BO9c80uk6Syf+4tTrXw+35FjxZhL6R72RYkp7KY8nF7Abq4hbaAfvslmSlgeS2oWxxaL
 GvmwTqDI4n/1kJDIMY2l+LIWxxBno2+QrEzFxDyQY9skELZlGzWnls7GNhQuB0JWwPFG
 vzLSPCVG/TCwX7xENObVFNL+eQv8yBKMt2IbiNX6eqiXfeBVw7h5eh1gYWQfO9Ia5PUZ
 RVoHELDf0y+HIcLkUSgnOmgjFqZi1YyxNL+9lSIrkMGw5rm4+eYZwz+Gp0c0ZEiU4QRc
 H9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688638691; x=1691230691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xIsSwZv0+6HkvL9zAUnCljJ7f9IbfLIHWBAcagEC0B4=;
 b=SzoiXkX1LbR1lYUJsTGBxpC4PijTKZSXJVJxxRXbcM+RYEr9Woo2lhLndSla2p8YqE
 RVvYd6nMNy3gBx726p6FCtQBgKwC1YWD+yIm7r6rYnARAaD0JdQXI5AGuySinY2LVMz8
 AhDkg9B8lBuA4ycrbH16kLzdyKn6JTMFhsic14bV7PRVQRQboAY9GI0fCY+OAdMief5z
 RaSAwS4OFWORtzf2S2Kd4TNgujZhCI62esyWGW56SbjZHh+TT2BZRAYxKxk9Gmf9iPQ/
 Eq6KsXalJkJEce16DNifIqNTE9c6+U+uPmnOye0KG/iemWmQvi6p8rQFBMa6Y7wrjJos
 dMzA==
X-Gm-Message-State: ABy/qLaWBgAATTaG+2ZIZe4z7R8CsW7pbk+ilApnNyObJexhYCLr3PsJ
 XZpfgCZ0aHFGSmvG6Jm6lNeUUg==
X-Google-Smtp-Source: APBJJlFw5Op88fU9OqEt3avsFgLRNPriTvShMBFLUoOAIpWNsJWssMOYZXbPFKiPKmcsbv07WKp1fw==
X-Received: by 2002:a05:6830:22f5:b0:6b7:5386:4a44 with SMTP id
 t21-20020a05683022f500b006b753864a44mr1550969otc.27.1688638691788; 
 Thu, 06 Jul 2023 03:18:11 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6a59000000b006b8850ad193sm511382otn.56.2023.07.06.03.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 03:18:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 08/20] target/riscv: handle mvendorid/marchid/mimpid for
 KVM CPUs
Date: Thu,  6 Jul 2023 07:17:26 -0300
Message-ID: <20230706101738.460804-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706101738.460804-1-dbarboza@ventanamicro.com>
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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


