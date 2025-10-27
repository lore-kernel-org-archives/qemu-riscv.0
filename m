Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE33BCCF9EA
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:11:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL20-00014D-SZ; Mon, 27 Oct 2025 07:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1g-0000lK-MJ
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:38 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1O-0005hA-R6
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:35 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b5e19810703so701467766b.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563039; x=1762167839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GGDtkgFr/GHLtEa0jhJz7Y8ig7qb2phfciaJVqoCnCs=;
 b=hnKY54IH9fXypyNJXpQ9FpSySGdP9h7lEeAPh3pC5vJHTrbI3EnVs5IhzLccDkhs15
 mE8vnD1wgK1fdbBSewbzDKfVkQ+NzA+9sj35Tf48I9e4McjGWvhkxa4SJgFq57tQZGAL
 nTxXRk4DN9mg025DBYI35/48yP7PiklW99oMIe8/Lz8pV5r0/w2EhVEWfZKk5TXPSNOv
 yRSa57w/CePdayDHVMkK4DNLLB/RWwnqVAxYV8+W1CfLZhub4sO3WtQfTEt0SRdhLtBS
 WzGw15OHVWfptb3sDgkDSDbpDgyI2gYpGTV8uBfI9MYeXw2cxf12XI6VgEFjnOk34Tka
 cMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563039; x=1762167839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGDtkgFr/GHLtEa0jhJz7Y8ig7qb2phfciaJVqoCnCs=;
 b=Tt2JPg2RRNEQQsm5su7ZhS3SjdTSF375Mgnf9uS97CH6EXI34xDo2HZI06SR4iUFac
 cNRzUN4qPQorX203g//cET8jHUsDcRL2B6lz0W/H+y2K3gSH60ADqECpM2y7H0FSWmTe
 BVLKQkNK+UKu+U85PwU0IJXX3E4U31BESuohpSexf/aaTEyePwApiG0KYysR6RouTrUb
 NYS+ib5xbcEgj5YkaGboLkCi2xgWGYERxdTZMKPFYQT/MUgYGNtXAZmy8ukZ25vD092G
 KwsgcTxLJ4FNFAhqaMkY75SWu4Aus3JDnll6HpLi4i1LRBhrMDGNmZ0aSHNzZ+20ow8B
 TZDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHICoNeNnH+jwuShhNNB45llmnJNkjkOxEcyzSNSb+WNOPx59TaI0iiFHShmRPn56yDElKyariFUZz@nongnu.org
X-Gm-Message-State: AOJu0Yzt6kAZrOZ2lhMGaQ/QBH5tJasxIiVzAijrUciBb/xjKVAEP/c0
 qNB6XPw8aOgJSlo6jCkGKde3UaMZpyX2Ppcv2yJPDM5vutlw2CRyPmPYo5GlGbJb7E8=
X-Gm-Gg: ASbGncsA+aRxiTItCd2RMTvCox4d/MHNd7Ri+ik/4mtQAu8dDtgy9O+XYAfTxkwvZc9
 iJ3IZrGOZNhNVqk31ASWeAGqLsroJmpp04Lh/bSBOophyYA2g40wEGNRpPNGXhfuHIQffLw+N72
 CuHUdgrYANINl7SZBePpCmmL3aWBcBPs85rGzRVvOjdAb97AFXhD67OrDGnL+6mYV4xqIVAmqIc
 p+44KnrndodpJEWL3WEBOYk+OmjojxjnfVRUbu5VE5J/Op4guJaRlf48HI8h7T+JF0UczYaJZT5
 KfGV/R/eXuhff4ImmZOCUGecx0N/H+fIhSkrii1nDi5Ue+CKNYk5nPYJTahEbdD6PQ0rwDeB08m
 i2NK+/Ct5pnGyHBRGOL+5QpfL7EdJxeJuAkOUEZivIsZfuV+8uPiy7vkIbm1A9fi8Eq0HsAYfbH
 DIsUZe0X4Ct5s=
X-Google-Smtp-Source: AGHT+IGQty3nqHvOvQICE9Rlly5V3h17LXnXWbLrIdqb1N8ODcrMwUJQb0dJNUF1TXud8Qjaz914fQ==
X-Received: by 2002:a17:907:c11:b0:b46:897b:d759 with SMTP id
 a640c23a62f3a-b647443b9c2mr4453853166b.40.1761563038954; 
 Mon, 27 Oct 2025 04:03:58 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8548ed8fsm735153366b.73.2025.10.27.04.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:53 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8E0B860B4E;
 Mon, 27 Oct 2025 11:03:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 16/35] target/loongarch: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:23 +0000
Message-ID: <20251027110344.2289945-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for loongarch targets. This architecture
has one special "exception" for interrupts and no host calls.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/loongarch/tcg/tcg_cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/loongarch/tcg/tcg_cpu.c b/target/loongarch/tcg/tcg_cpu.c
index 82b54e6dc3c..9d077c56d9d 100644
--- a/target/loongarch/tcg/tcg_cpu.c
+++ b/target/loongarch/tcg/tcg_cpu.c
@@ -8,6 +8,7 @@
 #include "qemu/accel.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
+#include "qemu/plugin.h"
 #include "accel/accel-cpu-target.h"
 #include "accel/tcg/cpu-ldst.h"
 #include "accel/tcg/cpu-ops.h"
@@ -80,6 +81,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     int cause = -1;
     bool tlbfill = FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR);
     uint32_t vec_size = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, VS);
+    uint64_t last_pc = env->pc;
 
     if (cs->exception_index != EXCCODE_INT) {
         qemu_log_mask(CPU_LOG_INT,
@@ -190,6 +192,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
                       __func__, env->pc, env->CSR_ERA,
                       cause, env->CSR_BADV, env->CSR_DERA, vector,
                       env->CSR_ECFG, env->CSR_ESTAT);
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
     } else {
         if (tlbfill) {
             set_pc(env, env->CSR_TLBRENTRY);
@@ -208,6 +211,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
                       tlbfill ? env->CSR_TLBRBADV : env->CSR_BADV,
                       env->CSR_BADI, env->gpr[11], cs->cpu_index,
                       env->CSR_ASID);
+        qemu_plugin_vcpu_exception_cb(cs, last_pc);
     }
     cs->exception_index = -1;
 }
-- 
2.47.3


