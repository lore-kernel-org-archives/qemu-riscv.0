Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF13CDB483
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 11:18:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsLbs-0002g4-Rf; Mon, 16 Oct 2023 07:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qsLbl-0002bp-MZ
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 07:18:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qsLbb-0005ac-EM
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 07:18:01 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40776b200e5so22872875e9.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Oct 2023 04:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697455061; x=1698059861;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o0X746pWBb61XQE/PyM4YL/Nc2C8wn9L+9XF0qSDLec=;
 b=sj1HQSzIuXyHrS07AoFH7gi23QYY6xUEiVZ71bBbs67dIjuMYCSWevLN2fqUwYBdMA
 hMNoRR2uTCjafvBsXM0O/wEHieDlquigA6rWhYFAKgwQhatafLBYMK3xtV//nqUIsNNG
 M21ZpyXi/RxYAgx4DcZUDCF40RWNGnwZcHuuBK2i+qZTyTTQugQwPpDOw2hbGs61GkK1
 uo/iEFFRKEZBv26uacbwfKy1qJvFkXVx2rKp3Djz0gxMRj+dkjuT5uHau6te097vOmZD
 zHPpD0Y6zUlp/GSUSkx30l6401lwC98h485m40A7RuAl+xw0lXYW/ZcIGL6ZhMLXdJUc
 hh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697455061; x=1698059861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0X746pWBb61XQE/PyM4YL/Nc2C8wn9L+9XF0qSDLec=;
 b=G3AFxFcJMAOP5aPhv28Fj7a9Ry93taqzgstTjco0ozLX+gvHBgbzdCu0HPTKm2Ps3C
 GzNyXg551fTMMPjfbQ4LNRNIkacnxWRlDRZznfjeCbfXR0aCNNINwmQeIfJBz3IS3ETM
 UzsFUP63vg9f/04KYEN38AlfWzKBYgtyYG3sGn0qNloHkseN7XeragNAumN0uo4+70qq
 uVe8TuFRy0KVuGeHJB2gWI3dnpBdBb/wsXL9eDl9iIG/LT8nE5WQ3KlQyIbElWLoPdQD
 wGAQl9wf2crEZlQO11PoS1HzP89eyps6iQ+sBOVJTOYI5yLJOLN3y7IN2x03d7q/vDit
 qX4w==
X-Gm-Message-State: AOJu0YzUNKDIVvqDlgvO74lpvQdhCbZPkyQbKlnsNi1f0YnzslD2i191
 2VU6r6RMpYgpUkWxIpU6vaHCAcsOXEJTuIL1l8I=
X-Google-Smtp-Source: AGHT+IHIdYSbUItU6QiNyeHZSj4SrFHJYkIKdMZs/uSSRSHC467zUCsFn4kzRxzMxPaQnfmAOur9WQ==
X-Received: by 2002:a1c:6a17:0:b0:401:db82:3edf with SMTP id
 f23-20020a1c6a17000000b00401db823edfmr28934481wmc.39.1697455060601; 
 Mon, 16 Oct 2023 04:17:40 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b0032daf848f68sm3114299wrx.59.2023.10.16.04.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 04:17:40 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v5 0/6] target/riscv: Add RISC-V Virtual IRQs and IRQ
 filtering support
Date: Mon, 16 Oct 2023 12:17:30 +0100
Message-Id: <20231016111736.28721-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

[0]: https://github.com/riscv/riscv-aia/releases/download/1.0/riscv-interrupts-1.0.pdf
[1]: https://github.com/rajnesh-kanwal/opensbi/tree/dev/rkanwal/irq_filter
[2]: https://github.com/rajnesh-kanwal/linux/commits/dev/rkanwal/aia_irq_filter
[3]: https://github.com/rajnesh-kanwal/qemu/tree/dev/rkanwal/riscv_irq_filter

v5:
 * Rebased the patches onto alister/riscv-to-apply.next again. Updated
   version_id and minimum_version_id in vmstate_riscv_cpu and
   vmstate_hyper. Also updated AIA spec links.

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
 target/riscv/machine.c     |  14 +-
 target/riscv/tcg/tcg-cpu.c |   7 +-
 7 files changed, 551 insertions(+), 79 deletions(-)

-- 
2.34.1


