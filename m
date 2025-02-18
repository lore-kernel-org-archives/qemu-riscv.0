Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9D6C021AF
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 16:40:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tkQcr-0006tP-JE; Tue, 18 Feb 2025 11:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tkQcq-0006t7-Lz
 for qemu-riscv@nongnu.org; Tue, 18 Feb 2025 11:39:12 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tkQco-0002MY-5j
 for qemu-riscv@nongnu.org; Tue, 18 Feb 2025 11:39:11 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-220dc3831e3so84028295ad.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Feb 2025 08:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1739896749; x=1740501549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A47RPj/W9GuuMfqZmgCnstbJB4seK0Dlzqp114GOt2c=;
 b=HNpagZf14aLz16dqibAFePP9bt7+2RAVTGirHJgKbi1eHOktgEnyAnGi1mb6iEOZAs
 Tc0C30FA2giYetjyWzj4vnjA+LCR5gQ/8I+GtUfirj3C9ILn/bY4WLMuLRD5JpQlDSc5
 Xhheb3olSuZkUW4j8nQ1R2QCw6jN7u9icUMBgCMnWHqyClOYgnYy11vyPuhcft1L3UwL
 eOoqvw/PmDC8rkQbHTv31DnB4FJDz+ndIzZhtjAuflV4dX1PK9fPLzSrYY4I4F4DV+4C
 BLCO+z83TJzxMRveYK2bwrUO41ITZt9HJhu/XJ1JC8UuyCoHgYtdU31iGSLd0UNya15o
 kx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739896749; x=1740501549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A47RPj/W9GuuMfqZmgCnstbJB4seK0Dlzqp114GOt2c=;
 b=qDA3kXF79bF1uRtt0H7TMuyt4buVJKLANVw/pFt4qfYKDwOsPRn6N635DFbRRf+Udx
 84rvh3o1Dp4Lh6kJNsY8COU74lmNAuYqhW4QlG2QarDAOI9nPJVLZkUFp03YLTNHGS+f
 8wWjRXAK01wYqYlHbZ1k7ESt9Q473pC9+3gtCt0EbrMG5JkD7EcbAinV/mFPKmI+S8RD
 xuQzkP1B3MhLFLQVW3oL2mWwpdPF046MoIuYM2goc989X0jnthOp912vmTQTYCnznCnO
 l6684d6pNbjsZ8jc8NW9XtFZUiTdOLUm4v9o/oG92IY0ZChS3qA3f8Jca74KNPIpY+ib
 T/fA==
X-Gm-Message-State: AOJu0YxMygHtxRo7Dl/rqU7nzr39dS8Y4RS3swV/FQxyxu3V5C9Qm2Xd
 mbLZMkvzYXsYUrlnBnylsxNSGTmxI4rWuC0G20pIreEbX4RNmtrtc9eEtIxa/yo=
X-Gm-Gg: ASbGncuLCr3Uv5hNRUOutnDepZQJveD7SrMrlCBs7QxHE6V61Txf30pejKMm49oKUAx
 xRqIdvD80lYsz9BxVUyg9cAnkRTLltG4fEtj+ooq5zvfSTAu4vP+MdVnVHXdKKxRp9YYVEt/kVq
 BThpY0Tz60DWzWYHGfOt1F03FhKVKIyuqWtLQCEMHKak2vHxKCrD3iQ5QmaUQ7Q6iz7Mwb/lh5J
 7Ej2daCLYAaWBLYV8wXH/1pR+OzCTNlhYVNg8wJF/UR7N7PqlVCxMwK5+wlSAhMTvwBxBPr/p9Q
 9gT1IZI3MV6HeYxp5Fb7eLUc/Dhocs8bn0M2YwKZg0Fyri7o04CL
X-Google-Smtp-Source: AGHT+IEBeqvqM4aQyOrLDn56L8QpG+tZXONfhiboIeDYR8cgb/BlTMtzqRRbiPcihlKn76MBtFVYtg==
X-Received: by 2002:a05:6a00:9297:b0:727:39a4:30cc with SMTP id
 d2e1a72fcca58-7329cd75fe4mr634479b3a.1.1739896748716; 
 Tue, 18 Feb 2025 08:39:08 -0800 (PST)
Received: from grind.. (201-68-240-180.dsl.telesp.net.br. [201.68.240.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73278d09228sm4595533b3a.117.2025.02.18.08.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:39:08 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 3/3] target/riscv/kvm: add extensions after 6.14-rc3 update
Date: Tue, 18 Feb 2025 13:38:54 -0300
Message-ID: <20250218163854.425607-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218163854.425607-1-dbarboza@ventanamicro.com>
References: <20250218163854.425607-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
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

Expose ziccrse, zabha and svvptc.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 23ce779359..471fd554b3 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -274,6 +274,7 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
 static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
     KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
+    KVM_EXT_CFG("ziccrse", ext_ziccrse, KVM_RISCV_ISA_EXT_ZICCRSE),
     KVM_EXT_CFG("zicntr", ext_zicntr, KVM_RISCV_ISA_EXT_ZICNTR),
     KVM_EXT_CFG("zicond", ext_zicond, KVM_RISCV_ISA_EXT_ZICOND),
     KVM_EXT_CFG("zicsr", ext_zicsr, KVM_RISCV_ISA_EXT_ZICSR),
@@ -283,6 +284,7 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
     KVM_EXT_CFG("zimop", ext_zimop, KVM_RISCV_ISA_EXT_ZIMOP),
     KVM_EXT_CFG("zcmop", ext_zcmop, KVM_RISCV_ISA_EXT_ZCMOP),
+    KVM_EXT_CFG("zabha", ext_zabha, KVM_RISCV_ISA_EXT_ZABHA),
     KVM_EXT_CFG("zacas", ext_zacas, KVM_RISCV_ISA_EXT_ZACAS),
     KVM_EXT_CFG("zawrs", ext_zawrs, KVM_RISCV_ISA_EXT_ZAWRS),
     KVM_EXT_CFG("zfa", ext_zfa, KVM_RISCV_ISA_EXT_ZFA),
@@ -325,6 +327,7 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("svinval", ext_svinval, KVM_RISCV_ISA_EXT_SVINVAL),
     KVM_EXT_CFG("svnapot", ext_svnapot, KVM_RISCV_ISA_EXT_SVNAPOT),
     KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
+    KVM_EXT_CFG("svvptc", ext_svvptc, KVM_RISCV_ISA_EXT_SVVPTC),
 };
 
 static void *kvmconfig_get_cfg_addr(RISCVCPU *cpu, KVMCPUConfig *kvmcfg)
-- 
2.48.1


