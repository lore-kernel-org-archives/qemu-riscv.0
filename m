Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D74ACAC592
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 16:08:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uwjpE-0005AE-Tf; Thu, 11 Sep 2025 12:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uwjpC-00058R-9I
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 12:07:06 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uwjp9-0006AG-QQ
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 12:07:05 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-32d9f725f68so747212a91.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Sep 2025 09:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757606822; x=1758211622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UIhBt/gfm4MfQLRC2cneq/+C/BNaiAz/oeMtDs6zQnA=;
 b=PUGPQszprDrH25oPwap2QYkjh1bOVQNsoFE8Fe8E1cdwoE2Rr+nFmKUGWaJsswcOgt
 Gi8uxidtlOFICzjQitosHAYi5Fz02bobHMAfHvN20t6Rna+jrmvvQKYH1rERhE7Lx35H
 LoQk7+MrJ4cZMi3Ch/3Ey1mHIYs+lL0NK0XczgGWJjaVPyGGeNjSaKjQpntwuKws8PRG
 kkImkQ5K03agGrf/3mrFKLQfAe2jn1Ty+25Qnf747+WHGUVdjOsaCFpNBpWxZrwzlCHm
 7Hx6LQC88Bk2Wnk6XiZ6BWQmehn7tF1SZedgHLwfWCCIvYhg+5XmcybpAxYo3tAlgvvA
 0YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757606822; x=1758211622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UIhBt/gfm4MfQLRC2cneq/+C/BNaiAz/oeMtDs6zQnA=;
 b=sCC1mRqcRyEhHW7fO7lcTAIEcE5Vb0bEahGyzt0e8W6Wqh3HqGndkIKZJ+NPw+LqTG
 6cszScW2ihLdhlSamtfsit2jtiNRYR4xqTv1EhVWZyFL2avrNs1QMb0xLZCDF7zmeW4D
 ML01fL3bCUvMF4JydcdHIR3GufedJ12qvJiSGxzW4wRLYLJYQ9/aLkNrdBZBOkp+F6hu
 gkunW4CSlrdq7pB2Vyv1WkYxBcEwAldS/q81BWpx+KGWU3LTGPiemPRcbEQueLKqWV3j
 sRnfQ8oR659w6zQ/vSFdKsNH1BRuL1dw/nCPravWIPInymcjhDhyRPyE9uOCxIAurbDG
 cilw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5WaxqU0yhWr6JPgA8OL6z5YPgdJrLvFlJ14EUaxoDbG7aPlkynMYUO393OwhH4VNl5dy1RjZc8cnG@nongnu.org
X-Gm-Message-State: AOJu0YySYrxsGnd3cIrUrhsOihvQIy0gkaku9zDGaiLSTXnrniCcgOzH
 jaZixMAwqQao7Nk0upPJAFUciBToPCG5dUsPS7k1JWQJYkGjq3aWKiCZv0xKhR5gY0w=
X-Gm-Gg: ASbGncukp3AkmwXZq8Q7I7tcW1L4fw9rMz00Zwc7NZaR1jK6QjavS7BD2Y4lJXAu+sO
 TjquAmUrQYE7qVFzBePBUQVOvEXL+6Gk0fANGgQa1+FC7h8vQmhccJPY38f0YW9rjhRZj/fItQq
 nEk3Wex1rRMtQi1Q3RA6+anWpWFHiThsr8pp6X/p+VFytQct8ZGFLqPax0xhYCDLcmy2YMmWb8H
 8F+elvYe2wFun6i3Z5GObE9O2UG1EKkSY7ntwQz09nqW74QTbPwvgU11KiEquopCEhygsBhG6kp
 EzIvn0H+039iew3Z7JdrOPg92Xcg07XHxlRj7K23we2jzBRuXae3LgJR+oIT15Vzzl8tTjFIb/s
 WvLMrcMksNEaBZl3etIMcP1mlcLcl4f9QmTBYiwF75jdN55F6dHPcgCnbHOSH
X-Google-Smtp-Source: AGHT+IGrXv1a1syGeNZS7H98f7pe9op4VyS741NsSQnqqfmADV4og4MPk4p+CszzYk5IxU49CG2HFg==
X-Received: by 2002:a17:90b:4e8b:b0:32b:6ac0:863f with SMTP id
 98e67ed59e1d1-32d43f5a67bmr23253381a91.18.1757606822268; 
 Thu, 11 Sep 2025 09:07:02 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd9903a2asm2618765a91.24.2025.09.11.09.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:07:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 4/4] hw/char: sifive_uart: Add newline to error message
Date: Fri, 12 Sep 2025 00:06:46 +0800
Message-ID: <20250911160647.5710-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911160647.5710-1-frank.chang@sifive.com>
References: <20250911160647.5710-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Adds a missing newline character to the error message.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/char/sifive_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index baef0bd9c28..e7357d585a1 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -113,7 +113,7 @@ static void sifive_uart_write_tx_fifo(SiFiveUARTState *s, const uint8_t *buf,
 
     if (size > fifo8_num_free(&s->tx_fifo)) {
         size = fifo8_num_free(&s->tx_fifo);
-        qemu_log_mask(LOG_GUEST_ERROR, "sifive_uart: TX FIFO overflow");
+        qemu_log_mask(LOG_GUEST_ERROR, "sifive_uart: TX FIFO overflow.\n");
     }
 
     if (size > 0) {
-- 
2.49.0


