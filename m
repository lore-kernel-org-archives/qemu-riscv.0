Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF95C35FFA
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 19:23:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuyza-0007Mi-Rc; Wed, 19 Mar 2025 15:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tuyzY-0007LR-3A
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 15:22:16 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tuyzW-0002Bg-8W
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 15:22:15 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-225b5448519so142678185ad.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Mar 2025 12:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1742412132; x=1743016932; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JQssGOpztpWWFjOnWZYSMTHISmCvQCvOgUNRyvmYuFc=;
 b=ArwVeVvFQYCFlTEHdHDucckQBFFTRjDdHXpZX47f/XGhqKFKRIHZvNXAnxJd0ycdUg
 i9x+SdgrBc/rG5k6M5IX5/diSlN3iXh9qqfw5cxwByiZ9FCgKbdtBkLqDnt4fa5UjdQQ
 DqpW7Tsyxju8cda8arNTFjCy0iPMt1ckmlqLm9bwg5gWBdjvxzW9MlDQvU7ToY5wsNGn
 5wAgvOKEekXe33YA8pmLXrEkL9oB4ILnj9IWwVkhiKuThxLgcs2bz2DO0rDgj6Pyr4Us
 4IhqKm2RhWzPqPesjB247FAfUozs8fp5R925Qc1CwmInDHhSRhraUWHupgWC2OLvXaPm
 V9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742412132; x=1743016932;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JQssGOpztpWWFjOnWZYSMTHISmCvQCvOgUNRyvmYuFc=;
 b=St6YXRQ9xFe4APc92KBzRG3v1Mce5sRfWL6JDbrBGsYnPLDzJqH/o9EVk09BPIWCS7
 liWfLKe7vsakDeXONFSxtyCCN8F7CRtB1BlcFyD/Oi7hyHiY8scXfH+wx0ELaITxHwMU
 UUTqpPuiqsJDttsk88KyuRj+42tHx9jKbL2Bh4GUH363x84XgimGRRNjpsfaJStIwmaA
 hT/71oOQHaaHVjK8g1iATPBcD1eNR4McX2Y9CDFuRezmV9D4zZv70TT5B/OahNZHaWVO
 Ajimpf3fWKMf46xzeI/MUD9rheo/X0e7M1FOdqDFH+418H2DOFwIXa5b78OOjaS3FpEg
 Qtnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqISV00AnkJ3eHSNvXII/qj+NznwPAcBSDjc/xTz6QdiIcdgcQktxc9bj1wotn16A7gMljww8OwNfH@nongnu.org
X-Gm-Message-State: AOJu0Ywgf3nwONk+0wmSKbiX9awnfH/wkxZ7j+HfOPc+gmAtqEbMbqzl
 LKGwmzMMvy9mT04w2eiwGrdtIA3OpxxU4ZW2ic2AesWIMDT8pf2MyKxaqxXlbeI=
X-Gm-Gg: ASbGncuuqRozRHn6KdRW3BDeBq8uajbEiRardLmKDylmyhPsBkOuGz8HwLDQh63XlgF
 evk0+GMdzM1Mg69lzOzkE8z45FtqMwpkN32NWDQi6sJO86hFQJHJ/9UHW/GMXHNU1Q4VaqhycE8
 9d2y+ll1cdymo9QJ/IJMn7RLZibxq12pvKEtbuF12moLclB9YXYdtzLVsshdVRIimZc61ZDcHGC
 K33AJ1enzMolVWo960s3eg4R1bVt52RDMFiijg15+QXs6qKGuRiHuw/Pm+jrGTFhxBHBqODzUGn
 d4NxBonCrWHhE4+9WUdBVUGZWKMCykJ3NUKzydIAoAx9OiEYgfJeDCzhzCB+GVe3Nag=
X-Google-Smtp-Source: AGHT+IFOBEEk6Zvcy0YZNa94DqJbNRt8nM7g2pXo7E0hp0OY+ylUnVnSde/3M7z7paZURqHpnqVpBQ==
X-Received: by 2002:a05:6a21:48c:b0:1f5:7eb5:72dc with SMTP id
 adf61e73a8af0-1fbeb1854b1mr6743816637.3.1742412132248; 
 Wed, 19 Mar 2025 12:22:12 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea947a4sm11432175a12.70.2025.03.19.12.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 12:22:11 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 1/4] target/riscv: Add the checking into stimecmp write
 function.
Date: Thu, 20 Mar 2025 03:21:50 +0800
Message-Id: <20250319192153.28549-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250319192153.28549-1-jim.shu@sifive.com>
References: <20250319192153.28549-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62d.google.com
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

Preparation commit to let aclint timer to use stimecmp write function.
Aclint timer doesn't call sstc() predicate so we need to check inside
the stimecmp write function.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/time_helper.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index bc0d9a0c4c..aebf0798d0 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -46,8 +46,23 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
 {
     uint64_t diff, ns_diff, next;
     RISCVAclintMTimerState *mtimer = env->rdtime_fn_arg;
-    uint32_t timebase_freq = mtimer->timebase_freq;
-    uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
+    uint32_t timebase_freq;
+    uint64_t rtc_r;
+
+    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn ||
+        !env->rdtime_fn_arg || !get_field(env->menvcfg, MENVCFG_STCE)) {
+        /* S/VS Timer IRQ depends on sstc extension, rdtime_fn(), and STCE. */
+        return;
+    }
+
+    if (timer_irq == MIP_VSTIP &&
+        (!riscv_has_ext(env, RVH) || !get_field(env->henvcfg, HENVCFG_STCE))) {
+        /* VS Timer IRQ also depends on RVH and henvcfg.STCE. */
+        return;
+    }
+
+    timebase_freq = mtimer->timebase_freq;
+    rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
 
     if (timecmp <= rtc_r) {
         /*
-- 
2.17.1


