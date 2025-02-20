Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724B1C021B1
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 16:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tl9BA-0008Rr-Br; Thu, 20 Feb 2025 11:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tl9B7-0008Lo-Ea
 for qemu-riscv@nongnu.org; Thu, 20 Feb 2025 11:13:33 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tl9B5-0007Hh-JM
 for qemu-riscv@nongnu.org; Thu, 20 Feb 2025 11:13:33 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22113560c57so22291685ad.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Feb 2025 08:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740068010; x=1740672810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnvQ9cuHygS6JjjK+o31ZflMYYOqbA8EhtHcyFl2E2k=;
 b=Ntx62Sinjob2m1IBvn5xAFVsUrYShegpQW1YPNa4KRwpt24GWbCwxStJG5UBac6gC/
 76Oox1VCcg2kQyWlSTBAyMxixHgZbufVDL0SS4uX4HHOkvXUP9VekpISTKVjwA/j/iTV
 MMyeo2lOIIkcXxinLgeJr34w5Su8TX7HClIY9NHMqNudy/htcfK6Z4b8cR+yW/Nl18Qk
 A56qwnggS6ymJhfCLU7CwB7xdct8Zx1YsJEGQSixfT44U0pwUR8VtMkDQK/r3ehTPDrn
 5/IDpzF/6guxLgZI6LGeXACNjyFPCYJqxrEie7ntTpjBIQhQ4FkfwawBAJBuRB+hKWjh
 dLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740068010; x=1740672810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnvQ9cuHygS6JjjK+o31ZflMYYOqbA8EhtHcyFl2E2k=;
 b=V6R/Sto8x/McXi/3nKBUkIIJcjykNQfbi0Ub6Kf5xVbhyYip14qPsAmZLpFD1H6c+s
 oHKmAwm5DIiS+VIphKok9eNlXSfuzjGoSEpNljz+1+JVRfBp+y+K4vU0oUdZ7wmjhbYJ
 5aNJEDoy3/ypoqED//uat8IHhwTBiE5/cDSqhS16Ff1NPAa2Gk0D/jY75ftMmXO3Vpi2
 6AU5mFExgFes2BuuLmL0g5gRUio+RsLrJQPNzGLQzcTxjhbXUtcyHpXqU6Tw1oLC5vuq
 cOzZROgzKmCIKaFdWQfie9fcNPoejoxoneHgjKaMmTPRWQo2HYKupM7AbkUagCZGh7ab
 PWiw==
X-Gm-Message-State: AOJu0YzLRxipoab6RFKfDljYAHY56QeVAIl1aoDC+QSq8AMeq/XVevjQ
 gxULF+PzvC7+AHqAP0I+ggv43BJplHvJRWCZG1DAn1rRrZJZCTb3Q+9uKp2Ft1g=
X-Gm-Gg: ASbGncs4VrLBixEdk7Ch8BqnoWOvKHMWaWha5xspt1vwqtL1F0dNv9c9yA0R73ZJzNk
 u19YtBZYXh/l8zLEqspLQpv9WWZu8Jj/HCA0iCY9op7DKGCbAv/BXMRA7OTrbY17hiueWewPI0H
 l9jF0u6avn/QPvnMTcpoWnC8OHtM4x150A78mjs1e9Tp3ARf5q8jAVeGIsQ/LjhTAcyFLAU6mLt
 hkzoGhOV8oNvhnXcR4KmsZMpHEzr2RvKx8cxeoM7cRt95ipxuagzY0VJym7JXvbUzjB4P0KqpUq
 vCuBhVvNcBj7xI7+KA==
X-Google-Smtp-Source: AGHT+IF7qg/nAKrRf2bIhKIIaR+koI+Ix4VMnGxIXEdT5Nrhvr5j22A1Wl4ahx+4+d8PloaCKM6x6Q==
X-Received: by 2002:a05:6a21:6004:b0:1ee:e4f0:62a with SMTP id
 adf61e73a8af0-1eee4f008a3mr6193126637.20.1740068010195; 
 Thu, 20 Feb 2025 08:13:30 -0800 (PST)
Received: from grind.. ([187.11.154.120]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7324254618dsm14074072b3a.26.2025.02.20.08.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:13:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 3/3] target/riscv/kvm: reset all available KVM CSRs in
 kvm_reset()
Date: Thu, 20 Feb 2025 13:13:13 -0300
Message-ID: <20250220161313.127376-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220161313.127376-1-dbarboza@ventanamicro.com>
References: <20250220161313.127376-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Explictly reset env->mstatus and env->sie. Add a comment about env->mip
being read/written into KVM 'sip' CSR.

We're also not read/writing 'scounteren' which is available in the KVM
UAPI. Add it in kvm_reset() and get/put_regs_csr().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index fea03f3657..ee7a9295b4 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -618,6 +618,7 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
     KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
     KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
+    KVM_RISCV_GET_CSR(cs, env, scounteren, env->scounteren);
 
     return 0;
 }
@@ -635,6 +636,7 @@ static int kvm_riscv_put_regs_csr(CPUState *cs)
     KVM_RISCV_SET_CSR(cs, env, stval, env->stval);
     KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
+    KVM_RISCV_SET_CSR(cs, env, scounteren, env->scounteren);
 
     return 0;
 }
@@ -1609,6 +1611,10 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
     env->pc = cpu->env.kernel_addr;
     env->gpr[10] = kvm_arch_vcpu_id(CPU(cpu)); /* a0 */
     env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
+
+    /* sstatus is read/written into mstatus */
+    env->mstatus = 0;
+    env->sie = 0;
     env->satp = 0;
     env->mie = 0;
     env->stvec = 0;
@@ -1616,7 +1622,9 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
     env->sepc = 0;
     env->scause = 0;
     env->stval = 0;
+    /* sip is read/written into mip */
     env->mip = 0;
+    env->scounteren = 0;
 }
 
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
-- 
2.48.1


