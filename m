Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DF5E77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:22:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWAHB-0000KI-GZ; Fri, 10 Jan 2025 03:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAHA-0000K0-7z
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:21:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAH7-0008K2-Qm
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:21:51 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2165448243fso32679625ad.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 00:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736497307; x=1737102107;
 darn=nongnu.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ALhJb02G3eiED+UG3eg9wfCmQxsdMnkumddY5RB/D6c=;
 b=mirZOpWZvm21mMLXyK47/aBtwEDrp8x2Wx/z/bCL7wdVD8VJw+qaSIfV0HpMFoM67n
 araCCPRBq2ucngrMY9UaWa2yc4QlYjZzquE8Fs+X8aY1Wxiqog4mIhTQS2OFJ8otmd5N
 krfzsX/Fbhhd7w14SWNa+h08NZ1wb9vuduiyQO8o/O4+sZ6kSOwmVA5dQFQS6QW/0PRY
 ntS9Bh8WDHbtqKo+QSUtJY2FPx3ZWKPCSBi0X9Odx3EUwbe7YYX/eDeLTtbJSzPo4pDH
 Y14y7ACY25wcloAKH6dFIwituY7+pMQ8V5LZW4lhmzBEsMKkTfUSeZNUECyuSNJKzXg9
 e1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736497307; x=1737102107;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ALhJb02G3eiED+UG3eg9wfCmQxsdMnkumddY5RB/D6c=;
 b=NbJa+yMZv0yBi8fChxWqzKEcj7A5ad5lOK6WYgDGnWlKwocspuDnoGHUOML7hX+XfK
 ZpayObWQRB5jZNeob+rVLZ9d3Kg4O4kJ+5eytGvuXAV7nOUa7h2NAYnBxeHYXHNBfqo5
 oDYSIRS7jmtveAgzK3hYpyVbCCkmX0NZ8goXt6c9nIc69AqTUGA2yjRGaKB+k2OnvT99
 xccROvE3aXUvhwEg28C4Djt6wD5nEKzFWemTA+qwfA0PS3eXRWJlhED+8R15H084+R0a
 a0QTZJhVmSWtX53qgHcaH4xzim/qOP4Raa+TgJEUsbc2v+4W3U1ejmu8fYWUSRoXpZ3h
 KLkg==
X-Gm-Message-State: AOJu0YzlzXRAp8QYnEXsQDS7BX3X0F7r1ZYkl9GXzgpR8ruA4mNvypHV
 se7ScizQsS2ertCUxY1/JJSddqrt8t7+1YjB7qdv7IFYvCNBPHODa3u6GQ1JkSk=
X-Gm-Gg: ASbGnctTSTDlfg2sUKR1ZqjL1DM4adYybHirElnDb2iqOLDd0zw9VLsc1T68+ZxaBUn
 /jNw0CXaJckeli0zgvIOSc3VDCiKSuy5bMGXsdyNqhwSUSJAUnI3o+DkucZrC9uHMYAilvs2Fu4
 f+WeamX6LWc0eeXe6A0KBWVQjNuIJgF2SYDENIl8SKLFheOjQDXhy/o+Wfit5ztITSRHjXMKHib
 2mJZA47HrB+5YoRR1Dgbt4rFOwTx40hk5iK4rCMmLvDjtNJNYE6ID2y9VLMDbpJI1u36w==
X-Google-Smtp-Source: AGHT+IEfTPATySM3421zYv8We0ZhL+Rfu75LdLyqpJe8c4md9ynKC/wNeDLBtf3VHdsHfSS02QYuAA==
X-Received: by 2002:a17:902:e852:b0:216:6be9:fd57 with SMTP id
 d9443c01a7336-21a83f57028mr155092255ad.21.1736497307576; 
 Fri, 10 Jan 2025 00:21:47 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f22ee09sm9278715ad.200.2025.01.10.00.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 00:21:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v5 00/11] Add RISC-V Counter delegation ISA extension support
Date: Fri, 10 Jan 2025 00:21:28 -0800
Message-Id: <20250110-counter_delegation-v5-0-e83d797ae294@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjYgGcC/23OTQrCMBAF4KtI1kby16a68h4ikk6mbUAbSWpQS
 u9uWkRBunzDzDdvJBGDw0gOm5EETC463+dQbDcEOtO3SJ3NmQgmFNO8oOAf/YDhYvGKrRnyOuX
 M1EqBtgIYyYf3gI17LujpnHPn4uDDa/mRxDz9cEKucUlQRkFxzUwhVQXmGFzy0fWwA38js5jkV
 +Gc61VFZkXp0paNLFFCtaKonyLYehc1d+HCVPvaoK3KP2WapjfbFP6qQwEAAA==
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62c.google.com
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

This series adds the counter delegation extension support. The counter
delegation ISA extension(Smcdeleg/Ssccfg) actually depends on multiple ISA
extensions.

1. S[m|s]csrind : The indirect CSR extension[1] which defines additional
   5 ([M|S|VS]IREG2-[M|S|VS]IREG6) register to address size limitation of
   RISC-V CSR address space.
2. Smstateen: The stateen bit[60] controls the access to the registers
   indirectly via the above indirect registers.
3. Smcdeleg/Ssccfg: The counter delegation extensions[2]

The counter delegation extension allows Supervisor mode to program the
hpmevent and hpmcounters directly without needing the assistance from the
M-mode via SBI calls. This results in a faster perf profiling and very
few traps. This extension also introduces a scountinhibit CSR which allows
to stop/start any counter directly from the S-mode. As the counter
delegation extension potentially can have more than 100 CSRs, the specificaiton
leverages the indirect CSR extension to save the precious CSR address range.

Due to the dependancy of these extensions, the following extensions must be
enabled to use the counter delegation feature in S-mode.

"smstateen=true,sscofpmf=true,ssccfg=true,smcdeleg=true,smcsrind=true,sscsrind=true"

This makes the qemu command line quite tedious. The previous version, I tried
to introduce a preferred rule to enable all but it was decided that an user
should opt to use max cpu if they don't want to enable all the dependant ISA
extensions by hand. This series got rid of the preferred rule and added 2 
patches for specifiying the mandatory ISA extensions via implied rule. 

The first 2 patches decouple the indirect CSR usage from AIA implementation
while patch3 adds stateen bits validation for AIA.
The PATCH4 implements indirect CSR extensions while remaining patches
implement the counter delegation extensions.

The Qemu patches can be found here:
https://github.com/atishp04/qemu/tree/b4/counter_delegation_v4
The Linux kernel patches can be found here (WIP version due to onging upstream
dependant patches):
https://github.com/atishp04/linux/tree/b4/counter_delegation_v2

[1] https://github.com/riscv/riscv-indirect-csr-access
[2] https://github.com/riscv/riscv-smcdeleg-ssccfg

Cc: kaiwenxue1@gmail.com

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v5:
- Rebased on top of the riscv-to-apply.next 
- Added RB/AB tags.
- Link to v4: https://lore.kernel.org/r/20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com

Changes in v4:
- Fixed the comments recieved on v3. 
- code style comments and removed 1 redundant if else block.
- Link to v3: https://lore.kernel.org/r/20241117-counter_delegation-v3-0-476d6f36e3c8@rivosinc.com

Changes in v3:
1. Updated the priv version in extensions
2. Fixed minor issues pointed out in v2.
3. Dropped preferred rule and added an implied rule for AIA and counter
   delegation.
- Link to v2: https://lore.kernel.org/r/20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com

Changes from previous RFC version:

1. Renamed sxcsrind to csrind to align with other function names.
2. Enable sscofpmf by default for virt machine.
3. Introduced a preferred extension enabling rule strategy for generic
mult-extension dependencies.
4. Enables all PMU related extensions if ssccfg extension is set.

RFC Link:
https://lore.kernel.org/all/35a4d40c-9d0d-4a0a-a2c9-5d5f7def9b9c@ventanamicro.com/T/

---
Atish Patra (5):
      target/riscv: Enable S*stateen bits for AIA
      target/riscv: Add properties for counter delegation ISA extensions
      target/riscv: Invoke pmu init after feature enable
      target/riscv: Add implied rule for counter delegation extensions
      target/riscv: Add configuration for S[m|s]csrind, Smcdeleg/Ssccfg

Kaiwen Xue (6):
      target/riscv: Add properties for Indirect CSR Access extension
      target/riscv: Decouple AIA processing from xiselect and xireg
      target/riscv: Support generic CSR indirect access
      target/riscv: Add counter delegation definitions
      target/riscv: Add select value range check for counter delegation
      target/riscv: Add counter delegation/configuration support

 target/riscv/cpu.c         |  20 +-
 target/riscv/cpu.h         |   1 +
 target/riscv/cpu_bits.h    |  34 ++-
 target/riscv/cpu_cfg.h     |   4 +
 target/riscv/csr.c         | 718 ++++++++++++++++++++++++++++++++++++++++++---
 target/riscv/machine.c     |   1 +
 target/riscv/tcg/tcg-cpu.c |  28 +-
 7 files changed, 753 insertions(+), 53 deletions(-)
---
base-commit: b74e358af21fddb93228c4aed22520950cbe9dd7
change-id: 20240715-counter_delegation-10ab44c7d2c0
--
Regards,
Atish patra


