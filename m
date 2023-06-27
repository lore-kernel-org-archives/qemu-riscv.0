Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DE6C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:33:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE9kW-00043X-KB; Tue, 27 Jun 2023 10:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE9kV-00043I-Kf
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:32:55 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE9kT-0003fZ-SV
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:32:55 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51d88f1c476so3957609a12.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687876372; x=1690468372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZH7thsC3n92/7WslOHqKTBqWIGtsrU49vkIr/rMBeI=;
 b=UoHa58zSTWPBSIx6vApGCo0OAQ+mQUW/b9EAqRNecCLGs6jqISpaZZuPf7U9FXlTB/
 0c0s3J3tMNUnJ8Tdfnhw+QTIdiiWs6WK4cUPpysDYybjSZnTRnjED9X7zY984KIpWzYj
 xX1Di6K8kHUUhpHYNIsq/LMc52eq5poT8e7SQiQVw8Iq43x4QqfGGVp2NjXQKtWDjlVC
 LrPhvm8BxzQE8ifqoMvxw4+1gOLYKFAZVtSAUCgqAL+dkIxbH/yeOxGIVArFiKf2pKel
 HSnHSGA8mgdM7I8jxGOFQXk24bixKdYbRBVNzJ0SYRT5CapGRdI6c1/D7fouVNxPO0vH
 q3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687876372; x=1690468372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZH7thsC3n92/7WslOHqKTBqWIGtsrU49vkIr/rMBeI=;
 b=d58CbPNzI5AkWDvbflZOMYEOe2KVme6liWeT5aBrmArXNeXFLIwIG1/qiSS7ivpYXO
 VFUiAiGVk/JzU0g1roQZiwo2zWA4MDR6o/noFSCCw3G2/f6f9HFtrK8JniEKUBP4W8cu
 py/AVNiPvEy3Y0eGuyaUZ/0pHhuOKHTcyxW2fSrJ615ld9NbCEIpvdxvKBx1yKVu3Vlb
 9SZs1Cpvb2gmienkiPS5URukrQOVSz7A93ZozDrrEQBQoUDOJdUOpRDKo3fiKM+/YWac
 Hhe61bQjHtvjmTitVfrSb/kqFrNWYF9tSfqmBNtVNjwta4Yc3wmMzmQl7FBh48za1da7
 qkhg==
X-Gm-Message-State: AC+VfDyDXKS0knjwgl+cyGVEQcDFPSs7wDWu4bFV1tcAhFqmaE88Y544
 cUnqjWAVDokASSVzFFxAwsAfjg==
X-Google-Smtp-Source: ACHHUZ7A7HzUwbIUXCeSoeL4VSwApVbanU7CI9HLUXoKxMKjvySy9wU7+TO1DpVnoPIGZMuZDvdqmw==
X-Received: by 2002:a17:907:7f04:b0:991:f6d0:9bc1 with SMTP id
 qf4-20020a1709077f0400b00991f6d09bc1mr3527179ejc.66.1687876372145; 
 Tue, 27 Jun 2023 07:32:52 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a1709061d0100b0098e1116737csm3915190ejh.24.2023.06.27.07.32.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Jun 2023 07:32:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/2] target/riscv: Only build KVM guest with same wordsize as
 host
Date: Tue, 27 Jun 2023 16:32:35 +0200
Message-Id: <20230627143235.29947-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230627143235.29947-1-philmd@linaro.org>
References: <20230627143235.29947-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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

Per Anup Patel in [*]:

 > Currently, we only support running rv64 guest on rv64 host
 > and rv32 guest on rv32 host.
 >
 > In the future, we might support running rv32 guest on rv64
 > host but as of now we don't see a strong push for it.

Therefore, when only using the KVM accelerator it is pointless
to build qemu-system-riscv32 on a rv64 host (or qemu-system-riscv64
on a rv32 host). Restrict meson to only build the correct binary,
avoiding to waste ressources building unusable code.

[*] https://lore.kernel.org/qemu-devel/CAAhSdy2JeRHeeoEc1XKQhPO3aDz4YKeyQsPT4S8yKJcYTA+AiQ@mail.gmail.com/

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 649de244c6..a3ab614235 100644
--- a/meson.build
+++ b/meson.build
@@ -110,8 +110,10 @@ elif cpu in ['ppc', 'ppc64']
   kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']
 elif cpu in ['mips', 'mips64']
   kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', 'mips64el-softmmu']
-elif cpu in ['riscv32', 'riscv64']
-  kvm_targets = ['riscv32-softmmu', 'riscv64-softmmu']
+elif cpu in ['riscv32']
+  kvm_targets = ['riscv32-softmmu']
+elif cpu in ['riscv64']
+  kvm_targets = ['riscv64-softmmu']
 else
   kvm_targets = []
 endif
-- 
2.38.1


