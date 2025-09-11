Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4B3CAC587
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 16:07:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uwjp9-00056U-4t; Thu, 11 Sep 2025 12:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uwjp4-000565-1W
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 12:06:58 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uwjp2-00068h-6a
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 12:06:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-32d3e17d925so814021a91.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Sep 2025 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757606814; x=1758211614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LMkhBnxP1K1lXBwRpWEfdoby7fEpJeDOFfIr89S0Eqo=;
 b=Y6BH+z7CMu3PxQeS3HUa/GKLnTUEl0uhZ8At4dV9AWLwTdkDFIxo/teOZjj0B4Pu3K
 gmDHJdArZQ14+oz2I0+hDr8eoGR+F0YdSNxzGlXzUrVus4velwpwspE6hAU+auXHdCTJ
 v1WR0FSGnrW+sg62+LbA2+iGx7QQj/5RVZPRyPcJ24yg3i5H0VXk3ea98PoxfztreRNv
 rq5Zk/jCsh5tKE7P7j9KKUK9hKQo5yS4/jShNJ0IVu7LkUTZwTUz3DvlDUf9TPvf9bx/
 FeEjZXlvLwUTp6lNWnkf1WzgUwutEuzdvFd689U9YbjMYpVPKp6xKmn9rU4XQ0Zey+Gi
 qP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757606814; x=1758211614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LMkhBnxP1K1lXBwRpWEfdoby7fEpJeDOFfIr89S0Eqo=;
 b=kqMsuwm5+RGqhZJXxRNFuX6wNJ7XjCj80rQ3//OHLXE2iyMsV1SRiEWp9AH52naOCs
 jQ0nXXHYBamIGk9x7HzMkr2RHJp65Qyk6KzhtMC5lOL/TD6F7dD6gqt8YtgDvHDKSNZb
 4NGBR2gN45E81alGU1DnMaRmT9mxQvmWjAPc5N7pZrmiqGMbJzdqVrE2SDKuTzE7CWCX
 XKqmgpNzRWDZB1WI5Q1HpyvWAtMfiR2W44rFR8jyMSfZdTBlHQv0aRQhhSbHAVcRU99g
 7vT8hFhNtKNzUfXnyzv7U3xvT15LR+H6LBrRayFinTIfipqhAuTjxmenef2hEbIRZXjh
 0/Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQPygmYaofKXEh1NALLc77LgW9UgRJSr/wC/rrCsNVeiKNyd0E0VZeSQWb0fOq1a8paQhX7cHvLszB@nongnu.org
X-Gm-Message-State: AOJu0YwJTGtPrzOwxe/O4EJIaAZBY0++t7PBJTsC66GljbKYk5ZKRe/K
 5OA76qj4BdirSFBHWLVHEgIA7DZEoBu4wVLk941kjDZDo3dMK8bKkz2OVAVF6tARZu4=
X-Gm-Gg: ASbGnctafi8/tBG1IRWoIeMdYFlQqBsiZAwU2tSYXIcx1trm66WYtqkKIU7s8O9po+k
 rJykShALIKgF5Oa85bJsZq3Hlja2DT9Vd5LJKDQssGuZMWQJ67vG67G0OkeRembn1yKKa0vJbTg
 x3uADrPC/zwuKoMSk0MWR9QWhO0rb5wZZbB/Q+dUHKQyjQkJBC30XSfMDT9ZVDBgEvJa+EDzeeH
 lRn9ZI3lM+xxGP30vbXPZlXZ4pD8jCYK1Ixy9GxwBGk4CTkDlbwE+JUmRilNcHLN66VZe6OUBOL
 Fvw/6PmnXSx23GkjbNH4UgYeb+o4PtjY/NBg8qfOjLGj9ZJSScFtob7YHPnQa7wfIqxgrFjdtnt
 N7gH4FZlmOkT9Y8f1lBDMD00/O1w4rPdrdfPMlyA3hrmCuLb//1fEKZpFjRD/
X-Google-Smtp-Source: AGHT+IGpNm5A2658L6+ROOG4L0n01PQizIba4+pp+39zluhCjRERtKb1dIut/EoP7iTZFi4E9l/8Pg==
X-Received: by 2002:a17:90b:5584:b0:32b:cb05:849a with SMTP id
 98e67ed59e1d1-32d43f936fbmr24008008a91.29.1757606813701; 
 Thu, 11 Sep 2025 09:06:53 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd9903a2asm2618765a91.24.2025.09.11.09.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:06:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 0/4] Fix SiFive UART character drop issue and minor refactors
Date: Fri, 12 Sep 2025 00:06:42 +0800
Message-ID: <20250911160647.5710-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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

This patch set fixes the SiFive UART character drop issue introduced
after commit [1], which changed character printing from synchronous to
asynchronous.

Since UART now transmits characters asynchronously, it is possible for
the Tx FIFO to become full, causing new characters to be ignored and
dropped when running Linux. This happens because:

  1. The Linux SiFive UART driver sets the transmit watermark level to 1
     [2], meaning a transmit watermark interrupt is raised whenever a
     character is enqueued into the Tx FIFO.
  2. Upon receiving a transmit watermark interrupt, the Linux driver
     transfers up to a full Tx FIFO's worth of characters from the Linux
     serial transmit buffer [3], without checking the txdata.full flag
     before transferring multiple characters [4].

This patch set updates QEMU to honor the Tx/Rx watermark thresholds and
raise interrupts only when the Tx threshold is exceeded or the Rx
threshold is undercut.

The remaining patches contain minor refactors, including removing an
outdated comment about the Tx FIFO.

[1] 53c1557b230986ab6320a58e1b2c26216ecd86d5
[2] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifive.c#L1039
[3] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifive.c#L538
[4] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifive.c#L291

Frank Chang (4):
  hw/char: sifive_uart: Raise IRQ according to the Tx/Rx watermark
    thresholds
  hw/char: sifive_uart: Avoid pushing Tx FIFO when size is zero
  hw/char: sifive_uart: Remove outdated comment about Tx FIFO
  hw/char: sifive_uart: Add newline to error message

 hw/char/sifive_uart.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

--
2.49.0


