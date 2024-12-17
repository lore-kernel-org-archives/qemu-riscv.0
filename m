Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A4CE7716A
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 06:26:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNR1G-00030y-47; Tue, 17 Dec 2024 01:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tNR14-0002wk-6d
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 01:25:11 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tNR0y-0004rT-In
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 01:25:09 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-725f4623df7so4245643b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Dec 2024 22:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734416702; x=1735021502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XBZdhaiMoxKZxHX9jMR/nzgRkr9faWbDFQsJShgEOjc=;
 b=eFjFcaQ5636zxbtRWzPGLfu7H1lEvSQGar4pGLO+LZl7js9Fl82CiGrlvWFjlqYtmc
 PcLabD3qmovBpUujoRKj/8mFPRdgR48WL3c7i/DW33Z1208ZB3BmOTbNeBn5lZPQIFzK
 sX6+rSmVB7ok+0DPUa5bSzUcQ4mDbdNFAjLpafYNrbk63htfX9MbJ0ByOxznUYsxb36n
 26lgJy4Yx8NZeZnIfSVTRuGUeqz4Ik+P4V31EWPuOvKcWcXviGIO6OxVSFhZnQ8OzaCx
 D3Veah/pBt9XSal4cJLOvqD7v7ZZUfLPxjXGyvS3LTe7ElCdHYnMz6DM/5lRnLKzy22y
 0+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734416702; x=1735021502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XBZdhaiMoxKZxHX9jMR/nzgRkr9faWbDFQsJShgEOjc=;
 b=VbFhnyxUi8fG90B7LoHjxwsSgYEOYEMCmeyDmNp9/ZsBUsYtFnKht/DFhCb6Di6j15
 PrUsvIA5+mexVP8pFupgLdEZ7n2cw7L22H7cyVLQ8SW74mZIsGTVVUKkcID6/7F79Hed
 02oP9mJHH08qV/b8wXMxZIEKUwcauE1z6Ow8zbyDlm08lmyOuYQm+p1xHg97yGrSGGK0
 3EE4X+UuFvSiYy86vLtb2hFcGrJr7np1JCMOjqRHl3QUiurvIXtu/VzoOXzspXGXPT5t
 X8q2YxFi6UCEifFJRcHW0+eisZPlx+vzgmRLWlY/EHJsZPhGg2YlRyyyjFxviQ5S0vT3
 k9lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl3Hh6P6UJYeHHRhS5leg1fZdc0RuoRB8408M/DR92sDvuo4IEaqAD5itii1J54E6Stav9gme/Voll@nongnu.org
X-Gm-Message-State: AOJu0YyQZSH6kMe3n3xrKHbl1pz+Y8pun5UJ9TzWQzy+hOgo2fC5nXJE
 nMJ5QluTOoeNyq1w/+j5I8b8KRGG637m292toIUgJgjR/h520dvJl2yhggZR/L8=
X-Gm-Gg: ASbGncscBuB5iXjmxXySrNceiyfwvKdxZXmzBAfRRErsx6uXYx9wuEfElp2izupOWwo
 ZWZj7hccgbHMPbXdwU7Q6eKgbh6epmxJpczwBH1rTSAeRbw9GoRA5E2ASZvT1vYZ2bLQtpiNdCm
 4ELEU4cU7bSZydsyvjfeYkexymIscUzhEN9SdupqnR4UwbXtd76JJwSXahXWBKMwa3bMshBIbgB
 x0vBWfSU2Ku3ygndLqYWV+ToUJHI8/x/ZECp76ARPk2J2gchaoJhktMvPHz6+cN36gujh2nhxgb
 VZV2+MEZDjA=
X-Google-Smtp-Source: AGHT+IHh6jHsACOOD/BRR0MrAgKRWQSK8bXVPbR9GBGvKhBlfSBudbGtMBmur55+pFe0uprLPu+6Iw==
X-Received: by 2002:a05:6a20:1589:b0:1db:9367:d018 with SMTP id
 adf61e73a8af0-1e1dfd60c79mr24694748637.20.1734416701579; 
 Mon, 16 Dec 2024 22:25:01 -0800 (PST)
Received: from fchang-1826.internal.sifive.com ([210.176.154.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72925e6e8b1sm4354301b3a.139.2024.12.16.22.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 22:25:01 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v10 0/7] Add Smrnmi support
Date: Tue, 17 Dec 2024 14:24:33 +0800
Message-Id: <20241217062440.884261-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Frank Chang <frank.chang@sifive.com>

This patchset added support for Smrnmi Extension in RISC-V.

There are four new CSRs and one new instruction added to allow NMI to be
resumable in RISC-V, which are:

=============================================================
  * mnscratch (0x740)
  * mnepc     (0x741)
  * mncause   (0x742)
  * mnstatus  (0x744)
=============================================================
  * mnret: To return from RNMI interrupt/exception handler.
=============================================================

RNMI also has higher priority than any other interrupts or exceptions
and cannot be disabled by software.

RNMI may be used to route to other devices such as Bus Error Unit or
Watchdog Timer in the future.

The interrupt/exception trap handler addresses of RNMI are
implementation defined.

If anyone wants to test the patches, we can use the customized OpenSBI[1],
and the customized QEMU[2].

We implemented a PoC RNMI trap handler in the customized OpenSBI.
In the customized QEMU, we use the Smrnmi patches and the patch from
Damien Hedde[3]. The patch from Damien Hedde can be used to inject
the RNMI signal with the qmp command.

[1] https://github.com/TommyWu-fdgkhdkgh/opensbi/tree/dev/twu/master
[2] https://github.com/sifive/qemu/tree/upstream-smrnmi-v10
[3] https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06232.html

Test commands :
$ ./build/qemu-system-riscv64 -M virt -cpu rv64,smrnmi=true,
rnmi-interrupt-vector={Offset of the RNMI handler in the customized
OpenSBI.} -m 4G -smp 2 -serial mon:stdio -serial null -nographic
-bios fw_jump.elf -kernel Image -initrd rootfs.cpio
-qmp unix:/tmp/qmp-sock,server,wait=off

Use qmp command to inject the RNMI.

Assert RNMI:
$ ./scripts/qmp/qmp-shell /tmp/qmp-sock
(QEMU) gpio-set path=/machine/soc0/harts[0] gpio=riscv.cpu.rnmi number=0 value=true

De-assert RNMI:
(QEMU) gpio-set path=/machine/soc0/harts[0] gpio=riscv.cpu.rnmi number=0 value=false

Changelog:

v10
  * Disable Smrnmi for the 'max' type CPU.

v9
  * Add Zicfilp support for Smrnmi.
  * Change the existence checks for 'rnmi-interrupt-vector' and
    'rnmi-exception-vector' to use 'num_rnmi_irqvec' and 'num_rnmi_excpvec'.
  * Add warn_once messages for cases where the user sets
    'rnmi-interrupt-vector' or 'rnmi-exception-vector' property without
    enabling Smrnmi.

v8
  * Set virt to false when trapping to M-mode by RNMI.
  (Thanks to Clément for the suggestions.)

v7
  * Rename 'nmi_execp' to 'nnmi_excep' and refactor RNMI exception
    checking codes.
  (Thanks to Clément for the suggestions.)
  * Add the missing REQUIRE_SMRNMI() check and remove the redundant
    check in 'helper_mnret'.
  * Rebase to riscv-to-apply.next.
  (Thanks to Alistair for the suggestions.)

v6
  * Delete the redundant code in 'riscv_cpu_do_interrupt'.
  (Thank Alvin for the suggestion.)
  * Split the shared code in 'helper_mret' and 'helper_mnret' into a
    helper function 'check_ret_from_m_mode'.
  (Thank Alistair for the suggestion.)

v5
  * Move the patch that adds the Smrnmi extension to the last patch.
  (Thank Alistair for the suggestion.)
  * Implement an M-mode software PoC for this with implemented handlers.
  (Thank Andrew Jones for the suggestion.)
  * Add a commit message to all patches of the series.
  (Thank Andrew Jones for the suggestion.)

v4
  * Fix some coding style issues.
  (Thank Daniel for the suggestions.)

v3
  * Update to the newest version of Smrnmi extension specification.

v2
  * split up the series into more commits for convenience of review.
  * add missing rnmi_irqvec and rnmi_excpvec properties to riscv_harts.

Frank Chang (2):
  target/riscv: Add Zicfilp support for Smrnmi
  target/riscv: Disable Smrnmi for the 'max' type CPU

Tommy Wu (5):
  target/riscv: Add 'ext_smrnmi' in the RISCVCPUConfig
  target/riscv: Add Smrnmi CSRs
  target/riscv: Handle Smrnmi interrupt and exception
  target/riscv: Add Smrnmi mnret instruction
  target/riscv: Add Smrnmi cpu extension

 hw/riscv/riscv_hart.c                         | 40 ++++++++
 include/hw/riscv/riscv_hart.h                 |  4 +
 target/riscv/cpu.c                            | 18 ++++
 target/riscv/cpu.h                            | 10 ++
 target/riscv/cpu_bits.h                       | 24 +++++
 target/riscv/cpu_cfg.h                        |  1 +
 target/riscv/cpu_helper.c                     | 96 +++++++++++++++++--
 target/riscv/csr.c                            | 82 ++++++++++++++++
 target/riscv/helper.h                         |  1 +
 target/riscv/insn32.decode                    |  3 +
 .../riscv/insn_trans/trans_privileged.c.inc   | 20 ++++
 target/riscv/op_helper.c                      | 54 ++++++++++-
 target/riscv/tcg/tcg-cpu.c                    |  6 ++
 13 files changed, 348 insertions(+), 11 deletions(-)

--
2.34.1


