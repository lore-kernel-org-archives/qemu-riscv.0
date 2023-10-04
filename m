Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964A7E8FDDD
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:12:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnxsd-00058q-Ew; Wed, 04 Oct 2023 05:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqr-0002pZ-Os
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqp-0007Yh-TG
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-313e742a787so387441f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 02:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696410446; x=1697015246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vfazF5twtKQ3eFwn5to3we5c0wVkZ7UGB4/AdEoPOtw=;
 b=ATs9LI8dTAiQBAMXtz+Eyw2ApJZMn7JGqAPka7zDjLyIRI19jhOe7TvyFPx3QcJQID
 PcINYNUbjb35q205ZldYTJJz+HiP4MsGm5erGLvHSbZB3M59dT48vEk6feKjobDcBZIb
 7IVKc8mSDRHREmMxPbziMghmJHgZYswMOVKp20c8QA/FM1zBpJ3nTbu7aRkjO4/qSykV
 kKKpQpYP3Y2dxuWklDTvU3xSNEAVu4fTP6Go1PiC6QmMume4z4TytqQy8sa0N2/6Phv7
 /OJZ6ebGnWUlDc5Q2RCrZStYxVWe8tEsL311b/NKBXKS38C+cB/WpfoQqWA3LKwu692O
 ypPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696410446; x=1697015246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfazF5twtKQ3eFwn5to3we5c0wVkZ7UGB4/AdEoPOtw=;
 b=u9au75r65leWfLDYfhvOdKDwILSxJzDr+LwMuOL1dKGfECoQjilN3JlBm7RGy049G9
 a5Lp0/puA7smYGD8SkbvKTEA5p71zVeIe6JnrgLtwPXAvPUPg7y9mp/SGWt4N7IIQJNz
 unBl7mLJG6+XaWAHBti3yNYf5ZC2beRNkFLnIjxzfXdDuC1TMsbZclzj264/n+HgxVjE
 HQeBPA1ICCvBE/Pxk7Isxsp2NJLae6rR0OGNuzL90ckmSIxEkqJhtCblVAFYc12vb0U3
 /Gg6uI/UaQmehIJ7rWKA3AqMFn+Tgi17t6/xP42cbfrJVy1hxue3tO7mZ5RL7i+Vd5Qx
 Lgug==
X-Gm-Message-State: AOJu0Yz7SVKCY5qUaO8NX7AVxxPMET9RW5iuIFQeKhZD68tRmgAw/OtZ
 ZKPp9UysZAGZlCNw5Q5DXRdP3Q==
X-Google-Smtp-Source: AGHT+IE4drWVEEXxin2eDRdKvls8Mlsox53e9be3+0/F2daDs3Lh3TcinCAi2Uyjq1caMQn0aDupuA==
X-Received: by 2002:adf:fe0e:0:b0:319:7ec8:53ba with SMTP id
 n14-20020adffe0e000000b003197ec853bamr1273272wrr.14.1696410446239; 
 Wed, 04 Oct 2023 02:07:26 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 f14-20020adff44e000000b0032318649b21sm3511716wrp.31.2023.10.04.02.07.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 02:07:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
Subject: [PATCH 09/13] target/i386: Rename i386_softmmu_kvm_ss -> i386_kvm_ss
Date: Wed,  4 Oct 2023 11:06:24 +0200
Message-ID: <20231004090629.37473-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Software MMU is TCG specific. Here 'softmmu' is misused
for system emulation. Anyhow, since KVM is system emulation
specific, just rename as 'i386_kvm_ss'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/kvm/meson.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index 5d9174bbb5..84d9143e60 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -1,14 +1,14 @@
-i386_softmmu_kvm_ss = ss.source_set()
+i386_kvm_ss = ss.source_set()
 
-i386_softmmu_kvm_ss.add(files(
+i386_kvm_ss.add(files(
   'kvm.c',
   'kvm-cpu.c',
 ))
 
-i386_softmmu_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen-emu.c'))
+i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen-emu.c'))
 
-i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
+i386_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
 
 i386_system_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
 
-i386_system_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
+i386_system_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
-- 
2.41.0


