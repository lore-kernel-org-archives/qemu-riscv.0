Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16EBC52D71
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 08:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1scKjm-0005Rn-JX; Fri, 09 Aug 2024 04:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1scKjk-0005QD-Ul
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2024 04:12:37 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1scKji-0006m1-I7
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2024 04:12:36 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1fc47abc040so14138095ad.0
 for <qemu-riscv@nongnu.org>; Fri, 09 Aug 2024 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1723191151; x=1723795951; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ONuT0iwndoVLKLXK6Qk1K1VahDQDZDxCbgNA+zTJ9qQ=;
 b=mHBZd6mQKGXZoZJoHygUSzPo7NMvRKxRxJkF2PxAUXkF3jSvTDUeTokAx1rtCKFJn7
 VYmhs5NMB3ZbQEbVBKKPzCn/WmJONdtPIwUfQJwSh3Bs4bPr+mag8QwcorKnQ5VtiFqW
 xCGWv6SbJzlT1Cn1DCLnOIwZdORFQ7x7xbEuLYzKcD593FNgoi3oi/2VVdhl93TJ5TgT
 GEszwj704MQDiqoi7wJbW2M44xL3e4PBosnTXOhjQwjTHti0qfLM6rROtzk5lh7Mm5rP
 ApCeeCVPwJghjP3AnwVMJaQknNYmDjTRARw10AYqlvHHcfN15efxX+HO9gMRwifu5ZrS
 MNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723191151; x=1723795951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ONuT0iwndoVLKLXK6Qk1K1VahDQDZDxCbgNA+zTJ9qQ=;
 b=mD0V6XOqP2GI6kC3B7BqogLHNhc9yew49QPl/IfuGID5TJYdpCH1kt2Tv8sFoaN6zA
 1cSlHEZMJ98q5qkwJ2D4NJpvSKNnOCLzaG+61FJGfEKk1xgH18Ptpfso+Be4iqF90PaT
 gNdjcqQm0hUxRP6p6U95ZFpG8bhJGACkpaAB/ZcDG6PurmfZjP31/sfMEdlasp4u7eB6
 YSGOAEQf4U9YN4QyyXxhJoCgXhQv/4XN9CRZ9zqWiPHylBeOyhaZUxCd1JF3+G9bCnjT
 LTaLpm01WX5E0f5lMenKORNIwwoeNgBSO0Txx6NBoE/d/+X+GOsQHpnchywoUKN5jZ9e
 VYbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV66Sw5PAN4ujrBgckAmDKQTZudbDeQlM7Rka3eUowZJyO2HGqLpOGZAVLiJ9uThetSLpElEAAxlzsFJnp5tN61oAaZL/E=
X-Gm-Message-State: AOJu0YwhXEJU2o1+y7sXQWBlgddM2ZFfS7kUv/0N0ILR4lKaJlqhGYuO
 ZDQfvzR3Uc91m62XR8ogPc0rvWc0cw9Gq0pU5sBK20mBK1BxUUx7xywTDDWT+j4=
X-Google-Smtp-Source: AGHT+IFJazMt1mQJbctQNvxv1t/ANdhSVcrs//lp0rznByIbZRevbfcmyYrxIBT2y7fMSbz0Y+9uCw==
X-Received: by 2002:a17:902:d4c7:b0:1fc:560b:1456 with SMTP id
 d9443c01a7336-200ae4d1115mr5977865ad.15.1723191151476; 
 Fri, 09 Aug 2024 01:12:31 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff592b6cfbsm136391185ad.306.2024.08.09.01.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:12:30 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v5 0/5] target/riscv: Add Smrnmi support.
Date: Fri,  9 Aug 2024 01:12:22 -0700
Message-Id: <20240809081227.1588508-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=tommy.wu@sifive.com; helo=mail-pl1-x635.google.com
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
[2] https://github.com/TommyWu-fdgkhdkgh/qemu/tree/dev/twu/master
[3] https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06232.html

Test commands :
$ ./build/qemu-system-riscv64 -M virt -cpu rv64,smrnmi=true,
rnmi-interrupt-vector={Offset of the RNMI handler in the customized
OpenSBI.} -m 4G -smp 2 -serial mon:stdio -serial null -nographic
-bios fw_jump.elf -kernel Image -initrd rootfs.cpio
-qmp unix:/tmp/qmp-sock,server,wait=off

Use qmp command to inject the RNMI interrupt.
$ ./scripts/qmp/qmp-shell /tmp/qmp-sock
(QEMU)  gpio-set path=/machine/soc0/harts[0] gpio=riscv.cpu.rnmi
number=0 value=true

(QEMU)  gpio-set path=/machine/soc0/harts[0] gpio=riscv.cpu.rnmi
number=0 value=false

Changelog:

v5
  * Move the patch that adds the Smrnmi extension to the last patch.
  ( Thank Alistair for the suggestion. )
  * Implement an M-mode software PoC for this with implemented handlers.
  ( Thank Andrew Jones for the suggestion. )
  * Add a commit message to all patches of the series.
  ( Thank Andrew Jones for the suggestion. )

v4
  * Fix some coding style issues.
  ( Thank Daniel for the suggestions. )

v3
  * Update to the newest version of Smrnmi extension specification.

v2
  * split up the series into more commits for convenience of review.
  * add missing rnmi_irqvec and rnmi_excpvec properties to riscv_harts.

Tommy Wu (5):
  target/riscv: Add `ext_smrnmi` in the RISCVCPUConfig.
  target/riscv: Handle Smrnmi interrupt and exception.
  target/riscv: Add Smrnmi CSRs.
  target/riscv: Add Smrnmi mnret instruction.
  target/riscv: Add Smrnmi cpu extension.

 hw/riscv/riscv_hart.c                         | 18 ++++
 include/hw/riscv/riscv_hart.h                 |  4 +
 target/riscv/cpu.c                            | 18 ++++
 target/riscv/cpu.h                            | 10 +++
 target/riscv/cpu_bits.h                       | 23 ++++++
 target/riscv/cpu_cfg.h                        |  1 +
 target/riscv/cpu_helper.c                     | 77 ++++++++++++++++-
 target/riscv/csr.c                            | 82 +++++++++++++++++++
 target/riscv/helper.h                         |  1 +
 target/riscv/insn32.decode                    |  3 +
 .../riscv/insn_trans/trans_privileged.c.inc   | 12 +++
 target/riscv/op_helper.c                      | 46 +++++++++++
 12 files changed, 292 insertions(+), 3 deletions(-)

-- 
2.39.3


