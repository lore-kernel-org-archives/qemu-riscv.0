Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479A4C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:19:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxRq-0003CR-34; Mon, 06 Nov 2023 06:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxRN-00023b-VM
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:06:46 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxRC-0004Un-Ny
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:06:43 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso626068466b.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268793; x=1699873593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkEvU4QtX35g0CiL+rllnKg5EMCBRsMDB6Gavwvy6mM=;
 b=A9kaRdSVWACV2BDy9cn5ts5ZnHoyOYqGTrqjjb+bpMygOwIuRvzGVPTjDvTDu8BdKm
 kwAY7XGhONdSMhXzgE9FjHqzIJrXnjzVPFgJL02zlExtwH49zsTaUFajrMTKIzGKyuSW
 y1SjYAo2mfqHNVQgs8sKITDVutEsE2oytycRdFUQtPohdk7YkKwpnLEjFpTJJpAoqa3x
 oWYvoc6RGQXzEtUiyWG7cqMc3HT2o5g+xARzuHROxamJsIJi8uG5rl3AL7U851xzvqwQ
 uoYtVpCvmRTGeAbJaIsocxWaqyHF7/VQTCBTdLd8klTIlpsFlAV8a7pCUrT0UMZ44GsN
 Yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268793; x=1699873593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QkEvU4QtX35g0CiL+rllnKg5EMCBRsMDB6Gavwvy6mM=;
 b=S38spY3sxDm5hhpRLAWCAx6eIwoVZJ9U53WIqX2y5RR81JMPma9opDPVIUfFa6/7yn
 pgcnhrc0d3DWL4pAqFhS45QawAb7mbBSFmTDTc8D1R/q6lKoZso5dZobdUbkl1crjkVj
 8ijv16w51HLwFfhvm0tDad8JVtsTsX9p26BLjzT2uXvymKRd5UnwpmM/u4+E48U+1ioy
 nQT8QNx6Z4ym0nEPz5rYreJHPwUbXlMO61rGlA/fTyUIv5vduTfyZZuAQ+5I1p4VlKgn
 FeWT1ETBbIdJQ2rw0V7nb8bbpxX4Q/O1Bwe3GdawmDHUeW789b2UL84wrelR+2WgXwXH
 FcoQ==
X-Gm-Message-State: AOJu0Ywl487G4KPWYzD/Ub6YRIRnKRvOxshL/KHJ8STBZdG4D8yhcouV
 SmqwJizczoa+33gxvNq5jn3O2A==
X-Google-Smtp-Source: AGHT+IFMgW1bfJ6Ek6vHroNC5F5c731oGSUYMxBHstbBSE+tYzXzXN3ikXIqjnIkkxPWlLbFWPB2pQ==
X-Received: by 2002:a17:907:2ce2:b0:9be:36c2:162 with SMTP id
 hz2-20020a1709072ce200b009be36c20162mr13367612ejc.31.1699268793032; 
 Mon, 06 Nov 2023 03:06:33 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 iv12-20020a05600c548c00b0040641a9d49bsm11948176wmb.17.2023.11.06.03.06.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:06:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PULL 25/60] target/i386/hvf: Use CPUState typedef
Date: Mon,  6 Nov 2023 12:02:57 +0100
Message-ID: <20231106110336.358-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

Follow C style guidelines and use CPUState forward
declaration from "qemu/typedefs.h".

No functional changes.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20231020111136.44401-2-philmd@linaro.org>
---
 target/i386/hvf/x86_emu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index b1f8a685d1..cd7ef30126 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -45,7 +45,7 @@
 #include "vmcs.h"
 #include "vmx.h"
 
-void hvf_handle_io(struct CPUState *cpu, uint16_t port, void *data,
+void hvf_handle_io(CPUState *cpu, uint16_t port, void *data,
                    int direction, int size, uint32_t count);
 
 #define EXEC_2OP_FLAGS_CMD(env, decode, cmd, FLAGS_FUNC, save_res) \
@@ -1417,7 +1417,7 @@ static void init_cmd_handler()
     }
 }
 
-void load_regs(struct CPUState *cpu)
+void load_regs(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
@@ -1440,7 +1440,7 @@ void load_regs(struct CPUState *cpu)
     env->eip = rreg(cpu->accel->fd, HV_X86_RIP);
 }
 
-void store_regs(struct CPUState *cpu)
+void store_regs(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
-- 
2.41.0


