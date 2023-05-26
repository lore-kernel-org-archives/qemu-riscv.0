Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EA7C77B73
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 16:24:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2aDo-0000f3-7w; Fri, 26 May 2023 12:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aDn-0000dX-3B
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:23:19 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aDi-0005LV-4e
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:23:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f603d4bc5bso10463015e9.3
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 09:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685118192; x=1687710192; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7zZkdQfndXGDq6GOJMf0VbACfEvk3LLwmZQujYfYvXE=;
 b=NQGHtC/bXFMmp7guIzpa4GesWrhqYLJIgFvKIQq9b/QrZM49s0dLT4FjCFa3hgf5pp
 NTt1L+CXrZjqBBOIlq71YpRCMvLfPQtxlV2lrqkqhN0W6P0Aj/BBn76+VwwXyyzA6Wuu
 JyFzc+/Pfc2aTj2x0ZhE8LkaN4N6sTFJ1jIYFpXhxc/Es41r/Ip4k+cw8r/mr+fMYaNa
 xBepQpTErIBMOK1kMjq2lw9m/6vcYa5/ItwFxnfnRr9YyE6+LDI6+1nkBSLW0tJDy4sO
 AbnLYGSg7WDVuY1bXfPcdJ9qtepiJM6QaU2zwdnLXtGCn6l4Y7dSYjdoP3C89bDefSC5
 lEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685118192; x=1687710192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7zZkdQfndXGDq6GOJMf0VbACfEvk3LLwmZQujYfYvXE=;
 b=BdGXADpmndbXnVyCkz9sCauDlDppCbpEqwwZn/3zPPXAyXlL3+pICe1ecGVce1htkR
 Fdq6rESc0jnF1EIiBiIicm9PBP2z5jsr4B5UChy/Uiu5cUKWmUQJ5KsGqqNbx8x2vI7/
 pfSvaEoMj7qAs9ddYeIPMUhzzB7L7dch8vmXRxS/N4fVveBTzNwnVB9iO4jl/j96RSex
 tdf4phWP5sgp0vjZ+/KGPQdpImv4XkvIthOYOBTLd/SqtgLlMoTzZ6Htb94aOkOMhi4c
 9UZGdUQV0rYZlBtdTTuEaQ/O+fHirASY1HcWlheZRAMxEIvquKZlVI+Yof6h4OlSed52
 jdxw==
X-Gm-Message-State: AC+VfDzFVvr2wxQoR+W3MaULFc4NZlIsTFHnUaF3lbupiEuRrzWrU3Xr
 xVle9/AAf/CT49AD2NQBhDA275RHukCDRJEBNew=
X-Google-Smtp-Source: ACHHUZ7uPkTZSxFKS2pThQQFU0PZo1cT2DagqoU2EuG/nDvypL7/Z0qJKnfvOAvxgjeX2jxcedoFmg==
X-Received: by 2002:a05:600c:2245:b0:3f6:cdf7:a741 with SMTP id
 a5-20020a05600c224500b003f6cdf7a741mr2082060wmm.25.1685118192064; 
 Fri, 26 May 2023 09:23:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc98982-watf12-2-0-cust57.15-2.cable.virginm.net. [82.26.13.58])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c294b00b003f6129d2e30sm9312090wmd.1.2023.05.26.09.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 09:23:11 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v2 0/6] target/riscv: Add RISC-V Virtual IRQs and IRQ
 filtering support
Date: Fri, 26 May 2023 17:23:02 +0100
Message-Id: <20230526162308.22892-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

 target/riscv/cpu.c        |   9 +-
 target/riscv/cpu.h        |  23 ++
 target/riscv/cpu_bits.h   |   6 +
 target/riscv/cpu_helper.c |  99 +++++---
 target/riscv/csr.c        | 477 ++++++++++++++++++++++++++++++++++----
 target/riscv/machine.c    |   6 +
 6 files changed, 546 insertions(+), 74 deletions(-)

-- 
2.25.1


