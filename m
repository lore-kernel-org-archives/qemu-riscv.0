Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E79C001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 13:46:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWGlW-0004pw-Mm; Wed, 16 Aug 2023 09:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGlN-0004iv-Gz
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:40:42 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGlF-0000fI-DN
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:40:41 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68891000f34so406364b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193210; x=1692798010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q21wFUBTdzz1toaXf+VkWZ8RFW1Ogy6h00eP92hlyR4=;
 b=f4oufeW/Vf+mytzfJfLrP73ipJlPLbdLkgCSt6SNVEg+OH5PQLQaobFJnCULgA9Mbh
 vjwxCITRptstcE7FnMCWFNgeJ9YWTLNtHJ3NR9O7yrYsrFcTyEiMMM+D+rjVi+s4I+h9
 YA/Ydlz5slg6GPGvgufrOZ7HR7N4NL3f08f/LwjyJ+Ui0G8YUYWAYCTBKz5XjLsi7f27
 00szxW7itinsC6hWwGwCTM3uwhjTPO209DInOqI7X+pwYjfDlmsUPzk0bPSPxF97bL8h
 tj6YCaZjWGemSmASnqMw05kKPSWsGgf6JSiJqSLK+Nz/Iwx8B0CX21crBbwUZNvoxLFG
 vTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692193210; x=1692798010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q21wFUBTdzz1toaXf+VkWZ8RFW1Ogy6h00eP92hlyR4=;
 b=XMffpekYO+mHoUyEm2X35KCpzh1fUTrwR3RXUcCVKuf/DGacFCb6ehH4vnnIKmdTKa
 87asN3F6gsPCcSdFScc+ZOZC/EpDW4IlTrJOg0CV7T9HLeA/3FgVCGVXSkkhD94T/UeH
 XXAPXyCTJEEgrym9IN7nPNAqs1HBAk2kOkbozNjDh8TKv/O7Ojn0BtcsQxJgX/fBuVDj
 g3Y0OLMvIFVrlWnHTHOobZ5c37y7CenUzhy5xMLKJ2VciT2ivpK0jigalHFfifUWBaGk
 GDfduwta4y49czuOOjsN9T7RQ263m/IAZZpT6+oYKVwHU1o6XYYRyLtjP2lOZZazEeu/
 5EdA==
X-Gm-Message-State: AOJu0YxM7yzsnNuDPSHiRPXX2+jnN/s/fGm8uhqOoLZyT41ggbK8dgyp
 JMx17T1wfdpOaicfdTBldiUS8Q==
X-Google-Smtp-Source: AGHT+IH/lpuT4+iZB+Nkasgh73RbF+jZYjWwFp0DV8ASqVErIyFmoKEXP1T9SRp8+yZROV2ClG1fYg==
X-Received: by 2002:a05:6a00:c89:b0:682:2e99:9de0 with SMTP id
 a9-20020a056a000c8900b006822e999de0mr2164929pfv.23.1692193209148; 
 Wed, 16 Aug 2023 06:40:09 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 06:40:08 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 00/25] plugins: Allow to read registers
Date: Wed, 16 Aug 2023 22:39:10 +0900
Message-ID: <20230816133938.18310-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

I and other people in the University of Tokyo, where I research processor
design, found TCG plugins are very useful for processor design exploration.

The feature we find missing is the capability to read registers from
plugins. In this series, I propose to add such a capability by reusing
gdbstub code.

The reuse of gdbstub code ensures the long-term stability of the TCG plugin
interface for register access without incurring a burden to maintain yet
another interface for register access.

This process to add TCG plugin involves four major changes. The first one
is to add GDBFeature structure that represents a GDB feature, which usually
includes registers. GDBFeature can be generated from static XML files or
dynamically generated by architecture-specific code. In fact, this is a
refactoring independent of the feature this series adds, and potentially
it's benefitial even without the plugin feature. The plugin feature will
utilize this new structure to describe registers exposed to plugins.

The second one is to make gdb_read_register/gdb_write_register usable
outside of gdbstub context.

The third one is to actually make registers readable for plugins.

The last one is to allow to implement a QEMU plugin in C++. A plugin that
I'll describe later is written in C++.

The below is a summary of patches:
Patch 01 fixes a bug in execlog plugin.
Patch [02, 13] introduces GDBFeature.
Patch [14, 17] adds information useful for plugins to GDBFeature.
Patch [18, 20] makes registers readable outside of gdbstub context.
Patch [21, 23] adds the feature to read registers from plugins.
Patch [24, 25] makes it possible to write plugins in C++.

The execlog plugin will have new options to demonstrate the new feature.
I also have a plugin that uses this new feature to generate execution traces for
Sniper processor simulator, which is available at:
https://github.com/shioya-lab/sniper/tree/akihikodaki/bb

V2 -> V3:
  Added patch "hw/core/cpu: Return static value with gdb_arch_name()"
  Added patch "gdbstub: Dynamically allocate target.xml buffer" (Alex Bennée)
  Added patch "gdbstub: Introduce GDBFeatureBuilder" (Alex Bennée)
  Dropped Reviewed-by tags for "target/*: Use GDBFeature for dynamic XML"
  Changed gdb_find_static_feature() to abort on failure (Alex Bennée)
  Changed the execlog plugin to log the register value only when changed
  (Alex Bennée)
  Dropped 0x prefixes for register value logs for conciseness

V1 -> V2:
  Added SPDX-License-Identifier: GPL-2.0-or-later (Philippe Mathieu-Daudé)
  Split long lines. (Philippe Mathieu-Daudé)
  Renamed gdb_features to gdb_static_features (Philippe Mathieu-Daudé)
  Dropped RFC.

Akihiko Odaki (25):
  contrib/plugins: Use GRWLock in execlog
  gdbstub: Introduce GDBFeature structure
  gdbstub: Add num_regs member to GDBFeature
  gdbstub: Introduce gdb_find_static_feature()
  target/arm: Move the reference to arm-core.xml
  hw/core/cpu: Replace gdb_core_xml_file with gdb_core_feature
  gdbstub: Introduce GDBFeatureBuilder
  target/arm: Use GDBFeature for dynamic XML
  target/ppc: Use GDBFeature for dynamic XML
  target/riscv: Use GDBFeature for dynamic XML
  gdbstub: Use GDBFeature for gdb_register_coprocessor
  gdbstub: Use GDBFeature for GDBRegisterState
  hw/core/cpu: Return static value with gdb_arch_name()
  gdbstub: Dynamically allocate target.xml buffer
  gdbstub: Simplify XML lookup
  hw/core/cpu: Remove gdb_get_dynamic_xml member
  gdbstub: Add members to identify registers to GDBFeature
  hw/core/cpu: Add a parameter to gdb_read_register/gdb_write_register
  gdbstub: Hide gdb_has_xml
  gdbstub: Expose functions to read registers
  cpu: Call plugin hooks only when ready
  plugins: Allow to read registers
  contrib/plugins: Allow to log registers
  plugins: Support C++
  contrib/plugins: Add cc plugin

 MAINTAINERS                   |   2 +-
 docs/devel/tcg-plugins.rst    |  18 ++-
 configure                     |  15 ++-
 meson.build                   |   2 +-
 gdbstub/internals.h           |  10 +-
 include/exec/gdbstub.h        |  51 +++++++--
 include/hw/core/cpu.h         |  17 ++-
 include/qemu/qemu-plugin.h    |  69 +++++++++++-
 target/alpha/cpu.h            |   6 +-
 target/arm/cpu.h              |  37 +++----
 target/arm/internals.h        |   2 +-
 target/avr/cpu.h              |   6 +-
 target/cris/cpu.h             |   9 +-
 target/hexagon/internal.h     |   6 +-
 target/hppa/cpu.h             |   6 +-
 target/i386/cpu.h             |   6 +-
 target/loongarch/internals.h  |   6 +-
 target/m68k/cpu.h             |   6 +-
 target/microblaze/cpu.h       |   6 +-
 target/mips/internal.h        |   6 +-
 target/openrisc/cpu.h         |   6 +-
 target/ppc/cpu-qom.h          |   3 +-
 target/ppc/cpu.h              |  15 ++-
 target/ppc/internal.h         |   2 +-
 target/riscv/cpu.h            |  10 +-
 target/rx/cpu.h               |   6 +-
 target/s390x/cpu.h            |   2 -
 target/s390x/s390x-internal.h |   6 +-
 target/sh4/cpu.h              |   6 +-
 target/sparc/cpu.h            |   6 +-
 target/tricore/cpu.h          |   6 +-
 target/xtensa/cpu.h           |   6 +-
 contrib/plugins/execlog.c     | 150 +++++++++++++++++++------
 cpu.c                         |  11 --
 gdbstub/gdbstub.c             | 203 ++++++++++++++++++++++++----------
 gdbstub/softmmu.c             |   2 +-
 hw/core/cpu-common.c          |  16 ++-
 plugins/api.c                 |  40 +++++++
 stubs/gdbstub.c               |   6 +-
 target/alpha/gdbstub.c        |   6 +-
 target/arm/cpu.c              |  12 +-
 target/arm/cpu64.c            |   8 +-
 target/arm/gdbstub.c          | 184 +++++++++++++-----------------
 target/arm/gdbstub64.c        |  96 +++++++---------
 target/arm/tcg/cpu32.c        |   3 +-
 target/avr/cpu.c              |   4 +-
 target/avr/gdbstub.c          |   6 +-
 target/cris/gdbstub.c         |   9 +-
 target/hexagon/cpu.c          |   5 +-
 target/hexagon/gdbstub.c      |   6 +-
 target/hppa/gdbstub.c         |   6 +-
 target/i386/cpu.c             |  13 +--
 target/i386/gdbstub.c         |  10 +-
 target/loongarch/cpu.c        |   8 +-
 target/loongarch/gdbstub.c    |   8 +-
 target/m68k/cpu.c             |   7 +-
 target/m68k/gdbstub.c         |   6 +-
 target/m68k/helper.c          |   6 +-
 target/microblaze/cpu.c       |   9 +-
 target/microblaze/gdbstub.c   |   6 +-
 target/mips/gdbstub.c         |   6 +-
 target/nios2/cpu.c            |   6 +-
 target/openrisc/gdbstub.c     |   6 +-
 target/ppc/cpu_init.c         |   9 +-
 target/ppc/gdbstub.c          |  90 ++++++---------
 target/riscv/cpu.c            |  27 ++---
 target/riscv/gdbstub.c        |  95 +++++++---------
 target/rx/cpu.c               |   4 +-
 target/rx/gdbstub.c           |   6 +-
 target/s390x/cpu.c            |   8 +-
 target/s390x/gdbstub.c        |  34 ++----
 target/sh4/gdbstub.c          |   6 +-
 target/sparc/gdbstub.c        |   6 +-
 target/tricore/cpu.c          |   4 +-
 target/tricore/gdbstub.c      |   6 +-
 target/xtensa/gdbstub.c       |   6 +-
 contrib/plugins/Makefile      |   5 +
 contrib/plugins/cc.cc         |  17 +++
 plugins/qemu-plugins.symbols  |   2 +
 scripts/feature_to_c.py       | 102 +++++++++++++++++
 scripts/feature_to_c.sh       |  69 ------------
 tests/tcg/Makefile.target     |   3 +
 82 files changed, 1045 insertions(+), 678 deletions(-)
 create mode 100644 contrib/plugins/cc.cc
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.41.0


