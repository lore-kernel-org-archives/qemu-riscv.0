Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678B8C4167D
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:29:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0LAQ-0007vG-Jl; Tue, 07 Nov 2023 07:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9g-0006H2-EQ
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:09 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9Q-00058w-TA
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:01 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5437269a661so13019347a12.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 04:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359945; x=1699964745; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWjAMfnV0kRvK1CF0UWrM+tNZeOmTMW+hMb8e74FNo4=;
 b=eqhVJ7QuIvRb24GOGl+EQ+FTM9OPsBLY1YX8cGVCFtxsmHl1M9a8vkkNqHAv/4UcGV
 P59d7lK8IfXfxZkgdIJwkmfq+V4SxFdkRZ0O1xOZlUOPK3zvSup4I7XRPopEq7uH0BhF
 Z36mo0SLrsDJVpI4t+z8ly0zDZx6KBzbd5njFPLzVFNFVeNuHzjNR7BORETtp5qBLjsX
 OfSsRglpidGONn28eVgLEeihWQLFcTT67MeZ7z7F8UvNbe4wYj+z6nyRF0NLKEm4W01R
 7lcuPfB9LGmFpKtesZcV54xe5CswzTMKI/oRWZJbcwdlvhBVU//h8V5+fqoFiq8L2uyj
 jBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359945; x=1699964745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWjAMfnV0kRvK1CF0UWrM+tNZeOmTMW+hMb8e74FNo4=;
 b=sFmPHCaAxxv2K5Hpr8xB5LW0MMTH1p/7DDjXg5vi5fYZ7LyGES6e98LUY+ggQG7yhd
 VafZGX1CQ/Yy4APtmQyz1uSBfteueRutYuMG9yOi+qJWA+DoYe+M419h3JslYvP3jJEm
 OU3jzTVg6tmTF6jxyRVlb1FDL553WhgcM/K2ARPX1UOKOjAMjUJDi3OXB9YOv2c/+4uZ
 G9d184SweCHxckj1RS2+sbK1pKh3L8UKRfl6dVqvaoLmFpl53KToJ5/LvmZKWePkLbJF
 dNU9v3faDHzhlnyqzuGEP0nzZynd7FrV2kUXgc9CBMUmHyzET9LJEJlVWQikWzV7JRJS
 Kekg==
X-Gm-Message-State: AOJu0YzE54oTGdPm84jwNLp/9jHQzUoAuqMC5nzyUAfeyrnchtuVuBoq
 Uolz0cXJKXq5YzLsVujMcJJkCQ==
X-Google-Smtp-Source: AGHT+IGZJdask+fi03EA8Mp4RnGJsuJPZ2tfZ6T/ZCgR3M1/MRVims0ImI0ewYQuiDr0hvwHAB2CYA==
X-Received: by 2002:a17:907:26c4:b0:9dd:ebab:2bc5 with SMTP id
 bp4-20020a17090726c400b009ddebab2bc5mr2059350ejc.7.1699359944935; 
 Tue, 07 Nov 2023 04:25:44 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b009c3f8f46c22sm986892eji.77.2023.11.07.04.25.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 45/75] target/s390x/cpu: Restrict CPUS390XState declaration to
 'cpu.h'
Date: Tue,  7 Nov 2023 13:24:35 +0100
Message-ID: <20231107122442.58674-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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

"target/s390x/cpu-qom.h" has to be target-agnostic. However, it
currently declares CPUS390XState, which is target-specific.
Move that declaration to "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231106114500.5269-5-philmd@linaro.org>
---
 target/s390x/cpu-qom.h | 2 --
 target/s390x/cpu.h     | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index fcd70daddf..ccf126b7a9 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -33,8 +33,6 @@ OBJECT_DECLARE_CPU_TYPE(S390CPU, S390CPUClass, S390_CPU)
 typedef struct S390CPUModel S390CPUModel;
 typedef struct S390CPUDef S390CPUDef;
 
-typedef struct CPUArchState CPUS390XState;
-
 typedef enum cpu_reset_type {
     S390_CPU_RESET_NORMAL,
     S390_CPU_RESET_INITIAL,
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 110902fa3c..942589c597 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -55,7 +55,7 @@ typedef struct PSW {
     uint64_t addr;
 } PSW;
 
-struct CPUArchState {
+typedef struct CPUArchState {
     uint64_t regs[16];     /* GP registers */
     /*
      * The floating point registers are part of the vector registers.
@@ -157,7 +157,7 @@ struct CPUArchState {
     /* currently processed sigp order */
     uint8_t sigp_order;
 
-};
+} CPUS390XState;
 
 static inline uint64_t *get_freg(CPUS390XState *cs, int nr)
 {
-- 
2.41.0


