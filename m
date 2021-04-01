Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRtbY-0003fl-8C
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 05:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbX-0003ep-D9
 for qemu-riscv@nongnu.org; Thu, 01 Apr 2021 05:27:07 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbU-0000aU-Sm
 for qemu-riscv@nongnu.org; Thu, 01 Apr 2021 05:27:07 -0400
Received: by mail-pl1-x633.google.com with SMTP id e14so733796plj.2
 for <qemu-riscv@nongnu.org>; Thu, 01 Apr 2021 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=DPn/VyjoRcdg2Tb/W2GIOzIy4AXKOBLzr/lu5G5f78w=;
 b=WTVuWf1GFGxg85wW+C9jBW0VyBhvcnDZjA5UZEGZrkqiCVJ96GxS5U/ry4nYxFJMUA
 TnKFr27kULLtnBJ4GmAf3bYHDMueLRI8k9exXK7/OdRUFx84goMJrN/jrY4TJ2FWx+nL
 RGTaJ/HsIjhgSandYA51GzDUL4khO1chnM+slnqlzaN5XqrW6nduO8ewwK/7ePB8IQDk
 dVTma4tCMQeH2X12V9noGY7aPDsU5beNMj+WS6unHG8+90hA5s9xtmmA0QKmoFmArCBu
 sFwJGmVyz2SDDRe2rZfYRvSa81RN8qcqyZ/9aLXulsJqUxpSxmfQ5OBMzSHjRcb9kxjT
 1OVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DPn/VyjoRcdg2Tb/W2GIOzIy4AXKOBLzr/lu5G5f78w=;
 b=CL7MsXpNSb8bZIXP1JOrJHR/6juok5bJgAfBHgtkn1qOH6mb3lyprVc81zonbl5wKT
 OJnoGgs94C9BDJt5lZEjyk6hnltIlUcay6Uhdx8mmkDr8UeXnXPF7l0P1EYvVxKb1LHc
 0J+2mMgKnXiZAkHy3JDHBOwQyvBEqnGTi1WdhyiNNK9MKycbsMJpjNEimrhopJILHOkl
 9raW7uErHvDNaGt8iLCAigubQd72FDlo2FNebFvzpU7ZPKgFE15m00/LCokaDHwrtBFb
 TjytCcxrGk+ilkc2wxojvrUqHutAaR0J9+dXG6YaOOr/PfNT08SttZEeprqHTapjHLUd
 TQyA==
X-Gm-Message-State: AOAM5304KNHWvY0VtFPbSeLDqXLZf97k8R3O74Whr9dQoBuvAHMJJatD
 D0gehrEtiYchYXZbAuIheGIxbQ==
X-Google-Smtp-Source: ABdhPJygHkgiQpwIJugXU1X8LmzymKp8o56AVpmfEWta++IAlH667DroSXHiSN8RTSP07xt2RUTPNA==
X-Received: by 2002:a17:90a:c207:: with SMTP id
 e7mr7819857pjt.188.1617269222580; 
 Thu, 01 Apr 2021 02:27:02 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i7sm4751319pgq.16.2021.04.01.02.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:27:02 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [RFC v2 0/4] target/riscv: add RNMI support
Date: Thu,  1 Apr 2021 17:26:47 +0800
Message-Id: <20210401092659.12014-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Apr 2021 09:27:07 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset add suport of Resumable NMI (RNMI) in RISC-V.

There are four new CSRs and one new instruction added to allow NMI to be
resumable in RISC-V, which are:

=============================================================
  * mnscratch (0x350)
  * mnepc     (0x351)
  * mncause   (0x352)
  * mnstatus  (0x353)
=============================================================
  * mnret: To return from RNMI interrupt/exception handler.
=============================================================

RNMI also has higher priority than any other interrupts or exceptions
and cannot be disable by software.

RNMI may be used to route to other devices such as Bus Error Unit or
Watchdog Timer in the future.

The interrupt/exception trap handler addresses of RNMI are
implementation defined.

The technical proposal of RNMI can be found:
https://lists.riscv.org/g/tech-privileged/message/421

The port is available here:
https://github.com/sifive/qemu/tree/nmi-upstream-v2

To test RNMI, we have created another QEMU branch to have
RNMI feature enabled and also both SiFive Bus Error Unit and
Error Device included on sifive_e machine.

Bus Error Unit (BEU) is routed to RNMI with mncause value set to 3.
When any reads or writes to Error Device, it will drive BEU RNMI.
A freedom-e-sdk RNMI example is also provided for testing.
(We will also upstream BEU and Error Device in the near future.)

Two -cpu options are added for RNMI and BEU:
  * rnmi=true to enable RNMI feature
  * beu=true to enable BEU feature

Download and build freedom-e-sdk rnmi example:

1. git clone git@github.com:sifive/freedom-e-sdk.git
2. cd freedom-e-sdk
3. git checkout origin/dev/yihaoc/nmi -b nmi
4. git submodule init
5. git submodule update --recursive
6. Follow freedom-e-sdk guide to install freedom-e-sdk:
   https://sifive.github.io/freedom-e-sdk-docs/index.html
7. make PROGRAM=example-rnmi TARGET=qemu-sifive-e31 \
    CONFIGURATION=release software

Download, build and run freedom-e-sdk RNMI example on QEMU:

1. git clone git@github.com:sifive/qemu.git
2. cd qemu
3. git checkout origin/upstream-nmi-beu-error-device -b nmi-beu-error-device
4. git submodule init
5. git submodule update --recursive
6. ./configure --target-list=riscv32-softmmu
7. make -j
8. <path to qemu-system-riscv32> -nographic -M sifive_e \
    -cpu rv32,rnmi=true,beu=true \
    --bios none -kernel <path to example-rnmi.elf>

Output example:

RNMI Driver Example.
Cleared accrued bus error
Enter RNMI interrupt ISR.
mnscratch: 0x00000000
mnepc: 0x20401178
mncause: 0x00000003
mnstatus: 0x00001800
Try to trigger illegal instruction exception.
Enter RNMI exception ISR.
mscratch: 0x00000000
mepc: 0x20401208
mcause: 0x00000002
mstatus: 0x80007800
Return from RNMI exception ISR.
Handled TileLink bus error
Return from RNMI interrupt ISR.
Test passed!!

Changelog:

v2
  * split up the series into more commits for convenience of review.
  * add missing rnmi_irqvec and rnmi_excpvec properties to riscv_harts.

Frank Chang (4):
  target/riscv: add RNMI cpu feature
  target/riscv: add RNMI CSRs
  target/riscv: handle RNMI interrupt and exception
  target/riscv: add RNMI mnret instruction

 hw/riscv/riscv_hart.c                         |  8 +++
 include/hw/riscv/riscv_hart.h                 |  2 +
 target/riscv/cpu.c                            | 40 +++++++++++++
 target/riscv/cpu.h                            | 16 ++++-
 target/riscv/cpu_bits.h                       | 19 ++++++
 target/riscv/cpu_helper.c                     | 49 +++++++++++++--
 target/riscv/csr.c                            | 59 +++++++++++++++++++
 target/riscv/helper.h                         |  1 +
 target/riscv/insn32.decode                    |  3 +
 .../riscv/insn_trans/trans_privileged.c.inc   | 13 ++++
 target/riscv/op_helper.c                      | 31 ++++++++++
 11 files changed, 236 insertions(+), 5 deletions(-)

--
2.17.1


