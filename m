Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623CCC197A0
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 08:31:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3uFg-0002r2-1C; Fri, 17 Nov 2023 03:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rcardenas.rod@gmail.com>)
 id 1r3uFd-0002oe-DV; Fri, 17 Nov 2023 03:30:57 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rcardenas.rod@gmail.com>)
 id 1r3uFb-0004CY-JY; Fri, 17 Nov 2023 03:30:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so1201010f8f.3; 
 Fri, 17 Nov 2023 00:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700209852; x=1700814652; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ogDJrJS0F7UTLPdMABAWNYx39xm6qJ2D1H1P0LYasq8=;
 b=Iv0RLWtgQEotb1oAXf9HxElOww6E5OupselIfynObBmTSHx8UaPmkNs6sOROBQYrja
 MQva+l8awG5bWFnfggHPZhMIPZDkCvfo5bvF3V2EriVc3kAPibH6+aiR4KZFRNAmZcuy
 WxA2C7nDk3XkBIMmIii3D+ivtNjUW75jlJmAk89PLc01NY7TJJrc3NI/xlLuYG6oEgxu
 gediKNJYVnrEzWToCPWMzBw8+uaATrxqX2I061UsrtkKhvs0ypFegTTbPnA81w7DPdtV
 0n9abSizo6Y7hdJbFteAN5wuGLGEOtzrhCY+UNHGqwxAZjBuPuRpOll4JMBWrZR97T4M
 V8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700209852; x=1700814652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ogDJrJS0F7UTLPdMABAWNYx39xm6qJ2D1H1P0LYasq8=;
 b=h8Rc0xru3bmjobAnBUNr/0I+WhVFELDTeehnX5gJmLg77btH+BwBSBblmXELdrJ8Ha
 FYePndMNc34gun7m6yQfM510O19/Ey/qXTR0V7+YzeBuE3GxSFUFWvrJBMVXXAG0JGon
 T9AjJ7Vuox9VjkmazWiQAv4QLEQc7O0FYMpdm2nYCOw1RA6MpHumREAvKlzJuUZSLq9U
 5CkBPr+BqDTgJOs61Ch0INyZnnH4FTSP/C4GXn/WvFld4ByoBkBwL+V5Q5xCB42vgHL+
 AsqwH5bGUQELpC6scBKVfx7Vl+eXGrU5QOK+dgLWzQXrGb5GfaJpqVZxa4o7ApsXlyrd
 54rA==
X-Gm-Message-State: AOJu0YxC13DoUWD6Hwo4vsuKv1MdssNYQUwDXbWQJ1Y9B4X3Kf5dNGLw
 y8RUd77gn3NxcsK9bEQXftGgt9f+UuU6UM9c
X-Google-Smtp-Source: AGHT+IEA1jcXmqvnTcUws0FKXtfTkkxaQqyQEs6gyE1lXFxjHhauZU/X7bbAihGqA81Z/nmNkzW5XA==
X-Received: by 2002:a5d:6da6:0:b0:32d:8401:404a with SMTP id
 u6-20020a5d6da6000000b0032d8401404amr14011596wrs.10.1700209852343; 
 Fri, 17 Nov 2023 00:30:52 -0800 (PST)
Received: from localhost.localdomain ([213.94.54.170])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a5d60cb000000b00331697bbcf5sm1409174wrt.94.2023.11.17.00.30.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Nov 2023 00:30:51 -0800 (PST)
From: =?UTF-8?q?Rom=C3=A1n=20C=C3=A1rdenas?= <rcardenas.rod@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 palmer@dabbelt.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org,
 =?UTF-8?q?Rom=C3=A1n=20C=C3=A1rdenas?= <rcardenas.rod@gmail.com>
Subject: [PATCH] riscv: Fix SiFive E CLINT clock frequency
Date: Fri, 17 Nov 2023 09:28:42 +0100
Message-Id: <20231117082840.55705-1-rcardenas.rod@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=rcardenas.rod@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If you check the manual of SiFive E310 (https://cdn.sparkfun.com/assets/7/f/0/2/7/fe310-g002-manual-v19p05.pdf),
you can see in Figure 1 that the CLINT is connected to the real time clock, which also feeds the AON peripheral (they share the same clock).
In page 43, the docs also say that the timer registers of the CLINT count ticks from the rtcclk.

I am currently playing with bare metal applications both in QEMU and a physical SiFive E310 board and
I confirm that the CLINT clock in the physical board runs at 32.768 kHz.
In QEMU, the same app produces a completely different outcome, as sometimes a new CLINT interrupt is triggered before finishing other tasks.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1978

Signed-off-by: Román Cárdenas <rcardenas.rod@gmail.com>
---
 hw/riscv/sifive_e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 0d37adc542..87d9602383 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -225,7 +225,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
             RISCV_ACLINT_SWI_SIZE,
         RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
-        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
+        SIFIVE_E_LFCLK_DEFAULT_FREQ, false);
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
 
     /* AON */
-- 
2.39.3 (Apple Git-145)


