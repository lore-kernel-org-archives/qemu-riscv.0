Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiIbX-00016j-Uk
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 10:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbU-00013Z-Qd; Mon, 08 Jun 2020 10:18:20 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbT-0004Te-5P; Mon, 08 Jun 2020 10:18:20 -0400
Received: by mail-pg1-x532.google.com with SMTP id r10so8789295pgv.8;
 Mon, 08 Jun 2020 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MPi6vTj4qaMjTAPVVPddeTzme+C9Ipmgwatea/EQioM=;
 b=FCT0JH+XhC2zfKYSnkiswanmt0YIbA3C/MIlVXrJSK97VwKuVNFuM455HDOAQQqbFx
 ulgPI3Lv8e+EchQFQTtiAd/IGydOfr/N5jkPDgRKkLmfkD5OUA/EeLqCu5/TzuOIUqLO
 xwMp02qg0WYGDlcET7xePOFexSh5vjfg1QDzeKravePKSodPCHfjOebItwgJYShg7Zd9
 2rj9a552iy4fgKtV8i7rlNVSAG9ordBcB3NCW+iW+49wiGTOplhrsQpqiCNEeu+Efepk
 esjWHYLYlMxYJkIYNd5+PFNSaV19+j5RpNzkUSlaePIXGmCGDBStzMbMyT0QLKMJ/oni
 Ee0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MPi6vTj4qaMjTAPVVPddeTzme+C9Ipmgwatea/EQioM=;
 b=QjV5NwcyQcdeHInnURa7m02+OzJ+LDJtaa7GR2E0VwuzGyA0enc9Mzlg85ExQgJXOJ
 5uttf+1wk0sQRvfQHCO6adT9qYN30T3uOp4s818lM3iftL0HY47JW3bjDLpMLcs3lPfV
 Eiw7BPFE9EYU+cbTgiYfJYPauF2rCbsRP7K4NqNho875P31HX28fvLgxojchSN+k2z0W
 4YCNupbLq674/CgWqZzvztqYwXXv8h/u7EjUscT/BIokK2PwtH/C6lsypf/NGIwXnVQZ
 61S6LY/XQh71F5KCkWnUSX0YwwsxIjPJaU1Qd46P1rNDiH9VbCmvGd/Sz09myWVEyfeg
 lb6w==
X-Gm-Message-State: AOAM531OTn43hx06+8ISCD0oukhKlib3WRsvC1UTsiFszaaeVN/JsIax
 GNSadD2cVlUJ9vPXnywDMac=
X-Google-Smtp-Source: ABdhPJxHA2QWIpl8P6p1cZ6m5j4ZizuOLOIwvtYa1jIVq8ueNU7O1IPYfgbjG68vicRUAhrHlHXKSA==
X-Received: by 2002:a65:4908:: with SMTP id p8mr19994720pgs.214.1591625896731; 
 Mon, 08 Jun 2020 07:18:16 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id b19sm7292575pft.74.2020.06.08.07.18.15
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 08 Jun 2020 07:18:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 00/15] hw/riscv: sifive_u: Add GPIO and Mode Select
 (MSEL[3:0]) support
Date: Mon,  8 Jun 2020 07:17:29 -0700
Message-Id: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 14:18:21 -0000

From: Bin Meng <bin.meng@windriver.com>

This series updates the 'sifive_u' machine support:

- Add GPIO controller support
- Support reboot functionality via GPIO pin#10
- Change SiFive E/U series CPU reset vector to 0x1004
- Support Mode Select (MSEL[3:0]) settings at 0x1000 via a new
  "msel" machine property
- Add a dummy DDR memory controller device

The series also does some clean-ups to the existing codes.

With this series, QEMU can boot U-Boot SPL built for SiFive FU540
all the way up to loading U-Boot proper from MMC:

$ qemu-system-riscv64 -nographic -M sifive_u,msel=6 -m 8G -bios u-boot-spl.bin

U-Boot SPL 2020.07-rc3-00208-g88bd5b1 (Jun 08 2020 - 20:16:10 +0800)
Trying to boot from MMC1
Unhandled exception: Load access fault
EPC: 0000000008009be6 TVAL: 0000000010050014

The last big gap for the 'sifive_u' machine is the QSPI modeling.


Bin Meng (15):
  hw/riscv: sifive_e: Remove the riscv_ prefix of the machine* and soc*
    functions
  hw/riscv: opentitan: Remove the riscv_ prefix of the machine* and soc*
    functions
  hw/riscv: sifive_u: Simplify the GEM IRQ connect code a little bit
  hw/riscv: sifive_u: Generate device tree node for OTP
  hw/riscv: sifive_gpio: Clean up the codes
  hw/riscv: sifive_gpio: Add a new 'ngpio' property
  hw/riscv: sifive_u: Hook a GPIO controller
  hw/riscv: sifive_gpio: Do not blindly trigger output IRQs
  hw/riscv: sifive_u: Add reset functionality
  hw/riscv: sifive_u: Rename serial property get/set functions to a
    generic name
  hw/riscv: sifive_u: Add a new property msel for MSEL pin state
  hw/riscv: sifive: Change SiFive E/U CPU reset vector to 0x1004
  hw/riscv: sifive_u: Support different boot source per MSEL pin state
  hw/riscv: sifive_u: Sort the SoC memmap table entries
  hw/riscv: sifive_u: Add a dummy DDR memory controller device

 hw/riscv/opentitan.c           |  29 ++++----
 hw/riscv/sifive_e.c            |  32 +++++----
 hw/riscv/sifive_gpio.c         |  45 +++++++-----
 hw/riscv/sifive_u.c            | 158 ++++++++++++++++++++++++++++++++++-------
 include/hw/riscv/sifive_gpio.h |   8 ++-
 include/hw/riscv/sifive_u.h    |  27 +++++++
 target/riscv/cpu.c             |   4 +-
 7 files changed, 223 insertions(+), 80 deletions(-)

-- 
2.7.4


