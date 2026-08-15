Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E3DC5DF67
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 20:40:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvL8e-00089w-Jy; Sat, 15 Aug 2026 16:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-000886-Sz
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:55 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8T-0008Fk-12
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-384930ca5e2so2384299a91.3
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826264; x=1787431064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xpi+58NLvsNGE5roXXmz2yeQ2sLTmSOVbtvh5q+nBos=;
 b=jgoCNRYvKoHMjLVl8EppgSe84GSLFa/GaWoqDpsZwZClgDBCPZ8BeUANhq6wJkUyo1
 qJ/7B9pJgUKOI0fzIlCYCaLJST85qbtE+Arf8MA1hzQmW3XPWu7+vFkMBkVwaxWkmX6D
 qg8Zvu+PvjC0NNkAowvl5PwVDNMrLXVpZu8U8Mav1PiU804MHxcE1Vq5JmVEBqg3a9hw
 g1IBJzwv1YHXjjRRWL7pjKRmNqNpEnByY/Y8swNwL2l21gyd61StJcF2E2aGvyCQ8Rjn
 Y9JG0aZS0lNNue4yssU2ghgir0TpZ3wb8EZ2V08RKiRFxaQGeVMN0ytefb/GEZH67Ea+
 Wlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826264; x=1787431064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xpi+58NLvsNGE5roXXmz2yeQ2sLTmSOVbtvh5q+nBos=;
 b=CUPx4xpL2Af0S9nGxO3l+Wm9ixY7RAsg7/+GKRsGGC92IfTly4xL5Qfs70WJ+vxHLW
 Q/BcPEgG0pZ0JmhoCL5T5R/sgBuvLx270cIwzHn4laVZ92McqH9o9yeFkGY1rly+BYum
 /k/hnWwlAohjyJxK7rcwdjDA/D3nGOGUSkt5wF/SFS62pqUHAPUNIq+5DWZmTuBT/soM
 1xFnLMEnCGnC/uBqKqA1wkTKK+0jHhSZ6KNc06iC/xt3GGTjhoHPAq6aV5TZv1oUWbKB
 IEKFQwvd7a1qkaR+3v4nhoAftP59cdJnOhb+Fe+6aZ8YRM0Ib0n+R1qoo/jiXXbdWyWj
 Uwzg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqS3sKhWeDZWdZ3TWiYwYaKAKRQ2i8a0hhAUIF2w+VKQYv46hCo9hKgoHWMlvzI9u2TQKw8YqVNB8oJ@nongnu.org
X-Gm-Message-State: AOJu0YzRJQ6UbCCRaeQHvjwEYW7ysSrOwAvQ+En9+w7WUPm7rmNlm/Dj
 WIC1rWuczZIUkbG3OHqFliG5HOHrrWaML1OX4gkE8vr8lVsu0xO7V3XWevn+v0LAaJA=
X-Gm-Gg: AR+sD115o1MqXSd0diTT8opoUshs0YPDbHDPBbhbLWfMNFeasYArR5NGfGAHMBiiLz5
 f0Ei+TJEq7+NyyxVgQHCaSf1toIVRkrdM/JBAfIysc1aro0IHRZg3igEM6DO4tiHOQM/4uqgs4J
 fI0jTSd8eJgrI8F48m7R92jCF5YNgOFUDhFsKw66L07KIcX7P4s725Hc4dvQzsDk3QMiP+qjpm7
 XA34xJLToPNyzX4fzBWd5QiuMKQ61hxVVMflQxiGsCimhi98P1o0hFlLs0nlceb/fnSVUGqVbHk
 ZBRgf1jZLZWP0EKFsBbpnTnc2o5njdtakLTIqPLQZqqqoLjLMGNr4ZjpyEKy5BCBKvjDrvaSkCF
 TgSrZQ2Th1Cu7m7L0IHCd7phY6OW1ZILNLdFGU0FexjJVU9Sxsu61w2R4ZYYQbzC0YwXIYdKy7X
 a9zQrGVj8nMxKpB4bxcgydwTCcYCUsZvzxfmGUcXqIm0lgTD00GPbwDdeyRbOdd1VkPDUZlbJSj
 HlaxIQHlV8h6j7e3MC4
X-Received: by 2002:a17:90b:53cf:b0:381:1c96:829b with SMTP id
 98e67ed59e1d1-3933bd204d0mr16889988a91.3.1786826263584; 
 Sat, 15 Aug 2026 13:37:43 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 06/18] accel/tcg: Drop fault_size from user-only
 probe_access_internal
Date: Sat, 15 Aug 2026 13:37:18 -0700
Message-ID: <20260815203730.1468365-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

This argument is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a35aca7889..3724e5d98e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -749,7 +749,7 @@ int page_unprotect(CPUState *cpu, tb_page_addr_t address, uintptr_t pc)
 }
 
 static int probe_access_internal(CPUArchState *env, vaddr addr,
-                                 int fault_size, MMUAccessType access_type,
+                                 MMUAccessType access_type,
                                  bool nonfault, uintptr_t ra)
 {
     int acc_flag;
@@ -797,7 +797,7 @@ int probe_access_flags(CPUArchState *env, vaddr addr, int size,
     int flags;
 
     g_assert(-(addr | TARGET_PAGE_MASK) >= size);
-    flags = probe_access_internal(env, addr, size, access_type, nonfault, ra);
+    flags = probe_access_internal(env, addr, access_type, nonfault, ra);
     *phost = (flags & TLB_INVALID_MASK) ? NULL : g2h_vaddr(env_cpu(env), addr);
     return flags;
 }
@@ -808,7 +808,7 @@ void *probe_access(CPUArchState *env, vaddr addr, int size,
     int flags;
 
     g_assert(-(addr | TARGET_PAGE_MASK) >= size);
-    flags = probe_access_internal(env, addr, size, access_type, false, ra);
+    flags = probe_access_internal(env, addr, access_type, false, ra);
     g_assert((flags & ~TLB_FORCE_SLOW) == 0);
 
     return size ? g2h_vaddr(env_cpu(env), addr) : NULL;
@@ -825,7 +825,7 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, vaddr addr,
 {
     int flags;
 
-    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, false, 0);
+    flags = probe_access_internal(env, addr, MMU_INST_FETCH, false, 0);
     g_assert(flags == 0);
 
     *hostp = g2h_untagged_vaddr(addr);
-- 
2.43.0


