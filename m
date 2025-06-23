Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4824EC77B7C
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:55:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uTkQw-0000sj-Go; Mon, 23 Jun 2025 12:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uTkQu-0000rg-JT
 for qemu-riscv@nongnu.org; Mon, 23 Jun 2025 12:54:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uTkQt-0008CB-5P
 for qemu-riscv@nongnu.org; Mon, 23 Jun 2025 12:54:12 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4531898b208so2022005e9.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Jun 2025 09:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750697649; x=1751302449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tNCesYs3FFj+/RQZWBoxRB23WBzDxbnoA2srKEuQzv4=;
 b=baPpPDgo0+BhElh1eMaz/CcSmMJ9fJQYASZ+wN4x6hQe51YtonU21fB1pDf0Ibyirz
 yM85eofOd15UepiNmAq+9UZfY5YOx4ZZVa3k7bD2LxkoqyN8c3F+AledfLik49pKWMye
 cXnVfRMJ9XNt9YTMaLxM3ufszGwh3uuLL8mt5hEP3Kca/0fObfzjrRJ17N7KvB0lRw5u
 6ajW/tvNXue/QLOIyB0iZk0GLoZVNw+EcqrWp0ublRMUXTBKAa3XzMkFbQEjitx9d/4n
 Hr03VaPGkSAi9ig2oOwDbmMf42am2C3rxrxg+FUfOVLjPt8qPrHz3ZRBXWv4R4BDb0NW
 a9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750697649; x=1751302449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tNCesYs3FFj+/RQZWBoxRB23WBzDxbnoA2srKEuQzv4=;
 b=r5tDIvyZFzRfpX1AjfutlTeRz2V2sc42ipgpJ+2oJKsU0w8ZTeJxej1jU9nHVflWwA
 ASKOi40VD3P8zdsCNrKRgOqLTlZqMSJ8/XzTTSMnJZQuAhxr5H2cCsFkUedsLmZyYAx/
 4TfGUGT6AS+weiM3+6eJhdAcOkUstwSpseeEauCOwyakIghMgYMOwHsOkLzQc2R+jAIo
 H/NiuVxoXyGpayAqubQHb4yKLxf83se9aB/qGTRqq2tlxcFdLuPDCd1nlzILvwWm2Vi5
 eooE4Rf7CHbBBTSmBFGj80+UipaMPT83cWigK+B8nbUAshTnFBhVMBZ2eAq1xEsmpbB8
 4D5Q==
X-Gm-Message-State: AOJu0Yy42nGs/42gU9i3JmcnSh2cD4Ur+H74MH8mp2zdKa/ROqG3n2uG
 zvPh5UU1puJc+EUx/ZnXJpV9WMt8TFWzpZJQo4+IQ23Mw15/pZ9GmuA20qA20aifrOBsamVFuXC
 +4IBf/wI=
X-Gm-Gg: ASbGncvfLNZdxe8p1EPerwkLS9hDaW17dLbKfDnqq15F09XjyLdg4KnH1Me8L/g5Dff
 j/64NeTblzEZi6lRYrZKef9vxh6u0YC4KCWuDKEfWNTRLL4cEoOzkmC3EUU0Q3PboDqS8dEnuyT
 B0qraSR6Mm69pGaWUczrSpdMBxyDIiE6nRVm7PZVjodwXKc95u4i/bMUyJFHfseF9HmDZlRB3nT
 3N+DwuZ/Dn+skf1mgatGhJvKy2FpP7MWej9g2EcKVUopPDi6wE3Ao3dO6La3qf/5tFXNq4XS+mq
 o4hR273akY1nC1I6GeVOWbPC1eYR5HFUSms90BWebNzZ6b0Z8u2oX7OhO9BIrIpPtkE=
X-Google-Smtp-Source: AGHT+IEto515WugI+tQ8tzq/Ckbh2Pz50Ab9kcI7e97q/wl6trF+5OZZh4CYul12bGQb/+lxjnlVDg==
X-Received: by 2002:a05:600c:1c28:b0:453:4376:8f48 with SMTP id
 5b1f17b1804b1-453659d879bmr49082635e9.6.1750697649327; 
 Mon, 23 Jun 2025 09:54:09 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8947:973b:de:93b7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453647082a2sm116607745e9.37.2025.06.23.09.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 09:54:08 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 2/2] target/riscv: disarm timer when writing past value
Date: Mon, 23 Jun 2025 18:53:29 +0200
Message-ID: <20250623165329.2759651-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623165329.2759651-1-rkrcmar@ventanamicro.com>
References: <20250623165329.2759651-1-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=rkrcmar@ventanamicro.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

There is no need to keep the timer running when writing a past value to
the *stimecmp.  The behavior was correct before, but I think it makes a
bit more sense like this.

Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
 target/riscv/time_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 8198a2d8d92d..81a6a6394502 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -64,6 +64,8 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
          * If we're setting an stimecmp value in the "past",
          * immediately raise the timer interrupt
          */
+        timer_del(timer);
+
         if (timer_irq == MIP_VSTIP) {
             env->vstime_irq = 1;
             riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
-- 
2.49.0


