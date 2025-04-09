Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39F8C36010
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 02:52:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2LXe-0000rN-KB; Tue, 08 Apr 2025 22:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXc-0000r4-9c
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:51:52 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXa-00018o-Qz
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:51:52 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-227aaa82fafso54092145ad.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 19:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744167109; x=1744771909; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yRx0l1L38CJZ6hR/oSAgykoMwro5gt/zxtwEU7Os2aE=;
 b=I/D9wGjoNTiNDMuPs9O6u1ckbWqgcE4O2avgub1AHetu0dQ2uhSlYHzhOPFkW2u+Yo
 5OQkvddmX31bue0PBnRDU9khoNKl8t+PJVM5JEY4vse4ckxayhmtTqCRgiH1m4kRMp4J
 XVgh8HxZ27TQM/pTXlK95xCx/t9aHBaNFJRJyAJ/5y7a3A8FXhNrKMu1Gq4+4oKLQpeU
 Lo7E4ZhdlBDDDUsgmoiNOuacfmnIOHQesA4difBCJf7k5HyIY1jq1uk2Owu+6a5wnuEb
 xC9guOC1L1yyPiRvLlv6l7C7U9CBXAN0kfcY0SorgzjhGpO9LoGg07bAtpbjOVrkkgvu
 2ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744167109; x=1744771909;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yRx0l1L38CJZ6hR/oSAgykoMwro5gt/zxtwEU7Os2aE=;
 b=fXuYNfxZvDqcp1ihyKvZVuRY0bSw6IjU3yIBPUJPklul4lAxU7RvttGMt3CgUOedHG
 d9behJQlQ2VuuYq3LQSbeMTv3D/Iz7HvNApAaFQ0MC5aMAoQ5c8huwAeMw0SCYCneztU
 v945K0vDT3jHpiPgpJYzGCxxH5tyDxrs5ILTcsBq8f6kZb2/sVjVQEasOS7nkaUgnwRa
 y/6Kyvx/R3HPz3whc0ePEttBQHyRsPkVImtIzRvRgGA70eJvu/0bdPbuX1J54ZM65D3A
 5nroP/lRKDiwI5jeOyMs7i/EOTksCUPawUXf2ApEQehrt0sg/pIXN2hcLpIac4Otctj+
 yenQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV99h+ArWayn9fFHEqG22j8tvjXHRfK/U81XZgYwXf4TBE7qqgxhYbgO5rjR4iACK4E8+ibUTSCSMKP@nongnu.org
X-Gm-Message-State: AOJu0YwV6xO1xiWq4fcQF55EXS/zEMpcIaQTS/FmDiFrE+G3sDJeld7h
 ROZQpnn1CyhYf6oPW1UNtAvut1Wa6d0aUim74XIYS6HKrp/BlfPmRUAg9l5a44uP4Ro5M4bzqgm
 S
X-Gm-Gg: ASbGncum1v4X+JlVipGsh4XtwFBg93sFCqisSiqutyiHWm4DcBNdt1YHe2ozPThYn0V
 9gH8IvXqQ5l//kmf0ucqSQK4OUtU6Br1+/LFEnL2NsTW3WRcgSJjND+eybYqcYLMisIw/LggzwE
 oR5mqECdcYU7r2pzHW8e65TUihiGex4fpOTwJg7nfvld877Vz/BmmobWmTszdTg6hxr0RnbF155
 IDXyYQUjWzGSm7yuCAhYIb1C4wA8JUgoTrBqiSLnQaTBzEe4XJc++h8rwjsqqOyO+CqpI4EPsj/
 UiWOXJVAAxbjtNeMielYiUKpGaMdzxpEEHqsGAm4ef8UQ29bzkJmOf/t9Yv8mWdJfy8=
X-Google-Smtp-Source: AGHT+IGRUXOuHV5k9iXh7SQCDO8A9xOvUc5azGqlveS/QbakTaTBbUMMC+pp/tmf3CftcI1EnyaiQw==
X-Received: by 2002:a17:902:ccc8:b0:227:e7c7:d451 with SMTP id
 d9443c01a7336-22ac3f9a8fcmr17212835ad.29.1744167109526; 
 Tue, 08 Apr 2025 19:51:49 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cb5463sm665725ad.195.2025.04.08.19.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 19:51:49 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 1/4] target/riscv: Add the checking into stimecmp write
 function.
Date: Wed,  9 Apr 2025 10:51:28 +0800
Message-Id: <20250409025131.3670-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250409025131.3670-1-jim.shu@sifive.com>
References: <20250409025131.3670-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x634.google.com
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
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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


