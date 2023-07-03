Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B7FC001B3
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:34:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOL8-0007Zd-6y; Mon, 03 Jul 2023 14:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOL5-0007Z9-Se
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:31:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOL1-000070-Sj
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:31:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31297125334so4095115f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409109; x=1691001109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MnDJGuJyd7hy6IfHuJQpgiX6kirrk5oLgIqP4WgR1ls=;
 b=gEm4cpDrD3c1t4Nku/wH3DSWqoJYBY8rXsG6uve0H6hqmkTAHZilGfKJR8tLCp98RO
 W2PfW/L52q9exJkigW9f8M3dXkoHTwH4iiZVbTLi7gaC1r4mXQDF5dbWTzWlEFkFx7xP
 dI/2v8X8dMzLVCJ8vC2nNon2r+AICrhf9DwTDEElP1I/qBoYtGULXDNtU8RzJ03eCCbv
 PLMpJZGU5hkNmVg1ffcmTKb8Go8arRbJUYOgKn7a7r++IvgEFmMQ/AJ12Urp0wXCFCYg
 2Fs6BPstdIauuoLAeh16rokGJ0CElfOhkHh9MiJv1C64n4ipcTlrAILbWL/wLwfjQyqM
 //8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409109; x=1691001109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MnDJGuJyd7hy6IfHuJQpgiX6kirrk5oLgIqP4WgR1ls=;
 b=brfxJzjvhR+UpEjxUIGG+5ZwgMz6FpfhSddcEHfIK/GHTzPeXpXqb1pfEaKNUHyKFf
 JB6T4iAQHWHpR+AOeuCQDzrDnhOCgKoFugfz5U9jp+w9k3hJVb+uXo97MzUsQRqFSc4P
 oDWdicl/swsxSuh0R8ynW2QyU1hAaMzZSNi1xltnAK+WQc/TQ5h31ooIh3JBdcz8JOft
 w31TEJ5tr3Nm8NvtTlfQFdsGafgLp7S6Efn/sY0ud+kuCgeEqaV6+8GyzT5nWf9A5cC/
 wVRJqFghs7aTEAZ9Tq/9EB+lY13t/cndjnNHzHHHQcS2wKKaFcllvLfBL1CsjKi+3x33
 i7uw==
X-Gm-Message-State: AC+VfDwALZ/M7GwIJUUomVio3XGCo78B2uk93LOH+FRQUscRgG3WVMtW
 stnu9RWovWaRsq/CbinKFnXn+w==
X-Google-Smtp-Source: ACHHUZ7YmFH6Jzw1OE18FZ5zHqnPjrQ1t77qrBJiI/Vjn6V6i/AusMhLJViSj8AKo6q+Hhx797kODg==
X-Received: by 2002:adf:e3c9:0:b0:313:ef28:d3d6 with SMTP id
 k9-20020adfe3c9000000b00313ef28d3d6mr14384299wrm.6.1688409108711; 
 Mon, 03 Jul 2023 11:31:48 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f9b24cf881sm30498831wma.16.2023.07.03.11.31.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:31:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 00/16] target/riscv: Allow building without TCG (KVM-only
 so far)
Date: Mon,  3 Jul 2023 20:31:29 +0200
Message-Id: <20230703183145.24779-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v2: Rebased on alistair23/riscv-to-apply.next

Patch #1-#5 reviewed.

Philippe Mathieu-Daudé (16):
  target/riscv: Remove unuseful KVM stubs
  target/riscv: Remove unused 'instmap.h' header in translate.c
  target/riscv: Restrict sysemu specific header to user emulation
  target/riscv: Restrict 'rv128' machine to TCG accelerator
  target/riscv: Move sysemu-specific files to target/riscv/sysemu/
  target/riscv: Restrict riscv_cpu_do_interrupt() to sysemu
  target/riscv: Move TCG-specific files to target/riscv/tcg/
  target/riscv: Move TCG-specific cpu_get_tb_cpu_state() to tcg/cpu.c
  target/riscv: Expose some 'trigger' prototypes from debug.c
  target/riscv: Extract TCG-specific code from debug.c
  target/riscv: Move sysemu-specific debug files to target/riscv/sysemu/
  target/riscv: Expose riscv_cpu_pending_to_irq() from cpu_helper.c
  target/riscv: Move TCG/sysemu-specific code to tcg/sysemu/cpu_helper.c
  target/riscv: Move sysemu-specific code to sysemu/cpu_helper.c
  target/riscv: Restrict TCG-specific prototype declarations
  gitlab-ci.d/crossbuilds: Add KVM riscv64 cross-build jobs

 target/riscv/cpu.h                            |   27 +-
 target/riscv/internals.h                      |    4 +
 target/riscv/{ => sysemu}/debug.h             |    6 +
 target/riscv/{ => sysemu}/instmap.h           |    0
 target/riscv/{ => sysemu}/kvm_riscv.h         |    0
 target/riscv/{ => sysemu}/pmp.h               |    0
 target/riscv/{ => sysemu}/pmu.h               |    0
 target/riscv/{ => sysemu}/time_helper.h       |    0
 target/riscv/{ => tcg}/XVentanaCondOps.decode |    0
 target/riscv/{ => tcg}/insn16.decode          |    0
 target/riscv/{ => tcg}/insn32.decode          |    0
 target/riscv/{ => tcg}/xthead.decode          |    0
 hw/riscv/virt.c                               |    2 +-
 target/riscv/cpu.c                            |   33 +-
 target/riscv/cpu_helper.c                     | 1692 +----------------
 target/riscv/csr.c                            |    6 +-
 target/riscv/{ => sysemu}/arch_dump.c         |    0
 target/riscv/sysemu/cpu_helper.c              |  863 +++++++++
 target/riscv/{ => sysemu}/debug.c             |  153 +-
 target/riscv/{ => sysemu}/kvm-stub.c          |    0
 target/riscv/{ => sysemu}/kvm.c               |    4 +-
 target/riscv/{ => sysemu}/machine.c           |    0
 target/riscv/{ => sysemu}/monitor.c           |    0
 target/riscv/{ => sysemu}/pmp.c               |    0
 target/riscv/{ => sysemu}/pmu.c               |    0
 target/riscv/{ => sysemu}/riscv-qmp-cmds.c    |    0
 target/riscv/{ => sysemu}/time_helper.c       |    0
 target/riscv/{ => tcg}/bitmanip_helper.c      |    0
 target/riscv/tcg/cpu.c                        |   98 +
 target/riscv/{ => tcg}/crypto_helper.c        |    0
 target/riscv/{ => tcg}/fpu_helper.c           |    0
 target/riscv/{ => tcg}/m128_helper.c          |    0
 target/riscv/{ => tcg}/op_helper.c            |    0
 target/riscv/tcg/sysemu/cpu_helper.c          |  765 ++++++++
 target/riscv/tcg/sysemu/debug.c               |  165 ++
 target/riscv/tcg/tcg-stub.c                   |   31 +
 target/riscv/{ => tcg}/translate.c            |    1 -
 target/riscv/{ => tcg}/vector_helper.c        |    0
 target/riscv/{ => tcg}/zce_helper.c           |    0
 .gitlab-ci.d/crossbuilds.yml                  |    8 +
 target/riscv/meson.build                      |   33 +-
 target/riscv/sysemu/meson.build               |   13 +
 target/riscv/tcg/meson.build                  |   22 +
 target/riscv/tcg/sysemu/meson.build           |    4 +
 44 files changed, 2037 insertions(+), 1893 deletions(-)
 rename target/riscv/{ => sysemu}/debug.h (96%)
 rename target/riscv/{ => sysemu}/instmap.h (100%)
 rename target/riscv/{ => sysemu}/kvm_riscv.h (100%)
 rename target/riscv/{ => sysemu}/pmp.h (100%)
 rename target/riscv/{ => sysemu}/pmu.h (100%)
 rename target/riscv/{ => sysemu}/time_helper.h (100%)
 rename target/riscv/{ => tcg}/XVentanaCondOps.decode (100%)
 rename target/riscv/{ => tcg}/insn16.decode (100%)
 rename target/riscv/{ => tcg}/insn32.decode (100%)
 rename target/riscv/{ => tcg}/xthead.decode (100%)
 rename target/riscv/{ => sysemu}/arch_dump.c (100%)
 create mode 100644 target/riscv/sysemu/cpu_helper.c
 rename target/riscv/{ => sysemu}/debug.c (83%)
 rename target/riscv/{ => sysemu}/kvm-stub.c (100%)
 rename target/riscv/{ => sysemu}/kvm.c (99%)
 rename target/riscv/{ => sysemu}/machine.c (100%)
 rename target/riscv/{ => sysemu}/monitor.c (100%)
 rename target/riscv/{ => sysemu}/pmp.c (100%)
 rename target/riscv/{ => sysemu}/pmu.c (100%)
 rename target/riscv/{ => sysemu}/riscv-qmp-cmds.c (100%)
 rename target/riscv/{ => sysemu}/time_helper.c (100%)
 rename target/riscv/{ => tcg}/bitmanip_helper.c (100%)
 create mode 100644 target/riscv/tcg/cpu.c
 rename target/riscv/{ => tcg}/crypto_helper.c (100%)
 rename target/riscv/{ => tcg}/fpu_helper.c (100%)
 rename target/riscv/{ => tcg}/m128_helper.c (100%)
 rename target/riscv/{ => tcg}/op_helper.c (100%)
 create mode 100644 target/riscv/tcg/sysemu/cpu_helper.c
 create mode 100644 target/riscv/tcg/sysemu/debug.c
 create mode 100644 target/riscv/tcg/tcg-stub.c
 rename target/riscv/{ => tcg}/translate.c (99%)
 rename target/riscv/{ => tcg}/vector_helper.c (100%)
 rename target/riscv/{ => tcg}/zce_helper.c (100%)
 create mode 100644 target/riscv/sysemu/meson.build
 create mode 100644 target/riscv/tcg/meson.build
 create mode 100644 target/riscv/tcg/sysemu/meson.build

-- 
2.38.1


