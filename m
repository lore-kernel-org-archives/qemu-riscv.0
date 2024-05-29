Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1FAC25B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 May 2024 16:11:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sCLsU-0000uz-7K; Wed, 29 May 2024 12:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1sCLsO-0000ra-Kz
 for qemu-riscv@nongnu.org; Wed, 29 May 2024 12:10:08 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1sCLsB-0003Lu-U1
 for qemu-riscv@nongnu.org; Wed, 29 May 2024 12:10:08 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35b6467754cso1384492f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 29 May 2024 09:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716998993; x=1717603793;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vvweq7JDSqVgyJdFSVmnrbu+6/IoB9lh90OgmJ3I8bk=;
 b=L/3El/HxusjY0e7qGnwsLwvQVEILrlwDLr9Vnci7hQ3kDZzw0dcL+sPE8GF4yfUcyR
 q6Pbbb2BBnevoQr1QF2l+VKv/HTg5uXAmImLq+rbt96qncnIMUwefy3Nhs3FsAQCbw+o
 JGDM17hW0heGuGLwIAfifyxBWt4EdWQuRmt+rPIKt5BySF7Zbd4vdR1SEEfeeaWbcSdw
 6Nu3+hma5NCVrNbHCCMR17G1DyFQTKD8zcyWFZbwDXOwQODTApnEehBmap5Iy2SYNIzv
 Um/IFcKSsEHTV3wYPYGpZ64O+Dcu7UTpjs6Xfjh0J45B3FK/KE48vtcAjd3vhX642Rhn
 xOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716998993; x=1717603793;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vvweq7JDSqVgyJdFSVmnrbu+6/IoB9lh90OgmJ3I8bk=;
 b=XGzzhYWmZS2xILPbsl3Iz0+gmZ98fTV2+DJVOylFCvvpNanwfV5TOz/AS1RXyPIN2m
 FSC3SeLC05s99wf/lOZ6MHhAg85J1+KsI1AUG8pW0B8MJZO2CL0rHTWcjuhyP/l161Zv
 EuHHMD1xA5fJ0m7CF9pMjvBSCVc+lAX15YCtSYLOOa3BiCrAxB+jGokxz+oyDY1Eebsq
 eJ0vga4F6N7BxtxfD8iPbHnVRMM0QtOOPzWG2c9V8dtdI4JVhtBCCsPnlWi9wVgG2+3O
 SBQj6XmI+FpgOHOf768+kHHFdXiUQpWtPZ3GSmTTsT3fFDa/DVqkp8asLv4DRDkHHzD1
 sSVw==
X-Gm-Message-State: AOJu0Yy4jf7H8smPWU0EcEj+MBXV8BIDRkcozWXaiO7k7+N2gh9PuIyq
 lyz2mB+dPDk2dCqt7LCqQCOp/B1KhYK3VwRV30F5YNpSgLay+p4O2ydBEKXRcqZp4JlCkAgg0pM
 S
X-Google-Smtp-Source: AGHT+IGldXWcQkSzsZ8Hi3ls2CQzKyQ78nQAILrZKuH29RZZHKI0vziZl1Pv/BfcGwCouA4Y8qgoGg==
X-Received: by 2002:adf:ed8f:0:b0:354:ddb8:b5e3 with SMTP id
 ffacd0b85a97d-35526c15a10mr10183350f8f.11.1716998993557; 
 Wed, 29 May 2024 09:09:53 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.Home
 ([2a02:c7c:7527:ee00:7446:71c1:a41a:da9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557dcf0740sm15228213f8f.107.2024.05.29.09.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 09:09:53 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, rkanwal@rivosinc.com,
 beeman@rivosinc.com, tech-control-transfer-records@lists.riscv.org
Subject: [PATCH 0/6] target/riscv: Add support for Control Transfer Records
 Ext. 
Date: Wed, 29 May 2024 17:09:44 +0100
Message-Id: <20240529160950.132754-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This series enables Control Transfer Records extension support on riscv
platform. This extension is similar to Arch LBR in x86 and BRBE in ARM.
The Extension has been stable and the latest release can be found here [0] 

CTR extension depends on couple of other extensions:

1. S[m|s]csrind : The indirect CSR extension [1] which defines additional
   ([M|S|VS]IREG2-[M|S|VS]IREG6) register to address size limitation of
   RISC-V CSR address space. CTR access ctrsource, ctrtartget and ctrdata
   CSRs using sscsrind extension.

2. Smstateen: The mstateen bit[54] controls the access to the CTR ext to
   S-mode.

3. Sscofpmf: Counter overflow and privilege mode filtering. [2] 

The series is based on Smcdeleg/Ssccfg counter delegation extension [3]
patches. CTR itself doesn't depend on counter delegation support. This
rebase is basically to include the Smcsrind patches.

Due to the dependency of these extensions, the following extensions must be
enabled to use the control transfer records feature.

"smstateen=true,sscofpmf=true,smcsrind=true,sscsrind=true,smctr=true,ssctr=true" 

Here is the link to a quick guide [5] to setup and run a basic perf demo on
Linux to use CTR Ext.

The Qemu patches can be found here:
https://github.com/rajnesh-kanwal/qemu/tree/ctr_upstream

The opensbi patch can be found here:
https://github.com/rajnesh-kanwal/opensbi/tree/ctr_upstream

The Linux kernel patches can be found here:
https://github.com/rajnesh-kanwal/linux/tree/ctr_upstream

[0]: https://github.com/riscv/riscv-control-transfer-records/release
[1]: https://github.com/riscv/riscv-indirect-csr-access
[2]: https://github.com/riscvarchive/riscv-count-overflow/tree/main
[3]: https://github.com/riscv/riscv-smcdeleg-ssccfg
[4]: https://lore.kernel.org/all/20240217000134.3634191-1-atishp@rivosinc.com/
[5]: https://github.com/rajnesh-kanwal/linux/wiki/Running-CTR-basic-demo-on-QEMU-RISC%E2%80%90V-Virt-machine

Rajnesh Kanwal (6):
  target/riscv: Remove obsolete sfence.vm instruction
  target/riscv: Add Control Transfer Records CSR definitions.
  target/riscv: Add support for Control Transfer Records extension CSRs.
  target/riscv: Add support to record CTR entries.
  target/riscv: Add CTR sctrclr instruction.
  target/riscv: Add support to access ctrsource, ctrtarget, ctrdata
    regs.

 target/riscv/cpu.c                            |   4 +
 target/riscv/cpu.h                            |  14 +
 target/riscv/cpu_bits.h                       | 154 +++++++++
 target/riscv/cpu_cfg.h                        |   2 +
 target/riscv/cpu_helper.c                     | 213 ++++++++++++
 target/riscv/csr.c                            | 312 +++++++++++++++++-
 target/riscv/helper.h                         |   8 +-
 target/riscv/insn32.decode                    |   2 +-
 .../riscv/insn_trans/trans_privileged.c.inc   |  21 +-
 target/riscv/insn_trans/trans_rvi.c.inc       |  27 ++
 target/riscv/op_helper.c                      | 117 ++++++-
 target/riscv/translate.c                      |   9 +
 12 files changed, 870 insertions(+), 13 deletions(-)

-- 
2.34.1


