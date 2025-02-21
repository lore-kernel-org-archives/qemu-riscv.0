Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2631EC021AA
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 12:28:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlS7t-0006jt-Ne; Fri, 21 Feb 2025 07:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlS76-0006ED-5F
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:26:42 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlS72-0007Yj-3w
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:26:38 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2210d92292eso59121275ad.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 04:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740140794; x=1740745594; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CWBUtSS67oYR3l74Eped0x0Nc8HfHcVrd0NioQ2Xqss=;
 b=RPIb+UZsckyWQQoKfXk4tg6xbgAjDg0mkZWRmsK9ARd1X9BO65pFn41hSlGC4m6WQM
 qqoVdfRZulhefPGvMSM+B4s+8ld+SxNFMUJ4fbFSsFEG3DBg1aKaKx6zex195D8/PcNK
 dH+p8f4d7KBSQY3J/lLj/gARuR91Z6V4tfT5SqEyzAELEwMfi9MixhoKq6x8kS0VyWJC
 OrqTjvVat7I8Qn3oL4pIpg5F/N9cSy57Tjl6nnwBBkhHxyN37exLtfaneQMHR+8OEL8Y
 AzepSx2KoQvPbFSPU0kljidjJKec+AC6HmsnUYKniQMP1InXZLu9U6QHjspCrcMWdVja
 KPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740140794; x=1740745594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CWBUtSS67oYR3l74Eped0x0Nc8HfHcVrd0NioQ2Xqss=;
 b=q72JWredNDvOo1sz4kQgZv7I99tvAlrdHjlwoOLzGr5XpKEuyse/3ViIUTkjx2yUkR
 wLokqtYR6elF4Ec9nwNSD82sJ2E/8Y+20RkO16OnwTs77qVc0d0I9vqUel/DP4zVJhYJ
 3yENhSb14iDdYuXKJQ4Aeaj+ewNIdb+vo9gIYp4TB1+9FiR2RI1MSPpbwp4WFyzgVm3g
 WqBZNOpliVXvnvvaOMlWOUY53lkfRHPhGNJKzzalHOSq2u8yx1ZfDhiBW6QqNj3HIVnT
 e7IJo6p3qvnS+snc5cWmVA3h9TtDeKp4yFnYcFC2TAzHzSntkkcm7ft7YiZAvO3Aod4m
 gAfw==
X-Gm-Message-State: AOJu0Yzat77HgNXxg65R/sF1GgJY9dSssU9F/9XJaFCLzAMhrjCPP41I
 f9goLO4T+ACb1HX6iXTb4EyS73JBnIVxRGO+4Fr1u/hZVVrsYNsy2BGC3sRbi+Q=
X-Gm-Gg: ASbGncsemgdZ3J8/z1Tvsa7zTbrAeloGf2dgHinPC1Tusg5G1rmxV9TRMeWvXKVLnZq
 0ro8wHS+CyOJmAWS5O0ZX7bvztUvc7xLX5bUe0HaN9UcIq7ak35cKmoXcyZpWkZNn5fjbtLv7WA
 /H/fT5FIg7JqKCsM8vyJGbnfQAuQXt0X4PBK93r8dqsy6QA2gSWll6fSOxKH2oEUv1gXSLGLISY
 h046PpyhHFoKk9RyN4AzCqLUaoJiSrRWHMi53JrFR8eXJkcdsX3HMTuTnnEyPMVjYmiOWF+16UG
 2sSgj0rfE7jNfBq3BSVPLgXxCO3Kv8i5humuZ6Mv+xx5/U9PVQjvFw==
X-Google-Smtp-Source: AGHT+IHiYj/wM+pKpfvYQyLlZlxFQa12aHhGIepWYrUEIkw6t3B0qkFHpiO/R+EzBgMwK8flkLXolQ==
X-Received: by 2002:a17:903:2381:b0:220:d272:534d with SMTP id
 d9443c01a7336-2219ff57817mr53796555ad.22.1740140794054; 
 Fri, 21 Feb 2025 04:26:34 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.11.154.120])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d545e39bsm137349855ad.124.2025.02.21.04.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 04:26:33 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/3] target/riscv/cpu: ignore TCG init for KVM CPUs in
 reset_hold
Date: Fri, 21 Feb 2025 09:26:21 -0300
Message-ID: <20250221122623.495188-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221122623.495188-1-dbarboza@ventanamicro.com>
References: <20250221122623.495188-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

riscv_cpu_reset_hold() does a lot of TCG-related initializations that
aren't relevant for KVM, but nevertheless are impacting the reset state
of KVM vcpus.

When running a KVM guest, kvm_riscv_reset_vcpu() is called at the end of
reset_hold(). At that point env->mstatus is initialized to a non-zero
value, and it will be use to write 'sstatus' in the vcpu
(kvm_arch_put_registers() then kvm_riscv_put_regs_csr()).

Do an early exit in riscv_cpu_reset_hold() if we're running KVM. All the
KVM reset procedure will be centered in kvm_riscv_reset_vcpu().

While we're at it, remove the kvm_enabled() check in
kvm_riscv_reset_vcpu() since it's already being gated in
riscv_cpu_reset_hold().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         | 9 +++++----
 target/riscv/kvm/kvm-cpu.c | 3 ---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 522d6584e4..8e6e629ec4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1050,6 +1050,11 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
         mcc->parent_phases.hold(obj, type);
     }
 #ifndef CONFIG_USER_ONLY
+    if (kvm_enabled()) {
+        kvm_riscv_reset_vcpu(cpu);
+        return;
+    }
+
     env->misa_mxl = mcc->misa_mxl_max;
     env->priv = PRV_M;
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
@@ -1146,10 +1151,6 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
         env->rnmip = 0;
         env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
     }
-
-    if (kvm_enabled()) {
-        kvm_riscv_reset_vcpu(cpu);
-    }
 #endif
 }
 
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 23ce779359..484b6afe7c 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1603,9 +1603,6 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
     CPURISCVState *env = &cpu->env;
     int i;
 
-    if (!kvm_enabled()) {
-        return;
-    }
     for (i = 0; i < 32; i++) {
         env->gpr[i] = 0;
     }
-- 
2.48.1


