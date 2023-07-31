Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB56C001DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:10:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQSfN-0004hf-BT; Mon, 31 Jul 2023 09:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOVl-00075S-Tu
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:44:17 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOVj-0004Nb-H8
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:44:17 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-686c06b806cso2895241b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793054; x=1691397854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CBn+i5nj20vvN0ekUr/AiX4JA2kgmu05HbHSUNBFeTE=;
 b=V9GBWiHm1vCm4A0HIEdbicQblVSB987/OTAQ55TLD+v23IHgofdMKY2WwzeTAUUjO0
 ZzUwN8RH6uXfKYThqw2k1aEKQ2EGBwRu6NmLu0eh+PNfGgvthJpE1AjdVpSQHLxtDkSv
 gmc4KgeSps1Xic6zekDFWnJraBIeSVVFMLFUiamgmMQbJ2cR7B77+kRZh1zYr+ZCsMcm
 7Mf/HmNEhHzFOqYPBiaJm+mUk15WKTK2JTv1N93SX1wIvr9n6kkNG18rioChyPDdBBzL
 Cdh59pEEwjZjuOPfxD1UA5YCLAg1QMFXcCeiSE98EgrALwiZaVB813HHZgL2M//TXtBr
 K0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690793054; x=1691397854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CBn+i5nj20vvN0ekUr/AiX4JA2kgmu05HbHSUNBFeTE=;
 b=dtXgMtEOVbnDLRxik8Cy0NtExZVJguLzFI9hDF+azNPeOQNcOkFVotLUGMkB5YSVnC
 OqhzLiUleWqB+jXQRbAGcR2UTSto8p7WhwVeHkg/fPOaVXgVwuZKBt75g0poV+FrU75a
 5PN+vmm7fFMhQAYkGQk7uSfVbYV87d7m4F3jxEhIcPp2eeJrux1yL13FoEQw8BigoyAW
 KgQ54P/T40N4Wv6Rjj4S/ma5kKUhBeLRN+toMKE2kR8LvrQ2jH5ZPuN9vKJT3516kNk2
 uQ9rwejgAVFqtau1ZuKHZdkGM/pkgYA7y4uSn49+ZHA5B++dv9nkqajcoVMssALsHLWb
 df4w==
X-Gm-Message-State: ABy/qLZ1+VYUdHVrH9uVmnusvcfLlgw4RoRf8s1QifUDy/2o3v9O+APR
 hWglxPbuM0KheLMwPaF5ZZYGTA==
X-Google-Smtp-Source: APBJJlHulO+9bai7HM3TBxkUIvH3l9LLnEnsQZGnhN06uQCpPeOidJV3P7w69UsLksZ6xmGGkGuiFg==
X-Received: by 2002:a05:6a00:1947:b0:680:6d16:8f8c with SMTP id
 s7-20020a056a00194700b006806d168f8cmr9407058pfk.32.1690793054114; 
 Mon, 31 Jul 2023 01:44:14 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 01:44:13 -0700 (PDT)
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
 qemu-s390x@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 00/24] plugins: Allow to read registers
Date: Mon, 31 Jul 2023 17:43:27 +0900
Message-ID: <20230731084354.115015-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:10:27 -0400
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
Patch [21, 22] adds the feature to read registers from plugins.
Patch [23, 24] makes it possible to write plugins in C++.

The execlog plugin will have new options to demonstrate the new feature.
I also have a plugin that uses this new feature to generate execution traces for
Sniper processor simulator, which is available at:
https://github.com/shioya-lab/sniper/tree/akihikodaki/bb

Akihiko Odaki (24):
  contrib/plugins: Use GRWLock in execlog
  gdbstub: Introduce GDBFeature structure
  gdbstub: Add num_regs member to GDBFeature
  gdbstub: Introduce gdb_find_static_feature()
  target/arm: Move the reference to arm-core.xml
  hw/core/cpu: Replace gdb_core_xml_file with gdb_core_feature
  target/arm: Use GDBFeature for dynamic XML
  target/ppc: Use GDBFeature for dynamic XML
  target/riscv: Use GDBFeature for dynamic XML
  gdbstub: Use GDBFeature for gdb_register_coprocessor
  gdbstub: Use GDBFeature for GDBRegisterState
  gdbstub: Simplify XML lookup
  hw/core/cpu: Remove gdb_get_dynamic_xml member
  gdbstub: Add members to identify registers to GDBFeature
  target/arm: Fill new members of GDBFeature
  target/ppc: Fill new members of GDBFeature
  target/riscv: Fill new members of GDBFeature
  hw/core/cpu: Add a parameter to gdb_read_register/gdb_write_register
  gdbstub: Hide gdb_has_xml
  gdbstub: Expose functions to read registers
  plugins: Allow to read registers
  contrib/plugins: Allow to log registers
  plugins: Support C++
  contrib/plugins: Add cc plugin

 MAINTAINERS                   |   2 +-
 docs/devel/tcg-plugins.rst    |  18 +++-
 configure                     |  15 ++-
 meson.build                   |   2 +-
 gdbstub/internals.h           |   8 ++
 include/exec/gdbstub.h        |  30 +++---
 include/hw/core/cpu.h         |  15 ++-
 include/qemu/qemu-plugin.h    |  69 +++++++++++++-
 target/alpha/cpu.h            |   6 +-
 target/arm/cpu.h              |  37 ++++----
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
 target/ppc/cpu.h              |  15 +--
 target/riscv/cpu.h            |  10 +-
 target/rx/cpu.h               |   6 +-
 target/s390x/cpu.h            |   2 -
 target/s390x/s390x-internal.h |   6 +-
 target/sh4/cpu.h              |   6 +-
 target/sparc/cpu.h            |   6 +-
 target/tricore/cpu.h          |   6 +-
 target/xtensa/cpu.h           |   6 +-
 contrib/plugins/execlog.c     | 140 ++++++++++++++++++++-------
 cpu.c                         |  11 ---
 gdbstub/gdbstub.c             | 100 ++++++++++++--------
 hw/core/cpu-common.c          |  16 +++-
 plugins/api.c                 |  40 ++++++++
 stubs/gdbstub.c               |   6 +-
 target/alpha/gdbstub.c        |   6 +-
 target/arm/cpu.c              |   6 +-
 target/arm/cpu64.c            |   4 +-
 target/arm/gdbstub.c          | 172 ++++++++++++++++++----------------
 target/arm/gdbstub64.c        |  55 +++++++----
 target/arm/tcg/cpu32.c        |   3 +-
 target/avr/cpu.c              |   4 +-
 target/avr/gdbstub.c          |   6 +-
 target/cris/gdbstub.c         |   9 +-
 target/hexagon/cpu.c          |   5 +-
 target/hexagon/gdbstub.c      |   6 +-
 target/hppa/gdbstub.c         |   6 +-
 target/i386/cpu.c             |   7 +-
 target/i386/gdbstub.c         |  10 +-
 target/loongarch/cpu.c        |   4 +-
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
 target/ppc/gdbstub.c          |  62 ++++++------
 target/riscv/cpu.c            |  21 +----
 target/riscv/gdbstub.c        |  68 +++++++++-----
 target/rx/cpu.c               |   4 +-
 target/rx/gdbstub.c           |   6 +-
 target/s390x/cpu.c            |   4 +-
 target/s390x/gdbstub.c        |  34 +++----
 target/sh4/gdbstub.c          |   6 +-
 target/sparc/gdbstub.c        |   6 +-
 target/tricore/gdbstub.c      |   6 +-
 target/xtensa/gdbstub.c       |   6 +-
 contrib/plugins/Makefile      |   5 +
 contrib/plugins/cc.cc         |  15 +++
 plugins/qemu-plugins.symbols  |   2 +
 scripts/feature_to_c.py       |  98 +++++++++++++++++++
 scripts/feature_to_c.sh       |  69 --------------
 tests/tcg/Makefile.target     |   3 +
 79 files changed, 904 insertions(+), 529 deletions(-)
 create mode 100644 contrib/plugins/cc.cc
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.41.0


