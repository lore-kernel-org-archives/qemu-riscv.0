Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994FAC83F12
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 12:22:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaxjQ-00088d-Po; Tue, 29 Aug 2023 08:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qaxjP-00087o-G9
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 08:22:03 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qaxjK-0001ND-PQ
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 08:22:03 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-57325fcd970so2721164eaf.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 05:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693311717; x=1693916517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9cL0Fun4ilnv0euhMcCCgO4wnOC+ky4KYEKADy08jIg=;
 b=lY9vc/9d0lRIMoLhsvz9XCrjqBobkK9DCuvMd1vRWKuKbVJFn2Ec8fXuupQ66RXJr0
 htPA+nqwoN9/7sjiqoZmQEz5WquiRvHhntAD8dkJBlhFKlhxa93XeEQN87WBadvgVUEH
 uroKVPYqkvMYR4ggQkKeZ+oIFb/hdvcSbdq0U8M5p4L7xyqVp6pYZ0esNlJJZJ8/Dr5l
 Sd8aBxyhKDfkJA7W+EaFQeXJMOriZ3alFxGcuXvlcCqM+n+zzEKpi0ieR56OM6EjzjhL
 I/FNqMOMGDx9P48/7oVe02Xwmkw8jXDhB4uQbnT3YdnXCEZ8G4n9kj/r/LDQZPYMlnDz
 4UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693311717; x=1693916517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9cL0Fun4ilnv0euhMcCCgO4wnOC+ky4KYEKADy08jIg=;
 b=DtpESVGHVJ7CNSmFsbE3w/8w03K2aLRBwEwvC+iDFixVY2TgnOLb9rYSQLoKaPyi3y
 5zcCr1mAS/mj4zgnKbEDzEKjooGkrbdq/hx0XMK/V74bY9H4gge70qynKrxyt1RXYqdV
 XYgJGTYNT8WUXwg0Zrxrurr0Nk6Y0Q3yl5gn5V3dHMqVIQ5DDlvzC72UCgpCmwQ4+ydW
 MM7DmnRGIpII/9yaDDhrbRCGn8bL0LGbJwrmkG9H+JJB2ePw/VRc5U6QGvtDtYHuxRyT
 ElmQ9Jia2/PNRne1gA9Q/hyh3GfHo0XgjXgi16234DZ4YosFhG3LP31JPZuyl9DStO/F
 loBQ==
X-Gm-Message-State: AOJu0YyqG0yCOEU0bpOQwHdYhwvosDdFtGFTyfTyrTpsqz6ID3qWjzfB
 rknZuQSiHm6GS2laN6fMHRDgzQ==
X-Google-Smtp-Source: AGHT+IH3s8xvMLbnhqPDlOGGLf0ATYLpvAzR/3GjtXkuicLLMqPX53/SbYf+W+h3olCpqyZZ2/WAtQ==
X-Received: by 2002:a4a:3457:0:b0:56c:7428:4a35 with SMTP id
 n23-20020a4a3457000000b0056c74284a35mr16001727oof.7.1693311717441; 
 Tue, 29 Aug 2023 05:21:57 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a4a97c7000000b00573320e1241sm5079327ooi.14.2023.08.29.05.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 05:21:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/2] hw/riscv/virt.c: fix non-KVM --enable-debug build
Date: Tue, 29 Aug 2023 09:21:44 -0300
Message-ID: <20230829122144.464489-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829122144.464489-1-dbarboza@ventanamicro.com>
References: <20230829122144.464489-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
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

A build with --enable-debug and without KVM will fail as follows:

/usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_riscv_virt.c.o: in function `virt_machine_init':
./qemu/build/../hw/riscv/virt.c:1465: undefined reference to `kvm_riscv_aia_create'

This happens because the code block with "if virt_use_kvm_aia(s)" isn't
being ignored by the debug build, resulting in an undefined reference to
a KVM only function.

Add a stub for kvm_riscv_aia_create() in kvm_riscv.h when CONFIG_KVM is
false. Adding it as an inline instead of using kvm-stubs.c will make it
easier in the future to remember to add stubs for kvm functions that are
used in multiple accelerator code.

Fixes: dbdb99948e ("target/riscv: select KVM AIA in riscv virt machine")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm_riscv.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index 7d4b7c60e2..01be45cc69 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -22,9 +22,19 @@
 void kvm_riscv_init_user_properties(Object *cpu_obj);
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
+
+#ifdef CONFIG_KVM
 void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
                           uint64_t aia_irq_num, uint64_t aia_msi_num,
                           uint64_t aplic_base, uint64_t imsic_base,
                           uint64_t guest_num);
+#else
+static inline void kvm_riscv_aia_create(MachineState *machine,
+                                uint64_t group_shift, uint64_t aia_irq_num,
+                                uint64_t aia_msi_num, uint64_t aplic_base,
+                                uint64_t imsic_base, uint64_t guest_num) {
+    g_assert_not_reached();
+}
+#endif
 
 #endif
-- 
2.41.0


