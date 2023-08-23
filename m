Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698D6EE49A0
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 07:07:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qYhxB-0006VB-5L; Wed, 23 Aug 2023 03:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qYhx9-0006Ub-8A
 for qemu-riscv@nongnu.org; Wed, 23 Aug 2023 03:06:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qYhx7-000428-Ia
 for qemu-riscv@nongnu.org; Wed, 23 Aug 2023 03:06:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fee8b78097so32667735e9.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Aug 2023 00:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1692774411; x=1693379211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UIydMWSHseXTCz2TrjbmNN3Ck1DmgBCrrMfXrisST0w=;
 b=Qqy3lnppabwSLusr9KnXBXLJhoElYH1R7okIxbhzy+r8KTm7meClFFaIk+MNvaf+4S
 mAfJGYLireq6n/gAcczIcukw4EBfWJvoVdm0QSICvBinW9XvcpM09+Xc7sZ0DvVgXCRS
 fw4AdYZ1JPbBxOlT7bgPtBWo9LVkpmQfyixcrKAjb7nVQ0vgMNVXWYG1LAJxOTLOfNHK
 wer7Ka7HvccC41yJ4yaq+b70qJdtVsNmDuj+P0iEYRYXZGvY/L4D0QNfOS4LtVfi/qTk
 MWAbvUvbamdZO+b/TiHAYfNE922+kB6eWR8Zn41p7eVh5sEzXeByxHRBhLodnuE7gR1t
 qW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692774411; x=1693379211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UIydMWSHseXTCz2TrjbmNN3Ck1DmgBCrrMfXrisST0w=;
 b=Ze0saQSFRUlXJzK8lRX++Cn+1uok6n64krTm8lVQs8YUIucD+di6SZ6LoJPIDbr/BS
 i8shf49bZSZ3BbQfVoCFM1YVIknCXsVhZ6QbfNRrH7GSDgIORIn9feoxyDx6s5pLUj6N
 hfedevSSH4BmoKlFKZijHw+Hu1XlO0sS6ogUdZ7bzJjhAju8L4KPYPeLyMOPOBoxpFzM
 R4Jb1TRrxRmFnEoLaR9bjAd+gC7ArayhPzGp+KqTn8Z/l4bUb92cGGuCsWz8xuvfkCUV
 nH+TAtvQbYFlrMQ4rdkYS9WD64cJy+hu1n0r43cro/QqBiWrPwJkhd3UdJQY3Xywces+
 K1/A==
X-Gm-Message-State: AOJu0YxPhRUSqtOvzFx7acB0mrcfajF4SwztYI2Axl1FRzmuQi8bMYDv
 uCZ9b1uViqtMnj+OPXbj8nxzD/tqMO64z6rOOqg=
X-Google-Smtp-Source: AGHT+IFiGMICCVWXHr9+vIqzf7gYAS9quRU2Kbg/i7XqYjrPRjCa4Se2oN6ad20fLDSjAx94mUmMfQ==
X-Received: by 2002:a7b:c414:0:b0:3fb:dff2:9f17 with SMTP id
 k20-20020a7bc414000000b003fbdff29f17mr9474417wmi.15.1692774411142; 
 Wed, 23 Aug 2023 00:06:51 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:d434:6b1d:751:97d0])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c294500b003fc06169ab3sm21176358wmd.20.2023.08.23.00.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 00:06:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v2 0/3] Risc-V/gdb: replace exit(0) with proper shutdown
Date: Wed, 23 Aug 2023 09:06:36 +0200
Message-Id: <20230823070636.362957-1-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x336.google.com
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

This serie replaces some of the call to exit(0) in hardware used by
Risc-V boards or made when gdb is requested to exit.
Otherwise, the gdb connection can be too abruptly disconnected resulting
in the last gdb packet "Wxx" being not sent.

As qemu_system_shutdown_request doesn't allow to pass the exit code,
only perform the above modification on a sucessful exit.

Difference with v1:
 - avoid sending a shutdown request in gdb_exit if one has already been
   set.

Clément Chigot (3):
  hw/misc/sifive_test.c: replace exit(0) with proper shutdown
  hw/char: riscv_htif: replace exit(0) with proper shutdown
  gdbstub: replace exit(0) with proper shutdown

 gdbstub/gdbstub.c     |  3 +--
 gdbstub/softmmu.c     | 13 +++++++++++++
 gdbstub/user.c        |  2 ++
 hw/char/riscv_htif.c  | 12 +++++++++++-
 hw/misc/sifive_test.c |  4 +++-
 5 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.25.1


