Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E14C77B73
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 19:48:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45JT-0006pO-TO; Tue, 30 May 2023 15:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JT-0006oW-0T
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:23 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JQ-0004MO-ED
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:22 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-19f68a583a7so129045fac.1
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 12:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685476039; x=1688068039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jj5q0gQim03Dfqbjx8y7Y2DfBrJ6GzehbS4t//l5qDk=;
 b=RBaHcB00oSSrGMF73jKqjuY3+u93pcqrkaxzPh9tgO5Ic6Vge2dRrckVoJRAvKm8c9
 2z0EXMBhUoQekjjYV870pos5+ACd2KwKIkZ9MzttHlLRbfQTSChJtLu63UdFwNF2pmhs
 Ovr+qfMzvB4HepLvpS6/SraNDcxZif96YekGZ+QQ4bKm67dfWqCO8bkuYeXlOszRub0E
 ak5xafRoxRt4t2wE0ciAWvhefi49rUHsaKJj4d5KAKjcg5gqSCt6dTM3WAzf8Rd/eLDR
 sZ97jOyTTXCgG6/+mFeZxTRDSEI9vKJ2rAoA9ScrmWHA1oi+bDzxnR+v0P7rNqW09zCJ
 a8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685476039; x=1688068039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jj5q0gQim03Dfqbjx8y7Y2DfBrJ6GzehbS4t//l5qDk=;
 b=Qo8hj7rsziE9H0pWa5zduo1UxF88QfxGPD0bkKdvcPxOSZ04qe4jJ7UUUyotwmguYs
 8tNSjUpp3/vnykPZPDOi5OT2ciXC1Xhd3Quwziq97OnGJqgvCkZy9iOg2COrALb2qxgF
 kOJ5Q2d+4iz9o7QCpUAnGNRO2ybNkABvYL8urAwmSjUKbtogDKCTsvi6bU1NwPghHoJw
 1CGCjcgQqyTMVsKfzz1wl5NbQajlhGE9RXVlMYrs4Tk6VbJ7CBa13Rf2/nviVCFiGQqe
 BMZzhZvvgHS+bigvH88uz1duSYaRjRZ2DUXoKLBbDPkhzfCz713S7XFztYqdy188lE4J
 E9eA==
X-Gm-Message-State: AC+VfDx7ZqKWqEo1/T0ff0XJrHa9G5L0U7VnAU2Yv48iEF3WGNXcb55J
 BeEcJ4oK3jzwtgPHmBR/xypmbg==
X-Google-Smtp-Source: ACHHUZ5/HpF2/L0F++kDsE3DvqKTw9PUCyLwDn9cl/Uxi3/Jyh9qi1z6i08ZscOpVwmISIJheffWbA==
X-Received: by 2002:a05:6870:219c:b0:192:b704:cf2a with SMTP id
 l28-20020a056870219c00b00192b704cf2amr1959880oae.25.1685476039223; 
 Tue, 30 May 2023 12:47:19 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (200-162-225-121.static-corp.ajato.com.br. [200.162.225.121])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056870a48300b0019fa8728b05sm342214oal.39.2023.05.30.12.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:47:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 15/16] target/riscv: update multi-letter extension KVM
 properties
Date: Tue, 30 May 2023 16:46:22 -0300
Message-Id: <20230530194623.272652-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530194623.272652-1-dbarboza@ventanamicro.com>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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

We're now ready to update the multi-letter extensions status for KVM.

kvm_riscv_update_cpu_cfg_isa_ext() is called called during vcpu creation
time to verify which user options changes host defaults (via the 'user_set'
flag) and tries to write them back to KVM.

Failure to commit a change to KVM is only ignored in case KVM doesn't
know about the extension (-EINVAL error code) and the user wanted to
disable the given extension. Otherwise we're going to abort the boot
process.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 675e18df3b..92b99fe261 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -295,6 +295,32 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
     kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
 }
 
+static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
+{
+    CPURISCVState *env = &cpu->env;
+    uint64_t id, reg;
+    int i, ret;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
+        RISCVCPUMultiExtConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
+
+        if (!multi_ext_cfg->user_set) {
+            continue;
+        }
+
+        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
+                              multi_ext_cfg->kvm_reg_id);
+        reg = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
+        ret = kvm_set_one_reg(cs, id, &reg);
+        if (ret != 0) {
+            error_report("Unable to %s extension %s in KVM, error %d",
+                         reg ? "enable" : "disable",
+                         multi_ext_cfg->name, ret);
+            exit(EXIT_FAILURE);
+        }
+    }
+}
+
 static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
 {
     int i;
@@ -829,6 +855,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
 
     kvm_riscv_update_cpu_misa_ext(cpu, cs);
+    kvm_riscv_update_cpu_cfg_isa_ext(cpu, cs);
 
     return ret;
 }
-- 
2.40.1


