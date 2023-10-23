Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958CDC004C0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 15:40:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qux1r-0000TW-0w; Mon, 23 Oct 2023 11:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1p-0000Sn-OV
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:41 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1o-0003q4-10
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:41 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c9b1e3a809so20527425ad.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698075579; x=1698680379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FrJFBp0QUtJN2hNlPZJWGh/625/6+NhPTSOe44ahUpo=;
 b=N1gsTn+rgkVfVjMf4Q88/oEDQhCeFMue605emFrE+Y628XuXic4KZzjmTcV2yKpCxt
 XN/yNMRKR4457xugGRmSiRP6W4D8buCP0hVFvYGbsmGcRmV1qWEAzOU1LBBkqOh/BApH
 4+jafxYwi7gKAwc9YUq5eVkADlTdPyM4bF6ufYImYVuZarbF7TsK7gNy+rV0fq228Y8A
 VLEdc9CeLh7ATE0Xwp8ZADGcZeY+/9w8TJor6qpD2MGpFepsxq8pGz0w2fiX17wK1X4B
 zmHedu+DxSYcraQYbiigWfraQfunhWq1E/0Q3u32FlQrOcNJcVkfNaB8oly/a2cFDqoO
 sY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698075579; x=1698680379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FrJFBp0QUtJN2hNlPZJWGh/625/6+NhPTSOe44ahUpo=;
 b=T3pG6BwfbV55/+prKwS4BXR/DWSQknqWEZpiBqbMFimPf9OnNuOb0KFCtICI6VWr/H
 yC5DlpRs3820/TmYSLdxuNnt175cNAdSDplOu5vXiymHd3mkL2mb7qk72YbBaDDS+IUk
 DVXMr+Z9BOpJt3usGDbIX7Fs/6loXqTNg2B581ImeE26HZBIXFsYkw8ErOajlS2L5GeO
 KCAEKzsIUDRfIBQLlL6FjVoQP8AqSZO+D0XcPbMUBCU0ekSavbJaIPH3rguFMpqjbBai
 y+nnvM37AgeeEgM9GLm07MuUdD7L0PC59QMuj7edHeec61SB8W5ofoTrth5uXDA7QI3U
 6uUw==
X-Gm-Message-State: AOJu0YyenQXY7Q8MIO8uWUyzjg+N4bG1jnwSQDxUnL+MHVS9ulPyJJ1H
 Ai1hRVEZAnw1QtHNdvaZan+hKg==
X-Google-Smtp-Source: AGHT+IHhezE0l9D02XEAc3ecB3fZ/mxUINpRgfEdoO+TjRed5bXgTiDDgTyUhXEIo4BN3gcVfl+ngg==
X-Received: by 2002:a17:903:294e:b0:1ca:5a82:e582 with SMTP id
 li14-20020a170903294e00b001ca5a82e582mr7701849plb.22.1698075578684; 
 Mon, 23 Oct 2023 08:39:38 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 k20-20020a170902ba9400b001b891259eddsm6053063pls.197.2023.10.23.08.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 08:39:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/4] target/riscv/kvm: add zicntr reg
Date: Mon, 23 Oct 2023 12:39:25 -0300
Message-ID: <20231023153927.435083-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023153927.435083-1-dbarboza@ventanamicro.com>
References: <20231023153927.435083-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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

Add zicntr support in the KVM driver now that QEMU supports it.

This reg was added in Linux 6.6.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm/kvm-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index cf98071f92..0a8be40786 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -228,6 +228,7 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
 static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
     KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
+    KVM_EXT_CFG("zicntr", ext_zicntr, KVM_RISCV_ISA_EXT_ZICNTR),
     KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
     KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
     KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
-- 
2.41.0


