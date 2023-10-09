Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8768FCD610E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:43:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptKe-0006sX-Dj; Mon, 09 Oct 2023 12:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJq-0005Bp-U6
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:33 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJc-0001S8-NQ
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4064867903cso47823475e9.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869666; x=1697474466; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1gVOQLrPCY4wB2HQtNdBWWNkWkP/1peRGEfdhoM/8Os=;
 b=MQsFAgGT3MAfH49SZB7QHUedjfKnYm6K7A7aSQjy2YiZ6d0lrPo8eZBdodlZd2RhcK
 tdngc50sncS0Z4wH1gLpVXiGiHKjSv180na6iBYObkyaEXwufRB1ErdpbjR4w82MrYOE
 dO3MSALjbca7DuINr4JKxPh24fFRtVCkMP8ZORtPCKjRJHFdAWZzifXXOFNdOCBzKx9T
 G7ibwGaxoWNQMwptTs8itvlCeE/vI2nfcE8OWbtkaH7mMXiIWdoVZfjIkOraGKAjquAt
 NYG58YruVLR93ZoXfonRAaQAliMeY72weVH0o/r8+M5gXrIkNw8yLonFNqkAsMmvd6x+
 nOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869666; x=1697474466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1gVOQLrPCY4wB2HQtNdBWWNkWkP/1peRGEfdhoM/8Os=;
 b=gKh0sdcDKKdfOm+E3HVqm6a3fuo4bfxblLwhAq/U8lJt0YLCnDGwMRPhAJuSVOo+gW
 wcDknzPsxh0/cEY7fLucsO0QADqto9Ei7buEytPLeNA6/Udci/zxJqMcuw9m0WqwjRAO
 O/hDmAiEGwWCa2vEPg7SipBV0jxyYihvSYIHsqlFdTqnKR6eARnISnNZmvB+eEAcQMeQ
 I3c2aY+plOLEB9TB2bvaTpljDJQ5nLamVurdH/2ecWR39XQK6nAsmOD9byZbbd0OuoyE
 FnGrL5Ryi6gXtGw+XWogFgce7aD5yxQYOhagqSE3Hv4FHyVyCgQZoCj96Qy/b94UYoKb
 pTXg==
X-Gm-Message-State: AOJu0YzsnLv3dgpegKjpScTLR2tqLVTfKQ09RbTOO3drfnQY/Qj5xNU7
 jm0H1okS/NkKC/I6vZzQS01HTw==
X-Google-Smtp-Source: AGHT+IG+hrdsQ7T/BH1U7hdIc+QPHt8fNOZ68l7Fq5gvQ+ZNEa1Av2ONy2XHFBZMtwuMyxAfjgqQ8A==
X-Received: by 2002:a1c:770d:0:b0:406:5463:8f74 with SMTP id
 t13-20020a1c770d000000b0040654638f74mr14904585wmi.24.1696869665957; 
 Mon, 09 Oct 2023 09:41:05 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a7bc416000000b00404719b05b5sm11668259wmi.27.2023.10.09.09.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:41:05 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F3E81FFBB;
 Mon,  9 Oct 2023 17:41:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/25] October maintainer omnibus pre-PR (tests, gdbstub,
 plugins)
Date: Mon,  9 Oct 2023 17:40:39 +0100
Message-Id: <20231009164104.369749-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
attempt to do my part to reduce the qemu-devel fire hose. It is pretty
much the same as the September tree except:

  - dropped RFC patches
  - dropped CRIS deprecation patches
  - dropped makefile dependency tweaks
  - tweaked RUNC as per Paolo's suggestion
  - used later version of Marcin's sbsa-ref changes
  - added a FLAKY_TEST removal
  - added tags as appropriate

Now I'm using the pre-PR subject to give people a last chance to
object before I roll a proper pull request later this week.

The following still could do with review:

  contrib/plugins: fix coverity warning in hotblocks
  contrib/plugins: fix coverity warning in lockstep
  contrib/plugins: fix coverity warning in cache
  configure: remove gcc version suffixes
  configure: allow user to override docker engine
  tests/docker: make docker engine choice entirely configure driven
  tests/avocado: remove flaky test marking for test_sbsaref_edk2_firmware

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

Alex Bennée (9):
  tests/avocado: remove flaky test marking for
    test_sbsaref_edk2_firmware
  tests/lcitool: add swtpm to the package list
  gitlab: shuffle some targets and reduce avocado noise
  tests/docker: make docker engine choice entirely configure driven
  configure: allow user to override docker engine
  configure: remove gcc version suffixes
  contrib/plugins: fix coverity warning in cache
  contrib/plugins: fix coverity warning in lockstep
  contrib/plugins: fix coverity warning in hotblocks

Marcin Juszkiewicz (1):
  tests/avocado: update firmware to enable OpenBSD test on sbsa-ref

Matt Borgerson (1):
  plugins: Set final instruction count in plugin_gen_tb_end

Richard Henderson (2):
  accel/tcg: Add plugin_enabled to DisasContextBase
  target/sh4: Disable decode_gusa when plugins enabled

 MAINTAINERS                                   |  2 +-
 configure                                     | 13 ++-
 meson.build                                   |  2 +-
 gdbstub/internals.h                           |  2 -
 include/exec/gdbstub.h                        | 17 ++--
 include/exec/plugin-gen.h                     |  4 +-
 include/exec/translator.h                     |  2 +
 include/hw/core/cpu.h                         |  4 +-
 target/ppc/internal.h                         |  2 +-
 accel/tcg/plugin-gen.c                        |  6 +-
 accel/tcg/translator.c                        |  3 +-
 contrib/plugins/cache.c                       | 18 ++--
 contrib/plugins/execlog.c                     | 16 ++--
 contrib/plugins/hotblocks.c                   |  2 +-
 contrib/plugins/lockstep.c                    | 13 ++-
 gdbstub/gdbstub.c                             | 95 +++++++++----------
 gdbstub/softmmu.c                             |  2 +-
 plugins/core.c                                |  2 +-
 stubs/gdbstub.c                               |  6 +-
 target/arm/cpu.c                              |  9 +-
 target/arm/cpu64.c                            |  4 +-
 target/arm/gdbstub.c                          | 32 +------
 target/i386/cpu.c                             |  6 +-
 target/loongarch/cpu.c                        |  8 +-
 target/ppc/gdbstub.c                          | 24 +----
 target/riscv/cpu.c                            |  6 +-
 target/s390x/cpu.c                            |  4 +-
 target/sh4/translate.c                        | 41 +++++---
 target/tricore/cpu.c                          |  4 +-
 .gitlab-ci.d/buildtest.yml                    | 15 ++-
 .gitlab-ci.d/cirrus/macos-12.vars             |  2 +-
 scripts/feature_to_c.py                       | 48 ++++++++++
 scripts/feature_to_c.sh                       | 69 --------------
 tests/avocado/machine_aarch64_sbsaref.py      | 71 +++++++++++---
 tests/docker/Makefile.include                 |  9 +-
 tests/docker/dockerfiles/alpine.docker        |  1 +
 tests/docker/dockerfiles/centos8.docker       |  1 +
 .../dockerfiles/debian-amd64-cross.docker     |  1 +
 tests/docker/dockerfiles/debian-amd64.docker  |  1 +
 .../dockerfiles/debian-arm64-cross.docker     |  1 +
 .../dockerfiles/debian-armhf-cross.docker     |  1 +
 .../dockerfiles/debian-ppc64el-cross.docker   |  1 +
 .../dockerfiles/debian-s390x-cross.docker     |  1 +
 .../dockerfiles/fedora-win32-cross.docker     |  1 +
 .../dockerfiles/fedora-win64-cross.docker     |  1 +
 tests/docker/dockerfiles/fedora.docker        |  1 +
 tests/docker/dockerfiles/opensuse-leap.docker |  1 +
 tests/docker/dockerfiles/ubuntu2204.docker    |  1 +
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/projects/qemu.yml               |  1 +
 50 files changed, 305 insertions(+), 274 deletions(-)
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.39.2


