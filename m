Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B851C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:46:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmP8-0002hl-Oo; Fri, 05 Jan 2024 10:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmO2-0001NR-Lj
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:45:35 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNy-0003jl-PR
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:45:30 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so383271f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469524; x=1705074324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=amIzVl4R3+PRNgzKiNHopIA/d217u9I/36YG2i2vTZM=;
 b=jo4c14uMlTmfF7eTggkWu51n178e1EZRoMEUHTEbJi2FO0JGfgbLcSV8d4fTEzouPc
 uZ75aS29g4RJRozIdJQmXqC8F5pxlC32ao+vUeZZQFmdvgVHcLAXS1dC3AMCUOduJ0ir
 Gv6cgk783qjPXF2Lrga1PYOFRfmRV2D6yOF+bw+JIitCKGkYolpU8pbN3onp4kRVHvdI
 3088w1Syvt1/9ce1RN3SbCkaJ09m8+0x2F+Kc1dgW0nV4TxFkMOOgPYfhDgZTMbIJ3b1
 gs2Bvsz22P7LnoCCG4IHrvMA4IrbxeCidQU7fKV6M8fFIJuYDj7d7/j3bILKR/QYqJ1+
 cYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469524; x=1705074324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=amIzVl4R3+PRNgzKiNHopIA/d217u9I/36YG2i2vTZM=;
 b=GA6Os+7joh3dDYUnAXjqdiibdlCOMpSSMYlrNuR5t9VVxTWtGJcYTxrjLvDLQtRmgq
 BVXxsMps57eHDWVHfQ1haqz51Lk8iiQKas5d/xFEkn+Y+4rphyaCSslej7UjrkTUykgp
 7DMmnEefUPi/NkCIQi9TH4xXs3yHoChO1Xe1YBTkh2idu0yAZ5gqLcJqrL+UUXqwErVv
 LOyhucyaQaymUhC3hvbgWXxrLToiSb/qPy1pnVquAWC39TflzMsKxYBLrgD0GLPQqFfG
 dAntMa+50n54WBJHOP2ZLb+Miu5xhNiyBRIRzODJsx/tpUbfJ4XULccVRIJ8ENc6Bw7L
 Mmaw==
X-Gm-Message-State: AOJu0Yw77BCojRXaPbw+PBl93cwEFB2DuMt5To9bx19kYZIx0Zlaq0Dj
 zXCNk9zXOtPlAuLENGLUKpBux4oPY+LmlQ==
X-Google-Smtp-Source: AGHT+IGqufJs3Mill6aJTL/2a2/pz7WmfNQLIUSgYOYhQoGFbsfG9/6rCYzCbj6/n2jSFigkySsbxg==
X-Received: by 2002:a05:600c:34c7:b0:40d:5ae4:a487 with SMTP id
 d7-20020a05600c34c700b0040d5ae4a487mr1247589wmq.25.1704469524057; 
 Fri, 05 Jan 2024 07:45:24 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 w15-20020adfe04f000000b00336471bc7ffsm1592013wrh.109.2024.01.05.07.45.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:45:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 21/71] target/xtensa: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:14 +0100
Message-ID: <20240105154307.21385-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-xtensa -cpu ?
Available CPUs:
  test_mmuhifi_c3
  sample_controller
  lx106
  dsp3400
  de233_fpu
  de212
  dc233c
  dc232b

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-xtensa -cpu ?
Available CPUs:
  dc232b
  dc233c
  de212
  de233_fpu
  dsp3400
  lx106
  sample_controller
  test_mmuhifi_c3

Signed-off-by: Gavin Shan <gshan@redhat.com>
Message-ID: <20231114235628.534334-22-gshan@redhat.com>
[PMD: Split patch in 2, only include the "Use generic cpu_list" change]
Message-ID: <51ffd060-b2f8-405c-83e1-a0663c0183f5@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/cpu.h    | 3 ---
 target/xtensa/helper.c | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index dd81729306..d9c49a35fa 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -600,8 +600,6 @@ G_NORETURN void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
                                                uintptr_t retaddr);
 
-#define cpu_list xtensa_cpu_list
-
 #define CPU_RESOLVING_TYPE TYPE_XTENSA_CPU
 
 #if TARGET_BIG_ENDIAN
@@ -626,7 +624,6 @@ void check_interrupts(CPUXtensaState *s);
 void xtensa_irq_init(CPUXtensaState *env);
 qemu_irq *xtensa_get_extints(CPUXtensaState *env);
 qemu_irq xtensa_get_runstall(CPUXtensaState *env);
-void xtensa_cpu_list(void);
 void xtensa_sync_window_from_phys(CPUXtensaState *env);
 void xtensa_sync_phys_from_window(CPUXtensaState *env);
 void xtensa_rotate_window(CPUXtensaState *env, uint32_t delta);
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index dbeb97a953..f6632df646 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -234,15 +234,6 @@ void xtensa_breakpoint_handler(CPUState *cs)
     }
 }
 
-void xtensa_cpu_list(void)
-{
-    XtensaConfigList *core = xtensa_cores;
-    qemu_printf("Available CPUs:\n");
-    for (; core; core = core->next) {
-        qemu_printf("  %s\n", core->config->name);
-    }
-}
-
 #ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
                                     vaddr addr, MMUAccessType access_type,
-- 
2.41.0


