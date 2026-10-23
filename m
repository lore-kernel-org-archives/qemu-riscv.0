Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A5606A321
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lnmUSGOl
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKBgn-0007oa-Dn; Fri, 23 Oct 2026 05:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshit007k@gmail.com>)
 id 1xKBgm-0007oJ-GJ
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 05:35:52 -0400
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <harshit007k@gmail.com>)
 id 1xKBgk-0007r0-TF
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 05:35:52 -0400
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-36661f953e4so1169568eec.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792748149; x=1793352949; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RmafiZvouxI8xaTDC/3w5uyTBEAScBuScIqir+IghVc=;
 b=lnmUSGOlh7O4l4VcAiZt372MoxCVH5L/N5W9uwxPgfjvApXZYdASy6c40PJ20RlFve
 DBEmocJ3/lpiZwGxhaFN1D6zK9i8ev3rKl3tK6Whhc1fSc/1g7eKkKmIFOyutdNV2LEH
 QXP7D6uSrnUYQbVWnGWwNUKtzQXVPJUuDUJ0GhgG17I08rI+cRMQe1/iZpTsn2r+Y1/+
 w8XbM1YV914f9fUhI9PpDxM40Ji887Dnjb1T+CufH3Yp4Jm9rY8GaOXpYXJ6HYj85DO7
 UcGEWxk36l7KKUK9QUlAAoJKsTXxaGRwJXCNliahYFzZhhIQLp2sDSsqhGwHhx2zXlKP
 ZQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792748149; x=1793352949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RmafiZvouxI8xaTDC/3w5uyTBEAScBuScIqir+IghVc=;
 b=rlYHM0yMvimdECM0Z907KbobtIh0Emu4Lk4YPJ083Sawm+Iu41TDAfaTVuwEKcBfky
 CneUnAk9Awu1MrjJ/pT9CQDi1V3M71Pich3Aq8JdTbgZ2tqFzisIjr30+LbZiAwnQTVi
 K5blNC2szOEKe9D3VNKStHyOQ8U85+RQTnmzX2LeEI/oxmKCnjRx5+DwkkLZAmN7fCN/
 nf2eQzsmR1qGH5UQVA2+wr54opPdjG2Y+Z98bxuE6dH/F/+R5tts9l2DUqp5JrG5El86
 o5pzDRkXgLWLVlaDNwEpDDgQMou7S/RTtthpwqlGDPx/hUoz0FBw8S54RKJZE/UrPDNk
 BQ4A==
X-Gm-Message-State: AFq9FYJiBRfsfmFqYKz2S/rWllI8o2Y2ZbPx2f5nsBk2c95/QwV2iIo4
 9TjqRPk4vHNLjrzDBHHAySQIoDzMjfJahTxNr5l/ucTHnkcTYgVvYwyiICQaZW74
X-Gm-Gg: AYBFou378IRbnpg0oHVo5Lkw+J+OorrkoT9TRPrcyIwCPOHwg3P3+G4E1ur6bk4nqfc
 n7l/WvL6X9oOEOQ00+fI8SpD4PITiJpLExCHxrGdjPNb4PsLui/CWG0Ce8beP9YZe64TzFw3+5Y
 TMRRJ6goz+Qrrf8QVWMwj5G3VYBq7/Ol3Y4xFXqfaaNEN0ZcclTHItnm8HxNuDon7F9rptAm3TU
 fdq8hlaDuD+ywVN9znz6jjykj6L41j5pI07SYlQqx4p6SCZuahx0PuKPOa/eFiIZHh8RpUO57Tv
 73vplpNIeJc5lBnORXc3kPZW78dG+W44qL3/76zF2htQy7EhFP9MDevDiHLgXZLjlZgGeECh/SD
 bZS6iBUDnbQMXkDrKRTCDABVRz5lca56OUGYVwUNQNaYZRVw0xZUXiIQSbUq0d5uh/UFmUTHE8v
 ZCDXDDfIncfUiWnSoOhCZ8e1wC6YF8bb7XbmePCAOP52qPXxL/0KNwapzK3Y3J+p7vlolfSd4dN
 nyIiFxQtJSjzrJieuRL5SKlkFduM+VoB+1aaa0Y1p6Hj+ojzBraqlS/5uGOqM/sgLWkIkJMOQRU
 o9b4vrk0z0WPRGti4g==
X-Received: by 2002:a05:693c:415b:10b0:369:d85f:ed6b with SMTP id
 5a478bee46e88-369d9865777mr2375065eec.24.1792748148545; 
 Fri, 23 Oct 2026 02:35:48 -0700 (PDT)
Received: from sys0 ([27.5.1.79]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369d9c15883sm5372905eec.3.2026.10.23.02.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 02:35:47 -0700 (PDT)
From: Harshit Mukhedkar <harshit007k@gmail.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Harshit Mukhedkar <harshit007k@gmail.com>, qemu-stable@nongnu.org
Subject: [PATCH] target/riscv: fix uninitialised upper half in
 pmu_timer_trigger_irq()
Date: Fri, 23 Oct 2026 15:05:22 +0530
Message-ID: <20261023093522.34335-1-harshit007k@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=harshit007k@gmail.com; helo=mail-dy1-x1334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pmu_timer_trigger_irq() reads the counter by passing
(target_ulong *)&curr_ctr_val to riscv_pmu_read_ctr(). On RV32 that
pointer is to a 32 bit type, so only half of the uint64_t gets written
and the rest is whatever was on the stack. The high word read from
riscv_pmu_read_ctr() is then ORed in on top of that, and the result is
compared against the software written counter to decide whether to raise
LCOFI. A stray bit in the garbage half can make that comparison wrong.

Read the low and high halves into their own target_ulong variables and
assemble the 64-bit value explicitly.

This was found while looking at #4724, whose reported mhpmcounterh
mismatch is fixed separately by 57b484e2d232.

Fixes: 74112400df65 ("target/riscv: More accurately model priv mode filtering.")
Cc: qemu-stable@nongnu.org
Signed-off-by: Harshit Mukhedkar <harshit007k@gmail.com>
---
 target/riscv/tcg/pmu.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
index 1a4658319b..0165faf06b 100644
--- a/target/riscv/tcg/pmu.c
+++ b/target/riscv/tcg/pmu.c
@@ -355,7 +355,8 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
     CPURISCVState *env = &cpu->env;
     PMUCTRState *counter;
     int64_t irq_trigger_at;
-    uint64_t curr_ctr_val, curr_ctrh_val;
+    target_ulong ctr_lo = 0, ctr_hi = 0;
+    uint64_t curr_ctr_val;
     uint64_t ctr_val;
 
     if (evt_idx != RISCV_PMU_EVENT_HW_CPU_CYCLES &&
@@ -383,12 +384,19 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
         return;
     }
 
-    riscv_pmu_read_ctr(env, (target_ulong *)&curr_ctr_val, false, ctr_idx);
-    ctr_val = counter->mhpmcounter_val;
+    /*
+     * riscv_pmu_read_ctr() stores a target_ulong, so on RV32 each call fills
+     * only 32 bits. Read each half into its own target_ulong and build the
+     * 64 bit value explicitly instead of passing a cast uint64_t pointer,
+     * which would leave the upper half uninitialised.
+     */
+    riscv_pmu_read_ctr(env, &ctr_lo, false, ctr_idx);
+    curr_ctr_val = ctr_lo;
     if (riscv_cpu_mxl(env) == MXL_RV32) {
-        riscv_pmu_read_ctr(env, (target_ulong *)&curr_ctrh_val, true, ctr_idx);
-        curr_ctr_val = curr_ctr_val | (curr_ctrh_val << 32);
+        riscv_pmu_read_ctr(env, &ctr_hi, true, ctr_idx);
+        curr_ctr_val |= (uint64_t)ctr_hi << 32;
     }
+    ctr_val = counter->mhpmcounter_val;
 
     /*
      * We can not accommodate for inhibited modes when setting up timer. Check
-- 
2.56.0


