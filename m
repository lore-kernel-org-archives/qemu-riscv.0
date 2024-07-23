Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE86C3DA49
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 23:32:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWOy0-0002UB-9E; Tue, 23 Jul 2024 19:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxb-00021A-4F
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:30 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxX-0007nH-N6
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2cb56c2c30eso240184a91.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2024 16:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721777416; x=1722382216;
 darn=nongnu.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZYtvWIWffeCzO8gyqSVBrafcootcHr9h+/uyygseIFk=;
 b=CC7eAc8r78Ftjqc6g80Skmc+dCQ1TZTBfaJDsrDKVFiG8No67D+2dvynNB39FgUyVc
 Wfe6xzeYySq8Yda3BFRDrI2BtbwqzpXvfRs6GQ1lEHR4RlugSt/rQW14rIuW0bt3TU3Z
 6fxC+LqrZ48+qsKx2mf/xFJQkjEelkb+edjgexQFMN1rqhr+xshL5+rOIpc/SQ0iGlvV
 VYiUL9pJDzYWzn6gcOdYFMPLcVYLkEvZnvI1oSUdmFCactudz+BuyUEC765Uyk8w1THg
 A2Ca70fizlyddiJI96ta9tHY949xqfT3aiBefaGU/9/+YQdjWCtXE+oRpZ+iPT/FKWG5
 PRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721777416; x=1722382216;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZYtvWIWffeCzO8gyqSVBrafcootcHr9h+/uyygseIFk=;
 b=tUXuj6UfjmML+v4hEu/UOQpCVvY1flCJpPGGt9liLB1zkDgST5b6n/eMnJ2WFgqy/L
 MV9IRCC4DzuWxtQvknDmYJBjNbMBcAWuQSko3BRpQEW9a+WalIIRjIYxIOANb+rVqgIP
 ucaHShJHln9yCYF1h3Q379dbEXr+1NE7fQ7J4H5Bnbx1474oCA1vGhsCeGRTlzvA9D4w
 6SR3NUnbAVdExoY8W63IbayP7EoajsqsFfzI2X6r53Mfuwl4tzkC8fgzDq0fjW7eAGsT
 QMSDvRqhqtc7TG5wrnf71lcV2Qf/Q2Hb7Jnv0dAs+U8ICstr3VUKE/iHWNRi3MjB4ZJl
 ccNA==
X-Gm-Message-State: AOJu0YyXRWSiuBLYpvQu0RnTdnf0oIhEt5TBAhgY2b/7EcFpn5ZSXHQt
 +XcvPnaQx4+cdHpfJerwXpNWuAetTqT4mO5yzIs6fl1orE7J9d8GU7qaV5Zpk4g=
X-Google-Smtp-Source: AGHT+IH0AUmP327NQ6+21d4rYgZz84KrtER9Y7Nkoi/ho5zShpwk06A8Laus0IP20nX6lqDemAxGCw==
X-Received: by 2002:a17:90b:1d12:b0:2c7:d24b:57f with SMTP id
 98e67ed59e1d1-2cdb9466810mr233814a91.19.1721777415945; 
 Tue, 23 Jul 2024 16:30:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb74e894csm179217a91.41.2024.07.23.16.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 16:30:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 00/13] Add RISC-V Counter delegation ISA extension support
Date: Tue, 23 Jul 2024 16:29:57 -0700
Message-Id: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPU8oGYC/x2MQQqAIBAAvyJ7TjAxhL4SEaabLYSFWgTi35OOA
 zNTIGEkTDCyAhEfSnSGBrJjYHcTPHJyjUEKqYTuB27PO2SMi8MDvclN570wq1JWO2kFtPCKuNH
 7T6e51g8kZku5ZAAAAA==
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1033.google.com
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

This makes the qemu command line quite tedious. In stead of that, I tried to
enable all PMU related extensions of ssccfg is set via newly introduced
preferred rule in last 3 patches. This approach was agreed upon in previous
revision[1] as well.

The first 2 patches decouple the indirect CSR usage from AIA implementation
while patch3 adds stateen bits validation for AIA.
The PATCH4 implements indirect CSR extensions while remaining patches
implement the counter delegation extensions.

The Qemu patches can be found here:
https://github.com/atishp04/qemu/tree/b4/counter_delegation
The Linux kernel patches can be found here (WIP version due to onging upstream
dependant patches):
https://github.com/atishp04/linux/tree/b4/counter_delegation

Changes from previous RFC version:

1. Renamed sxcsrind to csrind to align with other function names.
2. Enable sscofpmf by default for virt machine.
3. Introduced a preferred extension enabling rule strategy for generic
mult-extension dependencies.
4. Enables all PMU related extensions if ssccfg extension is set. 

RFC Link:
https://lore.kernel.org/all/35a4d40c-9d0d-4a0a-a2c9-5d5f7def9b9c@ventanamicro.com/T/

[1] https://github.com/riscv/riscv-indirect-csr-access
[2] https://github.com/riscv/riscv-smcdeleg-ssccfg

Cc: kaiwenxue1@gmail.com

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (7):
      target/riscv: Enable S*stateen bits for AIA
      target/riscv: Add configuration for S[m|s]csrind, Smcdeleg/Ssccfg
      target/riscv: Invoke pmu init after feature enable
      target/riscv: Enable sscofpmf for bare cpu by default
      target/riscv: Repurpose the implied rule startergy
      target/riscv: Add a preferred ISA extension rule
      target/riscv: Enable PMU related extensions to preferred rule

Kaiwen Xue (6):
      target/riscv: Add properties for Indirect CSR Access extension
      target/riscv: Decouple AIA processing from xiselect and xireg
      target/riscv: Support generic CSR indirect access
      target/riscv: Add counter delegation definitions
      target/riscv: Add select value range check for counter delegation
      target/riscv: Add counter delegation/configuration support

 target/riscv/cpu.c         |  25 ++
 target/riscv/cpu.h         |  18 ++
 target/riscv/cpu_bits.h    |  34 ++-
 target/riscv/cpu_cfg.h     |   4 +
 target/riscv/csr.c         | 726 ++++++++++++++++++++++++++++++++++++++++++---
 target/riscv/machine.c     |   1 +
 target/riscv/tcg/tcg-cpu.c | 109 ++++---
 7 files changed, 845 insertions(+), 72 deletions(-)
---
base-commit: 225d5c7b671d5eaf86bf36d40e7da2d1de2cca84
change-id: 20240715-counter_delegation-10ab44c7d2c0
--
Regards,
Atish patra


