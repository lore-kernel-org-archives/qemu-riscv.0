Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7240BC001E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 08:39:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPImw-00075h-Un; Fri, 28 Jul 2023 04:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qPIms-00074z-Ee
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 04:25:26 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qPImr-0001vO-06
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 04:25:26 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b9c5e07c1bso15126335ad.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Jul 2023 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1690532723; x=1691137523;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FUEm8usTciSKMJQUzkFqUCxcOyDB4ArOFF/qN+1sEbc=;
 b=mrudyEfc5HPPSGws6pYQXlg5XCXOXDcpQeCSGm7TWF30DR1iWF+vaG4JMPw/ipQDRt
 waVJaHpJFE1UFu8HPFMgHc9slJasNdswO1i9k+d4BsjlNRMXgJ8G+GNvCoGwpj/H6bjA
 YeyVUbESGl5LXZ/dRajnCC/XoKiG4w8wDx0ffpcxIGsUKt7X+eVY+PU2JEBaordCdbCm
 EHaIKqft8rwQk9+xMM+lqgy5AIJwO9JGoJsekVBIn4uvFYOwXhYEm21lyt5NQN1yUsxe
 M9HPAZK3Wj509Aq7+CJVlzsnGSnmU2nsvtmNz48MGsYGEJLJ0MDeMUPlSL/P+LGqJ+Ih
 /uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690532723; x=1691137523;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FUEm8usTciSKMJQUzkFqUCxcOyDB4ArOFF/qN+1sEbc=;
 b=VgFeMKQpOnjhg9kv5zRsh1C5dCeR4I6KhLYG5Xx19JAx+2ygKb5tiWCwSxnlTcpMRv
 TBUHswzmxIORsAFpiR2Pm/ibMl3wsmBY6P+0qmQxGIS1EJ3SfANqvj7x7i0DNKfr7a9A
 MYRydrKD5brs88zcWELHJoMPUKwOa2781hH4twHfStRQJMZAkEZ1aM5LFpWYZUS0Zlxp
 NRi4wDVKnSym8VAU/h5A31G2KccB+452aAbwH5r77QQXYu+JgO8nQfX7MnWYlFQG1NeR
 gb9vTYzDVReGh1qakg/zDpBttbfyU+yhWKhSaQ+gmP/0TJcTp4hvVSK/D4COv3aGf2ig
 1e3g==
X-Gm-Message-State: ABy/qLb3hX/bFGGWy1VdhwkhNAeqGGOLwCuz1I/70h9PCws3/RFeQPVp
 han9SQGhmGPDdVZSb2/1VQo7mg==
X-Google-Smtp-Source: APBJJlGm5pSZPXeaQOQ3DzRP0mAnHkxZZXdPp1pCOLaM5FbxzEd2aoDDSqTXKMHDkirFETh8T++54w==
X-Received: by 2002:a17:903:32c4:b0:1bb:1e69:28c0 with SMTP id
 i4-20020a17090332c400b001bb1e6928c0mr1234677plr.30.1690532723372; 
 Fri, 28 Jul 2023 01:25:23 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a170902e88800b001b53be3d956sm2985213plg.167.2023.07.28.01.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 01:25:23 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/2] hw/intc: Make rtc variable names consistent
Date: Fri, 28 Jul 2023 08:24:39 +0000
Message-Id: <20230728082502.26439-2-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230728082502.26439-1-jason.chien@sifive.com>
References: <20230728082502.26439-1-jason.chien@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The variables whose values are given by cpu_riscv_read_rtc() should be named
"rtc". The variables whose value are given by cpu_riscv_read_rtc_raw()
should be named "rtc_r".

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/intc/riscv_aclint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index bf77e29a70..25cf7a5d9d 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -64,13 +64,13 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
     uint64_t next;
     uint64_t diff;
 
-    uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
+    uint64_t rtc = cpu_riscv_read_rtc(mtimer);
 
     /* Compute the relative hartid w.r.t the socket */
     hartid = hartid - mtimer->hartid_base;
 
     mtimer->timecmp[hartid] = value;
-    if (mtimer->timecmp[hartid] <= rtc_r) {
+    if (mtimer->timecmp[hartid] <= rtc) {
         /*
          * If we're setting an MTIMECMP value in the "past",
          * immediately raise the timer interrupt
@@ -81,7 +81,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
 
     /* otherwise, set up the future timer interrupt */
     qemu_irq_lower(mtimer->timer_irqs[hartid]);
-    diff = mtimer->timecmp[hartid] - rtc_r;
+    diff = mtimer->timecmp[hartid] - rtc;
     /* back to ns (note args switched in muldiv64) */
     uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
 
-- 
2.17.1


