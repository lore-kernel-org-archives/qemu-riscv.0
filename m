Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4CBC4345F
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:31:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rxXSO-00084i-Uh; Thu, 18 Apr 2024 15:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXP0-00089R-U2
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:37 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXOy-0007VG-1m
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:34 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-516d6c1e238so1535617e87.2
 for <qemu-riscv@nongnu.org>; Thu, 18 Apr 2024 12:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713468390; x=1714073190; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3p8Qs3F8jC3emGpbq1YTEbHVimCbjmiYVCccpiO4GlE=;
 b=l6XJj1qe8VBY4jrF6BnIYaBg1AZu9OvyIfJD48OAGLmANCcO1rhrkC05Q9IQo78mPl
 XE1ZA0h1h+zQXBqauPdX0ackVXtdbEoJ7/18OrxCKs44Q+dKCgDdkVsLuY0+CL5DZBZF
 finkyr1zD+WmcefH3/KSWPryCHp1BiBiFXDUpaajv7jVj0l0ToFtwNJHUs8uLmAcqOT9
 Ibn6KrhTSzJhoet94eUFR6kTCLJGGQX3nCURcUBLRE0v56p+Ha8F1qJXsSK8bVxo0Z+T
 NxFSlbtbNsZJVgsYAHHHOFYg+MeQjqNkz/KVA06nINvI1tIJ37DE3SClCbRS8yZZVC6P
 vShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713468390; x=1714073190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3p8Qs3F8jC3emGpbq1YTEbHVimCbjmiYVCccpiO4GlE=;
 b=GneEkYr1Kiu6Bn7Dt+QSNQ5kcO7Ecqz2FZnJF/EpCZ0j3V9eUwmeawrfA5o4qeJ0nc
 KUlhuYpU1qIYXM9Y4AXXZtrcr4kZoaVnDctUD/rX8B5NXqXnMSGjTLxc2BYWcAoeToCS
 5surtqNPzdhZVDQcUsNKLJd8JEK7pUATLNvwL+alJv31krssmS92LOicaZYTuiQB5HAA
 0dsTD0rB5rb3Q7AYu8W96Q2GHKY+2jdI8pJRE/A+U22WvDOVocu6AU894QBaVUhlDYkY
 DTLt+YOKJQAZa27jYNohcRrvHhzyTqMBVQkbLmZVZIXE/3kTTDEc+S0dHb8kNL2H5fCz
 zWYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhewnA0Bb/yRX6H5sY0L0MD03/IK2kBsvhw4lFwre5Zk91m3zf1wPMPamBRYa5jq9Y1UsvPsW+EvFLfKejcaOJDK4NHx4=
X-Gm-Message-State: AOJu0Yzz0DwC6o5mxabQWhtow23zGd9RI763D0QV0KaMaFv4JM9HE34C
 triRCzFngyNp1oUsn96l8+S/Vt8QdNGBRP5gIphpBb/O5XZ6/SOT+QmHEnkQmxU=
X-Google-Smtp-Source: AGHT+IGc0qRkEMLMTGegLV4EypFFITOzOda0O4GHRkc0UB5yO1McHeMMwCZLkgpZNT6hPX4mXdod/A==
X-Received: by 2002:a05:6512:34c3:b0:51a:affe:2526 with SMTP id
 w3-20020a05651234c300b0051aaffe2526mr460238lfr.62.1713468390092; 
 Thu, 18 Apr 2024 12:26:30 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.151.213])
 by smtp.gmail.com with ESMTPSA id
 es13-20020a056402380d00b0056c249798absm1211244edb.71.2024.04.18.12.26.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Apr 2024 12:26:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/24] exec: Reduce tlb_set_dirty() declaration scope
Date: Thu, 18 Apr 2024 21:25:09 +0200
Message-ID: <20240418192525.97451-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
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

tlb_set_dirty() is only used in accel/tcg/cputlb.c,
where it is defined. Declare it statically, removing
the stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/exec-all.h | 1 -
 accel/stubs/tcg-stub.c  | 4 ----
 accel/tcg/cputlb.c      | 2 +-
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e4cff08db4..778c82ba8e 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -641,7 +641,6 @@ static inline void mmap_unlock(void) {}
 #define WITH_MMAP_LOCK_GUARD()
 
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
-void tlb_set_dirty(CPUState *cpu, vaddr addr);
 void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
 
 #endif
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 8a496a2a6f..dd890d6cf6 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -18,10 +18,6 @@ void tb_flush(CPUState *cpu)
 {
 }
 
-void tlb_set_dirty(CPUState *cpu, vaddr vaddr)
-{
-}
-
 int probe_access_flags(CPUArchState *env, vaddr addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 93b1ca810b..e16d02a62c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1039,7 +1039,7 @@ static inline void tlb_set_dirty1_locked(CPUTLBEntry *tlb_entry,
 
 /* update the TLB corresponding to virtual page vaddr
    so that it is no longer dirty */
-void tlb_set_dirty(CPUState *cpu, vaddr addr)
+static void tlb_set_dirty(CPUState *cpu, vaddr addr)
 {
     int mmu_idx;
 
-- 
2.41.0


