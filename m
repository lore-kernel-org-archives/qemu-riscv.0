Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3ECC004C0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 15:40:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qux2C-0000as-CH; Mon, 23 Oct 2023 11:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1v-0000WS-6Z
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:47 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1t-0003qq-IU
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:46 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5aa7172bafdso1889502a12.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698075584; x=1698680384; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFkyNavH6j4N1w2bNPF1bB24Zbhbzj0u+GAF/+GVrTs=;
 b=jqvQJz50DlF05xvOzInmEmrSBTCjoBuMBQPUyMXQHjsDUbnBquNsufvT6KgqGAKKcP
 ZIUOzEmoJAqUOb2DR1lEawuzkebPW2oI+KfAPSxUDvHoPFkcq/kjXKlVQUM6qlB0QidJ
 DluIrdycuav4Vaa8MawehT+qyARGHqwjXkaVr3muGW64dVBroH55ExbXvrW/MlGCM9sf
 griZKz6GQOkCQ+8ZJ41NiW/AX2GmPSE3rfs6Re268ejeiPzZSaIGUR0hB3iDX58kawV6
 FTg2bv7FAgZKddqPAFDd1muqnNX4PH85E4D0bdfHjHA1aVxBz6sAIeo8lBBxFLHTGk3u
 3Ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698075584; x=1698680384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFkyNavH6j4N1w2bNPF1bB24Zbhbzj0u+GAF/+GVrTs=;
 b=gAmpel+ivMYIrCWX4a6PNIGFkxYvqmJ3JKithl7GBiwX0+RLT+p9gpZFHzIcA+VErh
 Ecv2SpJiWsBD0TyE//s8XlRpsFpWg0DqImKZZA1KXbC8C7HytqYGfixeOLyxAATWna0J
 aHuipUU2n7ntaHBd0EpL6eyqEYkoVMdeq2zK6EknYhKPFzNaFPcJ27jJzn68DA2grfYT
 GrH2I7nDEyLFjUNiJfThLgZLovdeFsqKaA0JLoTZZt12qTwguxHaKMsi8Y7DZiBl7THw
 dyMHSoASN/IKzRJA/WgEeic3WcfGRby8dqW8IKDeeHiw5ZP8qLOkEiadkebw5uyhtFyt
 EEfw==
X-Gm-Message-State: AOJu0YxbjCo2kKV4vynGVeULpVkEHTYSffS0rcwcchfVkvM3cJsdSNcM
 irmWwNvISWWBScSbwcvIjDGoOgLMxJ0lygoQzSY=
X-Google-Smtp-Source: AGHT+IFeqHXouFucr5wfKpd+LkoHuGbhaYCGufdXUc3Kcb3GZAHWGqAec8+zbPTLe7SDAFiizfisIg==
X-Received: by 2002:a17:903:1c1:b0:1c3:bc7b:8805 with SMTP id
 e1-20020a17090301c100b001c3bc7b8805mr8333449plh.52.1698075584224; 
 Mon, 23 Oct 2023 08:39:44 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 k20-20020a170902ba9400b001b891259eddsm6053063pls.197.2023.10.23.08.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 08:39:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 4/4] target/riscv/kvm: add zihpm reg
Date: Mon, 23 Oct 2023 12:39:27 -0300
Message-ID: <20231023153927.435083-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023153927.435083-1-dbarboza@ventanamicro.com>
References: <20231023153927.435083-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
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

Add zihpm support in the KVM driver now that QEMU supports it.

This reg was added in Linux 6.6.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm/kvm-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 0a8be40786..6d1c0a7915 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -230,6 +230,7 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
     KVM_EXT_CFG("zicntr", ext_zicntr, KVM_RISCV_ISA_EXT_ZICNTR),
     KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
+    KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
     KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
     KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
     KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
-- 
2.41.0


