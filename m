Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC8DC52D7C
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 19:05:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1shZXs-0003Tu-UG; Fri, 23 Aug 2024 15:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1shZXl-00032b-M0
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 15:01:54 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1shZXi-0004IF-T6
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 15:01:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-201f7fb09f6so21089905ad.2
 for <qemu-riscv@nongnu.org>; Fri, 23 Aug 2024 12:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724439709; x=1725044509;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjZJpddrUYMLka+s3BuiKelWfoIA0sOQqw+ndLoWex0=;
 b=0bXbe/2LBdJFWFPrqfLZS5aaIG/U6qsqqQoSZ1jfOJlKZWzn7Ccy51axNaJU5COpay
 QPFZ5QATn0Ujx672A28e6sqigQFxGdMmH0fzJ3ossa/8nvVcfpB/ShE7507Y25yMmMse
 onBQbdYJgf+R8uqUsT3Vom7fKQSqXd2cPX9gD0nAwZ1gN2EmoEuKPdww26LxQJAqTpFO
 2543RitDnfL0rJnwx2g4PywhHNGv5FxUB6/z8YhJXR5/2/MmIV0nLqD3OmBeceJvoHuW
 ybjtB+Nj7w5Bn/7f5VNWIuKFikqzCnU2HpI7tlpa48W+Z+TSTGzjQpq6C+482UzqTi8l
 1Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724439709; x=1725044509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NjZJpddrUYMLka+s3BuiKelWfoIA0sOQqw+ndLoWex0=;
 b=na1v9vZ0BV6T1m/S7Y7RatJWyUYCWBmye/ftMTYSHABY4tMjdAVkXyCJ9vvItjPTs3
 zhUDGoG+3W+hEI7veW9Us0RST4zCnjKyqHSZsM6HOnMvepJHaeNVfHMPwo82uKoENmrx
 UTz3iUzlIMIKyT9azfgLPRxRAAchTBypqF/vJHrHA9X82Zld4tdWd9Oz2otkbMv531TM
 JdKt5U/C4Cu0qLxlyEXVDOtzOjwi0zpLRYf8MfqUa9yR0khdgNY+xQhQmuugrUrQtynk
 A3SqKaN7iB40BAuWlr3h6Jhjs9t4AAEASsWPPHLxWF2mj4MgvC56NEID0X2g1eGcsA/u
 S4Aw==
X-Gm-Message-State: AOJu0YzDhX8VoFHS6/LzbU4TYGwJsg1HoZHa+rVvtan5OyFPLwoOvyHs
 wJeYpj0U+At/O3S9KhSqv/Q/o7QBli5ubKR3rxV2kdSWcc25XGuScy+K5k+LHYpUU3L3fX7nncL
 6
X-Google-Smtp-Source: AGHT+IEmnqrRRuWv/NERGqYzBO69Ibbq5tDkFQ0ipIEJkm4K2PhUoLDhR5ZIy2iBBeL7wrdCDOxElw==
X-Received: by 2002:a17:903:11c5:b0:201:f18e:5077 with SMTP id
 d9443c01a7336-2039e50d411mr29667755ad.49.1724439709145; 
 Fri, 23 Aug 2024 12:01:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203b0c37768sm1749885ad.230.2024.08.23.12.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 12:01:48 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 richard.henderson@linaro.org, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v8 04/17] target/riscv: additional code information for sw
 check
Date: Fri, 23 Aug 2024 12:01:26 -0700
Message-ID: <20240823190140.4156920-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240823190140.4156920-1-debug@rivosinc.com>
References: <20240823190140.4156920-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

sw check exception support was recently added. This patch further augments
sw check exception by providing support for additional code which is
provided in *tval. Adds `sw_check_code` field in cpuarchstate. Whenever
sw check exception is raised *tval gets the value deposited in
`sw_check_code`.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        | 2 ++
 target/riscv/cpu_helper.c | 2 ++
 target/riscv/csr.c        | 1 +
 3 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7be0fa30f7..11c6513a90 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -224,6 +224,8 @@ struct CPUArchState {
 
     /* elp state for zicfilp extension */
     bool      elp;
+    /* sw check code for sw check exception */
+    target_ulong sw_check_code;
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
     bool ufcfien;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 12484ca7d2..9f08a67a9e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1761,6 +1761,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 cs->watchpoint_hit = NULL;
             }
             break;
+        case RISCV_EXCP_SW_CHECK:
+            tval = env->sw_check_code;
         default:
             break;
         }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5771a14848..a5a969a377 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1179,6 +1179,7 @@ static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                          (1ULL << (RISCV_EXCP_INST_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_LOAD_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_STORE_PAGE_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_SW_CHECK)) | \
                          (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) | \
-- 
2.44.0


