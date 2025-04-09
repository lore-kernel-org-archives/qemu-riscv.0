Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA8BC369A5
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 02:52:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2LXh-0000t7-SJ; Tue, 08 Apr 2025 22:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXg-0000s5-Bo
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:51:56 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXe-00019S-Hl
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:51:56 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22401f4d35aso71642055ad.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 19:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744167113; x=1744771913; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=34lLEwB0Gg3cwH10oPYf9tvhYdTQGgJnGI9qEibZYP8=;
 b=h5dXJeE8JN+k1C4AU4i2Wc9u+Ke2t5BWUKvsXgXXCSIfhjvpKnihS7sZx6F2YzFQcy
 KwM9Nd/I/RUwSTFSElU9lYeI4bm82yPkLX9vqmFdmWHcCN/jMVS/K0pO403/c4wC1ZaH
 FWZFpLVNLlDGFgGe2vQCrWwD6J16GbmUaUK39si3uADdtRVJgOBTR+6QNvPieYJbeeFh
 L/NvA9gLQ1jBW1IsxhhWEys8hNOyyMrVnENZk8UEGUk3y7es5ha1V0bXOhBJG/Ze5iQN
 De67tfcMocv3mFz389sh/zbMV2KV3eTnJCKFCg9jOxritceqlRMo0aBUARKeE01+GlWU
 0yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744167113; x=1744771913;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=34lLEwB0Gg3cwH10oPYf9tvhYdTQGgJnGI9qEibZYP8=;
 b=sp8rk/zBQRKjS5yy+CIqPVNBuqHVfLGwhdxQ1KGlKENd1oTxyH+NQkcsAFb4uB8R/t
 TbiPZAmBTv+bu1PcwGOVk5eR5JhWtVSp5/Zg7b1lBQFk0L5+90VCUs3BQd9K62S7dj6R
 qfxjVtdUO3YUibkpLAI+VswqUozMycGA7fB5NmkIDoD1brNvVKHx2yGp80HJz01bf+Hv
 0WIX8qA17MEw1RiLmUXCP6sLlizhh/NYcOkuRUyWazzubxIm0BUnXPkvN7JOS0Flq5Mi
 R/UQkoyq8kwi4Wrhc/B3yF7aYsak34Q7djjegr7jpD9+yS34Wy5/NwPxdh0KRVN6Yywj
 tCow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYY5BFlIh1gDcyUxFApUDOR8R1ddrUoHq9+XdCiMBR+30ociBsta+Io56N+mnCT4Y76OQ+pC6xypEt@nongnu.org
X-Gm-Message-State: AOJu0Yw55YaShOUSfu3IJWV0BKDrNSIIB1B4oHtgZ/EzzHB/7br21sdF
 10p6iPJeT59iggRT2br/eVwzkr32MnZYaFnfUCokLBVrzaP4ccBSpO7dFaZ9GPE=
X-Gm-Gg: ASbGncsCwj4Gy6jXooiX7M/GCcnXQoU2WzX193Mjgd/fnWIx7SfuBLl2hJCkIxaJ/Z5
 i9t301LgMFn9JMHrxV/O3iG4oQa4+GiRXuqKdJbWSBGhBiJgA8/QHWOpUkakGKLUcvCSatf05xg
 zV4Y/x9NpKlewfKm+V8kKSqJArkex8UFGODEdIpJrAMUJpfCEdyo5hfnCymHg5IKU5+a0nvRa3L
 6XWfbit8c7R6kXK44VDd1c3RQJf0KK0ZjRirbeD8YdFXrO6Bf0ZvvqhaPvHr1jGMyx1NeZQM7Z4
 B69N3ccWowc07SAxvaOIvzThQ0L1HOb7pkgW79sgg3c/k72TJij8theVzrE+qtWbCRmdTFgk0V0
 Hjw==
X-Google-Smtp-Source: AGHT+IHuZxg1XkNr9HdgCzep2yi5FoOs4gQYQjdn86csPg0WTyyAoPp3Pa3tlKPVjO2/r354THkDLQ==
X-Received: by 2002:a17:902:f9c3:b0:224:78e:4ebe with SMTP id
 d9443c01a7336-22ac2a1df74mr12899575ad.33.1744167113040; 
 Tue, 08 Apr 2025 19:51:53 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cb5463sm665725ad.195.2025.04.08.19.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 19:51:52 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 2/4] hw/intc: riscv_aclint: Fix mtime write for sstc
 extension
Date: Wed,  9 Apr 2025 10:51:29 +0800
Message-Id: <20250409025131.3670-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250409025131.3670-1-jim.shu@sifive.com>
References: <20250409025131.3670-1-jim.shu@sifive.com>
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
---
 hw/intc/riscv_aclint.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index db374a7c2d..5f4a17e177 100644
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


