Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52764C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:04:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxPF-0006aI-Jk; Mon, 06 Nov 2023 06:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxPD-0006N0-8G
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:31 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxP5-0003lo-8s
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40850b244beso33437505e9.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268660; x=1699873460; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBU4Pso0gSsGUJn6Y+tUxfBbchAwyEFBu11FifHIio4=;
 b=Z8lKU3NJxTdKZ97dZh4jm5cl3iptXXrfEQq5bveHNK1z7hyV+t8aIUkPg5Rj41AfZU
 zTSwHWjrJDnAhfhCm45HyKVLLU2VM1//YbFunZyw5PLCxjruO9ZaLAxTNc8szuKheh9w
 YuNlwcPjfyP5vjyZWC5QSwQ3WHh2XodaiYLI8DENc/3PVstRfc6A0mVez8ar6mqoXQKY
 xCdJ41dHgWkSofHqomJ34PdhUfJ5rsTpMz68RNw2JbSuuCKw9KqsY8JYBXW4C0LfBDdm
 pyIvdxdgNts8nWZI7MAsS/KJCNdXM4ophvBrhllPFmDRnVqcNuvTk85sRph0K22k01oa
 aq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268660; x=1699873460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vBU4Pso0gSsGUJn6Y+tUxfBbchAwyEFBu11FifHIio4=;
 b=qYRZOfb9P8MDtknKyuKpxNxpnhce1AoZjYvRll4EvSr5QMRBYRnrTlZ3XPbMmtRK2e
 21cII9ydPJ3oWt/eJDN/Rh19u1/zdmJfPP494nleV41MhflG/5wiUGhABjsitNcq88VW
 nN7rdfiuLsUwROB2uNNnmrVoLGpC8FOyRclsBBbOL+QC2J3irLCze0fA/P0sujzqMeyw
 yvJ2F2VuBbggBuIr3n0lP9Y4td7aGZU0SL+24Zo6FdjHZ7BzFo7rS6sufeBSK+kWYiul
 rNBJ6lBmnEoZJDnK2HR1IO+23R513QABxlFeGgSvpcBoR7fzfylMnETvLPJBp7lEs0x3
 Ek1A==
X-Gm-Message-State: AOJu0YxXYEemGp8L8PRi0AymUDvNRr5GSra9qr7ge5cfdleVlu/Bx6kf
 bWtZ309yzd6QrW5BDlMx43XKDA==
X-Google-Smtp-Source: AGHT+IFNaWNTXm6/JgnRLDfhCwlt529RJlrSNb5hfX6nFr1uBzGpsDlgEDrmBYL8mOG8EZ2XGLOTgg==
X-Received: by 2002:a05:600c:1906:b0:408:3b8d:f7e8 with SMTP id
 j6-20020a05600c190600b004083b8df7e8mr24996294wmq.33.1699268660546; 
 Mon, 06 Nov 2023 03:04:20 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003fee8793911sm12010027wmq.44.2023.11.06.03.04.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:04:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 06/60] accel: Introduce cpu_exec_reset_hold()
Date: Mon,  6 Nov 2023 12:02:38 +0100
Message-ID: <20231106110336.358-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Introduce cpu_exec_reset_hold() which call an accelerator
specific AccelOpsClass::cpu_reset_hold() handler.

Define a stub on TCG user emulation, because CPU reset is
irrelevant there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230918104153.24433-3-philmd@linaro.org>
---
 include/hw/core/cpu.h      | 1 +
 include/sysemu/accel-ops.h | 1 +
 accel/tcg/user-exec-stub.c | 4 ++++
 hw/core/cpu-common.c       | 1 +
 system/cpus.c              | 7 +++++++
 5 files changed, 14 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 18593db5b2..6373aa4501 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1153,6 +1153,7 @@ void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_initfn(CPUState *cpu);
 void cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
+void cpu_exec_reset_hold(CPUState *cpu);
 
 /**
  * target_words_bigendian:
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 3c1fab4b1e..ef91fc28bb 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -30,6 +30,7 @@ struct AccelOpsClass {
     void (*ops_init)(AccelOpsClass *ops);
 
     bool (*cpus_are_resettable)(void);
+    void (*cpu_reset_hold)(CPUState *cpu);
 
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
diff --git a/accel/tcg/user-exec-stub.c b/accel/tcg/user-exec-stub.c
index 2dc6fd9c4e..4fbe2dbdc8 100644
--- a/accel/tcg/user-exec-stub.c
+++ b/accel/tcg/user-exec-stub.c
@@ -14,6 +14,10 @@ void qemu_init_vcpu(CPUState *cpu)
 {
 }
 
+void cpu_exec_reset_hold(CPUState *cpu)
+{
+}
+
 /* User mode emulation does not support record/replay yet.  */
 
 bool replay_exception(void)
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 29c917c5dc..7d266c36ac 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -137,6 +137,7 @@ static void cpu_common_reset_hold(Object *obj)
     cpu->crash_occurred = false;
     cpu->cflags_next_tb = -1;
 
+    cpu_exec_reset_hold(cpu);
     if (tcg_enabled()) {
         tcg_flush_jmp_cache(cpu);
         tcg_flush_softmmu_tlb(cpu);
diff --git a/system/cpus.c b/system/cpus.c
index 0848e0dbdb..952f15868c 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -201,6 +201,13 @@ bool cpus_are_resettable(void)
     return true;
 }
 
+void cpu_exec_reset_hold(CPUState *cpu)
+{
+    if (cpus_accel->cpu_reset_hold) {
+        cpus_accel->cpu_reset_hold(cpu);
+    }
+}
+
 int64_t cpus_get_virtual_clock(void)
 {
     /*
-- 
2.41.0


