Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB29AC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:09:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxRw-0003p8-Jl; Mon, 06 Nov 2023 06:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxRi-0002zh-Tw
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxRQ-0004Wx-EQ
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4094301d505so32792445e9.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268806; x=1699873606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVCnzhVZzYM83NLjfDBn8N7f5t+G1396ppAvAy7GW2E=;
 b=fvxWGOkBCuMWElPxE3gI9ceYPz6TEi31TOWPl2wVWF5UiY5aVqSpA5nCegYpyOxSe5
 XEGDuE9wlR5g/Q2fnDTXr1eNifaGfxmI44EUjfpl0CjyMlSq/P51mqb0uns3iBw1QYya
 3uDDEUPHOG5gYLr+lvjwfVlR43d+AZt2b0+eolk97cvWjePRcm72DpN8zK6EmcwpNUZF
 bPyQkr3giobvQ/8eUi7jsw9dYijWRm/gjywhIsDA8a3fvttJ2xJkz6gWVeih//wItInS
 gF1TqCOP7yEPLudBlB2w4HbN1hTwWAmxLQiJ+HCr47mLtvZl0yEZ/DpjVaMsK+F89l41
 +DxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268806; x=1699873606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVCnzhVZzYM83NLjfDBn8N7f5t+G1396ppAvAy7GW2E=;
 b=UoQbPtOkkl7T/Y88o+If5QlSFqG3ZsPIOly26CKdXxFF9c4Tc2egKWXFCGtyCrdDeJ
 cgBkXBfvjoPbduhE6bJtIRxl5av02xSGJpfz70w4VEzJf/1Q8vV+5I9hM8hYi6Jq4cBF
 +rdL0kp1Phs0guep1qJjl0bz5h79C4LZFsLpAxvLqMCMeUY386SP1gquyUfFZLqDiBDh
 GzHPzDepklrdDvLJQO7CAOMnsD04Ycb9M//bl+8/72yRV+wCZKmoxUdYa0fmjoRv5WgL
 dFZzygAD8RGG0Hr6UHPSyforfIWRR0b8YmBtSLpsePiisYKkA9ttBaUqOwQ7yROngdXh
 eccw==
X-Gm-Message-State: AOJu0YxpCGHmZR5UwiD4mhXogat6gSNIDbNUMjxI/x0TIX039OSwQ6mO
 8sSbvp4ZZcK4qYJp72Rc74aukQ==
X-Google-Smtp-Source: AGHT+IEuDTQrO8cfHoeslXtrcco5KNUpzx8izu/DwKSeIwxrOOJugEKrgSkn8Nrwlb1DSs8x9XejMQ==
X-Received: by 2002:a05:600c:1d0e:b0:402:8896:bb7b with SMTP id
 l14-20020a05600c1d0e00b004028896bb7bmr22306462wms.6.1699268806095; 
 Mon, 06 Nov 2023 03:06:46 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b004064288597bsm11904145wmq.30.2023.11.06.03.06.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:06:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PULL 27/60] target/i386/hvf: Rename 'X86CPU *x86_cpu' variable as
 'cpu'
Date: Mon,  6 Nov 2023 12:02:59 +0100
Message-ID: <20231106110336.358-28-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Follow the naming used by other files in target/i386/.

No functional changes.

Suggested-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20231020111136.44401-4-philmd@linaro.org>
---
 target/i386/hvf/x86_emu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index 5b82e84778..3a3f0a50d0 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -665,7 +665,7 @@ static void exec_lods(CPUX86State *env, struct x86_decode *decode)
 
 void simulate_rdmsr(CPUX86State *env)
 {
-    X86CPU *x86_cpu = env_archcpu(env);
+    X86CPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
     uint32_t msr = ECX(env);
     uint64_t val = 0;
@@ -675,10 +675,10 @@ void simulate_rdmsr(CPUX86State *env)
         val = rdtscp() + rvmcs(cs->accel->fd, VMCS_TSC_OFFSET);
         break;
     case MSR_IA32_APICBASE:
-        val = cpu_get_apic_base(x86_cpu->apic_state);
+        val = cpu_get_apic_base(cpu->apic_state);
         break;
     case MSR_IA32_UCODE_REV:
-        val = x86_cpu->ucode_rev;
+        val = cpu->ucode_rev;
         break;
     case MSR_EFER:
         val = rvmcs(cs->accel->fd, VMCS_GUEST_IA32_EFER);
@@ -766,7 +766,7 @@ static void exec_rdmsr(CPUX86State *env, struct x86_decode *decode)
 
 void simulate_wrmsr(CPUX86State *env)
 {
-    X86CPU *x86_cpu = env_archcpu(env);
+    X86CPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
     uint32_t msr = ECX(env);
     uint64_t data = ((uint64_t)EDX(env) << 32) | EAX(env);
@@ -775,7 +775,7 @@ void simulate_wrmsr(CPUX86State *env)
     case MSR_IA32_TSC:
         break;
     case MSR_IA32_APICBASE:
-        cpu_set_apic_base(x86_cpu->apic_state, data);
+        cpu_set_apic_base(cpu->apic_state, data);
         break;
     case MSR_FSBASE:
         wvmcs(cs->accel->fd, VMCS_GUEST_FS_BASE, data);
@@ -1419,8 +1419,8 @@ static void init_cmd_handler()
 
 void load_regs(CPUState *cs)
 {
-    X86CPU *x86_cpu = X86_CPU(cs);
-    CPUX86State *env = &x86_cpu->env;
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
 
     int i = 0;
     RRX(env, R_EAX) = rreg(cs->accel->fd, HV_X86_RAX);
@@ -1442,8 +1442,8 @@ void load_regs(CPUState *cs)
 
 void store_regs(CPUState *cs)
 {
-    X86CPU *x86_cpu = X86_CPU(cs);
-    CPUX86State *env = &x86_cpu->env;
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
 
     int i = 0;
     wreg(cs->accel->fd, HV_X86_RAX, RAX(env));
-- 
2.41.0


