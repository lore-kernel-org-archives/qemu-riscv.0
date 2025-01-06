Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE6EE77188
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 05:44:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tUftz-0003hA-RU; Mon, 06 Jan 2025 00:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tUftx-0003gH-QR
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2025 00:43:45 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tUftv-0004H0-Tb
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2025 00:43:45 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2f4409fc8fdso17084587a91.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Jan 2025 21:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1736142222; x=1736747022; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2X5nWtoBDHcCOAv2YoYn8p6BiXBTm5yBQ3TPvY8bqA=;
 b=HlOPW+vIrUUqA3/wvaolZGzv8IZ9Tr6kRdAuWcLKiJ/SuCslfYFEo6+2kdKC8YSIPv
 3pniCqgnErCTcW57RRY7jYAo88jBE3c/u0IHzhx2I4vnZ36MiW01/bf2/9g/dapkNcwB
 JoWmUdGVIUgDLJqFV2sITEf/pXnBUhlKhWIapXpvTqt/S75CkrAj1MsiRAmKGt0ztiMQ
 A37TWK7yu7YwkOlrllisFowlToh89p8FCfZkQ1tWSMqiQ4//j8cGfkksypRj6u76CfKu
 tiUAk5tVk9chKnr+RPBL0HPmb7lzmIr3zV2P8n/bcSxrVfjF9krdrIDR1BZxuIVDR3ml
 3o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736142222; x=1736747022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z2X5nWtoBDHcCOAv2YoYn8p6BiXBTm5yBQ3TPvY8bqA=;
 b=ZUHRmcLG2aGMa8xELQnZvMoGl45ag1OJmjD32zUQYXZQMjuBsxyQSd4+FAB+SexsnU
 NSrUfRi+MFS4rufX+6GZJhDacWJc6mhPhi7K/M1Zao3/RSEwXVh4CozgG9GBWia2dGae
 /zQiymsWxEtSmx1gPubBX/Web7hBar2Pr5ltwk5z76CfV+CCDDQpXgM9I9cetSw2X2mM
 XiQzxHA0cQbHuSBDx7vd8+qELREtwMVOvjOFLCj20N7+wZhwO/C19l4EN74uv2JtUaKr
 PRt3pzF/6qA/1qoLU0rpPh1KXIKbuNpREz/QYQsxJUGxwtXbMpa7DANEK2hKBUrtMj4l
 I6RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd7jPIxQCEQ8K3G0dR7aNFKepkkMI5zQEtOO28R8KUiyg/xTXG5l8Jqd3i1KSlnSmND0nzMEWfCOQx@nongnu.org
X-Gm-Message-State: AOJu0YxaycvVy6sjG6wNr/SoYeip3YHB3Kf7IfpZdY7em/lblb+IWadp
 EKdQR3ehjtbjw1pZpfidPcr+iy1eED/Hdq95NB8n9J+jnnmvGj4n+NqlNWGwpWA=
X-Gm-Gg: ASbGncuP901883qqSsYqhzsqrPKE9YAeHogv0FQZomGVckHRZK9W2MwC86ApGJtPirb
 bU08rQPW90d/uP1gfXJpCoos3iGo05ifqYe3yBwyNF/d32mqwXs4INNwaH3hpdJZX8YA99F2uDS
 lD4lDBK6+3ugvgIMjgAJo71rVvfBzTUiKMwHc3TC5V5+iBd15oPIIVmdV6F+sXap4VZv9plmTYp
 M1uje3YHww/PbARLzrYXqHhBVpGFoUga46HSd6hw8197gKDmNFLrdf26m581cMnyRXSHCz2eMY8
 LhYoA0mcKB8=
X-Google-Smtp-Source: AGHT+IGK1BRrOVzvgCNi8MHimmjFCEhyxQM9n2mSCDpbT3aD2WeoBanODzIA1WBiwtMwMJgrSiri0A==
X-Received: by 2002:a17:90b:2651:b0:2ef:2980:4411 with SMTP id
 98e67ed59e1d1-2f443607d7cmr91122271a91.9.1736142221789; 
 Sun, 05 Jan 2025 21:43:41 -0800 (PST)
Received: from fchang-1826.internal.sifive.com ([210.176.154.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc96eac6sm285722215ad.80.2025.01.05.21.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 21:43:41 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v12 0/6] Add Smrnmi support
Date: Mon,  6 Jan 2025 13:43:30 +0800
Message-Id: <20250106054336.1878291-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
[2] https://github.com/sifive/qemu/tree/upstream-smrnmi-v12
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

v12
  * Replace TARGET_LONG_BITS with MXL.
  * Add log to inform user that Smrnmi is disabled in the 'max' type CPU.
  * Rebase to riscv-to-apply.next.

v11
  * Squash patch 7 into patch 5.
  * Remove "DEFINE_PROP_END_OF_LIST()" from "riscv_harts_props[]" for
    the upcoming "DEFINE_PROP_END_OF_LIST()" removal.

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

Frank Chang (1):
  target/riscv: Add Zicfilp support for Smrnmi

Tommy Wu (5):
  target/riscv: Add 'ext_smrnmi' in the RISCVCPUConfig
  target/riscv: Add Smrnmi CSRs
  target/riscv: Handle Smrnmi interrupt and exception
  target/riscv: Add Smrnmi mnret instruction
  target/riscv: Add Smrnmi cpu extension

 hw/riscv/riscv_hart.c                         | 41 ++++++++
 include/hw/riscv/riscv_hart.h                 |  4 +
 target/riscv/cpu.c                            | 18 ++++
 target/riscv/cpu.h                            | 10 ++
 target/riscv/cpu_bits.h                       | 24 +++++
 target/riscv/cpu_cfg.h                        |  1 +
 target/riscv/cpu_helper.c                     | 99 +++++++++++++++++--
 target/riscv/csr.c                            | 82 +++++++++++++++
 target/riscv/helper.h                         |  1 +
 target/riscv/insn32.decode                    |  3 +
 .../riscv/insn_trans/trans_privileged.c.inc   | 20 ++++
 target/riscv/op_helper.c                      | 54 +++++++++-
 target/riscv/tcg/tcg-cpu.c                    |  9 ++
 13 files changed, 353 insertions(+), 13 deletions(-)

--
2.34.1


