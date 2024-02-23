Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793FAC54E4F
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 16:38:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rdYVn-0000cX-EQ; Fri, 23 Feb 2024 11:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYJW-0003yS-5o
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:22:18 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYJK-00062w-D9
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:22:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41298411aefso972215e9.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Feb 2024 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708705323; x=1709310123; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ToD11vo/8rUjKiESU6uoSvQq8es5VKhsflbTNHBU+9U=;
 b=P+Xc1adjeuPn0EaJjMw/fsjWQrrq4AGksWO7/9s4UqXphxkN8SGhYXup4PQuqJibYW
 +W/9DbsFn9VszcwdS0P+ehwu3qdJdmSuGqXYl+lIkjLA544Aam8SVaOtlgTvVVtksK8L
 aFhyhj8eX/0gH7IFogMDKJ52tWHc3GkMJc+GYXDCi3o9n93m5ARsnI8iPiAo6F6M89cw
 h3Mgh0DRZBOrXekOkSXQ/ykzpqNNM3Y6N6dGRDZ71gN/5RSBJNjj2l+/JVZZugrTOx6g
 he68awEYFys3W/nzoyChEXUcxBVR7UttVUBwO/8aH6jNx0r9TW1dPPDP7w9DLrfrvYeC
 5zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708705323; x=1709310123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ToD11vo/8rUjKiESU6uoSvQq8es5VKhsflbTNHBU+9U=;
 b=cq4HYS9OBDcXOYgFPEqWgyRLuN5F45Fcp/85OvSQZcDnkCj9LNW0/JpZ/iFH1Q5lbz
 2svKmfTxKWtKlqADK1f5LmaJgjduDmWMAEzSLZtlF3imJbK1rd+vJOz7C98BfJQqF4tZ
 ntHG8AtXDxMDuA+g7OoYaDao4tKfTFNZctc4pkxx1LwrnjypyAbafv6em52VKDcP4nKp
 feCs46CWY5n0W4K5jy5LP5qY4S+MKq87Y89k5odxd2ImWQStmPKZtK5LxJ5U6/icziQ4
 XX3Z5TR1T5AQelDihLVl0WwNk2E3M5uQwLw1byOOcbaTygxhY5xJURtgbHH1X1KZ9MXB
 UrHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYitN6OfNmsJad0AAMHeEyMiealqMUk8rL7AWkT2FTAZY8FFy1oFTZexR47b9aajGoNRO9ABvAJy1mPed/zVg5RaN8DUI=
X-Gm-Message-State: AOJu0YzoiRmdDaGFwiF+L45NNcIeaCQd4/bxyJ7vgmIWaoJfFeL+hP4V
 b/o9pv8zfR1RZsUh83jJnwbZJq4UmtlJkzXYK6msGrO09FiRh7GgZsgUmuEFNzw=
X-Google-Smtp-Source: AGHT+IGwumETXu35Zg4OUcqgtG+TNEDWi2tQeGUoypUmeyBDhWVhSYMzc4Bs8DvjAxKbB1LtHRCmog==
X-Received: by 2002:a05:600c:3505:b0:412:937c:169f with SMTP id
 h5-20020a05600c350500b00412937c169fmr300059wmq.5.1708705323121; 
 Fri, 23 Feb 2024 08:22:03 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 z15-20020a05600c220f00b004126e26f756sm2771875wml.43.2024.02.23.08.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 08:22:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 671585F8A2;
 Fri, 23 Feb 2024 16:22:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, John Snow <jsnow@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 00/27] maintainer updates for 9.0 pre-PR (tests,
 plugin register support)
Date: Fri, 23 Feb 2024 16:21:35 +0000
Message-Id: <20240223162202.1936541-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

The test patch is a simple house keeping one to clean up some
inadvertent GPLv3 tagging to GPLv2-or-later. I've also increased the
timeout for check-tcg due to TCI timesouts.

The main bulk of this series is register reading support for TCG
plugins. The main change to the API is that the get/read_register
functions are now implicitly vCPU context only so have dropped the
vcpu index parameter and use current_cpu instead. This avoids the need
for locking the gdbstub structures in case there is a cross-vCPU
access.

I've pulled in some patches from Pierrick's inline enhancement series
that allow this to happen (making sure the init callback is in the
vCPU context).

Changes for v2:

After lots of back and forth in the last review I've dropped trying to
be clever with CPUClass as it was pointed out even with a common
CPUClass we might see different sets of registers depending on what
features are enabled on a CPU. Now I just have a hash per CPUState
(stored in the new CPUPluginState structure) with a simple reg_num key.

I also fixed a bug in nios2-linux-user.

The following still need review:

  contrib/plugins: extend execlog to track register changes
  tests/tcg: expand insn test case to exercise register API
  plugins: create CPUPluginState and migrate plugin_mask
  gdbstub: expose api to find registers
  linux-user: ensure nios2 processes queued work
  tests/tcg: bump TCG test timeout to 120s

But I'd like to get this merged soon so its not a mad rush before soft
freeze and so we can get the new inline support stabilised and merged.

Alex.

Akihiko Odaki (11):
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
  tests/tcg: update licenses to GPLv2 as intended
  tests/tcg: bump TCG test timeout to 120s
  linux-user: ensure nios2 processes queued work
  gdbstub: expose api to find registers
  plugins: create CPUPluginState and migrate plugin_mask
  plugins: add an API to read registers
  tests/tcg: expand insn test case to exercise register API
  contrib/plugins: fix imatch
  contrib/plugins: extend execlog to track register changes
  docs/devel: lift example and plugin API sections up
  docs/devel: document some plugin assumptions

Pierrick Bouvier (5):
  plugins: remove previous n_vcpus functions from API
  plugins: add qemu_plugin_num_vcpus function
  plugins: fix order of init/idle/resume callback
  cpu: call plugin init hook asynchronously
  docs/devel: plugins can trigger a tb flush

 docs/devel/multi-thread-tcg.rst               |   1 +
 docs/devel/tcg-plugins.rst                    |  72 +++-
 accel/tcg/plugin-helpers.h                    |   3 +-
 include/exec/gdbstub.h                        |  43 ++-
 include/hw/core/cpu.h                         |  18 +-
 include/qemu/plugin.h                         |  16 +
 include/qemu/qemu-plugin.h                    |  59 +++-
 include/qemu/typedefs.h                       |   1 +
 plugins/plugin.h                              |   6 +-
 target/arm/cpu.h                              |  27 +-
 target/arm/internals.h                        |  14 +-
 target/hexagon/internal.h                     |   4 +-
 target/microblaze/cpu.h                       |   4 +-
 target/ppc/cpu-qom.h                          |   1 +
 target/ppc/cpu.h                              |   5 +-
 target/riscv/cpu.h                            |   5 +-
 target/s390x/cpu.h                            |   2 -
 tests/tcg/aarch64/semicall.h                  |   4 +-
 tests/tcg/arm/semicall.h                      |   4 +-
 tests/tcg/multiarch/float_helpers.h           |   4 +-
 tests/tcg/riscv64/semicall.h                  |   4 +-
 accel/tcg/plugin-gen.c                        |  46 ++-
 contrib/plugins/cache.c                       |   2 +-
 contrib/plugins/execlog.c                     | 318 +++++++++++++++---
 gdbstub/gdbstub.c                             | 169 ++++++----
 hw/core/cpu-common.c                          |  15 +-
 linux-user/nios2/cpu_loop.c                   |   1 +
 plugins/api.c                                 | 129 +++++--
 plugins/core.c                                |  27 +-
 target/arm/cpu.c                              |   2 -
 target/arm/cpu64.c                            |   1 -
 target/arm/gdbstub.c                          | 230 ++++++-------
 target/arm/gdbstub64.c                        | 122 +++----
 target/avr/cpu.c                              |   1 -
 target/hexagon/cpu.c                          |   4 +-
 target/hexagon/gdbstub.c                      |  10 +-
 target/i386/cpu.c                             |   2 -
 target/loongarch/cpu.c                        |   2 -
 target/loongarch/gdbstub.c                    |  13 +-
 target/m68k/cpu.c                             |   1 -
 target/m68k/helper.c                          |  26 +-
 target/microblaze/cpu.c                       |   6 +-
 target/microblaze/gdbstub.c                   |  14 +-
 target/ppc/cpu_init.c                         |   7 -
 target/ppc/gdbstub.c                          | 114 ++++---
 target/riscv/cpu.c                            |  15 -
 target/riscv/gdbstub.c                        | 145 ++++----
 target/rx/cpu.c                               |   1 -
 target/s390x/cpu.c                            |   1 -
 target/s390x/gdbstub.c                        | 105 +++---
 tests/plugin/insn.c                           |  21 ++
 .../multiarch/arm-compat-semi/semiconsole.c   |   4 +-
 .../multiarch/arm-compat-semi/semihosting.c   |   4 +-
 tests/tcg/multiarch/float_convd.c             |   4 +-
 tests/tcg/multiarch/float_convs.c             |   4 +-
 tests/tcg/multiarch/float_madds.c             |   4 +-
 tests/tcg/multiarch/libs/float_helpers.c      |   4 +-
 plugins/qemu-plugins.symbols                  |   5 +-
 scripts/feature_to_c.py                       |  14 +-
 tests/tcg/Makefile.target                     |   9 +-
 tests/tcg/i386/system/boot.S                  |   6 +-
 tests/tcg/x86_64/system/boot.S                |   6 +-
 62 files changed, 1257 insertions(+), 654 deletions(-)

-- 
2.39.2


