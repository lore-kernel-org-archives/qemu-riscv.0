Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oTvOQ-0005YH-Qv
	for mharc-qemu-riscv@gnu.org; Thu, 01 Sep 2022 21:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0m-0000TY-69
 for qemu-riscv@nongnu.org; Thu, 01 Sep 2022 18:50:12 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:42739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0i-00057e-HN
 for qemu-riscv@nongnu.org; Thu, 01 Sep 2022 18:50:11 -0400
Received: by mail-lj1-x22b.google.com with SMTP id p18so554574ljc.9
 for <qemu-riscv@nongnu.org>; Thu, 01 Sep 2022 15:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=pK0T5K9iLXIRmFjx2HXck4xniY+enuaxvAUkjGmDIvo=;
 b=tLe7gtDJL2FyJFwyz2SQ6WWUgfKINm5aYoaEWyP7/1nc2F+2y5q+fyPGr55kw8Ku20
 olveg1gnjRCinrrNJe7brqrm3UWboWjjqadoQIfkct1lEKt1C8XdFVqXdoZdxYaVrtSO
 /88xIcjQat4uNS2F401KIIyb1mmJqSkz2L2akvzDnfFPjArjRO0fFSPRPDaF65qtvEp7
 M4X8Y7jbs71IS7rokVcXNNN3OiywsGpAa9vgJZCSaW7WVLIfrbIjqsiTXkUcUgGcJxRo
 QPMV1ybcOlpStzFs3XKo3Z6QMhNiayVrHCVu6NQaz807PO1WybKTQT4u82Xakz/TP/UM
 A+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=pK0T5K9iLXIRmFjx2HXck4xniY+enuaxvAUkjGmDIvo=;
 b=PQOANQQrazQWGdjBtVi5gipGnDcNo+NQA5D8pCJElu+TOAFHEEdrzMToHU76eob6vB
 cB8m4YGBiy996AErRQ25143VuddX/WiJq5EC2QO0AbXBlDCsisv4/8ndDr7iDfaFy57A
 4n9RDxEtrgIFVsuH2p1FbyWre1Hhd9wjRrw+51b2E/JNMUNJCuccuuFcS8g21QG9fDSw
 QEXD/J9J6e0Bx8FByMxHWlmxUd+9sCKxxRfQ/wMjQWZctku+xfYoChlqcf2rZAkGGgbz
 439nZyE6uSYhmZUAcd1da92w2zJ0EwLuF+DJbLHIMTz/Kjqjdn3xID6m456zP/ehQ9Fi
 HM5g==
X-Gm-Message-State: ACgBeo1FkuBQsnpOSOM1Bk368pc6z7a1tyVzbIWzl11KXfez/4obBypD
 RKKrQPWMSBKzaJNqWSO4e5mGiNZzlTWdBGvR5WaoEZ4n//4y43Dw
X-Google-Smtp-Source: AA6agR7xzKWIvioV08tqobb46/NnS7VAEpzXlXsxf+6KPEd3UTuipn1KztX5of5LfdEeyBK/FxjcU1AfSvHysHtHz6U=
X-Received: by 2002:a05:651c:b0c:b0:268:dae4:9727 with SMTP id
 b12-20020a05651c0b0c00b00268dae49727mr528372ljr.526.1662072605864; Thu, 01
 Sep 2022 15:50:05 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 1 Sep 2022 15:49:55 -0700
Message-ID: <CAB88-qN40Z+M-jZaJ11+zRF=qa0j8rGttW1yAx3=t=27ne1tYg@mail.gmail.com>
Subject: [PATCH 0/4] Implement the OpenTitan watchdog
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=tkng@rivosinc.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Sep 2022 21:22:41 -0400
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
X-List-Received-Date: Thu, 01 Sep 2022 22:50:12 -0000

This patch series does three things:
1) Adds an implementation of the OpenTitan Always-On Timer's watchdog
functionality
2) Fixes a bug encountered with the SiFive PLIC device during development
3) Updates the register addresses and adds support for writes to mtime
for the Ibex timer

(2) is necessary for the bark interrupt to work. (3) will bring the
Ibex timer up to spec.

Tyler Ng (4):
  hw/watchdog: wdt_ibex_aon.c: Implement the watchdog for the OpenTitan
  hw/intc: sifive_plic.c: Fix interrupt priority index.
  hw/timer: ibex_timer.c: Update register addresses
  hw/timer: ibex_timer.c: Add support for writes to mtime

 hw/intc/sifive_plic.c              |   2 +-
 hw/riscv/Kconfig                   |   4 +
 hw/riscv/opentitan.c               |  22 +-
 hw/timer/ibex_timer.c              | 114 +++++---
 hw/watchdog/Kconfig                |   3 +
 hw/watchdog/meson.build            |   1 +
 hw/watchdog/wdt_ibex_aon.c         | 432 +++++++++++++++++++++++++++++
 include/hw/riscv/opentitan.h       |   9 +-
 include/hw/timer/ibex_timer.h      |   5 +
 include/hw/watchdog/wdt_ibex_aon.h |  67 +++++
 tests/qtest/ibex-aon-timer-test.c  | 189 +++++++++++++
 tests/qtest/meson.build            |   3 +
 12 files changed, 809 insertions(+), 42 deletions(-)
 create mode 100644 hw/watchdog/wdt_ibex_aon.c
 create mode 100644 include/hw/watchdog/wdt_ibex_aon.h
 create mode 100644 tests/qtest/ibex-aon-timer-test.c

--
2.30.2

