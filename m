Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBC9C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:46:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEbn-0004gI-5W; Sun, 05 Jul 2026 00:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbk-0004fA-JB
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:32 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbh-0003x4-Fi
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:32 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cacb8416a1so13306165ad.1
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226248; x=1783831048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9ndt7/Xaf78gbnm5ds/w+OXU431kvwyAI4qL6QO88k=;
 b=wsMY2mNOYuPLulFUuO3Dlh4yKKS/tdt504sZLYOaeLl9TIu890GAthrvxB+JN7gyOj
 t1chpfmlpiwmXxQZtLy9u0tcZMlDd+jYQRLED8aXyC50pG1llinxt5HO1DNuYydzX8LS
 s97AuG9ngyltdyMpcjOoxPozEeRAhf6u7u4if6VKOGHJuU6AeL8pYwc+Y6mTGATMnZ5V
 c4SE95KaoscSwnIVwNYTr856W5Fns8TkCn+u72jWVT7E16yfIsrY5FC5ftO4unCFVC+1
 i66qsNwDHlIbDJKeI7RRNlIPabXYZzoxNVmKtwsLr3Hiibp/pfR0KlCQFQ7lwCE95r4Q
 Eagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226248; x=1783831048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E9ndt7/Xaf78gbnm5ds/w+OXU431kvwyAI4qL6QO88k=;
 b=cxET1Eb29EBggvQZ1jJS36FFiLfek5b0TqHtFv5JTSyRDj82kMs1TOl3sa9h4jjmNE
 2TMX51KQxbD5PwKmACFJ1Zlo/QSI11647EiqDr/2ILElKyMHmhucaZZLLktnOcDhLefW
 CTj7IZJ/TDb6XYQJls+0lzhEHr3g9Wr8KHkLB98E0SHB2Y4xAR0ClIw1kBCs9aaWUkwe
 CY3Lo/VKH4k/ojQE/NJHUf+PWbwjRVJeTZeYYE6eFn7ifVbl2HE+CCEui9N9stzOIpUe
 KYS20qSGdWs3G8rCBO3C/IfT8xTHIGtRI4OZCXtOxFyLCIdgDebOqng9ggeIdeuWkCzc
 T2nw==
X-Forwarded-Encrypted: i=1;
 AHgh+RojhNmyrTS7TfKIkX4vcINPd326BjMjuGbHR0fG9taRLT5OGGr764xUrglpApynErvz/DnPj6btFQzj@nongnu.org
X-Gm-Message-State: AOJu0YyjOqVOkvp7W3BAC0xkqL/26PLnkbIF2f68Gl88tQJW2SghQ4TQ
 ap/nT9g851agzZ/cYPeFnhNqOk5Bjoh0PtaQZ11EoKrQm4BuVPw2/dKMrRfJdoqu/gqc8Id2T+O
 bOwkN
X-Gm-Gg: AfdE7cnPm5ncsnG/zumL3CabyW91IPf/QS3AquL0IJW2Wj7uMhLcvHSZkgFbJbhuUmb
 JTHJU0xPaM3Qf6X1tzf5N86RjCbrszGVlPNg+EWY6zKQm7wQZRAcnSLStGA+UegsqRcsrEiO7Qr
 AVp7cN8L89sK6aVi7u7TW2EN2TQNm9tkgSh2RhHtGSqAyLM9emIlPGrGpSoSJg1IHTyWDARva+B
 QaFiLL3o0DKA7tDSnpMNfUTIF8x0Z700SMsa3dSPgnKcVeWfhmkVTQS2cfNpXGUd9MTbl9G0mxH
 PohCtDpk3HNPTH/QiX32fHW8Z0Z+QaStq2AamZAFosfkqaNthoODuDAwKcgUpGu95ix3MbHtsb0
 sjgCwOxfaXbeB+Qre4dUp1+rrNcTF14LLCj6w7zuRGS+//HqcxRTwoJZdak3YckWtZZXzYgIz8T
 Jx4q/0oBYoi0UQP7wO31x2lzzvQRZO+A1PAKfvXBjwkOBSFbCy6OD1kpY40w==
X-Received: by 2002:a17:902:db0b:b0:2ca:6514:9201 with SMTP id
 d9443c01a7336-2cbb9e2441amr46886065ad.15.1783226247981; 
 Sat, 04 Jul 2026 21:37:27 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 01/46] cpu: Move BREAKPOINT definitions to
 'exec/breakpoint.h'
Date: Sat,  4 Jul 2026 21:36:40 -0700
Message-ID: <20260705043725.1373137-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

From: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20260630220100.1289-18-philmd@oss.qualcomm.com>
---
 include/exec/breakpoint.h | 14 ++++++++++++++
 include/hw/core/cpu.h     | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 95f0482e6d..cc6fedd09f 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -12,6 +12,20 @@
 #include "exec/vaddr.h"
 #include "exec/memattrs.h"
 
+/* Breakpoint/watchpoint flags */
+#define BP_MEM_READ           0x01
+#define BP_MEM_WRITE          0x02
+#define BP_MEM_ACCESS         (BP_MEM_READ | BP_MEM_WRITE)
+#define BP_STOP_BEFORE_ACCESS 0x04
+/* 0x08 currently unused */
+#define BP_GDB                0x10
+#define BP_CPU                0x20
+#define BP_ANY                (BP_GDB | BP_CPU)
+#define BP_HIT_SHIFT          6
+#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
+
 typedef struct CPUBreakpoint {
     vaddr pc;
     int flags; /* BP_* */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 59d601465b..c3959607df 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1138,20 +1138,6 @@ void qemu_init_vcpu(CPUState *cpu);
  */
 void cpu_single_step(CPUState *cpu, int enabled);
 
-/* Breakpoint/watchpoint flags */
-#define BP_MEM_READ           0x01
-#define BP_MEM_WRITE          0x02
-#define BP_MEM_ACCESS         (BP_MEM_READ | BP_MEM_WRITE)
-#define BP_STOP_BEFORE_ACCESS 0x04
-/* 0x08 currently unused */
-#define BP_GDB                0x10
-#define BP_CPU                0x20
-#define BP_ANY                (BP_GDB | BP_CPU)
-#define BP_HIT_SHIFT          6
-#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
-#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
-#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
-
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint);
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags);
-- 
2.43.0


