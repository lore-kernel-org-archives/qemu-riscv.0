Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5C5C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:33:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFDt-0004Me-TC; Tue, 21 Jan 2025 09:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBq-00021B-4B
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:17 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBo-0003VE-8z
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:13 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so5012012f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469510; x=1738074310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GkHLGnbNtUXznuzSD8HY730UHLCtgMSWFluNpwmKQeM=;
 b=Y55VdusCRh6NRwkgQrV9LWzBaxaMP9zNebptp8syRImpceW2JUrAbDmlBfxFdrx7In
 gixa++qGF/ruAYBXJvfXwMBG1D+FtP0Un8Lp9/RfyxapDotSi5Fu3O+E9ieLqfEeFWuf
 4p9gIE45BH8wjKtJT7HnKoeVX9ZACOAwkEourgakv3i+1295KY7BWtK2JyNr5yFnR2CI
 9FBJtN/OeYOZL/FDTDKLa0Zcrfsl5oOoel0q42lRsYk19fuCj8DHbYnz7v8dVsfsJOHI
 5IXO4z8bcUEF8R7SVUJOGNlB42r/zgkXDgYYB/61ADFZ8cWFTphQHmZyHvlVgyOZNztf
 Ii3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469510; x=1738074310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GkHLGnbNtUXznuzSD8HY730UHLCtgMSWFluNpwmKQeM=;
 b=ox8agY96ouY0a3k4s4pEJUXcozTUmQUpStAF8r4N6XRQgaeWNxE3DJnjlHTmvIBCrh
 wuzI9x6Yd5DC5wDoo0ctnJaiDBxRqZpJnUtv3u9X07rbW4Aeu5XwdqcIPKWL9lSo9057
 JhBoB7xIgO0lbC2epsOLCth6y2r8BX2QTFlYRggqG3V/WbfpZEhv036V3O4J0zoRZz5h
 ByW55QwnmtQaKtgMY7iczFBB8aDVjYz8zo31CVdXxRXMPTzStiGYcGmZTrXUtp8oSxxe
 XFMMxDWhCyc3+wfKfdqkvKHe1Q6dQVO+fPR526XRSk5P5577shChFXXE2io+o7/L9tlh
 noJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvmp7+e5KRYjAvdjYb0pucLBOH4YO1aI7a4j7eLEwLbxuN5/HRefKX42f2vMpOQX3K0eWjMXvh7Jzc@nongnu.org
X-Gm-Message-State: AOJu0Yw8HkJLWSGOS+ACMoTuWzcbzC6QC6cfCJU2szPSrHBgsGFdFnM8
 4t5QjAd9CMwokk8o5B18gmuxYu4D7II+aykcgTKQcKYzKZhl0ACD0bXQbXbpr+k=
X-Gm-Gg: ASbGncugYLJB5f9yKFwrWP7RPl55kfwuCIbDVWa1xP4Ro9QTWioR/29dOJ1FuymjzeD
 iHWBagpEP8bd6EKpkRDEV10ti1zJamiRekMdCFRID31dxBGFZOYz3cGoN5KYZVpnjvdR6pnsCe7
 mu2Dz7qDmldLOvoVoz57O5FpzEyZfygRz4MdJYfbOb006v8mFNCEy/+WAb4l6ejEAFHCD110/ck
 D6O5eGjmhOAzPbeFBMwy+fULpm61opELrIgIdio+udpyOGd4iFi6WIa/sla6JzfZG1eKRpq040Y
 I9siAfptHlZMgKxJ+pybRsDhL6uFOyOgwvR6BzcUAU0O
X-Google-Smtp-Source: AGHT+IGvEab1ClV7h5y897LB6+BdG5W4Px4cgpiqOAOhbSj4iHnOZ9w31FgAecyvJTeS+fdrHtBNiA==
X-Received: by 2002:a5d:47c9:0:b0:385:fb56:5596 with SMTP id
 ffacd0b85a97d-38bf5663956mr12725335f8f.19.1737469509642; 
 Tue, 21 Jan 2025 06:25:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3278088sm13563656f8f.73.2025.01.21.06.25.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/28] target/openrisc: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:31 +0100
Message-ID: <20250121142341.17001-19-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/openrisc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index b7bab0d7abf..5d80c4aa9ac 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -63,11 +63,13 @@ static void openrisc_restore_state_to_opc(CPUState *cs,
     }
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
                                     CPU_INTERRUPT_TIMER);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int openrisc_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -228,6 +230,7 @@ static void openrisc_any_initfn(Object *obj)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps openrisc_sysemu_ops = {
+    .has_work = openrisc_cpu_has_work,
     .get_phys_page_debug = openrisc_cpu_get_phys_page_debug,
 };
 #endif
@@ -261,7 +264,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
                                        &occ->parent_phases);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
-    cc->has_work = openrisc_cpu_has_work;
     cc->mmu_index = openrisc_cpu_mmu_index;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
-- 
2.47.1


