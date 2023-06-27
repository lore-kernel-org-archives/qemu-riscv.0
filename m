Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4242C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 16:36:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEBd2-0004IF-Dy; Tue, 27 Jun 2023 12:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBcs-000485-14
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:33:10 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBcq-00050J-FH
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:33:09 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1b06c978946so403568fac.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687883587; x=1690475587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCyEYTCurZlKeBb+smp4iBapbYzZbkqtdlsgVYmzaks=;
 b=cMFgPUoaW+uwcHq7JBXVNfZVDoT2oLLZi5P8QVyentU8gidzJvbNPy+G0TChsOjaII
 NN7quT3mZa/ZwHsBMBXUKc8KMgrboNh1ECWQt7nHF7PW9UmSjge232nmkwkLt+23SJ0x
 MJj7ldR8BdjOA2lzzzzEfXiZTU2OgywT0xBpLhVieirOGSrU/AQOuaexmTvHdeKjOJT7
 P+JRbp69e3AXrDlEKPgMTInube1nQiQO2x4bvzXET1T9U7Jys9YDu48Ii7nWeftP3J2w
 318Mbqej70QxdehT3Nq9kohz3DO3q9Z0w1A+tefF13JrQSN2b7WCg9kZmgB+6X6zYDss
 ioZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687883587; x=1690475587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HCyEYTCurZlKeBb+smp4iBapbYzZbkqtdlsgVYmzaks=;
 b=kO5FxFEUbF+hhUD7LhB0TEDcQOOXZ4OQGeBXddEtx9kRkprf0d5vljVy4pnJtIV4yu
 pSkR1wy4m080Os4T+Wp8SUSPe8c84VAIJE4fLEwxbbJO4fsDFby5Fz2oz/tZRzrDQrGY
 4gkUE1LwlDqE4xtRFxQpy3KTqOgiQssd4+3l+wF+NBYQcH7gywB69rq0hja7Q05SDdK7
 71l8DYa0qap3iElbc1fVTxtskejl10nLcqIW+qjwPAzie5Sx9PayT5SGeYCr3OhBykGq
 8CWvjttNx/ocV8GraB+c0sj8aAy7V2+HGv9HLJargWAhivYI9aOa6w342IAHj5ZhI7vc
 R7pw==
X-Gm-Message-State: AC+VfDz6o0pt431iGrW4k+yfwOjLqHh5Rpds1jWvE5Xr+DQ8f5rvxIBk
 /aPNtNQZqd2e6I5FlhUaaeJohw==
X-Google-Smtp-Source: ACHHUZ7Irv7IAxUf/vwUxBHZAFaOo9csvQKIAqOxFi4st/XmE1A9p7gkqN8lqDseY12EjfOElzeScA==
X-Received: by 2002:a05:6870:7342:b0:1b0:2bff:b9b5 with SMTP id
 r2-20020a056870734200b001b02bffb9b5mr6987933oal.47.1687883587485; 
 Tue, 27 Jun 2023 09:33:07 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 gu17-20020a056870ab1100b001a3093ec23fsm5254134oab.32.2023.06.27.09.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 09:33:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 18/19] target/riscv/kvm.c: add kvmconfig_get_cfg_addr()
 helper
Date: Tue, 27 Jun 2023 13:32:02 -0300
Message-ID: <20230627163203.49422-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627163203.49422-1-dbarboza@ventanamicro.com>
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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

There are 2 places in which we need to get a pointer to a certain
property of the cpu->cfg struct based on property offset. Next patch
will add a couple more.

Create a helper to avoid repeating this code over and over.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 6eebeb123a..e8f6683030 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -215,11 +215,15 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
 };
 
+static void *kvmconfig_get_cfg_addr(RISCVCPU *cpu, KVMCPUConfig *kvmcfg)
+{
+    return (void *)&cpu->cfg + kvmcfg->offset;
+}
+
 static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
                             uint32_t val)
 {
-    int cpu_cfg_offset = multi_ext->offset;
-    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+    bool *ext_enabled = kvmconfig_get_cfg_addr(cpu, multi_ext);
 
     *ext_enabled = val;
 }
@@ -227,8 +231,7 @@ static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
 static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
                                 KVMCPUConfig *multi_ext)
 {
-    int cpu_cfg_offset = multi_ext->offset;
-    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+    bool *ext_enabled = kvmconfig_get_cfg_addr(cpu, multi_ext);
 
     return *ext_enabled;
 }
-- 
2.41.0


