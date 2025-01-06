Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5768BE77188
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 17:38:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tUr37-0001T4-Br; Mon, 06 Jan 2025 12:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tUr2z-0001Ro-K7
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2025 12:37:50 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tUr2y-00059q-3H
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2025 12:37:49 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ee46851b5eso17231760a91.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Jan 2025 09:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736185067; x=1736789867; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qv52jkrGDn6R8p6PaFWBL55tG/0tbBmoAShMyY3di4w=;
 b=fl2/uvQxdPyXX0OhQlKV+KdXcqmFqtfSwsEY8QWJokepD+l/tXaaXUmP8GRFreU1lQ
 pL+QGaPYhg1qM3SBQLD8ip0wgt/eQJn4LdWlIf+K4K3cv6+pDGqukcwHF2luZ0wWN+d6
 VIgOHlzzpAPZ71f10rD38TjcT6uKGHVRuniMDOudC6gworzEhfmCO65xvYuf2RlotkwV
 yTI9gQhJ04hDTqZDL8a/l6nAlFeu1kU1ioPErk2aVQvfRV06F6XBHmNs/8sRgZ5NZURp
 /+wQPLKs4r27mqyFK420tcvS/1QJaaeBQEls8evVDqx+3SNkkuOA5AAH6sU7SVXlvDvO
 j7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736185067; x=1736789867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qv52jkrGDn6R8p6PaFWBL55tG/0tbBmoAShMyY3di4w=;
 b=CL4tJneps0yo0yuEYNFBbr1fHOedUogkVdzlDGIR0wCCGARuIdgKHvIETWvbULtBOe
 ECGqFu76PWQHOgGs8oR5hYJ7TH/gR9U6VXmpkZu4gKl78ZnVQOLLX8C0+2S2bZsWNATl
 6pB/gTdltCHvOurqZA5dN/n3jPPkBh+XKVc47lKJ+HUdLRTeFJApPcIt1eQZwxUq1fgE
 GVcqOvBVYcan7v4NGksa4E3kL94wmarqf3jhw+joug7vjEUuGPeiisJ7MAlt2mIrHKF1
 dBTb7aKugh6AKN2biCZB4w2Jkc0Zeu+njfO+SHDWBGSoVxk94wxVMA1TNMPivBW21CeA
 eCGg==
X-Gm-Message-State: AOJu0YzOdLyRmz7+rduNNyrVza02lLUvVAdE37KxyOJ/WqD0BTpjL7dg
 onXei+EajBHVh7d3y3o17ibJjpbcsa5X8DeqOJo8mWk5G9IVGh4gZA3QdGFDMp0=
X-Gm-Gg: ASbGncsWywhOqku7zpY0pasQDZbZiY8aDeBoTbzP1kX+0mzSocIG6okkEPmzJMUPw56
 nbTxCghSF1I9ljEWhG4hhtyUAH6Za0XvvUro9bcuw6OMNjAIyuQu9Ja5T+lXcAKEPi5e9qjTxhe
 5WzjsbU558tuXmOUE1Pn1T0Wc4ndq3SfHiAgBOj11fUlr/7BO9Ea5iASBZoAS12QkwpG6GRCrXy
 QrUo4Ijq3YG9UiTM/TGy14k1xwzx31PVVNL3UVZcIz9wA1/48dES2LTadIywSZM2vRPi2SrHee+
 NKmjXXR2zQ==
X-Google-Smtp-Source: AGHT+IG7g2zeqhgMAS1yxD6t0p3QHrELyI8xaNuo9Ayxj0AY77oAc7tcnFm0Z2BqxdkyItd37f9gRA==
X-Received: by 2002:a17:90b:2c84:b0:2ee:f687:6ad5 with SMTP id
 98e67ed59e1d1-2f452dfd364mr83272047a91.2.1736185066867; 
 Mon, 06 Jan 2025 09:37:46 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.107.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f4478ac7dbsm34139317a91.50.2025.01.06.09.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 09:37:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/2] target/riscv: add trace in riscv_raise_exception()
Date: Mon,  6 Jan 2025 14:37:34 -0300
Message-ID: <20250106173734.412353-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106173734.412353-1-dbarboza@ventanamicro.com>
References: <20250106173734.412353-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1030.google.com
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

When using system mode we can get the CPU traps being taken via the
'riscv_trap' trace or the "-d int" qemu log. User mode does not a way of
logging/showing exceptions to users.

Add a trace in riscv_raise_exception() to allow qemu-riscv(32/64) users
to check all exceptions being thrown. This is particularly useful to
help identifying insns that are throwing SIGILLs.

As it is today we need to debug their binaries to identify where the
illegal insns are:

$ ~/work/qemu/build/qemu-riscv64 -cpu rv64 ./foo.out
Illegal instruction (core dumped)

After this change users can capture the trace and use EPC to pinpoint
the insn:

$ ~/work/qemu/build/qemu-riscv64 -cpu rv64 -trace riscv_exception ./foo.out
riscv_exception 8 (user_ecall) on epc 0x17cd2
riscv_exception 8 (user_ecall) on epc 0x17cda
riscv_exception 8 (user_ecall) on epc 0x17622
(...)
riscv_exception 2 (illegal_instruction) on epc 0x1053a
Illegal instruction (core dumped)

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c  | 6 ++++++
 target/riscv/trace-events | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 29c104bc23..29de8eb43d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
+#include "trace.h"
 
 /* Exceptions processing helpers */
 G_NORETURN void riscv_raise_exception(CPURISCVState *env,
@@ -31,6 +32,11 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
                                       uintptr_t pc)
 {
     CPUState *cs = env_cpu(env);
+
+    trace_riscv_exception(exception,
+                          riscv_cpu_get_trap_name(exception, false),
+                          env->pc);
+
     cs->exception_index = exception;
     cpu_loop_exit_restore(cs, pc);
 }
diff --git a/target/riscv/trace-events b/target/riscv/trace-events
index 49ec4d3b7d..93837f82a1 100644
--- a/target/riscv/trace-events
+++ b/target/riscv/trace-events
@@ -9,3 +9,6 @@ pmpaddr_csr_write(uint64_t mhartid, uint32_t addr_index, uint64_t val) "hart %"
 
 mseccfg_csr_read(uint64_t mhartid, uint64_t val) "hart %" PRIu64 ": read mseccfg, val: 0x%" PRIx64
 mseccfg_csr_write(uint64_t mhartid, uint64_t val) "hart %" PRIu64 ": write mseccfg, val: 0x%" PRIx64
+
+# op_helper.c
+riscv_exception(uint32_t exception, const char *desc, uint64_t epc) "%u (%s) on epc 0x%"PRIx64""
-- 
2.47.1


