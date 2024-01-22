Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CABBC47DDB
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 15:00:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRvim-0006xf-Ki; Mon, 22 Jan 2024 09:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rRvik-0006ux-Ub
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 09:56:18 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rRvig-0008Fi-7d
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 09:56:18 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e86a9fc4bso42170005e9.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 06:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705935371; x=1706540171; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bb/KYUiaTsna6vJuXI/9siaZWs98wLSaDxs6Hv4zkgU=;
 b=hvITcoeQlSeCKT9LdMy8mjY5iVSspcsqj2SAKpr5MU++7/9A5hq7BfWvQ5CtIr3yDW
 RRNmBC7ZOjYkpYoB2PTWWw1+5UhCY+QEmK9r5MjgGmplS7ix3U9Ga3yQA029cRme9kas
 yzNn3UcC6oPVhusn4PtyLHugUm4qwlv1WMvdJbfGslwyYLuPYvGh2borAVTbazmO8It7
 nwjHmJnhkm7xqkUmgnGmxAi1SWnxt9+5sy6gf6QGPTec5wR/Oi71Qwfy3nJxS38Ji3Us
 BjnwaPA70qxeByzKl6dxby9sUToH0nSqIi/D9jCsFJrqcD05026LTJAstparSy/JcI/l
 8fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705935371; x=1706540171;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bb/KYUiaTsna6vJuXI/9siaZWs98wLSaDxs6Hv4zkgU=;
 b=rRasb00XLgIH2duKPSIU62qUABWqmVDkKgUPUxEsw0145TucoWC5xPi87NLu+cCfe8
 VnwL8QY2l6fohGVUn3ibGSoDuRaWrGSbzsgmUHUgTjnWV9EE3poMyTSbwGuVxyjlNKiB
 /x5XiljVzsDhiUnKLo8iT/wFGSh0bt9F/eQwr1lF8Jcw9Tevd95ZgiyfVZD6RdXYbUlZ
 ad1fugUk5+M0pswyPx5EUfBZ9ijGoqzCa5Gex21v/4JKd7Rsb5Kt9bZ4xbyfc3irCrRY
 YyTP/HImHysvPUrJiFsqQxd7KpJGDoZJIYCQ/FazRizkySeL1N2GJr7aTVPdQ3qNpFbE
 6W9g==
X-Gm-Message-State: AOJu0Yy+uEclikIPNvAOoXDWXQCqlC6HkmAl8LGeZRKzOR21/tY6cnMC
 ovZ06CzTHpqs4eKRirbUB0IsAikZdISCb/o0Fkw/88c4+FjPLgerY+dJY2l1nL8=
X-Google-Smtp-Source: AGHT+IFRKwbXocgaijT07IhMJdnHqOsm5/GOB25FwCO0EZ5jJroK5Ak40g+nI35wW91C50qu6kEv6g==
X-Received: by 2002:a05:600c:21d1:b0:40e:3b3f:51eb with SMTP id
 x17-20020a05600c21d100b0040e3b3f51ebmr2307292wmj.81.1705935371471; 
 Mon, 22 Jan 2024 06:56:11 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 m4-20020a5d64a4000000b003392e05fb3esm4592744wrp.24.2024.01.22.06.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 06:56:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C42EF5F7AE;
 Mon, 22 Jan 2024 14:56:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Paul Durrant <paul@xen.org>
Subject: [PATCH v3 00/21] plugin updates (register access) for 9.0 (pre-PR?)
Date: Mon, 22 Jan 2024 14:55:49 +0000
Message-Id: <20240122145610.413836-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Akihiko requested the register support not be merged in its current
state so it's time for another round of review. I've made a few tweaks
to simplify the register and CPU tracking code in execlog and removed
some stale API functions. However from my point of view its ready to
merge.

v3
--
  - split from testing bits (merged)
  - removed unused api funcs
  - keep CPUs in a GArray instead of doing by hand

v2
--

 - Review feedback for register API
 - readthedocs update
 - add expectation docs for plugins

The following still need review:

  contrib/plugins: extend execlog to track register changes
  gdbstub: expose api to find registers

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

Alex Bennée (6):
  gdbstub: expose api to find registers
  plugins: add an API to read registers
  contrib/plugins: fix imatch
  contrib/plugins: extend execlog to track register changes
  docs/devel: lift example and plugin API sections up
  docs/devel: document some plugin assumptions

 docs/devel/tcg-plugins.rst   |  72 +++++++-
 accel/tcg/plugin-helpers.h   |   3 +-
 include/exec/gdbstub.h       |  43 ++++-
 include/hw/core/cpu.h        |   7 +-
 include/qemu/plugin.h        |   1 +
 include/qemu/qemu-plugin.h   |  51 +++++-
 target/arm/cpu.h             |  27 ++-
 target/arm/internals.h       |  14 +-
 target/hexagon/internal.h    |   4 +-
 target/microblaze/cpu.h      |   4 +-
 target/ppc/cpu-qom.h         |   1 +
 target/ppc/cpu.h             |   5 +-
 target/riscv/cpu.h           |   9 +-
 target/s390x/cpu.h           |   2 -
 accel/tcg/plugin-gen.c       |  43 ++++-
 contrib/plugins/execlog.c    | 319 +++++++++++++++++++++++++++++------
 gdbstub/gdbstub.c            | 169 +++++++++++--------
 hw/core/cpu-common.c         |   5 +-
 hw/riscv/boot.c              |   2 +-
 plugins/api.c                | 123 +++++++++++++-
 target/arm/cpu.c             |   2 -
 target/arm/cpu64.c           |   1 -
 target/arm/gdbstub.c         | 230 ++++++++++++-------------
 target/arm/gdbstub64.c       | 122 +++++++-------
 target/avr/cpu.c             |   1 -
 target/hexagon/cpu.c         |   4 +-
 target/hexagon/gdbstub.c     |  10 +-
 target/i386/cpu.c            |   2 -
 target/loongarch/cpu.c       |   2 -
 target/loongarch/gdbstub.c   |  13 +-
 target/m68k/cpu.c            |   1 -
 target/m68k/helper.c         |  26 ++-
 target/microblaze/cpu.c      |   6 +-
 target/microblaze/gdbstub.c  |   9 +-
 target/ppc/cpu_init.c        |   7 -
 target/ppc/gdbstub.c         | 114 +++++++------
 target/riscv/cpu.c           | 193 +++++++++++----------
 target/riscv/gdbstub.c       | 151 +++++++++--------
 target/riscv/kvm/kvm-cpu.c   |  10 +-
 target/riscv/machine.c       |   7 +-
 target/riscv/tcg/tcg-cpu.c   |  44 +----
 target/riscv/translate.c     |   3 +-
 target/rx/cpu.c              |   1 -
 target/s390x/cpu.c           |   1 -
 target/s390x/gdbstub.c       | 105 +++++++-----
 plugins/qemu-plugins.symbols |   2 +
 scripts/feature_to_c.py      |  14 +-
 47 files changed, 1287 insertions(+), 698 deletions(-)

-- 
2.39.2


