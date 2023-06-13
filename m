Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD24AEB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 21:00:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9B79-00025L-03; Tue, 13 Jun 2023 16:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B77-000250-K5
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 16:59:41 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B75-0006jf-Vh
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 16:59:41 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-39cf00a2ad2so1321457b6e.1
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 13:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686689979; x=1689281979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iv3WV4ASh2/ahyZmDoMdg8LOeNDDBGDihd9nx6jCt9Y=;
 b=DNnaJJila+09lZzGsNJPuMmK47ygXH0IaFKC+A9MFBMYyEiHr+jo5iC+9HQ4df0eDx
 hjKspODqUjbLM1QZuazPKA65UhQPOkkJMudv5PtmHQwfKUrzwfg4RXcKSvqUVx+XvGkO
 9YfoLJjZZezb/FQ/vm82NiZYHNG1TJaExHCSj48JBv3o2XTPmDiHXAGZddn9XXfbnvsq
 L706AUSZSIObf4k7TK8muF54GupsOUQHC9MA4F3nTo/Vn0SfWXrNOHd2vCbp6npIbeRM
 pEBqvZlQ8bvQietiiwnkPo5r5K5J4IKKmjtmI011OzU+3FjGdupCI62LtTt5ls6DYdgh
 wFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686689979; x=1689281979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iv3WV4ASh2/ahyZmDoMdg8LOeNDDBGDihd9nx6jCt9Y=;
 b=GOKIiAoz7axS6BRK22hUaOfXXCGQ9ZYWZFtbPVgqTtVtI3nk+sYDCeLRcmyMgYbjPV
 BhRShNS8dI9pNTlQ9yZjovGSOdRJAMeToC7neWpulV2TnK9cDFv6/LDwF12RqVx26N+t
 jBCKmlIdkIC91h8sVNqPi+iM0EvtQQZNvknKoBUOvD/gMjT5nalouBeEEghhNPHtuFEe
 f5DQb6eLmpJvBea1drcUeCyuYBLTkqoZK+m8W1aHSO7Yo3iBFOBEuXfC+urbM6x8A8r1
 A9bFtBCnj4fINY4lmjEGd+/dQAp/CDADnch6D79clAt2VYhKeMI2k0OS0G+Qw982LzIv
 830A==
X-Gm-Message-State: AC+VfDwmI3O++dn6xbrkYwz7FArrkmhw4WbJKmJynPd1BxXN9chsYwBZ
 FVvN6WnaQ9xjJ4aOjqddAKR+ww==
X-Google-Smtp-Source: ACHHUZ7fIvReVkhNEuxlnmn13lH9NWMLwu481prR1cQChdhfcO1BNrYa6vdlEs1CPzpfqWqJtXFoSA==
X-Received: by 2002:a54:4588:0:b0:39a:b77b:b43b with SMTP id
 z8-20020a544588000000b0039ab77bb43bmr7881536oib.55.1686689978959; 
 Tue, 13 Jun 2023 13:59:38 -0700 (PDT)
Received: from grind.. ([177.170.117.210]) by smtp.gmail.com with ESMTPSA id
 q82-20020acaf255000000b003982a8a1e3fsm5619514oih.51.2023.06.13.13.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:59:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 08/18] target/riscv: handle mvendorid/marchid/mimpid for
 KVM CPUs
Date: Tue, 13 Jun 2023 17:58:47 -0300
Message-Id: <20230613205857.495165-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613205857.495165-1-dbarboza@ventanamicro.com>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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
2.40.1


