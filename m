Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obObC-0007Ky-4p
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 11:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1obOb8-0007Hm-Uh
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 11:58:47 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1obOb6-0004q6-HS
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 11:58:46 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o99-20020a17090a0a6c00b002039c4fce53so2854287pjo.2
 for <qemu-riscv@nongnu.org>; Thu, 22 Sep 2022 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=g151PNUk/a7LItKdEKf8ohvN14x9wEGJ63ngSuCRrTs=;
 b=lp+HtylerCpz/IeNCAbBRVXtE+ErX4XtARqbs2RaW51KBZTyg2RzPYKEqMV4ZJy3Jc
 t5ByBij5u06ZHE50WcQcVA2l+jYDf8RXy8d76fSUDGbzDb3X6xf52TT1zozEoo/VBDRJ
 kx8R6QEtojNPs+NLRBa9/fC9WUai/RDkPy/oycyzBcAQUl7u8gvcu3ki8IIUcAunMaoF
 FnvmCZoDBqZkZ4tiWqO4DSlDSoPrwf9CazTLdW3T48RMONzoSGb35tOpTXdrz1lBOWd5
 eqqGzO4ISubFDeN2wUBY235i37STo+TKJprhlv2v88c+Du7Z+lQPWj3t1RNHxKqDlLJv
 yoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=g151PNUk/a7LItKdEKf8ohvN14x9wEGJ63ngSuCRrTs=;
 b=sszm+EwVmrjrU5yhaiCxVpMonoCH2hF7N3IJs7u/oYPJvUolhUjrFn2fgA40B/gYsA
 lGbuk1TJmetH3J/fSaO0UYEWF7gTUQS1BbvjKSh27XHequ2+vuNLvz0o9sIOmOvBDrMm
 VKdDlNJQc+kpg3Ngejlh8k7IC/C1YV9xrZXg0TWQ+q9c4EWEK5WKKgZHlPVcWFn0PcBV
 1qM9ZtS/Wo1OKqR2xzN3U3bJV2lx8u6pbMLYLrCs2N+sTu6u8qGZfHDx76J1GtL1xRn2
 F86YtlEWN0GaWQhpQKN036hbWrniuWZ24bWCc1BJhI3hO5ha8TJBR6RAhJqBMLH2Rwd0
 gZgg==
X-Gm-Message-State: ACrzQf1gclnZLFw3F1/3FOrzLGjAXYhwsEa07CmtbrR1r2DR5q3vEGvs
 8R4Jdr+QAVsDHoxVb4zMducAFNDPClDwch14ldjZspUMZdwZkg==
X-Google-Smtp-Source: AMsMyM7k+Pjy9zyPYsm+CL8pUTCbA004XssRLXx+IaSBb286JrhOIlw666ulhwKob+jzQlo/1VnzHFSGCWCSRvaoAE4=
X-Received: by 2002:a17:902:f604:b0:172:75a4:33ea with SMTP id
 n4-20020a170902f60400b0017275a433eamr3848235plg.7.1663862321849; Thu, 22 Sep
 2022 08:58:41 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 22 Sep 2022 08:58:30 -0700
Message-ID: <CAB88-qN7Uz-W-UQY1SZA2XZ7cNQPKCxCVcangrveFvxuBKdfrw@mail.gmail.com>
Subject: [PATCH v2 0/3] Implement the Opentitan watchdog
To: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=tkng@rivosinc.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 22 Sep 2022 15:58:47 -0000

This patch series implements the OpenTitan Always-On Timer device, and
includes several fixes/feature additions to existing devices.

The memory map used for reference can be found here:
https://github.com/lowRISC/opentitan/blob/217a0168ba118503c166a9587819e3811eeb0c0c/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h

The main components of this patch series are:
1. The OpenTitan AON Timer device itself, and an associated qtest.
2. Fix a bug found with the sifive plic device.
3. Adds support for writes to mtime in the Ibex timer device and adds
a qtest for it.

Tyler Ng (3):
  hw/watchdog: wdt_ibex_aon.c: Implement the watchdog for the OpenTitan
  hw/intc: sifive_plic.c: Fix interrupt priority index.
  hw/timer: ibex_timer.c: Add support for writes to mtime

 hw/intc/sifive_plic.c              |   4 +-
 hw/riscv/Kconfig                   |   4 +
 hw/riscv/opentitan.c               |  21 +-
 hw/timer/ibex_timer.c              |  98 +++++--
 hw/watchdog/Kconfig                |   3 +
 hw/watchdog/meson.build            |   1 +
 hw/watchdog/wdt_ibex_aon.c         | 405 +++++++++++++++++++++++++++++
 include/hw/riscv/opentitan.h       |   7 +-
 include/hw/timer/ibex_timer.h      |   6 +
 include/hw/watchdog/wdt_ibex_aon.h |  67 +++++
 tests/qtest/ibex-aon-timer-test.c  | 189 ++++++++++++++
 tests/qtest/ibex-timer-test.c      | 178 +++++++++++++
 tests/qtest/meson.build            |   4 +
 13 files changed, 953 insertions(+), 34 deletions(-)
 create mode 100644 hw/watchdog/wdt_ibex_aon.c
 create mode 100644 include/hw/watchdog/wdt_ibex_aon.h
 create mode 100644 tests/qtest/ibex-aon-timer-test.c
 create mode 100644 tests/qtest/ibex-timer-test.c

--
2.34.1

