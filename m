Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEEFEB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:10:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFB4l-0006bP-Ep; Fri, 30 Jun 2023 06:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB4j-0006RV-EZ
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:10:01 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB4T-0000ud-1B
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:10:01 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1b06c978946so1564244fac.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688119763; x=1690711763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CUH65l9b+94gS7t3oEPmx65114gAPQ3iRabq6g0F0LI=;
 b=a3JVNmG23M3SNeLvr8s27ZIUH7MLaR7I9Ja4wdNqq3Ii9ZddM8RUqeo3x79m+A3Xca
 X3VcPeWPcGCBxHWDS5nfaLTWP2WYrBrZ261B7GEorx17f9DlzXT0uPF1Vw2kd7DHdkVb
 1aiXrTCGjJKYE5Rex10xJzeBI197roJKB+O0cTLN7GkVThKVYuPe+v4jYiPFg1BwxP+w
 1OOpGv+RaTnKZQSIkAkOaCN2vxKPL4uLQWUP5ki0Y3CQjsPlCOtQxTnH8RaJcHvlkoDq
 nqpcVpRGSLLOO7AZ3BW/6cRYFQ42IsdrRz1NL+n6EvMpPJpr2Qskx+nY3DAS3HzGHIPU
 A5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688119763; x=1690711763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CUH65l9b+94gS7t3oEPmx65114gAPQ3iRabq6g0F0LI=;
 b=jmkehFA8i9LRi3agpIdKTWncHBwL9t/dhFKgnDwrCIWLbznA5/vSdIyHW033XgcaHS
 VXyN64hLmnVsXGAr6fF5dfoMej+Rt6E0hCU6eH/TlwX8GtGP7rKifz08l0ys1dSYfrpo
 fFb5JRg+sR4DvUWrBjHSBe/9HyG6Mqa8KJe6d22y9EluIsqkow3rWOw1sajKC0jE0pUX
 uGzAzCtqW+Ka12NLjmjj9FVdr4msULFTLncSTnTpGTBfBfubREFh7FHH3MxsuFq64AD3
 As8iEmkyt2CsDTG0UNcfC46/Y+qjSZkEVqlA1B/msbuK9GDiiCLCDnWaYKA8oESxqi+/
 dmcw==
X-Gm-Message-State: ABy/qLYAuE3Oie13Y0WtPuNk8eM7NSh57xlH75wTIdmJgulSf0GF2gyF
 ZZN7vDumJ7pJpT+elWQilImwGA==
X-Google-Smtp-Source: ACHHUZ5QUimJnrvJCDKIClY4QP4ZvKON2UqwdDG6WicoXzOiQfSFrT049TjWUhOVOFsEP3+2fvVqTg==
X-Received: by 2002:a05:6871:4385:b0:1a9:b83b:3d8 with SMTP id
 lv5-20020a056871438500b001a9b83b03d8mr2917560oab.29.1688119763413; 
 Fri, 30 Jun 2023 03:09:23 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 eh18-20020a056870f59200b001a663e49523sm8707467oab.36.2023.06.30.03.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 03:09:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 19/20] target/riscv/kvm.c: add kvmconfig_get_cfg_addr()
 helper
Date: Fri, 30 Jun 2023 07:08:10 -0300
Message-ID: <20230630100811.287315-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630100811.287315-1-dbarboza@ventanamicro.com>
References: <20230630100811.287315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
index 2edf0270e3..f048135cd3 100644
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


