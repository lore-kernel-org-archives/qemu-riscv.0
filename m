Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101EDC369D3
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 16:02:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8LVg-0006NV-Ee; Fri, 25 Apr 2025 12:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8LVY-00069h-KD
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:02:32 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8LVW-0008Nj-TJ
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:02:32 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b061a775ac3so2387171a12.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745596949; x=1746201749; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqkSXWmlAzXCmkQApAbF+YpwERfG9A2hRBSgef/JTFs=;
 b=WczjmJcwMu9WGjhf/SRMJiMHM7L8cJncT7JogBqukUdY8442M71aSwGabZiHnCAdlu
 Ow1fA9yxW0Adf3dyQWJ/Z1ZuBnYCPckUsyEX3hKT+1eD3/hcR4sogsg71dEmg/DqFaoS
 AJ+RR9vR3ijPqFFg6PCf0BugASYs+ePn4Cw1hop17AIg0BZnCw0gILMIwVS6mFMxJwhq
 Gxofr9FB5grUCzaCi/59L+27vQ9wwigyiTZ5oDghAhLesqxQPXUD3aY9jVgg2tevdHsM
 I09C4IdpIO5uEVx+o7wHNJZoa3crWfK0xhR6V8ylnyHqZ48GnTiO1lPihjjKI1zWUEcd
 4m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745596949; x=1746201749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqkSXWmlAzXCmkQApAbF+YpwERfG9A2hRBSgef/JTFs=;
 b=DVstrkf4G7Ct2L3+auANXU7ZFLgETOQ5iA/MWZtYKortIX102fC7mzjWseRF8HjJ/Z
 j9GFhvJKMHk3+LEyI8A2MLIucaRZFaLw9GVpnyIZWR9EqtQYECTkwdsL+K7AkE8GDaFv
 11BpxDtBqFkRSw3uLCIlK25Fbvclv7kFUD3plexrIcnOZ8fJPJR+aJHH7uFR8FNtbxPR
 k27aoeJ6xERSEDkQqzwT3JjQ9KSOBfCVNX995JoXZkfu/2qiyG1z5VMUeZfe0A60VH6/
 93vy75QECA2SFFDyWzFrmOCmHNbVC9iHM2uhJytbN+OkAYinbNDIwKBc3UzrKjHfe6BC
 iK7g==
X-Gm-Message-State: AOJu0Yw43Cdh8tRn4bu6Knq0ru6XEQ2dLdKIPAagVqHTAeH7rJ8TQ5Cr
 AFhQ3LYSlCGPTxZRvJqFvBYAStRx47UN1CbPWIC/s/Ooe1Cho0pAWh2JGeBcQlE=
X-Gm-Gg: ASbGncuESCiHQzoZWaYDYzeRhy8qv5mlUGKpVownT9HqRo7e97gisb+W2UArxRnpX2M
 mBExfHM7aU66tWZ/AJ/gPMGwf7dHEpSh0YsAwOSdidYpTi+zqE+xCojJJEyWaFqkMFVMXswa9r/
 HkKOI6ghcHH7143tQaOhx4MbP0y03uwqPZN782hzPMnqlBHA0frKFesyPd8A+egnDDUft7y7n6W
 cNZs25uCiO+Zk2zc24wpojGQ+xXVTDsQymXJ7MnPXeVYn5RLPjXuP3c/9ajU9WoubGykLzgWvVZ
 WKBDKzB3iQDC0p+EUyZoT7wjo2vmrwwp9RvYseiXkJLGjrq20Ng9ah41FYfMZLoAIqWa
X-Google-Smtp-Source: AGHT+IE4YYqmaEP3zJ1KrUTGfl5R4j13/d1L2SAgmq6sAAY9/xzl0Xgp4kB756Ixq6d56Qy8F7wMrw==
X-Received: by 2002:a17:90b:574d:b0:2ff:6aa6:47a3 with SMTP id
 98e67ed59e1d1-30a013b50c5mr137757a91.25.1745596949215; 
 Fri, 25 Apr 2025 09:02:29 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f774e534sm1820005a91.17.2025.04.25.09.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 09:02:28 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 7/9] target/riscv/kvm: add senvcfg CSR
Date: Fri, 25 Apr 2025 13:02:01 -0300
Message-ID: <20250425160203.2774835-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425160203.2774835-1-dbarboza@ventanamicro.com>
References: <20250425160203.2774835-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x533.google.com
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

We're missing the senvcfg CSRs which is already present in the
KVM UAPI.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 1ce747d047..5efee8adb2 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -249,6 +249,7 @@ static KVMCPUConfig kvm_csr_cfgs[] = {
     KVM_CSR_CFG("stval",      stval,      RISCV_CSR_REG(stval)),
     KVM_CSR_CFG("sip",        mip,        RISCV_CSR_REG(sip)),
     KVM_CSR_CFG("satp",       satp,       RISCV_CSR_REG(satp)),
+    KVM_CSR_CFG("senvcfg",    senvcfg,    RISCV_CSR_REG(senvcfg)),
 };
 
 static void *kvmconfig_get_env_addr(RISCVCPU *cpu, KVMCPUConfig *csr_cfg)
@@ -698,6 +699,7 @@ static void kvm_riscv_reset_regs_csr(CPURISCVState *env)
     env->stval = 0;
     env->mip = 0;
     env->satp = 0;
+    env->senvcfg = 0;
 }
 
 static int kvm_riscv_get_regs_fp(CPUState *cs)
-- 
2.49.0


