Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ophJP-0002HJ-DD
	for mharc-qemu-riscv@gnu.org; Mon, 31 Oct 2022 22:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophJ6-0002E3-Dj
 for qemu-riscv@nongnu.org; Mon, 31 Oct 2022 22:47:28 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophJ3-0004D8-OO
 for qemu-riscv@nongnu.org; Mon, 31 Oct 2022 22:47:15 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 cy15-20020a056830698f00b0065c530585afso7825829otb.2
 for <qemu-riscv@nongnu.org>; Mon, 31 Oct 2022 19:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LNFLpDjl6gEmrwAKx9a5roVrTsz01H64OI9IVTmmQUQ=;
 b=CjDXJufn7C6d+ZokQ8yj0QZIK/GPc9r/10wW5xVkMI+95T0WQwgiiLzzHcBEGX3fK+
 WigGJGGKAxqEl8B9GrxJ10yVHhJ8L5C+WeCorL845HGlDO6m1FfWeiPoNXVEdYNQWsWv
 vnw9I42rzPTgJHxfVd3q6IkZnvkKnwGt2huYiEhuAE+qgaeb9DhVHzM1xCk2TA8lw96E
 RN0DW335zaLtOx42F4yjb9D7DP3JZz4ctNvTyyfW8/vavxyzcOe6i1bFM8Vjwi3kJqB6
 XfQV48mHu85Sl9hsH7ndIvaLIp6nWcAIAXsfCMNNkbYtOCxrafjYNolThrBBHyd6qycy
 6LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LNFLpDjl6gEmrwAKx9a5roVrTsz01H64OI9IVTmmQUQ=;
 b=TAXoupsS82D1WNpdl2+IACt7pV4P6j4SCj3m/N+lMxX8HcNM7wtbHgLvnZd3GLtOOD
 LK0g9Z9cQ+pjaB0Tra2qnV9iWN26MNhXGUS/U4JnkcHppkKiTQdEAxjXHjMDerixc2CY
 F9/exXbpYiZrTb8JAyV2kbSOXmwaXD7kOvG4qjsS6YAthmUOaCTAmp2fu9vTg/L6Mcjo
 fT+Pq1ZAKclznkI9Bne0hArPmpMkleHR6w84G75hi+Ekrv2+6GzCVh8r298e/XnHJOyk
 y2AQjtzh0s7oz2IDOc7yyoOKiF4Jy+0uFFffOPP0+C8E5IGr+Eb0Cb32fGZeqVLoKTzp
 OZew==
X-Gm-Message-State: ACrzQf1UMWdNTUT4oE8AE+udzjZTRegHA1Yl0o2YLugI0xfE6UbfTUJ6
 f3hcGhsknldyAt5T4HK//N2OOw==
X-Google-Smtp-Source: AMsMyM629vGvszhFiW1Z7i5d2Al7HB4iEDo6UsaaN6CJafdhZtqQ+szQdJM6f1MfCwY3yJcaT14Q2w==
X-Received: by 2002:a05:6830:2706:b0:661:e264:9b82 with SMTP id
 j6-20020a056830270600b00661e2649b82mr8403066otu.82.1667270830422; 
 Mon, 31 Oct 2022 19:47:10 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05683001c400b00661a33883b8sm3367215ota.71.2022.10.31.19.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 19:47:09 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v2 0/3] Implement the watchdog timer of HiFive 1 rev b.
Date: Mon, 31 Oct 2022 19:46:53 -0700
Message-Id: <20221101024656.517608-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=tommy.wu@sifive.com; helo=mail-ot1-x329.google.com
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
X-List-Received-Date: Tue, 01 Nov 2022 02:47:29 -0000

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

Tommy Wu (3):
  hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
  hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
  tests/qtest: sifive-e-aon-watchdog-test.c : Add QTest of watchdog of
    sifive_e

 hw/misc/Kconfig                          |   3 +
 hw/misc/meson.build                      |   1 +
 hw/misc/sifive_e_aon.c                   | 403 ++++++++++++++
 hw/riscv/Kconfig                         |   1 +
 hw/riscv/sifive_e.c                      |  13 +-
 include/hw/misc/sifive_e_aon.h           |  62 +++
 include/hw/riscv/sifive_e.h              |   8 +-
 tests/qtest/meson.build                  |   3 +
 tests/qtest/sifive-e-aon-watchdog-test.c | 650 +++++++++++++++++++++++
 9 files changed, 1139 insertions(+), 5 deletions(-)
 create mode 100644 hw/misc/sifive_e_aon.c
 create mode 100644 include/hw/misc/sifive_e_aon.h
 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c

-- 
2.27.0


