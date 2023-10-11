Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F0BCD6E71
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:47:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqZXp-0004vA-Sl; Wed, 11 Oct 2023 09:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqZWb-0003rW-TZ
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 09:45:22 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqZWN-0001UT-Ai
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 09:45:21 -0400
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-32d834ec222so860182f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697031903; x=1697636703;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cfIKZYANERAYrk1U9u/ABQRyiAeehioXS/8BTpychyQ=;
 b=fp2VyMlJGTGUlUybo91nkrM+h3YdWdRo66LqIqJ8qq/8kBVrUFjqmSJOCzX4HaPrw4
 Tyo54tOzv4Wms2NgqKEQ2oa6e3K0ZDTcd6cy6fkXfyjfNIRly7FsVxVP34a8JMV84kVc
 nZcjxmYK0rCxTOl7UYAnxtE77Qv0/BpNHCe3J4JwEVRJVE7Oze5JG288P2WSG5dvZR4z
 DfnyRHYy4+NimD6Cvu4Yd2YdpxZn1IFCgKBTmMwBr9bXlgYrB0aJDVGWyY8n/W2DdRWx
 08iyAjWAXv1E6hWLQDlcxyCO5DRwq/kqqxs/5xYsPguONK80aDWBmAb4HS9Dr/Y6RX06
 kHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697031903; x=1697636703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfIKZYANERAYrk1U9u/ABQRyiAeehioXS/8BTpychyQ=;
 b=tT+pOmCPZkcGOliw4wPdjJVKiNz3NZh9gFbclAIZdk5TLDx+rqNiQYROCxgbB2kD8G
 +9jL5XOPRpDxqtSgDnkozEO0wtywaa2WUpInWiENXRzwCxKK4PDePO1hALgCKjdib87g
 FOsqQld148GfRpQ0Rnyq+AypwhbaQdTp5Fow3KgOv2IrsPOsGAQdIQR76+VntYGWYZmJ
 I0cvRHrtWy107xaQqWscMnAX7m+VRekjj/kMWVnUsd7Ty7NoqedwBVI47jl0uQ4zz5Ho
 F0kkJQ5T+n3S6V6Aeg4FSRjpWCKYsL2/dPOsKQt3eBVqH4juEtXaLA3QLLD8IIpU0LPB
 789g==
X-Gm-Message-State: AOJu0YxzI3dYuXC+RibaKnnYoCZdnF73aFgg4xYHA87KGsvl1iEaI/fR
 D2Id1EpkB2NmoMWdpMF8O5npFf1bQsM4Lj03f84crA06
X-Google-Smtp-Source: AGHT+IG4w+2Ll2aHhYCxI6V8Hu3osnbQKeaZqw8IhJ4+CmAlzDwdVhSBegBkQX9uPlnHsyrMQOxO0g==
X-Received: by 2002:a5d:58db:0:b0:32d:80e:689c with SMTP id
 o27-20020a5d58db000000b0032d080e689cmr3904403wrf.39.1697031903284; 
 Wed, 11 Oct 2023 06:45:03 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.ba.rivosinc.com
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm15583141wru.35.2023.10.11.06.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 06:45:02 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v3 0/6] target/riscv: Add RISC-V Virtual IRQs and IRQ
 filtering support
Date: Wed, 11 Oct 2023 14:44:44 +0100
Message-Id: <20231011134450.117629-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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

[0]: https://github.com/riscv/riscv-aia/releases/download/1.0-RC4/riscv-interrupts-1.0-RC4.pdf
[1]: https://github.com/rajnesh-kanwal/opensbi/tree/dev/rkanwal/irq_filter
[2]: https://github.com/rajnesh-kanwal/linux/commits/dev/rkanwal/aia_irq_filter
[3]: https://github.com/rajnesh-kanwal/qemu/tree/dev/rkanwal/riscv_irq_filter

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

 target/riscv/cpu.c        |  11 +-
 target/riscv/cpu.h        |  23 ++
 target/riscv/cpu_bits.h   |   6 +
 target/riscv/cpu_helper.c |  99 +++++---
 target/riscv/csr.c        | 477 ++++++++++++++++++++++++++++++++++----
 target/riscv/machine.c    |   6 +
 6 files changed, 547 insertions(+), 75 deletions(-)

-- 
2.34.1


