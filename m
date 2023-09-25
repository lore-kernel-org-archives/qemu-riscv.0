Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18F5CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:49:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkmtZ-000128-6f; Mon, 25 Sep 2023 10:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtX-0000zv-LX
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtP-0008Eb-BL
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-307d20548adso5608945f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653336; x=1696258136; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1YtSf2Ab2f4lgt/V/Wma19HlFhyxKexuv024AXVfN/4=;
 b=nHBdJMy9QbFN10TL3Ur3S03nznYDytkSKQettq8QbUFITNVpj9rftt+AfhfJUKJ9RJ
 VAKmg2TQIkwSgk0+Rf+fuvcW9Y+EcWw1HmuLZ0ka/QnrUViH5wHlLBFDsunyLcoqDXDj
 O8DBcQRLI4Gf9Ns88q4pqU4wgGgwpJGVirwSlhHbqv2lk4rdmmoIdUzWm2CeGFw1L15Q
 HnrmP4izRsF7bzBtS8cSzlrNAIHRrE0yNL8XZ71yxhBlDGNLWETeR5dOTSP/SDU0YmK0
 CE9VQJRZQh7JmwM1n80Xj0tYxGDdkvlEHO/qcaYFQIeQA34HtAhrJstUSEEdgZZU9kmP
 calg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653336; x=1696258136;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1YtSf2Ab2f4lgt/V/Wma19HlFhyxKexuv024AXVfN/4=;
 b=ZCwxLf8u1+21zoGa4Z1oeXqj/fVHyd7XvwwsIiPdqjNt1AfDppOtsJ7X9/EVshZSLF
 vQ4DY/mBYbGhulHxmeA3/ATKv1XYxYLwH31733Ja16Iuhe4KdSuk0acGkAY3JaFUlEkc
 F3HPwxb47crZzsDMiR4aoRAwdARCR6VdPJ2IzR6qYdJjPPSVHIj6AeSH+fBiMekN2CRM
 kB6jV2vnCv4kLbjE0DlJs0JCNA/4ITj2FOoqOnXMuLHVsRxEY0XREC61n9ty8tXmMfqj
 i6DbL8WIyn1qAjFus1bh3Lcm7FkyoBo3qeJai55DvFObonzKzmhJZx6FcSnnnmOSXL+q
 OyBA==
X-Gm-Message-State: AOJu0Yx/SlSjYYfvJk9ulHHOjrHcTlpLNVobBX/OMUcp6ssDOTs+g3+/
 kP9nngZSt56+Qs6SJM4jIOAaxg==
X-Google-Smtp-Source: AGHT+IHyqmt/cMcJ6b3wfHWrx0g+TBl8VfxxMFoVDskoCx7kqVU/YCV3BArbLs4sV2zVLg22ZRMeQw==
X-Received: by 2002:a5d:510f:0:b0:31f:fedd:83ad with SMTP id
 s15-20020a5d510f000000b0031ffedd83admr6868879wrt.4.1695653335938; 
 Mon, 25 Sep 2023 07:48:55 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a5d608c000000b0031c6e1ea4c7sm12057674wrt.90.2023.09.25.07.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:48:55 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E44CB1FFBB;
 Mon, 25 Sep 2023 15:48:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 00/31] September maintainer omnibus (tests, gdbstub, plugins)
Date: Mon, 25 Sep 2023 15:48:23 +0100
Message-Id: <20230925144854.1872513-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Hi,

This wraps up my current testing, gdbstub and plugin trees in an
attempt to do my part to reduce the qemu-devel fire hose.

For testing we have a number of cleanups to configure to better handle
selecting the container engine (removing the ability to dynamically
switch). I had to do this as one of my build boxes has recently
acquired a broken podman install. There are also some updates to
avocado sbsa-ref as well as tweaks to the gitlab setup to minimise the
amount of wheel spinning we do. The deprecation of CRIS is a little
provocative but if we do want to keep it we need to stop relying on a
rapidly dated fedora image to do it. Finally we include the swtpm
package to widen the testing we do through avocado.

The gdbstub updates are from Akihiko and include a bunch of clean-ups
that will hopefully pave the way for another series which allows the
plugins to access register values using the gdb backend to source the
data.

Finally the plugins has a few fixes which includes a tweak to make SH4
atomic modelling more plugin friendly. This allows for Matt's fix to
deal with non-regular instruction encoding spanning pages. I also fix
a number of coverity warnings.

The final time control patches are still RFC and not ready for merging
but I include them for completeness.

The following still need review:

  contrib/plugins: add iops plugin example for cost modelling
  plugins: add time control API
  sysemu: generalise qtest_warp_clock as qemu_clock_advance_virtual_time
  qtest: use cpu interface in qtest_clock_warp (1 acks, 1 sobs, 0 tbs)
  contrib/plugins: fix coverity warning in hotblocks
  contrib/plugins: fix coverity warning in lockstep
  contrib/plugins: fix coverity warning in cache
  configure: ensure dependency for cross-compile setup
  configure: remove gcc version suffixes
  configure: allow user to override docker engine
  tests/docker: make docker engine choice entirely configure driven
  docs: mark CRIS support as deprecated
  tests/lcitool: add swtpm to the package list

Akihiko Odaki (12):
  gdbstub: Fix target_xml initialization
  gdbstub: Fix target.xml response
  plugins: Check if vCPU is realized
  contrib/plugins: Use GRWLock in execlog
  gdbstub: Introduce GDBFeature structure
  target/arm: Move the reference to arm-core.xml
  hw/core/cpu: Return static value with gdb_arch_name()
  gdbstub: Use g_markup_printf_escaped()
  target/arm: Remove references to gdb_has_xml
  target/ppc: Remove references to gdb_has_xml
  gdbstub: Remove gdb_has_xml variable
  gdbstub: Replace gdb_regs with an array

Alex Bennée (15):
  tests/lcitool: add swtpm to the package list
  gitlab: shuffle some targets and reduce avocado noise
  docs: mark CRIS support as deprecated
  tests/docker: make docker engine choice entirely configure driven
  configure: allow user to override docker engine
  configure: remove gcc version suffixes
  configure: ensure dependency for cross-compile setup
  contrib/plugins: fix coverity warning in cache
  contrib/plugins: fix coverity warning in lockstep
  contrib/plugins: fix coverity warning in hotblocks
  sysemu: add set_virtual_time to accel ops
  qtest: use cpu interface in qtest_clock_warp
  sysemu: generalise qtest_warp_clock as qemu_clock_advance_virtual_time
  plugins: add time control API
  contrib/plugins: add iops plugin example for cost modelling

Marcin Juszkiewicz (1):
  tests/avocado: update firmware to enable sbsa-ref/neoverse-v1

Matt Borgerson (1):
  plugins: Set final instruction count in plugin_gen_tb_end

Richard Henderson (2):
  accel/tcg: Add plugin_enabled to DisasContextBase
  target/sh4: Disable decode_gusa when plugins enabled

 MAINTAINERS                                   |   2 +-
 docs/about/deprecated.rst                     |  11 +
 configure                                     |  15 +-
 meson.build                                   |   2 +-
 gdbstub/internals.h                           |   2 -
 include/exec/gdbstub.h                        |  17 +-
 include/exec/plugin-gen.h                     |   4 +-
 include/exec/translator.h                     |   2 +
 include/hw/core/cpu.h                         |   4 +-
 include/qemu/qemu-plugin.h                    |  19 ++
 include/qemu/timer.h                          |  15 +
 include/sysemu/accel-ops.h                    |  18 +-
 include/sysemu/cpu-timers.h                   |  27 +-
 include/sysemu/qtest.h                        |   1 +
 target/ppc/internal.h                         |   2 +-
 accel/qtest/qtest.c                           |   1 +
 accel/tcg/plugin-gen.c                        |   6 +-
 accel/tcg/translator.c                        |   3 +-
 contrib/plugins/cache.c                       |  18 +-
 contrib/plugins/execlog.c                     |  16 +-
 contrib/plugins/hotblocks.c                   |   2 +-
 contrib/plugins/iops.c                        | 261 ++++++++++++++++++
 contrib/plugins/lockstep.c                    |  13 +-
 gdbstub/gdbstub.c                             |  95 +++----
 gdbstub/softmmu.c                             |   2 +-
 plugins/api.c                                 |  28 ++
 plugins/core.c                                |   2 +-
 softmmu/cpus.c                                |  11 +
 softmmu/qtest.c                               |  26 +-
 ...t-virtual-clock.c => cpus-virtual-clock.c} |   5 +
 stubs/gdbstub.c                               |   6 +-
 target/arm/cpu.c                              |   9 +-
 target/arm/cpu64.c                            |   4 +-
 target/arm/gdbstub.c                          |  32 +--
 target/i386/cpu.c                             |   6 +-
 target/loongarch/cpu.c                        |   8 +-
 target/ppc/gdbstub.c                          |  24 +-
 target/riscv/cpu.c                            |   6 +-
 target/s390x/cpu.c                            |   4 +-
 target/sh4/translate.c                        |  41 ++-
 target/tricore/cpu.c                          |   4 +-
 util/qemu-timer.c                             |  26 ++
 .gitlab-ci.d/buildtest.yml                    |  15 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |   2 +-
 contrib/plugins/Makefile                      |   1 +
 plugins/qemu-plugins.symbols                  |   2 +
 scripts/feature_to_c.py                       |  48 ++++
 scripts/feature_to_c.sh                       |  69 -----
 stubs/meson.build                             |   2 +-
 tests/avocado/machine_aarch64_sbsaref.py      |  25 +-
 tests/docker/Makefile.include                 |   7 +-
 tests/docker/dockerfiles/alpine.docker        |   1 +
 tests/docker/dockerfiles/centos8.docker       |   1 +
 .../dockerfiles/debian-amd64-cross.docker     |   1 +
 tests/docker/dockerfiles/debian-amd64.docker  |   1 +
 .../dockerfiles/debian-arm64-cross.docker     |   1 +
 .../dockerfiles/debian-armhf-cross.docker     |   1 +
 .../dockerfiles/debian-ppc64el-cross.docker   |   1 +
 .../dockerfiles/debian-s390x-cross.docker     |   1 +
 .../dockerfiles/fedora-win32-cross.docker     |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   1 +
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +
 tests/docker/dockerfiles/ubuntu2204.docker    |   1 +
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   1 +
 66 files changed, 689 insertions(+), 298 deletions(-)
 create mode 100644 contrib/plugins/iops.c
 rename stubs/{cpus-get-virtual-clock.c => cpus-virtual-clock.c} (68%)
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.39.2


