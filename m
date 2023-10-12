Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C535CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 10:02:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqsVN-00079W-D6; Thu, 12 Oct 2023 06:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqsVI-00077C-7o
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 06:01:16 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqsVF-0006xg-Eb
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 06:01:15 -0400
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-32799639a2aso729340f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697104871; x=1697709671;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/uDNKhg8CJ8x2YA34QcwAjMiq7D5MjiTEYuva1JakdA=;
 b=k8fjYTAGYxBpLxO2l1kW3o2u7OjW8AQKyhFPcWlGOdlLRW18px+Pb+8AXO3S6/LxFl
 EvNCeQSUzVjMivULoM3UlHRWOHT7LoovQIL3BHcpbLUQZlC8wwqZcjxdO4qkOkwTRecF
 QJoVv8G2sBcYHQvsjOXjAu+1imvXcbkiesGI1LuAVIgzDez7CfEYBTHrnOypt3vk2B6V
 e2EM/Bwl8FPkBMq9yk2wsyTb4FcSrC7MmCO1L71R5FHlV+wGxzvXxUCmM36kljLdiesF
 UWKMqHxgXjS8o8WeMj5yi6UfoBvCU+ayWi0/o3vQfwrZ6A7pWATK/rIPDJlaY5DZPneX
 P6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697104871; x=1697709671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/uDNKhg8CJ8x2YA34QcwAjMiq7D5MjiTEYuva1JakdA=;
 b=mlBrHYG9C4gO4hVDQkUu9Zq5Q1kDN+5td7Al0JkPf7oph9qC+6qlcn8uXmokR20xsU
 phnAW+nm3ruV6NT5m1KBL2pu7Wyj2NFbBoN1/8bNhN+zu3fMRS/Eot3amXZrvSQmQTtF
 669fCKV+9Eb3Z2H8+b4NZ2HPX4slcupzYemeJLEutggRsxnZDPSiqZVUvHjJ7+1659t6
 3fhVL/ftVPdrbU5BL59xbF6pRoNX+GDGiOvZKH8/kg+8jEyR7oePb/c5/7WynqybdnPZ
 iUvWot9xwP2OmGeQwpyH9lVIp9hOOJgaZ+1wiwumRIdWHYpAPKhFT3vxGVD7oGhHzh6o
 lujA==
X-Gm-Message-State: AOJu0Yzr4LpeNYRRNVeQzzXvCDJ1BSP/mQwD1Qx9J8y4zfEvPfMq14XP
 5czEt1rrgXup39wFQuB1UiFQuonlDyOREZz9avYnMZkU
X-Google-Smtp-Source: AGHT+IHQsHWZzgYE1OpYa/TQqY1copjPHn2YZxPRBrlCybNY0pgv2Z13SGfHx7X+KycA73539JQ+Hg==
X-Received: by 2002:adf:b186:0:b0:32d:819d:ec75 with SMTP id
 q6-20020adfb186000000b0032d819dec75mr4408748wra.60.1697104871451; 
 Thu, 12 Oct 2023 03:01:11 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056000024c00b0032d88e370basm3803122wrz.34.2023.10.12.03.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:01:10 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v4 0/6] target/riscv: Add RISC-V Virtual IRQs and IRQ
 filtering support
Date: Thu, 12 Oct 2023 11:00:57 +0100
Message-Id: <20231012100103.28612-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This series adds M and HS-mode virtual interrupt and IRQ filtering support.
This allows inserting virtual interrupts from M/HS-mode into S/VS-mode
using mvien/hvien and mvip/hvip csrs. IRQ filtering is a use case of
this change, i-e M-mode can stop delegating an interrupt to S-mode and
instead enable it in MIE and receive those interrupts in M-mode and then
selectively inject the interrupt using mvien and mvip.

Also, the spec doesn't mandate the interrupt to be actually supported
in hardware. Which allows M/HS-mode to assert virtual interrupts to
S/VS-mode that have no connection to any real interrupt events.

This is defined as part of the AIA specification [0], "5.3 Interrupt
filtering and virtual interrupts for supervisor level" and "6.3.2 Virtual
interrupts for VS level".

Most of the testing is done by hacking around OpenSBI and linux host.
The changes for those can be found at [1] and [2].

It's my first touch on RISC-V qemu IRQ subsystem. Any feedback would
be much appreciated.

The change can also be found on github [3].

TODO: This change doesn't support delegating virtual interrupts injected
by M-mode to VS-mode by the Hypervisor. This is true for bits 13:63 only.

Thanks
Rajnesh

[0]: https://github.com/riscv/riscv-aia/releases/download/1.0-RC4/riscv-interrupts-1.0-RC4.pdf
[1]: https://github.com/rajnesh-kanwal/opensbi/tree/dev/rkanwal/irq_filter
[2]: https://github.com/rajnesh-kanwal/linux/commits/dev/rkanwal/aia_irq_filter
[3]: https://github.com/rajnesh-kanwal/qemu/tree/dev/rkanwal/riscv_irq_filter

v4:
 * Rebased the patches onto alister/riscv-to-apply.next. There were
   some rebasing conflicts due to code restructuring.

v3:
 * Rebased the patches and added reviewed-by tags.

v2:
 * Move RISCV_EXCP_SEMIHOST to switch case and remove special handling.
 * Fix linux-user build.

Rajnesh Kanwal (6):
  target/riscv: Without H-mode mask all HS mode inturrupts in mie.
  target/riscv: Check for async flag in case of RISCV_EXCP_SEMIHOST.
  target/riscv: Set VS* bits to one in mideleg when H-Ext is enabled
  target/riscv: Split interrupt logic from riscv_cpu_update_mip.
  target/riscv: Add M-mode virtual interrupt and IRQ filtering support.
  target/riscv: Add HS-mode virtual interrupt and IRQ filtering support.

 target/riscv/cpu.c         |   4 +-
 target/riscv/cpu.h         |  23 ++
 target/riscv/cpu_bits.h    |   6 +
 target/riscv/cpu_helper.c  |  99 ++++++--
 target/riscv/csr.c         | 477 +++++++++++++++++++++++++++++++++----
 target/riscv/machine.c     |   6 +
 target/riscv/tcg/tcg-cpu.c |   7 +-
 7 files changed, 547 insertions(+), 75 deletions(-)

-- 
2.34.1


