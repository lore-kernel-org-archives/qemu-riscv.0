Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D5BC021A4
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 12:32:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmXcg-0004fH-4f; Mon, 24 Feb 2025 07:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmXcZ-0004bE-E2
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 07:31:40 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmXcX-0007eT-SR
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 07:31:39 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-221050f3f00so94090995ad.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 04:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740400296; x=1741005096; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y7ZOq6CGiOpDDrwdS6L6rqcG8JIc9h6/YnxChOerYnU=;
 b=a8dD/8auXsdA18kjx+f/zTpGNNqLovvtNP1orNRwlSedY5BDg8Va663AsBzpLEoBjs
 mVn+oUzmu/1kmKVGoO5vmR16vxtI0C592Be2QJamzGEopIEOzCL6Jufpf/Wyj2rvoeia
 /mr6NzXYhWKuMGn2oXmlkU1oJR5U/ULn58xi0rsQX/d4H/vMrlbuOvqkncpEhhj8y9Vs
 iLjFtgPLWF4sx34ZS5YpI/6Xz7WgR3KhKfkUIXRsLU6qWNrD4f4PRQFJg0/Dr7rE4wWk
 LjB77kv+IoH0omiKsqQ6lFDZMZcDiDoXwP7qrPAlmZ356pHTKGaNupVTVId2Y5RZXO0U
 PMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740400296; x=1741005096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y7ZOq6CGiOpDDrwdS6L6rqcG8JIc9h6/YnxChOerYnU=;
 b=SNSSWAeqKoX3bAkWpVOeh5aj4nVvSP/Fpp1HYVFiJbHQ9e5L7XV8WaD/A2aPjxd9l6
 XTsTDnVUPJlmLAc1Sl3md6c13ucR0q3XftcSDlSXAduCxbcM0g52zgtUomBBgA6vaF5a
 pcG6fYMIIiO0iJTcd1x9mFcEwhgJ+qlPh0YD2Dc9n0U315pJHzMtllzY/vrBo5xBSHlo
 c6PQ4HQB+V+8UlcXWrkb5w9clfb3WRxhpopYYNo1LCztBkGxpvhMrkCwvapYO//WLWHi
 ugRwOIPuyNnLGtsBFqn76d3YngIvBCwXjTKgbaArudv3xAFd7MVglkhpzzTZF6/et0P8
 9A/A==
X-Gm-Message-State: AOJu0YwdDFdSZKJXuOS/M97uTGmP4+LBndzjkcHN6Cumh5w8ZDGTB06O
 5gMGtD/dcJkWxR2UBW/PAuOsPzR4KHeIC2cGAg7nGo5aL2pIhP9PFM5d1QR7ndg=
X-Gm-Gg: ASbGncvtkaFDafddLr+iREw/xe85mCDezBs4WR6OdRiH/vRRdappHn5Xcg2vDiW8uXi
 J9F3r7K8VwiNSI3bwIXx4ZbdAms3E5IgAwqiBqhcSssE7oRbv6yttgdTwXUt37HFXjEjJIjAoj6
 gW79pZoqbIwcfDO333cH5Gv3LlIJu25/Y8xM23Zj8LAFNSkY8prOIocuKXZFBGSXpe2yG3xsZRV
 BU7xUmnZK1w/JaBsJv5ozA5KR2cGLNqgn5nIkVmJglcgJi2B4eEgg163UwaXc61VTyEAie/HYQR
 DvWfESopzvO7+PyXsXJhWRUhm7X7Fg==
X-Google-Smtp-Source: AGHT+IGfZh/PBCq7Rk8S0SdaiWpX+hoJGxIVgJ87PMio/G08O/wf/0IbkCTn8D3kypCW9NA1hkFyng==
X-Received: by 2002:a05:6a00:b52:b0:730:91fc:f9ba with SMTP id
 d2e1a72fcca58-73426d77a2emr22208725b3a.19.1740400296562; 
 Mon, 24 Feb 2025 04:31:36 -0800 (PST)
Received: from grind.. ([177.170.227.219]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242568af8sm20554470b3a.48.2025.02.24.04.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 04:31:36 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 3/3] target/riscv/kvm: add missing KVM CSRs
Date: Mon, 24 Feb 2025 09:31:20 -0300
Message-ID: <20250224123120.1644186-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224123120.1644186-1-dbarboza@ventanamicro.com>
References: <20250224123120.1644186-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

We're missing scounteren and senvcfg CSRs, both already present in the
KVM UAPI.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index cabc34b6a2..e8c31a32d4 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -619,6 +619,8 @@ static void kvm_riscv_reset_regs_csr(CPURISCVState *env)
     env->stval = 0;
     env->mip = 0;
     env->satp = 0;
+    env->scounteren = 0;
+    env->senvcfg = 0;
 }
 
 static int kvm_riscv_get_regs_csr(CPUState *cs)
@@ -634,6 +636,8 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
     KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
     KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
+    KVM_RISCV_GET_CSR(cs, env, scounteren, env->scounteren);
+    KVM_RISCV_GET_CSR(cs, env, senvcfg, env->senvcfg);
 
     return 0;
 }
@@ -651,6 +655,8 @@ static int kvm_riscv_put_regs_csr(CPUState *cs)
     KVM_RISCV_SET_CSR(cs, env, stval, env->stval);
     KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
+    KVM_RISCV_SET_CSR(cs, env, scounteren, env->scounteren);
+    KVM_RISCV_SET_CSR(cs, env, senvcfg, env->senvcfg);
 
     return 0;
 }
-- 
2.48.1


