Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030E2CCD193
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:15:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vAuP6-0004ld-6g; Mon, 20 Oct 2025 14:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@videogpu.com>)
 id 1vAuP3-0004l2-PJ
 for qemu-riscv@nongnu.org; Mon, 20 Oct 2025 14:14:41 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <michael@videogpu.com>)
 id 1vAuP1-0005yF-Gx
 for qemu-riscv@nongnu.org; Mon, 20 Oct 2025 14:14:41 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4711f3c386eso21213665e9.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Oct 2025 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=videogpu-com.20230601.gappssmtp.com; s=20230601; t=1760984077; x=1761588877;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=opzEFalbYVbnXWRcVo0cezjfl31ENyryu9nRbaDEx2g=;
 b=CCZhz+FsdtRYSqwN+8vgIkv5XbKdg1YAycHYjnY/IlVHfdCTFg7h7yvEjqHPMIWmW/
 85iiDfcCro6pAwtgNKtgJ+kP27cYxS0mdIk8KJbdVlSX+jKDjXT2U3m99sBU+tuks22L
 zEjC9PusVhXT6k+yetaUQcR2taSEaNr9HZqPJ+SYxNhB7pEON8ztuw9ZR2CJ2rBHISY8
 H20ZwWWoEZcTUY7SsycqIw1OC1L/ZZcIEIwIfz9DsiGUWhEjzbZ3JLdSG0br8SYlR/k+
 M7HT2XR4ndF5qU6mu0ZEeXEXuvM1awZae1d+dX1sldEWsgLKZiHC5Qiw/cgq9LBUj7Gw
 tVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760984077; x=1761588877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=opzEFalbYVbnXWRcVo0cezjfl31ENyryu9nRbaDEx2g=;
 b=ttOu9+k5i0tvbL+2aPToCFqhBZQlZiddUOwm9jJ70mkGbuVDxiD2hlqEOAokmxkfFx
 v/Le0R6Zw1xdold1OQ3GHMYWpttX7f6kmQDj5YDOTnwZK4KI9aZpwueb0SBs0K0/dIld
 GvokU/TnsKMFfQyE7vJEIl+kALhTECMjEoYokK5ZGvr5IrHdVWst1Cmik3BwQVGDpRZJ
 oTcbpMFX8ymocRjwlwCHL4mJgFq4unGkMuZ/cyJW5N+6miTI/NNQUWscvc7VFsjm7KKe
 Bqy0jWdesMec+3EGIsSU8UDuB38dR82FEN/cXVGXPJlHlXOCO3M87Lnhi/gfdFW/zB/P
 JOVw==
X-Gm-Message-State: AOJu0YyyR1BuKqNPxHWZl1jGzU/V1qcTSiAS1ZYGNfUrUlzCduw1z7PP
 VIE8Q+MlbuB8pd/klFGo693h+F6lrCoXLiXNb65G2u3cQQk3o5jDv+jY+zWVSkremZo=
X-Gm-Gg: ASbGnctTYwD9E1r93BSxWZevACB6uPlOnhM07t1DYeva7SXu+Ztz670Jpffz41Ewhbu
 WD0DsR0SHLoYSNfxmvc6PDsA0vNHQ7St43AzG561H80VAk1X/pEDhMD2Ee4O0brUJ1+yuVbfPdV
 2Nm281qYcCklXBV8f4ayE+mneZUMpbTCSE/hPfJBNt4XwxlPY3i//lrp13BYXyy9rCqQ0YraYG8
 TB3soVbrCTvb4Vu3Kdy2v5ezkSHlppa8Zzbpu5jtJRoz3UomtXpOED94c9T9QUUh4yfjrpiiC8f
 rc5+wmS9Hf1m6hHZPA/A0NYDIjRwKUSLXkDeIQj3NT84mbZ96x7292/VEXE3GV8e1uwWp6hFpZx
 zz4fVD7vDvkUs74HedpnR6AsN5RPxt58MeujC1CDYibCORp0JM3w6BM8Q7ugXpN5wLlgXmnbeWi
 cQWr+s
X-Google-Smtp-Source: AGHT+IEFOhgMdtUmTZZNBbgu5u3ALs/exwCvAWTXxJav578tblOxVOHp9+v0fkfGp7p/qZuMMAkW2Q==
X-Received: by 2002:a05:600c:8284:b0:46f:b43a:aedf with SMTP id
 5b1f17b1804b1-47117925da1mr82177885e9.38.1760984076660; 
 Mon, 20 Oct 2025 11:14:36 -0700 (PDT)
Received: from DDesktop.local ([2a10:8012:d:eea4:f4de:376b:66b1:d7b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9fa8sm16731063f8f.38.2025.10.20.11.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 11:14:36 -0700 (PDT)
From: Michael Levit <michael@videogpu.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, pbonzini@redhat.com
Subject: [PATCH v1 0/1] hw/riscv: adding support for NeoRV32 RiscV MCU
Date: Mon, 20 Oct 2025 21:14:34 +0300
Message-Id: <20251020181435.8242-1-michael@videogpu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::32d;
 envelope-from=michael@videogpu.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

1) Initial support for Neorv32 soft-core MCU
2) IMEM, DMEM memory regions, bootloader ROM
3) Basic support for UART0, Basic support for SPI
4) Added SPI flash memory for loading firmware following  bootloader
5) Based on Neorv32 RTL implementation repo
   https://github.com/stnolting/neorv32 commit id 7d0ef6b2
Thanks in advance for review!

Michael (1):
  hw/riscv: adding support for NeoRV32 RiscV MCU

 .gitignore                                  |   1 +
 configs/devices/riscv32-softmmu/default.mak |   1 +
 docs/system/riscv/neorv32.rst               | 110 +++++
 hw/char/Kconfig                             |   3 +
 hw/char/meson.build                         |   1 +
 hw/char/neorv32_uart.c                      | 311 ++++++++++++
 hw/misc/Kconfig                             |   2 +
 hw/misc/meson.build                         |   1 +
 hw/misc/neorv32_sysinfo.c                   | 183 +++++++
 hw/misc/neorv32_sysinfo.h                   |  79 +++
 hw/misc/neorv32_sysinfo_rtl.h               | 134 ++++++
 hw/riscv/Kconfig                            |   8 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/neorv32.c                          | 219 +++++++++
 hw/ssi/Kconfig                              |   4 +
 hw/ssi/meson.build                          |   1 +
 hw/ssi/neorv32_spi.c                        | 504 ++++++++++++++++++++
 include/hw/char/neorv32_uart.h              |  68 +++
 include/hw/riscv/neorv32.h                  |  60 +++
 include/hw/ssi/neorv32_spi.h                |  70 +++
 target/riscv/cpu-qom.h                      |   2 +
 target/riscv/cpu.c                          |  18 +
 target/riscv/cpu.h                          |   3 +
 target/riscv/cpu_cfg.h                      |   1 +
 target/riscv/cpu_cfg_fields.h.inc           |   1 +
 target/riscv/cpu_vendorid.h                 |   2 +
 target/riscv/meson.build                    |   1 +
 target/riscv/neorv32_csr.c                  |  54 +++
 28 files changed, 1843 insertions(+)
 create mode 100644 docs/system/riscv/neorv32.rst
 create mode 100644 hw/char/neorv32_uart.c
 create mode 100644 hw/misc/neorv32_sysinfo.c
 create mode 100644 hw/misc/neorv32_sysinfo.h
 create mode 100644 hw/misc/neorv32_sysinfo_rtl.h
 create mode 100644 hw/riscv/neorv32.c
 create mode 100644 hw/ssi/neorv32_spi.c
 create mode 100644 include/hw/char/neorv32_uart.h
 create mode 100644 include/hw/riscv/neorv32.h
 create mode 100644 include/hw/ssi/neorv32_spi.h
 create mode 100644 target/riscv/neorv32_csr.c

-- 
2.20.1


