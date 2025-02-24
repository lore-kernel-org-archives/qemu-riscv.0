Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFC0C021B6
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 08:26:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmTlo-0000If-Ga; Mon, 24 Feb 2025 03:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmTlc-00006J-82
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 03:24:44 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmTla-0001Al-7W
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 03:24:43 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-220d601886fso59241165ad.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 00:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740385481; x=1740990281; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lxmKqqKswXlJbs5eaPNHVwiNA4X+9jY4AP8kBqT7664=;
 b=i9FdGUbosEC6/F9S2gss0jVXZ3cqSw13O1fNtHWZ0exO/CC6ANVkIC/iuM3oJDxFwA
 psMCzyyzrWpnPkJ/bo3OfpiGQRX3Ha4j7CxLlu23K4YYV4igD+gEQlDr9ZEgHZvxlwkr
 O0A5mhr01CQ4jZuxDDdn/lF1kY1AgGiA2rwnaigtAtTILK712nIXXXaeJRGFg5uPRwEA
 3FDjOroP4INRKG2qQbMdkT25m1hgAkNgC5/tQlU7J8byzOj6I84npUbRMkd+JLvOtM19
 rzfQHXfOqjR67+QIFntLST7Q8inKdFojqVOZlzBNAidirnrdlYHBSzF+QQ9pXXwfYRY1
 vxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740385481; x=1740990281;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lxmKqqKswXlJbs5eaPNHVwiNA4X+9jY4AP8kBqT7664=;
 b=SxY9vJm/IKv3siT0FpnKwlJj1VWxHR6zrCgrvci35It9MMMRF/pnu1RlQS/gGq0Ccg
 Sm3D1pCSd/gwZLJzcKvvFtmZ+CrfE07H5Ig5p2Lo/+KmnfBwiA8BEqh/VaAWr4+nwUGy
 xeOid6Y2elmrsegUliNcRzSORTZ79euyRv1/JVADL21Xis3SsA+Ztq99aWdv2x7pXl8P
 m061N+Q4bavuI2pBHRY+GyPk0wCKNC+RSN+1v2Qk4u5hFWngD75zVovv8WENk8gPVwpa
 JLa3dTyp7oEO5zKU0NEVwhWHwSxDLfARodn2wQPZh7ZFxK1WfKjNsL5PJqZK5maah9b7
 w1+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoG+LuvTh4cVpES2VuvfIM6IkC2sb3wCK2C6FF4xDI8ylyWvm5a4TIDNpxcgOykUmC5NAzh88zr5H5@nongnu.org
X-Gm-Message-State: AOJu0YzIRP2l0U0h0FHKVb9sXurxIdVYbK6mx5V5lMjfGgoVpmm1JcX3
 76zxyUDEEYT6EcvjP/KBJiJxIRsth6HiOUvgpKvfOoZDmIhhzaqNZeYp4Xel0lw=
X-Gm-Gg: ASbGncsoV/Mlq4vttGDkRc5BtmOFEAxhfGvMDXZYhhbsH10MvCzSV/7hkgCqZpARTyQ
 iQ3tv4aNDl7QVB5FNYHCb3405z8iRhYfk2m+1/bERN6gzJxS9HMa0TRB37Nc4YnRj9fh4TvE2SC
 +MNERSwUX6rdsQObo10QdW5Qx8MIEu7QJsaNpo5mHud07PckK4NHxE8OZJn/UQsN6m5Sl8IwFhD
 cvfyjUgVv1/sthSm6rX12NLnKqBdHqA0JzUDMUfV+hQRe2yE+4tH6wKcapllFgwbzQPpetUViVC
 x8N2e07IlcxV6vlmoVq+6bGCm+kbR5VcdXi6GvAyMfJdbgr/GSWxh4Wv
X-Google-Smtp-Source: AGHT+IGQ7eju7iu6W5RoT1p96E/VQB3wy0f6AcRYFWl8cV1djL5uXEqVv3e65iwwjVJ+/O+2ydKSYg==
X-Received: by 2002:a05:6a00:805:b0:730:75b1:7218 with SMTP id
 d2e1a72fcca58-73426d7782emr22451288b3a.16.1740385480586; 
 Mon, 24 Feb 2025 00:24:40 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7325c88d74esm17714914b3a.149.2025.02.24.00.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 00:24:40 -0800 (PST)
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
Subject: [PATCH v2 3/8] target/riscv/kvm: add KVM_REG_RISCV_CSR_SMSTATEEN
Date: Mon, 24 Feb 2025 16:24:10 +0800
Message-Id: <20250224082417.31382-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250224082417.31382-1-yongxuan.wang@sifive.com>
References: <20250224082417.31382-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x634.google.com
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

Add KVM_REG_RISCV_CSR_SMSTATEEN support to get/set the context of
Smstateen extension in VS mode.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 target/riscv/kvm/kvm-cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index c7318f64cf12..d421c7a1b65d 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -135,6 +135,9 @@ static uint64_t kvm_riscv_vector_reg_id(RISCVCPU *cpu,
 #define RISCV_AIA_CSR_REG(name) \
     (KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(name))
 
+#define RISCV_SMSTATEEN_CSR_REG(name) \
+    (KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_SMSTATEEN_REG(name))
+
 #define KVM_RISCV_GET_CSR(cs, env, idx, reg) \
     do { \
         int _ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, idx), &reg); \
@@ -687,10 +690,31 @@ static int kvm_riscv_put_regs_aia_csr(CPUState *cs)
     return 0;
 }
 
+static int kvm_riscv_get_regs_smstateen_csr(CPUState *cs)
+{
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    KVM_RISCV_GET_CSR(cs, env,
+                      RISCV_SMSTATEEN_CSR_REG(sstateen0), env->sstateen[0]);
+
+    return 0;
+}
+
+static int kvm_riscv_put_regs_smstateen_csr(CPUState *cs)
+{
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    KVM_RISCV_SET_CSR(cs, env,
+                      RISCV_SMSTATEEN_CSR_REG(sstateen0), env->sstateen[0]);
+
+    return 0;
+}
+
 static int kvm_riscv_get_regs_csr(CPUState *cs)
 {
     kvm_riscv_get_regs_general_csr(cs);
     kvm_riscv_get_regs_aia_csr(cs);
+    kvm_riscv_get_regs_smstateen_csr(cs);
 
     return 0;
 }
@@ -699,6 +723,7 @@ static int kvm_riscv_put_regs_csr(CPUState *cs)
 {
     kvm_riscv_put_regs_general_csr(cs);
     kvm_riscv_put_regs_aia_csr(cs);
+    kvm_riscv_put_regs_smstateen_csr(cs);
 
     return 0;
 }
-- 
2.17.1


