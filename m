Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E09C27C7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 05:31:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWVau-0006ZN-SK; Thu, 17 Aug 2023 01:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWVas-0006W8-VC
 for qemu-riscv@nongnu.org; Thu, 17 Aug 2023 01:30:50 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWVao-0003mu-R2
 for qemu-riscv@nongnu.org; Thu, 17 Aug 2023 01:30:50 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-565f86ff4d1so945523a12.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 22:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692250245; x=1692855045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mQyi6gfRgbfl9Ba+HuBYDjs0BflAbozpyrrSa1VYhO8=;
 b=foDAMsj/Luf3JT0hF77ecWbCMXR62K/pt13rcHFIsAZecLufRI8U+vJeMkICee3tbc
 A2srfIbdFPgJ9EWMcmJQtXyeGs+nMTAeolhp1KLy0/t+oFI2Xb23lS285rPG5vBfOgjf
 +6B/Qk7f90KrqSgUxsYyTFoUPVwwLQlKy5zrSKCtl9uhrVf4Kd4zhJV7Uwda19LdJSn9
 j1g8rwy76DBFRh17khvu/zqyK/V/pnfcSEP/kyVOsrhfpNOLgaX0lQ+ohALH34YgPcVs
 a1ZV45juk2ebZIHrrOXGBLCjDzMZvt7vZ8zhPB8v2OhHM/F98vnFn48GkJFWpMmu3lp2
 i7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692250245; x=1692855045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mQyi6gfRgbfl9Ba+HuBYDjs0BflAbozpyrrSa1VYhO8=;
 b=L20ToEKLSBDcxeETf6XNIvx9+yN/BmAJvJETpeWQNts8HYnaP7WMa4QJltOS7JFMvR
 GWj6VpVet+rbGWKg8OLNBBBDOJltLBw1vHjSiJQFu/j2e8qKMQxnXpe0bQdkkq8tIs5R
 pf/h8fFbDq2qlLOsKVkNn+eU+4VKMAVpIjzCaF73ZyQpqM8JJw7jwAM1kpmAQCkMbhnI
 3zgXg43qTRc9AmToOSFGT7+3vsBmyurjWmPX0L7XlC1d9btcsV9CLpllaqM2XXZHHlVc
 EGCatKE9czoP80pmxzoSI9839exQYSVa4W5cbSAg2k2ObAVwlAOh0JjQIGsltMidwmJc
 2yvg==
X-Gm-Message-State: AOJu0YwmYYOv6fmYPgtsx8U9omkzHfp2Y0/K/mR3Uq10XDEDlJ8Q43o9
 ryucr0M53RgSHgURkaUmy8r+Ng==
X-Google-Smtp-Source: AGHT+IGfYhrcUvpGzOTYqb82+q9qq2vUi7LvrswIp9J2Txc3w26+L40Re4cMZJpHZ5HqbFY3M4ZlFQ==
X-Received: by 2002:a05:6a20:729d:b0:13d:ee19:771f with SMTP id
 o29-20020a056a20729d00b0013dee19771fmr5340005pzk.8.1692250245092; 
 Wed, 16 Aug 2023 22:30:45 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 j18-20020aa783d2000000b00662610cf7a8sm12339407pfn.172.2023.08.16.22.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 22:30:44 -0700 (PDT)
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
Subject: [PATCH v5 00/26] plugins: Allow to read registers
Date: Thu, 17 Aug 2023 14:29:47 +0900
Message-ID: <20230817053017.24207-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x533.google.com
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
Patch [02, 16] introduce GDBFeature.
Patch 17 adds information useful for plugins to GDBFeature.
Patch [18, 21] make registers readable outside of gdbstub context.
Patch [22, 24] add the feature to read registers from plugins.
Patch [25, 26] make it possible to write plugins in C++.

The execlog plugin will have new options to demonstrate the new feature.
I also have a plugin that uses this new feature to generate execution
traces for Sniper processor simulator, which is available at:
https://github.com/shioya-lab/sniper/tree/akihikodaki/bb

V4 -> V5:
  Corrected g_rw_lock_writer_lock() call. (Richard Henderson)
  Replaced abort() with g_assert_not_reached(). (Richard Henderson)
  Fixed CSR name leak in target/riscv. (Richard Henderson)
  Removed gdb_has_xml variable.

V3 -> V4:
  Added execlog changes I forgot to include in the last version.

V2 -> V3:
  Added patch "hw/core/cpu: Return static value with gdb_arch_name()".
  Added patch "gdbstub: Dynamically allocate target.xml buffer".
  (Alex Bennée)
  Added patch "gdbstub: Introduce GDBFeatureBuilder". (Alex Bennée)
  Dropped Reviewed-by tags for "target/*: Use GDBFeature for dynamic XML".
  Changed gdb_find_static_feature() to abort on failure. (Alex Bennée)
  Changed the execlog plugin to log the register value only when changed.
  (Alex Bennée)
  Dropped 0x prefixes for register value logs for conciseness.

V1 -> V2:
  Added SPDX-License-Identifier: GPL-2.0-or-later. (Philippe Mathieu-Daudé)
  Split long lines. (Philippe Mathieu-Daudé)
  Renamed gdb_features to gdb_static_features (Philippe Mathieu-Daudé)
  Dropped RFC.

Akihiko Odaki (26):
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
  target/arm: Remove references to gdb_has_xml
  target/ppc: Remove references to gdb_has_xml
  gdbstub: Remove gdb_has_xml variable
  gdbstub: Expose functions to read registers
  cpu: Call plugin hooks only when ready
  plugins: Allow to read registers
  contrib/plugins: Allow to log registers
  plugins: Support C++
  contrib/plugins: Add cc plugin

 MAINTAINERS                  |   2 +-
 docs/devel/tcg-plugins.rst   |  18 +++-
 configure                    |  15 ++-
 meson.build                  |   2 +-
 gdbstub/internals.h          |   2 +-
 include/exec/gdbstub.h       |  51 +++++++--
 include/hw/core/cpu.h        |  11 +-
 include/qemu/qemu-plugin.h   |  69 +++++++++++-
 target/arm/cpu.h             |  26 ++---
 target/arm/internals.h       |   2 +-
 target/ppc/cpu-qom.h         |   3 +-
 target/ppc/cpu.h             |   3 +-
 target/ppc/internal.h        |   2 +-
 target/riscv/cpu.h           |   4 +-
 target/s390x/cpu.h           |   2 -
 contrib/plugins/execlog.c    | 150 ++++++++++++++++++++------
 cpu.c                        |  11 --
 gdbstub/gdbstub.c            | 198 +++++++++++++++++++++++-----------
 gdbstub/softmmu.c            |   3 +-
 gdbstub/user.c               |   1 -
 hw/core/cpu-common.c         |  10 ++
 plugins/api.c                |  40 +++++++
 stubs/gdbstub.c              |   6 +-
 target/arm/cpu.c             |  12 +--
 target/arm/cpu64.c           |   8 +-
 target/arm/gdbstub.c         | 202 +++++++++++++----------------------
 target/arm/gdbstub64.c       |  90 +++++++---------
 target/arm/tcg/cpu32.c       |   3 +-
 target/avr/cpu.c             |   4 +-
 target/hexagon/cpu.c         |   5 +-
 target/i386/cpu.c            |  13 ++-
 target/loongarch/cpu.c       |   8 +-
 target/loongarch/gdbstub.c   |   2 +-
 target/m68k/cpu.c            |   7 +-
 target/m68k/helper.c         |   6 +-
 target/microblaze/cpu.c      |   9 +-
 target/ppc/cpu_init.c        |   9 +-
 target/ppc/gdbstub.c         |  80 ++++----------
 target/riscv/cpu.c           |  27 ++---
 target/riscv/gdbstub.c       |  89 +++++++--------
 target/rx/cpu.c              |   4 +-
 target/s390x/cpu.c           |   8 +-
 target/s390x/gdbstub.c       |  28 ++---
 target/tricore/cpu.c         |   4 +-
 contrib/plugins/Makefile     |   5 +
 contrib/plugins/cc.cc        |  17 +++
 plugins/qemu-plugins.symbols |   2 +
 scripts/feature_to_c.py      | 102 ++++++++++++++++++
 scripts/feature_to_c.sh      |  69 ------------
 tests/tcg/Makefile.target    |   3 +
 50 files changed, 825 insertions(+), 622 deletions(-)
 create mode 100644 contrib/plugins/cc.cc
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.41.0


