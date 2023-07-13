Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9376EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 08:45:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJrw8-0006Nk-KV; Thu, 13 Jul 2023 04:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qJrw4-0006MN-9O
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 04:44:30 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qJrw1-0006yk-0X
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 04:44:26 -0400
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a36b309524so484358b6e.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Jul 2023 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689237863; x=1691829863;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bRqQKtep7JWLgclLdUkli6/fChTnwWs+kTdTq5m30jU=;
 b=CTlKktPs+hY0cgE7CS2PUANVjOXYIGn9DpU2fh7mMW2HZEQy1ymS0r+QkdZU1bdjGB
 P2H/jtF17Wexhc+P++LOh0FtkHw9ToVJYYkmJ2R+46Pq+yCVcBYwEa6sNddZeYTAQG93
 F9Re91F5WlS3VTETLFEyPWpb8ZNnRWYnopTN/k1Y1tVgM4Q3WhYSiZEb5INzk1ZCWmZy
 Ht6uHxlWh/bDhXre4KQ3q292Ebz8ayR2ctMZrSgTwIWEJnL9HCOIKtH7CssMxSprI1gQ
 basdybVGjqRuPOKpJ+sCLh4s5/DYF6oxFOrVQwIq/hKuKNAcy/cCYqRf8VrmJrBEBlX/
 xwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689237863; x=1691829863;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bRqQKtep7JWLgclLdUkli6/fChTnwWs+kTdTq5m30jU=;
 b=JFR+EbOW310sdiZTnez/7U0xXqvubhNoDVaUhq7Yhgfu7OgLPdClVNK1ZXeJvEf5Gh
 ZAKF4t8k9iAbAIg9LHs4yhvc1qtqLkyv2UyIe8VO1IsQbFJKukp0dNOlXV4tHi2snLQz
 htZ0ErKzNmxnTVVRKB3oFyXpxd02Qd/dVHGcvBrdHNPOPGZOpbBuMqjcgix56Y522iZ8
 vdtV7HlEIs5PkSf7wz7DoryQSUdCCDX2rY2G2Zav2gOJgp1mdMS9BzdsTzwKwOiIaAzT
 vz2LzyNjGen1AxD6kfi/68eF5/2RUumU0GT42/RaBVRpraalpIRKTQVRm1WW0MU2RVK4
 HZKw==
X-Gm-Message-State: ABy/qLbIZAmcQbTPqH+YHmBZ1q8djShiJfTDNoAD8awmETArKo7SWgci
 QbSvcQ721AN5rl3BH6l35BpsWw==
X-Google-Smtp-Source: APBJJlEwvjQxj7TZ0LJFULoNQDbfGWViUSUPEKbUpl3Uk7rotzEbi31NqIdsDVgZwphMV9Wf+7w6Vw==
X-Received: by 2002:a05:6358:70d:b0:133:26e4:afb2 with SMTP id
 e13-20020a056358070d00b0013326e4afb2mr2045730rwj.3.1689237863041; 
 Thu, 13 Jul 2023 01:44:23 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a63724a000000b0055386b1415dsm4989198pgn.51.2023.07.13.01.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 01:44:22 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Subject: [PATCH v5 2/5] target/riscv: check the in-kernel irqchip support
Date: Thu, 13 Jul 2023 08:43:54 +0000
Message-Id: <20230713084405.24545-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230713084405.24545-1-yongxuan.wang@sifive.com>
References: <20230713084405.24545-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We check the in-kernel irqchip support when using KVM acceleration.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 9d8a8982f9..005e054604 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -914,7 +914,15 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
 int kvm_arch_irqchip_create(KVMState *s)
 {
-    return 0;
+    if (kvm_kernel_irqchip_split()) {
+        error_report("-machine kernel_irqchip=split is not supported on RISC-V.");
+        exit(1);
+    }
+
+    /*
+     * We can create the VAIA using the newer device control API.
+     */
+    return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
 int kvm_arch_process_async_events(CPUState *cs)
-- 
2.17.1


