Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obHlu-00082Z-RF
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 04:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHln-000822-8u
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 04:41:19 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHll-00009m-E9
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 04:41:18 -0400
Received: by mail-pg1-x533.google.com with SMTP id s206so8474504pgs.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Sep 2022 01:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=+4rim3ibIpaGXCMvpT4yqhyL8WjkihXEZjo9mLkOCyM=;
 b=jd01xzSR98DcqZvmA1cBVRLJjgZtqcAOd8dluWM0FoU0y0HPn9TwEGpJJAcTbGBDkk
 JfwWcSapkG7HOM8LpqYiW/NL6se324SEIO7MQxa7rPcH9SaBSBqo8FV30/GW9u4/v1dU
 i8JpIKePJ0h1Oe5BnY/8EmjjvkDj/Qsb+9H3ksM+CkmjtmiPsZ6rWyTMDEvZw/cWGwG/
 vnpn0ynCsGWkjot2gOI++qvXooRNaoVCjUQHojIZG7Vy3BTGtIfvWuL0RTVCHzMh0BRb
 HOZpy3ENSt2WLHcj2JK2zgBnuQ3OAPVfLlb+gTOlpEE011CxubMXL0pLYVtr4/PKYXRn
 nwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+4rim3ibIpaGXCMvpT4yqhyL8WjkihXEZjo9mLkOCyM=;
 b=PDYqJmBB9rMm+3WbO7jOYL+NQseQoTjV7LfUx19vsfPk23sVa24tv2lVekSRX3pj8V
 qjIdR0T6ZrWmYSRQb5aIexJqLC2cNIEMUeXzmPEiKt88MPCm7Yy3Y3QldukaFO9fGVkz
 PcZKY4eX6pW2gP5vkxXwXxmJyEVdQF2QP2CHstr2mYQxBj09b1WIJIJ+u2SeanQwmfJP
 BALF9Rft2EKUj256QTQiMTyX7q6qK6tpPEkwiLSiivm+Me9nXUseU3U9Je5wljwFrjND
 EOxGAaHU5CO9XSzaKzyRYllY1gdRwKyLEBu6R3oSvYDLugbk+Zo9WA1BFO2SxHp3SAle
 zUDA==
X-Gm-Message-State: ACrzQf1v0aMpfdktmzc8VrqXGv/mUHoDBemyk/vdtGUH08Pudex97GQW
 K+sfk7qF3Zj1JAzJq6CoqUFgWA==
X-Google-Smtp-Source: AMsMyM7r6YXs3eoUSArYl1rS5EeFLFEmlVnXbr4BDfBnwIIzquhzQ6dIPNDU9FoTtvIKMVefuEb/eA==
X-Received: by 2002:a05:6a00:1947:b0:54d:d12e:93b7 with SMTP id
 s7-20020a056a00194700b0054dd12e93b7mr2369393pfk.77.1663836075485; 
 Thu, 22 Sep 2022 01:41:15 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a17090a1f8200b0020379616053sm3239202pja.57.2022.09.22.01.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:41:14 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH 0/3] Implement the watchdog timer of HiFive 1 rev b.
Date: Thu, 22 Sep 2022 01:41:04 -0700
Message-Id: <20220922084107.2834285-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=tommy.wu@sifive.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Sep 2022 08:41:19 -0000

The HiFive 1 rev b includes a watchdog module based on a 32-bit
counter. The watchdog timer is in the always-on domain device of
HiFive 1 rev b, so this patch added the AON device to the sifive_e
machine. This patch only implemented the functionality of the 
watchdog timer, not all the functionality of the AON device.

You can test the patchset by the QTest tests/qtest/sifive-e-aon-watchdog-test.c

Tommy Wu (3):
  hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
  hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
  tests/qtest: sifive-e-aon-watchdog-test.c : Add QTest of watchdog of
    sifive_e

 hw/misc/Kconfig                          |   3 +
 hw/misc/meson.build                      |   1 +
 hw/misc/sifive_e_aon.c                   | 330 +++++++++++++++++++
 hw/riscv/Kconfig                         |   1 +
 hw/riscv/sifive_e.c                      |   5 +-
 include/hw/misc/sifive_e_aon.h           |  87 +++++
 include/hw/riscv/sifive_e.h              |   7 +-
 tests/qtest/meson.build                  |   3 +
 tests/qtest/sifive-e-aon-watchdog-test.c | 400 +++++++++++++++++++++++
 9 files changed, 832 insertions(+), 5 deletions(-)
 create mode 100644 hw/misc/sifive_e_aon.c
 create mode 100644 include/hw/misc/sifive_e_aon.h
 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c

-- 
2.27.0


