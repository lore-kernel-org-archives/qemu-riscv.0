Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C540C0219E
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:19:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thc7F-0001lA-9o; Mon, 10 Feb 2025 17:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc73-0001fT-9s
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:18:49 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc6x-0002mJ-Aa
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:18:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38dd14c99d3so2443928f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225918; x=1739830718; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urCafULq2XMolqgFjY2xq4efBzngODSAdng6Y+2R71g=;
 b=zQDQn8B4rZXT3536POHYvFQXSrZm0rJr/dMXR8DdA4OkoBZP3iThrsu7A97tiIfd/W
 mekNl0WOtmJGAyn1ihUWX1ztxHF7zBVpkyfmNwf+Zy55qgpZP4DsBO/iIcYQBXCGXhCj
 iSk6hKlh5DRQfUBrT/lWSze8A4+PFCQtqpjlEevkkBavOdOkps4rWHhi4z1DSSZld9CB
 MBqLbW9eOtgxhM5WDtECgVNf0v+hCeeKXbcdoQJ1w0Rgd/FNOh7RtDtGT31Zs7EC7zoz
 Y4/woJjj50voH/V0RD5AK5gx5zB7oA9qjVDo9MvjYCYx0C8rrc9uh0cXsSA9k8Qrbhz6
 iSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225918; x=1739830718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urCafULq2XMolqgFjY2xq4efBzngODSAdng6Y+2R71g=;
 b=EMG6tmXM0rtgbeaf6CVmccYWDBQKBlS3kxFZ3sohsoPukBPcyN/uRiKKDlkvThH2e9
 qF3n9bMsDIEviWzTuk76FiBv+hAJs3PVj8FHcElAYzN+GwVk2NbVNIqDUvBn1iFMLQO2
 n1HyLZEhQ/VFKTbcoKTuCVIcAhjPtDIlp/OrBenG+Rlkxw6Md8l4fHLgpDVP+Hjc3JjI
 sj391Ffsvi8jeh5imm56ll3/aVjCvgAL4Evf1nAq1NhMp6Y1xStABOIXEOJqFNlue5Zt
 4vyWPHY/FXs4aedGO2JBovxcQRaEG7c7LQOe/Hp5SFx105gFa/A7pUVwSZK7g9vhmdG8
 7dlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj00X2hbx2hp4/QkAQNJrc70IX+u8AvNYz5TZE56ezLAI+1ipTK41O+vVxkKXkMcgbbbj5Q7Hf/SrS@nongnu.org
X-Gm-Message-State: AOJu0Yw5cMH6hEfSyVHGjtnTuf6P5rlS3SYLC02REgEUSzLG7jbVcVVX
 5Bz2yZLRoSU9W0loEMXE/pAdGGlNcs0L3ZR5CPB/FYvEHGACAwJJ65W8bO7Y0wA=
X-Gm-Gg: ASbGncvRYuOzhXa8+UQPQpivRJHmvEzS5+r1OmSUFRQXpUpCGEdYatBwt0JNuVaohcl
 Vgacq5CWp1rQ4mpziZxClzKOxX2vo1GFG8M1h4a5FYuxP58x5HrfqqGglgzRac6dGEJufrSoew5
 LaujUN6yUptzKEl9PGH/llSSyRnYfnlMdSmhSluKAdrZCEaBw5CTGYaDtQowqpXGjtVnfxoJldY
 9c+/MfvVv6AQgyQNA4nwcaqyMcidtMh0UmKINFtBdg7uj8pOGr7n+i0rYUO9F9Tu+n0023Ppbuz
 Z5B3thRI+LMFOdW+Ln6IppFxEf+cnLalBDV0mboP42fpu4hbxygO66LuI7zJPIpMKg==
X-Google-Smtp-Source: AGHT+IGb6lQBkiLCOrLrA3izSw2JF0Cw5P4MdyQznW4Ss9muIgLrQALYA0thK7oD/jwIaT6Qcz0yBA==
X-Received: by 2002:a05:6000:2c2:b0:385:ee3f:5cbf with SMTP id
 ffacd0b85a97d-38dc8ddc464mr13174251f8f.20.1739225917907; 
 Mon, 10 Feb 2025 14:18:37 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc9ce31e8sm10652676f8f.5.2025.02.10.14.18.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:18:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 01/10] target: Set disassemble_info::endian value for
 little-endian targets
Date: Mon, 10 Feb 2025 23:18:21 +0100
Message-ID: <20250210221830.69129-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field for little-endian targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.c     | 1 +
 target/avr/cpu.c       | 1 +
 target/hexagon/cpu.c   | 1 +
 target/i386/cpu.c      | 1 +
 target/loongarch/cpu.c | 1 +
 target/rx/cpu.c        | 1 +
 6 files changed, 6 insertions(+)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index da21f99a6ac..acf81fda371 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -85,6 +85,7 @@ static int alpha_cpu_mmu_index(CPUState *cs, bool ifetch)
 
 static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_LITTLE;
     info->mach = bfd_mach_alpha_ev6;
     info->print_insn = print_insn_alpha;
 }
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5a0e21465e5..2871d30540a 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -102,6 +102,7 @@ static void avr_cpu_reset_hold(Object *obj, ResetType type)
 
 static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_LITTLE;
     info->mach = bfd_arch_avr;
     info->print_insn = avr_print_insn;
 }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 238e63bcea4..a9beb9a1757 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -293,6 +293,7 @@ static void hexagon_cpu_reset_hold(Object *obj, ResetType type)
 static void hexagon_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     info->print_insn = print_insn_hexagon;
+    info->endian = BFD_ENDIAN_LITTLE;
 }
 
 static void hexagon_cpu_realize(DeviceState *dev, Error **errp)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b5dd60d2812..85815c0805d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -8497,6 +8497,7 @@ static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
+    info->endian = BFD_ENDIAN_LITTLE;
     info->mach = (env->hflags & HF_CS64_MASK ? bfd_mach_x86_64
                   : env->hflags & HF_CS32_MASK ? bfd_mach_i386_i386
                   : bfd_mach_i386_i8086);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 227870e2856..cb9b9f909f3 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -617,6 +617,7 @@ static void loongarch_cpu_reset_hold(Object *obj, ResetType type)
 
 static void loongarch_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_LITTLE;
     info->print_insn = print_insn_loongarch;
 }
 
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 154906ef5f4..acd5a6e12da 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -160,6 +160,7 @@ static void rx_cpu_set_irq(void *opaque, int no, int request)
 
 static void rx_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_LITTLE;
     info->mach = bfd_mach_rx;
     info->print_insn = print_insn_rx;
 }
-- 
2.47.1


