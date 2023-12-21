Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672E1C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGS3-00047c-6q; Thu, 21 Dec 2023 05:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRo-0003js-FT
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:37 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRc-0003pv-8U
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33679c49fe5so508327f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155100; x=1703759900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gkoO3wXiqTI2NxB7hGCZob5xUBPaL3tAx2dwNp2CaZw=;
 b=zrCLN1FZ+eafsSu6AmBIEYimmuAvH9QbhlulXDe/E9s4dAKQ2nvqj9GS/GZKMuvUeg
 xepOaX+cK0fE7tPR/8KwEnIFBR7b1CKGr+oJHRLOlSHp4d2gaKIwJYDrDLjExpAEXD9o
 8THOURplf6Ez5bMdBQ57Ug5d2NW9M+nIeE3jqBpL3lkDoWw5mUQmpDWqAE/xNT+Cwyld
 H7BXOQKECBw2l8FRKzD7wlz6wu1lK7vhXKnvNNEfSujNOlft2IN4D7dExgEBsOjZCHpj
 gf6g+W61etR7fNerP+Fe36GkEwySlr1RYWr70mbfl6esPE3MQQ5H6eQ5VQChHBlGPMEo
 yiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155100; x=1703759900;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gkoO3wXiqTI2NxB7hGCZob5xUBPaL3tAx2dwNp2CaZw=;
 b=NzGu+MCynD9hNKuUmgp+ubFx4caa102f6hAtE/CA5MBBRnONPQwWPYsWVEyUhCgRsm
 GdBUZGtxnriVoj8Rlrx7K4FAsrzAUUYSoV9q0mCs4nFZcoAB4etyxENjkSjM9h76Lf9e
 n7U1yxasq3wbe76/NA+yisH+16gXADRELyZLb7Pm3Cs2IJdJ9HApaL/Mhj94LFjPk6N6
 GZ88PBOHEcR36KFc3aJifz6dFG/kyr2aye1hJcg1wkY+6hnSmKar76pESXh+JBHxZCv1
 BthjUWrbJuRkT89J94QrHV6EvgU6rUZ1hw4BYGEGyaiZpfWbY6lWOL+YG/9P2OXMSAQ6
 ekag==
X-Gm-Message-State: AOJu0YyKldXIk7fSTc1gxyMZT8lhuBwKHbk30cxhiIx86Q9eX7K+j3QC
 c8311yxDxaQcHlXom/O5GuQLiw==
X-Google-Smtp-Source: AGHT+IHiVMXfF/xI1b5EktkHAluL3eMpNY86C4FyPfFnImWeNCM0tuUOg02HfxtosXDAxpKu6VLOBQ==
X-Received: by 2002:adf:fc8d:0:b0:336:8160:cbcb with SMTP id
 g13-20020adffc8d000000b003368160cbcbmr760131wrr.125.1703155099676; 
 Thu, 21 Dec 2023 02:38:19 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 j9-20020adfb309000000b00336641feb02sm1748375wrd.19.2023.12.21.02.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:38:19 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EE01B5F7D4;
 Thu, 21 Dec 2023 10:38:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 00/40] testing and plugin updates for 9.0
Date: Thu, 21 Dec 2023 10:37:38 +0000
Message-Id: <20231221103818.1633766-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

The following still need review:

  contrib/plugins: optimise the register value tracking
  contrib/plugins: extend execlog to track register changes
  contrib/plugins: fix imatch
  plugins: add an API to read registers
  gdbstub: expose api to find registers
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

Alex Bennée (8):
  tests/avocado: use snapshot=on in kvm_xen_guest
  gitlab: include microblazeel in testing
  chardev: use bool for fe_is_open
  gdbstub: expose api to find registers
  plugins: add an API to read registers
  contrib/plugins: fix imatch
  contrib/plugins: extend execlog to track register changes
  contrib/plugins: optimise the register value tracking

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

 docs/devel/tcg-plugins.rst          |  17 +-
 accel/tcg/plugin-helpers.h          |   3 +-
 include/chardev/char-fe.h           |  19 +-
 include/exec/gdbstub.h              |  62 +++++-
 include/hw/core/cpu.h               |   7 +-
 include/qemu/plugin.h               |   1 +
 include/qemu/qemu-plugin.h          |  53 ++++-
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
 plugins/qemu-plugins.symbols        |   2 +
 scripts/feature_to_c.py             |  14 +-
 scripts/mtest2make.py               |   3 +-
 tests/avocado/kvm_xen_guest.py      |   2 +-
 tests/avocado/machine_microblaze.py |  26 +++
 tests/fp/meson.build                |   2 +-
 tests/qtest/meson.build             |  25 +--
 tests/unit/meson.build              |   2 +
 57 files changed, 1332 insertions(+), 704 deletions(-)

-- 
2.39.2


