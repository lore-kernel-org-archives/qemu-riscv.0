Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA380C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:12:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhKu-0007Dv-U0; Thu, 31 Aug 2023 09:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhGU-0004Dn-Lm
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:59:18 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhGQ-0005q2-IL
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:59:14 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-58d41109351so26246757b3.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486749; x=1694091549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GxA/5EXb2SmpDTy3rgcCO3KdbceHG3sLJR7WKjQ1/Y8=;
 b=KftkL0tURDmv9kk6wv+NzYLaIdWqE3EHoNBlZVZyyBfK0e7qeC0URUkoyrcuSXL67u
 gHskIagRgXksHntUyFWUixjuthsiVeX8Iv4ScO16vQwAGhgVr0QGLfM/taKNaI67svit
 X5SnJVos2xL2B3p9H2BYlXMSG68BLsHXhof7LhTS56M+cgSCY3NczSeE98y4+vudfQn0
 V1BOQkuaIVP/rdAql/Q2khXmMu3i0+0NhsKG9f5Tk7S028xRIzokoXAFxHxTcYZEIr0B
 ZZ+VlgQw2g7EnpXTzYK3BSDNfXOY8aYznKv3d431BIhkENiniJQt+3CMzGG4/PZ4lo6P
 kS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486749; x=1694091549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GxA/5EXb2SmpDTy3rgcCO3KdbceHG3sLJR7WKjQ1/Y8=;
 b=Pw0StHV+mrGCTlWDnCBeU4Q4QQ8xOYD7lZWIuHNkcUxtZ/BaCXiqKaqb5LTrsvHOC9
 ALAD6nAvgqKVKIY3E4uTEwcmC7bF8mk0VPIUjdUck74vYaQDus2fLeUhWJ3E9YfUho3A
 wI7Oy39Zbe9j7h06BCNHXV3xvppJT5Ny/vsLOxGClFuHuIw5AEBJgeuJJdBrBCxAeCdQ
 YxiJ3gX0RA9Rvq70nxGmtHhv1OV3SZZtNFizy1+5L+iOxWtw5riDiGKesQpnOhqyBLpN
 7GV1oKhRkVt2nTlFUQqXbFahdwn/5lBnPITMBxVyOa7C43F49HU66hDSWchgL+pdXaR9
 f07g==
X-Gm-Message-State: AOJu0YyrYrHVf3xlYmrCQA1YWIwV1+VHikcy4qVPz3q+ff+y39wg93bF
 4S0eBVLK3u8nAqI1UYggotz+Fg==
X-Google-Smtp-Source: AGHT+IGZURAw3hFpSJjNx80pusv4a+zH+7FD/wa1hmsdENsbIvNg1i+IISlDxc3wVmlX5600ur2vOA==
X-Received: by 2002:a0d:d6cb:0:b0:58f:bda3:7d9 with SMTP id
 y194-20020a0dd6cb000000b0058fbda307d9mr2154104ywd.26.1693486748816; 
 Thu, 31 Aug 2023 05:59:08 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 b131-20020a0dd989000000b005772abf6234sm391546ywe.11.2023.08.31.05.59.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:59:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 23/41] hw/char/pl011: Remove duplicated PL011_INT_[RT]X
 definitions
Date: Thu, 31 Aug 2023 14:56:25 +0200
Message-ID: <20230831125646.67855-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=philmd@linaro.org; helo=mail-yw1-x1136.google.com
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

PL011_INT_TX duplicates INT_TX, and PL011_INT_RX INT_RX.
Follow other register fields definitions from this file,
keep the shorter form.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230522153144.30610-6-philmd@linaro.org>
---
 hw/char/pl011.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c3203e5b41..96675f52cc 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -48,9 +48,6 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
     return dev;
 }
 
-#define PL011_INT_TX 0x20
-#define PL011_INT_RX 0x10
-
 /* Flag Register, UARTFR */
 #define PL011_FLAG_TXFE 0x80
 #define PL011_FLAG_RXFF 0x40
@@ -157,7 +154,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
             s->flags |= PL011_FLAG_RXFE;
         }
         if (s->read_count == s->read_trigger - 1)
-            s->int_level &= ~ PL011_INT_RX;
+            s->int_level &= ~ INT_RX;
         trace_pl011_read_fifo(s->read_count);
         s->rsr = c >> 8;
         pl011_update(s);
@@ -262,7 +259,7 @@ static void pl011_write(void *opaque, hwaddr offset,
         /* XXX this blocks entire thread. Rewrite to use
          * qemu_chr_fe_write and background I/O callbacks */
         qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        s->int_level |= PL011_INT_TX;
+        s->int_level |= INT_TX;
         pl011_update(s);
         break;
     case 1: /* UARTRSR/UARTECR */
@@ -350,7 +347,7 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
         s->flags |= PL011_FLAG_RXFF;
     }
     if (s->read_count == s->read_trigger) {
-        s->int_level |= PL011_INT_RX;
+        s->int_level |= INT_RX;
         pl011_update(s);
     }
 }
-- 
2.41.0


