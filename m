Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39D9C369DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 19:24:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9U59-0003hv-J4; Mon, 28 Apr 2025 15:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9U57-0003h1-GG
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 15:23:57 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9U55-0007OE-PM
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 15:23:57 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2295d78b45cso74940795ad.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Apr 2025 12:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745868234; x=1746473034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqkSXWmlAzXCmkQApAbF+YpwERfG9A2hRBSgef/JTFs=;
 b=dtepnuWpV6gMvnvXqVOBvEN+kFGWaZQLpTcjtDCpBmvT62Gc20MLr1wpQhttaMiVs6
 pQfUUPrfkLvg7PFICtU0aSjpdQnDgkOx2OTO60flKYW/a4lwsaOaUzhtoiJpX7WMA9lr
 kNCi9wAYtARr+yBYDB1+ivmLnnXYwUIoXtQmxKfdqjCHrRw1u0ebenqu7lQukW3eioS8
 YXLuYrdSToSBR3mnbBpLwlrUVNQjXCjTTeS2PM5kxhNaVtJZBP0uD9NhTHffiJy4BV8R
 1EFHgqJOncA6OEIUouZ3dAkKjVGi3y7H2L+/QjXCp4MQvLJcmxrYLeeoTbiRTExT61hP
 drYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745868234; x=1746473034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqkSXWmlAzXCmkQApAbF+YpwERfG9A2hRBSgef/JTFs=;
 b=Rjoe/XCvy+cbZ5qPPDw138iHD3E+60RTdY3bldx/LGj8vB8iRlCNzoWUpeEV2WGKv4
 HKNgmx0VD0tjl4WekUbVIXLXbLz6SWRVlotr+nnVqVPUbi6v04f7KQEHNsDFbmMR1iUI
 cQV/r8dqpzoXU4LfeRfxqtwr8qXfoa/N22ZbocEt7FQPTHuq9N0TqX4X644+bAy8J9UF
 0Xv0+mh2Tv2YcIgcme5LreOVgNTshIAJscrqZ3xdZiLHnza9v23UdIBQmB+L1nxGPhtu
 02Lz4g5tUTaFdTb6ZHzRr7vVtvw1tHal1JCzkmT/4UBZYXPg9tSqtGi2wDYxOBRnIokN
 3VRA==
X-Gm-Message-State: AOJu0YzVcCU5ax4m5BomzTNDn2wGE22EAcAj5aLR9a+aqLC7q7DuV+p6
 iDL0okpI+fPrIb3bjP5DyufUdrMzwOVa9tgrXlmWIAks8+lqdIay5PH7U3lZWN8=
X-Gm-Gg: ASbGnctJFMHt0ZytSyz0/5uWrfjQBTMaw9cYF25b5iovS2PpeTBlHcvjOuroMEB3lhe
 Mtz+T5t9RFOY05RnysXlFq1F++LDlLXHV4AjW7xyMgex9JQJfZFmBnt7l18MhbB+kTEJkVtK4+v
 ROhTlWnMRBJ9WzdLj31xdkStjkcceyjCxud5lVE2DxWXBxaoNJBRk3naZ6hn4TyPN7JvFwDs491
 fTUHjN+ixJasVd69bb2ZTrgJDMCfG0vVVzwsg/kg+lf1imj/WglMoxUYDkY9iEgmAokaGy/pUjq
 ysFKpYNtEHQVtDRAcAUrT1rXN2JCLy1kZ08w+d1kZE8U
X-Google-Smtp-Source: AGHT+IFSnTEGWjV9S2VC9mg//Sux2kfRF9Ce+hrDfGO7zzsfU18TI7NJTQpa9HQ4G4osonWqWRVzLw==
X-Received: by 2002:a17:903:1209:b0:21f:7e12:5642 with SMTP id
 d9443c01a7336-22dc6a04770mr129720115ad.18.1745868234419; 
 Mon, 28 Apr 2025 12:23:54 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:906e:57d5:dca2:1ab3:20de])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4db99d3sm87300565ad.53.2025.04.28.12.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 12:23:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 7/9] target/riscv/kvm: add senvcfg CSR
Date: Mon, 28 Apr 2025 16:23:21 -0300
Message-ID: <20250428192323.84992-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428192323.84992-1-dbarboza@ventanamicro.com>
References: <20250428192323.84992-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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


