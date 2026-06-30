Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FEAC43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 02:52:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weOYc-0004HT-1y; Mon, 29 Jun 2026 22:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1weOYa-0004Gr-GJ
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 22:50:40 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1weOYZ-0002OF-1O
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 22:50:40 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-37fa53bc22dso2645056a91.3
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 19:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782787838; x=1783392638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YlDwRDlBQ/gUwrgfwu6cin/6C44gvUhKFn8kgeqaXU4=;
 b=sUEAB32VSOt84zOJfeBW1bqEenxPnwhrN29P4w9RepYuAusmm5s8H4O2F5lJacu68k
 d2hQ/bly0wi+UUFaV+nKCNDYHb3JHwWzcMP1oZ+0Vy+CEEXYUFKl8pX4ZCUKMdXQzKYz
 CSE4cOuxiy/8TOwTJ4QqD3uUaFv3UwnMkVgfScq1CyY2ZwukJjDnmKyBsYzC/4sqcKeI
 PQGbE4576JMQNfHr+rw56JbHfaiCN++X6zKH6sRzpgGx3SC711f2UkdE05F90GCmp0bk
 qkkWsB3F9z0mwJsqGVatS5sYEaVWYqHixvWrC0JabAePG2x2He0EZx6ih2IK+e+4rXWU
 SXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782787838; x=1783392638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YlDwRDlBQ/gUwrgfwu6cin/6C44gvUhKFn8kgeqaXU4=;
 b=kCThKt6LnXNnQJZyIc6HDkw4F4/Kp6GfN4sPEGIqAJ3e9+JdDokEo2aeGz6+ipfaSk
 NFS2N9a8JEb7Af6QCGpinUxg+hoBU67pBgFCSeYW5mnG+k13tHdhgxWaF5rQ85piRCUp
 /IHHEyuw3zDRhrPTLoPa3Bq5u1d6ZdTgkj102CSIcxpiV5EPlGwNi8YWM+8Y1ggrJO/V
 A/5olBFGM0kRLiBMvzIJqkbD0vmYmK3sG5ogrRDi+s/IjYfOWmJs8ZMYAc+h2ENzkTO5
 U+5WDmvLUbT8stQzuXOjyKj856DhXEtjgzTu176zw3bADwlo+KSfybkbACSWnLH54x3L
 40Rw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSfc4ruelmU3m1m6LFFNgobgw7I9CPb9Fcg9HuaOEz5p66fyUeba3FCYIxkD0xfEAgLUzNfYUak5wA@nongnu.org
X-Gm-Message-State: AOJu0YwwPNm/nKgqS1lRO8dIsek5PlzRkGTQpPHcdOybIyku1MP7WoRu
 jYkK4ysPxG+j3dKbtFmp2TNmuS4btfUhuKcqzfOVprTRLYqrL7DEr2GO
X-Gm-Gg: AfdE7cltV4/g3pOVSGWgzDumt04r4phU4AZ4Q5ZwaSLpbj0KGXrxQZjCfLRcrfSiarK
 OABuam/FYykVh9w2wY9ENoaTG+0bZqTjNh66pTRNfnR7Qx37Br90iHlo/Sa9O836gKh/uNB7kqz
 D8q+iM6FYeKIGv3NFv3bOwC3LVCEcE93DQdX2LAVrqRntzHPitDLJL/xY6Bm4iPxJDFt2C6j1yw
 y25QWIOZ2+A9hoAI7gCfy7xwMnZ8yifgJAMajc3llGbqDLXYo0EGf4FcjmVT0btfOE+/6K2ILrY
 B9NG7MeiZy0/bJyk/Z0jdm0TRowH4jv9HzuvCj5qe67Dzw1xlj0U1KZs8k6QjUTDqbVigE6ptj7
 3q+Rvbe/N0+dkP44JFy3xQX2NQIc7bDB9t2usNicYNdkmRUKb86l0MGwm7SRoaoSYwXolsRgP6G
 g4DOmEapwkqQ60/9lUAPa1aTtLb1uzVvtZysgMWckncp4mvABbKqdH0vAjHX1fF4KiX7d1KmCHk
 5yukOoyYownewPvjs8MtR4S90RT7BwcBBcqTAnf9gw=
X-Received: by 2002:a17:90b:2808:b0:37f:b0a9:1a55 with SMTP id
 98e67ed59e1d1-380525651b9mr1245645a91.11.1782787837638; 
 Mon, 29 Jun 2026 19:50:37 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38052f32661sm704545a91.9.2026.06.29.19.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 19:50:36 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v10 06/12] target/riscv: tt-ascalon: Enable Zkr extension
Date: Tue, 30 Jun 2026 12:19:44 +0930
Message-ID: <20260630024952.1520546-7-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630024952.1520546-1-joel@jms.id.au>
References: <20260630024952.1520546-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Nicholas Piggin <npiggin@gmail.com>

Ascalon supports Zkr and the SEED CSR.

Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bff3ed5de142..1b4061b2c7d0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3240,6 +3240,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zba = true,
         .cfg.ext_zbb = true,
         .cfg.ext_zbs = true,
+        .cfg.ext_zkr = true,
         .cfg.ext_zkt = true,
         .cfg.ext_zvbb = true,
         .cfg.ext_zvbc = true,
-- 
2.47.3


