Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0CJM-0003QD-MF
	for mharc-qemu-riscv@gnu.org; Tue, 29 Nov 2022 20:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1p0CJL-0003PM-BJ
 for qemu-riscv@nongnu.org; Tue, 29 Nov 2022 20:54:55 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1p0CJJ-0005RE-HW
 for qemu-riscv@nongnu.org; Tue, 29 Nov 2022 20:54:55 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so513570pjm.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Nov 2022 17:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Na3Qsw2N8+bEzTD+3WGfRuAEDb8bOMMkoc+54F3zD8=;
 b=Ff+Yibyt5FylZ6tZTHtDwpu/ALhNFkDd5WC5D0/XVvBFzak3Hhax+N2xYmkbIsFuLC
 kj2MlgoE8J20KZ75iCglwebJh+P18eL9n2hOTPGENoL0xfthoMG65cxbAq1M0dGSWRdo
 Lx2U6q7YBPcbpbuT+cig5Zcaiuw0I+M4LLrgF7b8g74ZNnK0E+yU02zLWCderXkLY3iG
 YTvsutYHfMeVY2J60FwslH3mO+URV8SQ/5XbiDY2BXalmBYFMyIFnnT69KYGuVHLbRo4
 n5FM71lSOOkyAL/s49DOmy1zWqI0HWkqWJP6zW9PO45EWZtdzi16+jsGcdreXJIvbYEk
 vdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Na3Qsw2N8+bEzTD+3WGfRuAEDb8bOMMkoc+54F3zD8=;
 b=pGRUWnC0XNjruBj7e+nOfELJpJncHPGoCaEQXqp+/vcAebbuASSHIX4P5lJAdEdlj2
 6KvT/98fwkzP60+MPreWPmTjYcs/4oStd+6/OCwsRHZjkw7IYnAfRbcqV4ZAynYijfxI
 /bxDcdwaeGe0/ANWoRU+m1ttbx68ZmpdgN2ST/MtLsYXggL/5JlBjvCHDT/8NxohhFJp
 Ud0rKkY8uxJLRpU1l7OXh5Twbq88eYcZ5i3eBZHzY5e5PHVlUEOHhIBGXiB0O8BYkcTx
 j9i+6rvGMFdXArEHQpISGAiX6ociC4T+r/WPM+V7xDzZj+3Bj6GkgYhdbJnACSk001ab
 lAWA==
X-Gm-Message-State: ANoB5plXaGFPc0I0ZgMpQjwjfKcTKZJTKcW+HZztQDY8stJb+AqZkpyq
 aL6SIlTQA47ry0A1si+hkON9sQ==
X-Google-Smtp-Source: AA0mqf7hoCLgNipEvantO22dDBmvwc4TpN1xhKvgMujp2YfqbMXms7OSdrhAXAF0B2gJ0dxifdkG8w==
X-Received: by 2002:a17:90a:ff14:b0:219:1927:27bc with SMTP id
 ce20-20020a17090aff1400b00219192727bcmr21221540pjb.229.1669773291379; 
 Tue, 29 Nov 2022 17:54:51 -0800 (PST)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a655b48000000b004768ce9e4fasm9003871pgr.59.2022.11.29.17.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 17:54:51 -0800 (PST)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v3 0/3] Implement the watchdog timer of HiFive 1 rev b.
Date: Tue, 29 Nov 2022 17:54:41 -0800
Message-Id: <20221130015444.1459842-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=tommy.wu@sifive.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Wed, 30 Nov 2022 01:54:55 -0000

The HiFive 1 rev b includes a watchdog module based on a 32-bit
counter. The watchdog timer is in the always-on domain device of
HiFive 1 rev b, so this patch added the AON device to the sifive_e
machine. This patch only implemented the functionality of the
watchdog timer, not all the functionality of the AON device.

You can test the patchset by the QTest tests/qtest/sifive-e-aon-watchdog-test.c

Changes since v1 ( Thank Alistair for the feedback ):
- Use the register field macro.
- Delete the public create function. The board creates the aon device itself.
- Keep all variable declarations at the top of the code block.

Changes since v2 ( Thank Alistair for the feedback ):
- Delete the declaration and definition of the create function.

Tommy Wu (3):
  hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
  hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
  tests/qtest: sifive-e-aon-watchdog-test.c : Add QTest of watchdog of
    sifive_e

 hw/misc/Kconfig                          |   3 +
 hw/misc/meson.build                      |   1 +
 hw/misc/sifive_e_aon.c                   | 383 +++++++++++++
 hw/riscv/Kconfig                         |   1 +
 hw/riscv/sifive_e.c                      |  13 +-
 include/hw/misc/sifive_e_aon.h           |  60 +++
 include/hw/riscv/sifive_e.h              |   8 +-
 tests/qtest/meson.build                  |   3 +
 tests/qtest/sifive-e-aon-watchdog-test.c | 650 +++++++++++++++++++++++
 9 files changed, 1117 insertions(+), 5 deletions(-)
 create mode 100644 hw/misc/sifive_e_aon.c
 create mode 100644 include/hw/misc/sifive_e_aon.h
 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c

-- 
2.27.0


