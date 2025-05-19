Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E347C2D0CD
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 May 2025 14:36:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uH1b7-0001t9-LP; Mon, 19 May 2025 10:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1as-0001rp-Oi
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:35:56 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1af-0007QQ-HV
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:35:47 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso4272538b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 19 May 2025 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1747665339; x=1748270139; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dIa7DDRQ8dI1YRPtN6aWOvu+ANiSnYEGc52FeaM93zI=;
 b=eaHYQXjXEGOKmQVGzAMJn7oIWTi/SUajmnmlgJC9YpHL++HKSiUb+83IOYYzMfMHzq
 6Czp6CefLEvlEUE5E7ZZkHl+/ViqTlO+IiBLsOnQfgXSHzb1zd7I//vMpi73j7ibZur2
 aMNOoP92Ebwyxbv8cuLkEtIPcllvLLzgqoL97gtnPjmifB/TjbGSs3daxN4eXxMNXG8H
 0Tn8gV0dtNxEdU8GaIfqy92vPD40snHiNkjE1Ykf0y0UL6WZagB5jwSfYZjaS5LjJ2Y9
 2Q8q7tMhJf0Jz9rvMaUQ4jeCC+P/kKYtfRDxz82XkpYhpyqdu9IZ9k9NUlfbPD/C+nLP
 10mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747665339; x=1748270139;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dIa7DDRQ8dI1YRPtN6aWOvu+ANiSnYEGc52FeaM93zI=;
 b=QvNlZCf5CcjkR/sfur98YLeftSgGEY7dfuNq4XcaNo6agD0PSbqC0XRp/Ptfn7uFTC
 ltYfSeWTXwId53jGixajZaRn1oW53GYa0kLlzYIXvuIefvjnSGVwUEftiuA7GAUntuf8
 xwT2V9STnQRUMWF1Yyocwo8omTst+r7ZBSPHQPs2t6bqzp4Iy/UzsCK5LfEH7wBw9f4Z
 FxToLEWca27dCte36G4YGKPSLEHvuCQQIw3D2t9kPU/41qq3vq45eWGSffTal2utt9Ap
 nk/yFKVIQrZ1mxZNTvPc2K1McQMH4A8NPbElRmBrGzZUQ1GzKJdOZKEH+40URsaLSzkY
 L2oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS4t/ifgrBmaFjjSgfpztiyU4KYD80XlJ6zxS6duZxFZqM1ACKMKDfI6tezLrJNt4vM8UWoBxxrM+e@nongnu.org
X-Gm-Message-State: AOJu0Yw8kNX/MqFXJ84Ka0BklaAdN7Rm5VqKz7j8LMKOzoh1IeApRwZ9
 2StufS1n0S1cEq9vzvpJIcRKJAy0WKjK7WPycTytbfNWRpI7CGOiA5aO1DQnjsfSOts=
X-Gm-Gg: ASbGncs870+rZjvz9j+aRuqsw5B4BG4ofXWyQwOXcQWyMMJVrZ/Acqcka1ZCC/fM2gm
 hF/q4kkYSeWO6qdw3qVz9VaHtQ4BCdO+lCCWj/TjZe2IBI4b1YzWA1m0eBBkbbCvZpZn1Jc65E/
 TBdcVlg6JVpIbgfhu5/j+VCFgLWSPWaS8tm9eRNm6EWb2CTDFNcRiEHZ1K6w29vY6Xg5HsRVMTo
 JO85koM+wRkJ/YeZ8L13EXucR4m030Z8wHQWyvOuL21lq/nqWdbRUyMkTiAMMQMRbVHAcH3k/XD
 XjhioMs0Yhohi7EsVXfve6viVsxchI3ujPQjUZUoeOGmzxVnDB/wGn6fvNqyifZ8LSs6wNLBgg=
 =
X-Google-Smtp-Source: AGHT+IE3UuhHn0UNehAuLAdg2lfUfsCG18va4AcXSjBAO/RC8mIkrPOkBoE6ZUDYZkYRAGWtOkhYgg==
X-Received: by 2002:a05:6a00:1d23:b0:742:ccf9:317a with SMTP id
 d2e1a72fcca58-742ccf932d4mr6842489b3a.12.1747665339435; 
 Mon, 19 May 2025 07:35:39 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a98a32edsm6297683b3a.162.2025.05.19.07.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:35:38 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 2/4] hw/intc: riscv_aclint: Fix mtime write for sstc
 extension
Date: Mon, 19 May 2025 22:35:16 +0800
Message-Id: <20250519143518.11086-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519143518.11086-1-jim.shu@sifive.com>
References: <20250519143518.11086-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42d.google.com
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

When changing the mtime value, the period of [s|vs]timecmp timers
should also be updated, similar to the period of mtimecmp timer.

The period of the stimecmp timer is the time until the next S-mode
timer IRQ. The value is calculated as "stimecmp - time". [1]
It is equal to "stimecmp - mtime" since the time CSR is a read-only
shadow of the memory-mapped mtime register.
Thus, changing mtime value will update the period of stimecmp timer.

Similarly, the period of vstimecmp timer is calculated as "vstimecmp -
(mtime + htimedelta)" [2], so changing mtime value will update the
period of vstimecmp timer.

[1] RISC-V Priv spec ch 9.1.1. Supervisor Timer (stimecmp) Register
A supervisor timer interrupt becomes pending, as reflected in the STIP
bit in the mip and sip registers whenever time contains a value
greater than or equal to stimecmp.
[2] RISC-V Priv spec ch19.2.1. Virtual Supervisor Timer (vstimecmp) Register
A virtual supervisor timer interrupt becomes pending, as reflected in
the VSTIP bit in the hip register, whenever (time + htimedelta),
truncated to 64 bits, contains a value greater than or equal to
vstimecmp

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index b0139f03f5..4623cfa029 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
+#include "target/riscv/time_helper.h"
 #include "hw/qdev-properties.h"
 #include "hw/intc/riscv_aclint.h"
 #include "qemu/timer.h"
@@ -240,6 +241,10 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
                                               mtimer->hartid_base + i,
                                               mtimer->timecmp[i]);
+            riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_STIP);
+            riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
+                                      env->htimedelta, MIP_VSTIP);
+
         }
         return;
     }
-- 
2.17.1


