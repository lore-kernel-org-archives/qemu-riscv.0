Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C399C021A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:22:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tjwKA-0001yN-NY; Mon, 17 Feb 2025 03:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwK9-0001y0-Db
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:17:53 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwK7-0000zV-Mi
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:17:53 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6e660740061so37883546d6.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 00:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1739780270; x=1740385070; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XmLG5UQJV7cOfmKz1oOTzmfuK6M6OFxQ8TpTbwfoB7Q=;
 b=FDVkaS0a7cnL47TB4UrfBJsraGnt0cjtayYhVdgB55vxEJnVHLsVSqJkyT9K/jnsnj
 kUAEV0/MhuPSx02/PMmJ2OtoJEmyXgQhb2ejSApcqTlCCMCChygo7mp0uPE0FGPFy0Vc
 UqO+bLQKqB2lUw4Uq67VDv4W7acQ+73ByDGjsp2tZg1jpZX13ispVxfRn19igQ1f2r19
 izl7FdSKsAvQ3q5sjKX3bPaae30O2KZ4p61ShzTe9507JsC27f4hlooc9o+31aKf/go5
 yOBRAXF4AM95teQwCy3Y7zqnyzmdx8KgiT6abQv6+/XaiHAgRYtkF3m6ZaNtvdclpMGT
 0AjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739780270; x=1740385070;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XmLG5UQJV7cOfmKz1oOTzmfuK6M6OFxQ8TpTbwfoB7Q=;
 b=dKt7YCtR0CBxtlnf0L2yiXE8HD7oyGxrt1D3zB2FWEX1/SYG41xySk68D34nKda+Pd
 z9M0Ghp+OfD15L1cxb2qQLw5Yy4h6rsLR5/mZ/eqehSTHiXQFK1HDEAKJsIbYGHyxm4q
 4WUAgnw2Ut9nRJb8a3reY8urcjVaBQh9p0D4fOZdeoaENWQ1zHtHcTu38H/ztoZ4zN5C
 th0SvwA5eXq99yFRIiqxVn11UJCYCLUDAWg7eMON4UKiaYDPNT/Grzxa9AdxE2d86ORS
 +8+3wWBbC8bW6Ie1ec2ZPtZDw9Y8IYV54+6u8AmdOWHjM1X5np02LMxDHDzn8h8eYJTx
 nUEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlYdS9ybuognbgSxY1xoq36Exm0QHPxniRT2eK6k6vlOhab2UXaeF6igTbhQVpv3lz+lzrju4t9JTD@nongnu.org
X-Gm-Message-State: AOJu0Yx6X/B5YshHTbD+mgXdo1YMwTPJQruuHex56wMztOtcPfYPb11V
 bfgctAMcd5QmYSU14NHnK5cQeVk0QGgMJeGrLK1rgjr0C3OX5NB20fH6lncPtLk=
X-Gm-Gg: ASbGncsPfxgSIJ6IxngqVFj1lT5CwelBeQkQb6dQ9virfB8gFGBjBUAgOpO1GK14m32
 meyuvYyyuqUOOkfy41tTkB7Qz5xIhz1TE0JG4EihTZsLpBYc69/a7rbhe7j14zuYiss1K707IMZ
 6GfAThsLF8TZG2VjQ6fNtvDVdBHCN+nfIaAhGvx7ue4q/+IyhigUpaAr9o0Oe1oZQYB8kTnIq+c
 XLuAEavqCXTdjD6Y5ixydf0mMpAHlrwW85UVa1J/A/7291TZsZL1SNYVA43JNus4oib4g9LypgF
 TFbKXDPeD1giVRSTbKzqmdotZdjf/GIhBRtuHHyTd77K2g==
X-Google-Smtp-Source: AGHT+IFce0ent2uBbLukL8x0M56RKYBaZm4XiBGTPGtm2Dhp9QYczsv+ZkZni+JuM4bKnQyoKziQ5Q==
X-Received: by 2002:ad4:5de8:0:b0:6e6:61f1:457f with SMTP id
 6a1803df08f44-6e66ccc1198mr139344766d6.18.1739780270540; 
 Mon, 17 Feb 2025 00:17:50 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e65d9f38absm49673346d6.88.2025.02.17.00.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 00:17:50 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/8] target/riscv/kvm: rewrite get/set for KVM_REG_RISCV_CSR
Date: Mon, 17 Feb 2025 16:17:21 +0800
Message-Id: <20250217081730.9000-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250217081730.9000-1-yongxuan.wang@sifive.com>
References: <20250217081730.9000-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-qv1-xf2a.google.com
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

As KVM_REG_RISCV_CSR includes several subtypes of CSR, rewrite the
related macros and functions to prepare for other subtypes.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 target/riscv/kvm/kvm-cpu.c | 70 +++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 27 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 23ce77935940..e315fea46973 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -111,9 +111,8 @@ static uint64_t kvm_riscv_vector_reg_id(RISCVCPU *cpu,
     kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CORE, \
                            KVM_REG_RISCV_CORE_REG(name))
 
-#define RISCV_CSR_REG(env, name) \
-    kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CSR, \
-                           KVM_REG_RISCV_CSR_REG(name))
+#define RISCV_CSR_REG(env, idx) \
+    kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CSR, idx)
 
 #define RISCV_CONFIG_REG(env, name) \
     kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG, \
@@ -130,17 +129,20 @@ static uint64_t kvm_riscv_vector_reg_id(RISCVCPU *cpu,
     kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_VECTOR, \
                            KVM_REG_RISCV_VECTOR_CSR_REG(name))
 
-#define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
+#define RISCV_GENERAL_CSR_REG(name) \
+    (KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(name))
+
+#define KVM_RISCV_GET_CSR(cs, env, idx, reg) \
     do { \
-        int _ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
+        int _ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, idx), &reg); \
         if (_ret) { \
             return _ret; \
         } \
     } while (0)
 
-#define KVM_RISCV_SET_CSR(cs, env, csr, reg) \
+#define KVM_RISCV_SET_CSR(cs, env, idx, reg) \
     do { \
-        int _ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
+        int _ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, idx), &reg); \
         if (_ret) { \
             return _ret; \
         } \
@@ -605,36 +607,50 @@ static int kvm_riscv_put_regs_core(CPUState *cs)
     return ret;
 }
 
-static int kvm_riscv_get_regs_csr(CPUState *cs)
+static int kvm_riscv_get_regs_general_csr(CPUState *cs)
 {
     CPURISCVState *env = &RISCV_CPU(cs)->env;
 
-    KVM_RISCV_GET_CSR(cs, env, sstatus, env->mstatus);
-    KVM_RISCV_GET_CSR(cs, env, sie, env->mie);
-    KVM_RISCV_GET_CSR(cs, env, stvec, env->stvec);
-    KVM_RISCV_GET_CSR(cs, env, sscratch, env->sscratch);
-    KVM_RISCV_GET_CSR(cs, env, sepc, env->sepc);
-    KVM_RISCV_GET_CSR(cs, env, scause, env->scause);
-    KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
-    KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
-    KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
+    KVM_RISCV_GET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sstatus), env->mstatus);
+    KVM_RISCV_GET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sie), env->mie);
+    KVM_RISCV_GET_CSR(cs, env, RISCV_GENERAL_CSR_REG(stvec), env->stvec);
+    KVM_RISCV_GET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sscratch), env->sscratch);
+    KVM_RISCV_GET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sepc), env->sepc);
+    KVM_RISCV_GET_CSR(cs, env, RISCV_GENERAL_CSR_REG(scause), env->scause);
+    KVM_RISCV_GET_CSR(cs, env, RISCV_GENERAL_CSR_REG(stval), env->stval);
+    KVM_RISCV_GET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sip), env->mip);
+    KVM_RISCV_GET_CSR(cs, env, RISCV_GENERAL_CSR_REG(satp), env->satp);
 
     return 0;
 }
 
-static int kvm_riscv_put_regs_csr(CPUState *cs)
+static int kvm_riscv_put_regs_general_csr(CPUState *cs)
 {
     CPURISCVState *env = &RISCV_CPU(cs)->env;
 
-    KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
-    KVM_RISCV_SET_CSR(cs, env, sie, env->mie);
-    KVM_RISCV_SET_CSR(cs, env, stvec, env->stvec);
-    KVM_RISCV_SET_CSR(cs, env, sscratch, env->sscratch);
-    KVM_RISCV_SET_CSR(cs, env, sepc, env->sepc);
-    KVM_RISCV_SET_CSR(cs, env, scause, env->scause);
-    KVM_RISCV_SET_CSR(cs, env, stval, env->stval);
-    KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
-    KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
+    KVM_RISCV_SET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sstatus), env->mstatus);
+    KVM_RISCV_SET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sie), env->mie);
+    KVM_RISCV_SET_CSR(cs, env, RISCV_GENERAL_CSR_REG(stvec), env->stvec);
+    KVM_RISCV_SET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sscratch), env->sscratch);
+    KVM_RISCV_SET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sepc), env->sepc);
+    KVM_RISCV_SET_CSR(cs, env, RISCV_GENERAL_CSR_REG(scause), env->scause);
+    KVM_RISCV_SET_CSR(cs, env, RISCV_GENERAL_CSR_REG(stval), env->stval);
+    KVM_RISCV_SET_CSR(cs, env, RISCV_GENERAL_CSR_REG(sip), env->mip);
+    KVM_RISCV_SET_CSR(cs, env, RISCV_GENERAL_CSR_REG(satp), env->satp);
+
+    return 0;
+}
+
+static int kvm_riscv_get_regs_csr(CPUState *cs)
+{
+    kvm_riscv_get_regs_general_csr(cs);
+
+    return 0;
+}
+
+static int kvm_riscv_put_regs_csr(CPUState *cs)
+{
+    kvm_riscv_put_regs_general_csr(cs);
 
     return 0;
 }
-- 
2.17.1


