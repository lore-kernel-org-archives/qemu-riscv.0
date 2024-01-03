Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94256C47077
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:36:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL582-0003Vv-M0; Wed, 03 Jan 2024 12:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL57t-0003SE-U5
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:33:58 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL57o-0002N9-7A
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:33:57 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so116666415e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303230; x=1704908030; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dts3uGjaAQB4Zj+XcLvFb0kYHGMK7F2/Fd5b3pjZeUQ=;
 b=JGIc+2AXgHAa3ZutKM7yLU8t1NPPNq+WN4uwszu1YRyV5m+SAW9CqfnjGkQyUFOI1M
 C/vBcnjh4v2KRGN6VpNAFvaX2t4HuFM737gCxdaYHwqtr5kk8UNwH2uDqgYjJm4wS0jg
 eeJ9co6+u8Tlhmtn0Toit+nNAkdxrkkIgr7qA3sKX0Ec2iuRCowMpUgx9MKCHPtNSe1g
 GArO2iZ+CZOzcZ6hUrk1tDYsyQS0mMCjGuCYzSof7y0MZF8MzXxbS+w9oTCTb5xXH7WA
 Bp+5zKMfMCWDIOobsrxyfkY+QpElyGbOziZh9/GZKY3IO3KniEXsGbQ+m7FuEeAhH2z0
 Sn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303230; x=1704908030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dts3uGjaAQB4Zj+XcLvFb0kYHGMK7F2/Fd5b3pjZeUQ=;
 b=bUfZgC5knyMpURT6LAPBUCnA093KuENGGceDE91EIY1RPKHvMMI2tKuYu/Edkbt7tb
 EMkafKX3zxvCS3OmcVDYIQFFr/OsWdNj4JcWCft/TZwWxSPzr3GXs3dkLrSJ8ugnSFoG
 wkLA/D25wTCMeWeG2Da/16pGcPVoJZzonJtNDmzEPlBvayOcisljPqExeUzdxBlZkHyt
 Y8kKyLTZnzdSxg8MyLx68WL0bqwQhRkEoroxXdktLFzAOCIq3TH5IZ9BrcwGrIg7AyXc
 FHmYyLINdtb3DH/vnBGUXUYAkWRE8SvATrgQhjKVy24q62or4U0O2t00tQUtDnhgRnfk
 u63w==
X-Gm-Message-State: AOJu0YyIn7ofrO1hiynNpfmxZyKNeOB8W0FTPhtrd6Bi5kQJ871qM65G
 nls0ci/GGx75+0SyCT+9ydFU/+/AJ0S0Lw==
X-Google-Smtp-Source: AGHT+IE3/CV3c0Eu5OCeFLt0dFUcc9KWQXjM0MXb+jlP0M9UUFGEerl1L8vaCck8QY9rqnVn10H4pg==
X-Received: by 2002:a05:600c:1f89:b0:40d:628a:13ac with SMTP id
 je9-20020a05600c1f8900b0040d628a13acmr5402530wmb.124.1704303230402; 
 Wed, 03 Jan 2024 09:33:50 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 iw13-20020a05600c54cd00b0040c11fbe581sm2914640wmb.27.2024.01.03.09.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:33:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 53A845F926;
 Wed,  3 Jan 2024 17:33:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 00/43] testing and plugin updates for 9.0 (pre-PR)
Date: Wed,  3 Jan 2024 17:33:06 +0000
Message-Id: <20240103173349.398526-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This brings in the first batch of testing updates for the next
release. The main bulk of these is Daniel and Thomas' cleanups of the
qtest timeouts and allowing meson control them. There are a few minor
tweaks I've made to some avocado and gitlab tests.

The big update is support for reading register values in TCG plugins.
After feedback from Akihiko I've left all the smarts to the plugin and
made the interface a simple "all the registers" dump. There is a
follow on patch to make the register code a little more efficient by
checking disassembly. However we can leave the door open for future
API enhancements if the translator ever learns to reliably know when
registers might be touched.

v2
--

 - Review feedback for register API
 - readthedocs update
 - add expectation docs for plugins

The following still need review:

  docs/devel: document some plugin assumptions
  docs/devel: lift example and plugin API sections up
  contrib/plugins: optimise the register value tracking
  contrib/plugins: extend execlog to track register changes
  contrib/plugins: fix imatch
  plugins: add an API to read registers
  gdbstub: expose api to find registers
  readthodocs: fully specify a build environment
  gitlab: include microblazeel in testing
  tests/avocado: use snapshot=on in kvm_xen_guest

Akihiko Odaki (15):
  hw/riscv: Use misa_mxl instead of misa_mxl_max
  target/riscv: Remove misa_mxl validation
  target/riscv: Move misa_mxl_max to class
  target/riscv: Validate misa_mxl_max only once
  target/arm: Use GDBFeature for dynamic XML
  target/ppc: Use GDBFeature for dynamic XML
  target/riscv: Use GDBFeature for dynamic XML
  gdbstub: Use GDBFeature for gdb_register_coprocessor
  gdbstub: Use GDBFeature for GDBRegisterState
  gdbstub: Change gdb_get_reg_cb and gdb_set_reg_cb
  gdbstub: Simplify XML lookup
  gdbstub: Infer number of core registers from XML
  hw/core/cpu: Remove gdb_get_dynamic_xml member
  gdbstub: Add members to identify registers to GDBFeature
  plugins: Use different helpers when reading registers

Alex Bennée (11):
  tests/avocado: use snapshot=on in kvm_xen_guest
  gitlab: include microblazeel in testing
  chardev: use bool for fe_is_open
  readthodocs: fully specify a build environment
  gdbstub: expose api to find registers
  plugins: add an API to read registers
  contrib/plugins: fix imatch
  contrib/plugins: extend execlog to track register changes
  contrib/plugins: optimise the register value tracking
  docs/devel: lift example and plugin API sections up
  docs/devel: document some plugin assumptions

Daniel P. Berrangé (12):
  qtest: bump min meson timeout to 60 seconds
  qtest: bump migration-test timeout to 8 minutes
  qtest: bump qom-test timeout to 15 minutes
  qtest: bump npcm7xx_pwn-test timeout to 5 minutes
  qtest: bump test-hmp timeout to 4 minutes
  qtest: bump pxe-test timeout to 10 minutes
  qtest: bump prom-env-test timeout to 6 minutes
  qtest: bump boot-serial-test timeout to 3 minutes
  qtest: bump qos-test timeout to 2 minutes
  qtest: bump aspeed_smc-test timeout to 6 minutes
  qtest: bump bios-table-test timeout to 9 minutes
  mtest2make: stop disabling meson test timeouts

Thomas Huth (5):
  tests/avocado: Add a test for a little-endian microblaze machine
  tests/qtest: Bump the device-introspect-test timeout to 12 minutes
  tests/unit: Bump test-aio-multithread test timeout to 2 minutes
  tests/unit: Bump test-crypto-block test timeout to 5 minutes
  tests/fp: Bump fp-test-mulAdd test timeout to 3 minutes

 docs/devel/tcg-plugins.rst          |  72 ++++++-
 docs/requirements.txt               |   2 +
 accel/tcg/plugin-helpers.h          |   3 +-
 include/chardev/char-fe.h           |  19 +-
 include/exec/gdbstub.h              |  62 +++++-
 include/hw/core/cpu.h               |   7 +-
 include/qemu/plugin.h               |   1 +
 include/qemu/qemu-plugin.h          |  51 ++++-
 target/arm/cpu.h                    |  27 +--
 target/arm/internals.h              |  14 +-
 target/hexagon/internal.h           |   4 +-
 target/microblaze/cpu.h             |   4 +-
 target/ppc/cpu-qom.h                |   1 +
 target/ppc/cpu.h                    |   5 +-
 target/riscv/cpu.h                  |   9 +-
 target/s390x/cpu.h                  |   2 -
 accel/tcg/plugin-gen.c              |  43 +++-
 chardev/char-fe.c                   |  16 +-
 chardev/char.c                      |   2 +-
 contrib/plugins/execlog.c           | 322 +++++++++++++++++++++++-----
 gdbstub/gdbstub.c                   | 198 +++++++++++------
 hw/core/cpu-common.c                |   5 +-
 hw/riscv/boot.c                     |   2 +-
 plugins/api.c                       | 114 +++++++++-
 target/arm/cpu.c                    |   2 -
 target/arm/cpu64.c                  |   1 -
 target/arm/gdbstub.c                | 230 ++++++++++----------
 target/arm/gdbstub64.c              | 122 +++++------
 target/avr/cpu.c                    |   1 -
 target/hexagon/cpu.c                |   4 +-
 target/hexagon/gdbstub.c            |  10 +-
 target/i386/cpu.c                   |   2 -
 target/loongarch/cpu.c              |   2 -
 target/loongarch/gdbstub.c          |  13 +-
 target/m68k/cpu.c                   |   1 -
 target/m68k/helper.c                |  26 ++-
 target/microblaze/cpu.c             |   6 +-
 target/microblaze/gdbstub.c         |   9 +-
 target/ppc/cpu_init.c               |   7 -
 target/ppc/gdbstub.c                | 114 +++++-----
 target/riscv/cpu.c                  | 154 ++++++-------
 target/riscv/gdbstub.c              | 151 +++++++------
 target/riscv/kvm/kvm-cpu.c          |  10 +-
 target/riscv/machine.c              |   7 +-
 target/riscv/tcg/tcg-cpu.c          |  44 +---
 target/riscv/translate.c            |   3 +-
 target/rx/cpu.c                     |   1 -
 target/s390x/cpu.c                  |   1 -
 target/s390x/gdbstub.c              | 105 +++++----
 .gitlab-ci.d/buildtest.yml          |   4 +-
 .readthedocs.yml                    |  19 +-
 plugins/qemu-plugins.symbols        |   2 +
 scripts/feature_to_c.py             |  14 +-
 scripts/mtest2make.py               |   3 +-
 tests/avocado/kvm_xen_guest.py      |   2 +-
 tests/avocado/machine_microblaze.py |  26 +++
 tests/fp/meson.build                |   2 +-
 tests/qtest/meson.build             |  25 +--
 tests/unit/meson.build              |   2 +
 59 files changed, 1396 insertions(+), 714 deletions(-)
 create mode 100644 docs/requirements.txt

-- 
2.39.2


