Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AE3D78799
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:06:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAVW-0004Vj-JU; Thu, 21 Nov 2024 11:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVU-0004TD-L8
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:16 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVP-0007yQ-4f
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:15 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso9418795e9.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208289; x=1732813089; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HUYtX66WaY59NeY7kbEaZ0Xc1QSSRucylXdo8YZvDLY=;
 b=Xh6q0w8fVgBm4qzfTTk7SNgD+jAGQGeZWpy6HMdh9Zk3Ng6kWlYE2NXschkBUqXcOx
 HOaz7uY7mf6ORsKVWgFvR/nRCi11bTJb6SapF3Wh51FmyocYrIZx2oswmOftkzMcqVOi
 6zSLgzjYnLGemtdTaMZPPZRrLOWimLl8yivxeXmPHI5e/7F7XRtcVAI9ely+Um7ofFzN
 EXFJCjrE4TkPhXB5cM/MjmfYEnHiQcV8ot5c/tdfeK7l3Lo8efArjpZ3c7Yh75gUkC7K
 PH3Kn5LarIf4GYBfsT4wF0uTnJzlOMfnoUtuTue0/TzmDeRBL4TPBciaaiaBLUmbwFlu
 7Ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208289; x=1732813089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HUYtX66WaY59NeY7kbEaZ0Xc1QSSRucylXdo8YZvDLY=;
 b=vLtv1wb0BxQGUr+j4pEDyIinfbnWVy7AgEADijW5exiZtyNpIB4Eq1M1DQeyNVd5/p
 KYX2o9tt1NaUblFRlArVlxL9WQjvhnzA7ifuiFBD0RjZ+G+0JBQL6Xu2kLgWnWsv96Ma
 AbkYS+IZvVOOYwScVoFHN7z7lmlsZxYG2MODIBaFeW73tMJEO3bAY+6k3flwuKpVaBh2
 zT7+pYbW1UBfPg8X6wEwer+zu/sQIIKA6PbTWMHLATy3r/dViGp2xgPTHXw9+ckqCCqZ
 iA/cNu1F60x91uO02PH0brvIbR4fVOzSiHoxLaybP4TQR8jN+1VDCmnah7LqTLh2K5ar
 AL0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg50AWayEwzZRjqhPzpeEWbvIZW5siiNys4QHqkg+IVx/1MwC5T/oRhc18FLJQv8RBPeN2zH5MxzQQ@nongnu.org
X-Gm-Message-State: AOJu0YzNurkQit1K1N1AT4tOSx5+rdoI51nPWYvCPCLUxyROtuin5SxO
 FcWk8kr2GFzV5SczgiQyP4hxvIgJYzy19ItCiILl3o2d1d7Lu0iMAr54+Stzjwo=
X-Gm-Gg: ASbGncsFiJHCmyzDkmRstlPC1/aAWqyqoJMPjYIjXFExtC7fmevFRnyjliCBvYYP3N1
 np9Eq8Kmx5U8JCYml0T2iq7ZRAKzWhYtMNO1r4tgzhdS8HpLUEezi+0e9oo7mGFwUUtTT3ydIut
 11PQXLWwALnwT4TgsHAfuDrKcLKFhYS1J/gPKoysFWgP/0Yc8o8/KWCs6OJekHLnJIo5+lE0aQe
 u9cXKENOMVCfHaHkEiUui2hhNctuMBPVN+SHTXpPj5wRiQ7
X-Google-Smtp-Source: AGHT+IHq31Tg8H8moluNyRE1qpUkZSzwEeXAnzdl16bG4NOEYoYYgnhi8cyM88cHzgpvw6Q6h9Inyw==
X-Received: by 2002:a05:6000:1f8c:b0:382:383e:84e9 with SMTP id
 ffacd0b85a97d-38254b160e3mr6030543f8f.43.1732208289570; 
 Thu, 21 Nov 2024 08:58:09 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45bd4d1sm63014115e9.12.2024.11.21.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 711BC5F77B;
 Thu, 21 Nov 2024 16:58:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 00/39] maintainer updates for -rc2 pre-PR
Date: Thu, 21 Nov 2024 16:57:27 +0000
Message-Id: <20241121165806.476008-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

This is a mostly testing focused set of patches but a few bug fixes as
well. I plan to send the PR in on Monday. I can drop any patches that
are objected to but I think its pretty safe.

Contains:

  - Daniel's clean-up of functional tests
  - Another avocado->function conversion from Thomas
  - Update the tuxrun baseline images
  - Minor fix to the rust pl011 device
  - Documentation clarification on identity

The following could do with some review:

  tests/functional: update the x86_64 tuxrun tests
  tests/functional: update the sparc64 tuxrun tests
  tests/functional: update the s390x tuxrun tests
  tests/functional: update the riscv64 tuxrun tests
  tests/functional: update the riscv32 tuxrun tests
  tests/functional: update the ppc64 tuxrun tests
  tests/functional: update the ppc32 tuxrun tests
  tests/functional: update the mips64el tuxrun tests
  tests/functional: update the mips64 tuxrun tests
  tests/functional: update the mips32el tuxrun tests
  tests/functional: update the mips32 tuxrun tests
  tests/functional: add a m68k tuxrun tests
  tests/functional: update the i386 tuxrun tests
  tests/functional: update the aarch64 tuxrun tests
  tests/functional: update the arm tuxrun tests
  tests/functional: Convert the Avocado aarch64 tuxrun tests

Thanks,

Alex.

Alex Bennée (15):
  tests/functional: update the arm tuxrun tests
  tests/functional: update the aarch64 tuxrun tests
  tests/functional: update the i386 tuxrun tests
  tests/functional: add a m68k tuxrun tests
  tests/functional: update the mips32 tuxrun tests
  tests/functional: update the mips32el tuxrun tests
  tests/functional: update the mips64 tuxrun tests
  tests/functional: update the mips64el tuxrun tests
  tests/functional: update the ppc32 tuxrun tests
  tests/functional: update the ppc64 tuxrun tests
  tests/functional: update the riscv32 tuxrun tests
  tests/functional: update the riscv64 tuxrun tests
  tests/functional: update the s390x tuxrun tests
  tests/functional: update the sparc64 tuxrun tests
  tests/functional: update the x86_64 tuxrun tests

Daniel P. Berrangé (19):
  tests/functional: fix mips64el test to honour workdir
  tests/functional: automatically clean up scratch files after tests
  tests/functional: remove "AVOCADO" from env variable name
  tests/functional: remove todo wrt avocado.utils.wait_for
  tests/functional: remove leftover :avocado: tags
  tests/functional: remove obsolete reference to avocado bug
  tests/functional: remove comments talking about avocado
  tests/functional: honour self.workdir in ACPI bits tests
  tests/functional: put QEMUMachine logs in testcase log directory
  tests/functional: honour requested test VM name in QEMUMachine
  tests/functional: enable debug logging for QEMUMachine
  tests/functional: logs details of console interaction operations
  tests/functional: don't try to wait for the empty string
  tests/functional: require non-NULL success_message for console wait
  tests/functional: rewrite console handling to be bytewise
  tests/functional: remove time.sleep usage from tuxrun tests
  tests/functional: add a QMP backdoor for debugging stalled tests
  tests/functional: avoid accessing log_filename on earlier failures
  docs: explicitly permit a "commonly known identity" with SoB

Junjie Mao (1):
  rust/pl011: Fix range checks for device ID accesses

Pierrick Bouvier (3):
  plugins: add missing export for qemu_plugin_num_vcpus
  plugins: detect qemu plugin API symbols from header
  plugins: eradicate qemu-plugins.symbols static file

Thomas Huth (1):
  tests/functional: Convert the Avocado aarch64 tuxrun tests

 MAINTAINERS                              |   4 +-
 docs/devel/submitting-a-patch.rst        |   7 +-
 docs/devel/testing/functional.rst        |  16 ++
 include/qemu/qemu-plugin.h               |   1 +
 .gitlab-ci.d/check-dco.py                |   5 +-
 plugins/meson.build                      |  12 +-
 plugins/qemu-plugins.symbols             |  59 ------
 rust/hw/char/pl011/src/device.rs         |   2 +-
 scripts/qemu-plugin-symbols.py           |  45 +++++
 tests/avocado/tuxrun_baselines.py        | 224 -----------------------
 tests/functional/meson.build             |   3 +
 tests/functional/qemu_test/cmd.py        |  89 +++++++--
 tests/functional/qemu_test/testcase.py   |  43 +++--
 tests/functional/qemu_test/tuxruntest.py |  17 +-
 tests/functional/test_aarch64_tuxrun.py  |  50 +++++
 tests/functional/test_acpi_bits.py       |  57 ++----
 tests/functional/test_arm_bpim2u.py      |  20 --
 tests/functional/test_arm_orangepi.py    |  27 ---
 tests/functional/test_arm_tuxrun.py      |  28 +--
 tests/functional/test_i386_tuxrun.py     |   8 +-
 tests/functional/test_m68k_nextcube.py   |   3 +-
 tests/functional/test_m68k_tuxrun.py     |  34 ++++
 tests/functional/test_mips64_tuxrun.py   |   8 +-
 tests/functional/test_mips64el_malta.py  |   4 +-
 tests/functional/test_mips64el_tuxrun.py |   8 +-
 tests/functional/test_mips_tuxrun.py     |   8 +-
 tests/functional/test_mipsel_tuxrun.py   |   8 +-
 tests/functional/test_ppc64_tuxrun.py    |  16 +-
 tests/functional/test_ppc_tuxrun.py      |   8 +-
 tests/functional/test_riscv32_tuxrun.py  |   8 +-
 tests/functional/test_riscv64_tuxrun.py  |  16 +-
 tests/functional/test_s390x_tuxrun.py    |   8 +-
 tests/functional/test_sparc64_tuxrun.py  |   8 +-
 tests/functional/test_virtio_gpu.py      |   3 +-
 tests/functional/test_x86_64_tuxrun.py   |   8 +-
 35 files changed, 376 insertions(+), 489 deletions(-)
 delete mode 100644 plugins/qemu-plugins.symbols
 create mode 100755 scripts/qemu-plugin-symbols.py
 delete mode 100644 tests/avocado/tuxrun_baselines.py
 create mode 100755 tests/functional/test_aarch64_tuxrun.py
 create mode 100644 tests/functional/test_m68k_tuxrun.py

-- 
2.39.5


