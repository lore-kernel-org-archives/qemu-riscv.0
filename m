Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973CDCDB482
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 22:13:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qssJ1-0001er-3U; Tue, 17 Oct 2023 18:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssIz-0001dc-Fj
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:49 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssIr-0002Wf-Ly
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:49 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6c4bf619b57so4234935a34.1
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 15:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697580760; x=1698185560; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Juy9Fo26ThtU0g+UY2hVD044MQTFgCmF6GOFzAjzMiI=;
 b=gsainKF7k7KzOWMP7nQ4d/tgFOZ2JYBdFRMVQLS1LzGsl9/kES730mu10IC9B/mNMa
 AmZulnP2Jk/V26AutgHlAdpIlcvu7/MMIGpvAGUAikks9nIjSK7xYIsSm7VddBvRbZLz
 26NY5VRKgjcySlHjyJqhbG9+LoUwgdIOgIYrb4tWOPfkPJTbhmdHDocE/TEoU26Tc5bU
 LBL0Tvnr0y5o2mGzkhepppYa/C9wNCOez2DFnYOtxT5F8XBW+vnCkB3qEhWXCtoNFTOU
 XIM7+Zy0fhrT+ps+5STApzDjeSu4rQ0TBizbbOx4KpiLJ32LY1Zk9Glg0UnMGqTDVUcx
 O6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697580760; x=1698185560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Juy9Fo26ThtU0g+UY2hVD044MQTFgCmF6GOFzAjzMiI=;
 b=v6pNG/jmw6MR3qzaJTm8PgWLBusnRqDqgJYuqY3Gq1esEqNYrLHSHyUbbxJ6XWkebQ
 01VnPJrH+mr8YFajen25csJOELvQkvhF4lLqoiJVza+vdYj8p7zaHU1keCtaCEo+cFLu
 9aj9fyaWVKCxGAJ7EmP8CZ5I8mWkboIfjxg/2feEFFlADUEu5PAwZlXI4i5B0DBj/NYG
 g5RB18DTi1UYxVLZ3e2sfGk0M+se1JXvOP5aif5/iX411tE7snQv9GB6UrmJseuAubkT
 N9izNgDzdI5ZLgpNX+J0F6P0ZX0sBZg+1DVRaLAzD5SgKsqgcxziF8ffclVVGe29v9y0
 tZ2Q==
X-Gm-Message-State: AOJu0Yzrk38M1ZFENeIWSTxxbxZBBqVFCtVgq5945beO0OYQtbmzc2hZ
 iZOZMZ57Z39+U6Z2UTNX8GESWw==
X-Google-Smtp-Source: AGHT+IF8BPJuoys33rsqefNcP1VEer+wmPKM60y6SCkUqstQQEo04SYBNz7yZTAZmSFdi0BVRHViHQ==
X-Received: by 2002:a05:6830:71a2:b0:6b8:f730:7ab4 with SMTP id
 el34-20020a05683071a200b006b8f7307ab4mr4689556otb.0.1697580760616; 
 Tue, 17 Oct 2023 15:12:40 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a62d14d000000b006be077531aesm2011023pfl.220.2023.10.17.15.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 15:12:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/6] target/riscv/kvm: add zicntr reg
Date: Tue, 17 Oct 2023 19:12:23 -0300
Message-ID: <20231017221226.136764-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017221226.136764-1-dbarboza@ventanamicro.com>
References: <20231017221226.136764-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
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
---
 target/riscv/kvm/kvm-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5695f2face..6c2a92d171 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -215,6 +215,7 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
 static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
     KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
+    KVM_EXT_CFG("zicntr", ext_zicntr, KVM_RISCV_ISA_EXT_ZICNTR),
     KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
     KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
     KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
-- 
2.41.0


