Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC162CCF9F8
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 18:51:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vGibJ-00047Z-Of; Wed, 05 Nov 2025 13:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@videogpu.com>)
 id 1vGib3-0003zV-Dv
 for qemu-riscv@nongnu.org; Wed, 05 Nov 2025 13:51:06 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <michael@videogpu.com>)
 id 1vGiay-0003Ba-M2
 for qemu-riscv@nongnu.org; Wed, 05 Nov 2025 13:51:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-429bcddad32so113209f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Nov 2025 10:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=videogpu-com.20230601.gappssmtp.com; s=20230601; t=1762368658; x=1762973458;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2if4ozVw8yt5djDJE9vZL0DPZmNx/MlAw6CBcParLWA=;
 b=iB/ce8X5G6XFkuqe8b2tFoVeVJzvTVka5rboPE0hrSRZgD7dJOJvihYBoMMvE99iIM
 wzZKh4x53HxbPWa4q0UVqdplk844LIzuwX0hBACn6Ab7tAet97fv2t/fJLH5cfEdgN4f
 bQSeVE2gbz0LDQvO7afWsdejjcyd2Xj85Wh9Zh9BYuoIumyKvoMZJLgudzXVJnpGbz1g
 cY3Thf8yLvJBZXRlIJ8oy0i5gc+cM8R2Zy61QL7V5VGaoEhNRVzKYOZ7aSFzsG8fqc0j
 LenLw+RflGjrzMjkRZFqDERzcy1IieNl+q3shj49mZSzt91B9C4LPl0HsDBAaofW0/uM
 YDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762368658; x=1762973458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2if4ozVw8yt5djDJE9vZL0DPZmNx/MlAw6CBcParLWA=;
 b=motD7u+yqURcXxdqhRaJGunpxtnGtvtEcK8qBHYVTzQJXSCATdlf17ICRnQXsdX8Po
 OQLtB0gNSbs7Anuh/eeXlOPSHf8X/T1FILJYiR0XKDxlpCC0YBbVrbVBrEm5C/lBNXGb
 /xLrhtQnfC9pOcXhdhfgNJhDzoBvd1ICTZUsDskogGvy+LMm8pVoRspWhhawmWEp75qs
 nvY5JmzKrPvDhB5Gt80XcmhOl5CwHTt4W1NNAGLHuSmdYhAr16MCa6Ju0PrwOYUVn8+T
 AOUIwwc3uOr6Aorfz1apUZ4ey8pemSmFC+3tygfvtTkFh+r1RZtfcU11NhQRSFQdC/so
 usDQ==
X-Gm-Message-State: AOJu0YyqaYQ1g/W6Hpa/CZ+1Z1lER2SmSneRaJFXG+ixCQVsBEk6UCmM
 vB9vh7OwayzgpuzwoKEkpcrCZSKb4G7gWlRCsTULkIH3gm9BdInIrHC4VrkqtQNNWto=
X-Gm-Gg: ASbGncsdJSTweVijD45XTCrRpGmUzEtISnqZnHN+cD5jpq8OFtQARjpxpF2elKWBpX3
 ZmE8bChPj9KVXOTXqh0bhWnuiaVq9wM1Ssz2xP65VvBhDJH+sg7OKAden0aRTqq88+kNczD3Ol8
 6XEvbrw+VFIcY7Z2hLWJh39JRAHEReN/XbwMW1ksmZEuE9dH6pFG536OrE0e5i6v6tyj6Rf2cgs
 HaRGdoMYZDOCCklZIuSaeln2m3tLU8+8aasUL0BVqGyV6+1+d1aFQdOiiBBnSkI9swvRe+d15zA
 MlzuFrb3fTxT6FXfjakcH7N+lngDl93yP/NhjJhc30b07XOhIHtcaVPvaMjOjT0cJ6ZrSs2i922
 +nn9zk2QrZNJfA5fFyhfX9A/ycdivbY2VokvtiNxsja7ADyY1VnPyhD//9Sq1hVIQKhC/RRDGVb
 DiboVH
X-Google-Smtp-Source: AGHT+IFlpPTMNUnO9qYRrTXBi9prP4yQo/YngAVNjhCrIYbFUhXLhWGnp6vE80c6bZ44QKdQuGRruw==
X-Received: by 2002:a05:6000:310d:b0:429:ba48:4d8 with SMTP id
 ffacd0b85a97d-429e32f478emr3892703f8f.25.1762368658174; 
 Wed, 05 Nov 2025 10:50:58 -0800 (PST)
Received: from DDesktop.local ([2a10:8012:d:eea4:f4de:376b:66b1:d7b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb42a354sm270622f8f.20.2025.11.05.10.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 10:50:57 -0800 (PST)
From: Michael Levit <michael@videogpu.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, pbonzini@redhat.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 liwei1518@gmail.com, smishash@gmail.com
Subject: [PATCH v3 0/5] RISC-V: NEORV32 CPU, peripherials, and machine
Date: Wed,  5 Nov 2025 20:50:51 +0200
Message-ID: <20251105185056.23565-1-michael@videogpu.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::432;
 envelope-from=michael@videogpu.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Hi all,

This v3 reworks my initial NEORV32 submissions.

The series introduces:
  * a minimal NEORV32 RV32 CPU type and vendor CSR hook,
  * the SYSINFO MMIO block,
  * a small UART device,
  * an SPI controller with command-mode chip-select,
  * and the 'neorv32' RISC-V board wiring the above, plus docs.

Tested by booting the NEORV32 bootloader as -bios and chaining into a
Hello World from an MTD-backed SPI flash image, with UART on stdio.

Changes since v2:
  * Clean-up all errors and most of the warnings generated by scripts/checkpatch.pl 
  * Sync with master, fix compile error
  * No intentional functional changes; only file organization and clarity.
  * Kept default.mak entry off by default (n).

Patch layout
============
  1/5  target/riscv: add NEORV32 RV32 CPU type and vendor CSR hooks
  2/5  hw/misc: add NEORV32 SYSINFO block (CLK/MISC/SOC/CACHE)
  3/5  hw/char: add NEORV32 UART (CTRL/DATA, fifo, chardev)
  4/5  hw/ssi: add NEORV32 SPI controller (SSI master, CS command)
  5/5  hw/riscv: introduce 'neorv32' board, docs, and riscv32 device config

Quick usage
===========
  $ ./configure --target-list=riscv32-softmmu --enable-debug --enable-fdt
  $ make -j$(nproc)

Prepare a flash image (64MiB) and place your app at 4MiB offset:
  $ dd if=/dev/zero of=$HOME/flash_contents.bin bs=1 count=$((0x04000000))
  $ dd if=/path/to/neorv32_exe.bin of=$HOME/flash_contents.bin \\
       bs=1 seek=$((0x00400000)) conv=notrunc

Run bootloader and chain-load your app:
  $ ./build/qemu-system-riscv32 -nographic -machine neorv32 \\
      -bios /path/to/neorv32/bootloader/neorv32_raw_exe.bin \\
      -drive file=$HOME/flash_contents.bin,if=mtd,format=raw

Debugging:
  $ ... -s -S   # gdbstub on :1234, start paused



Thanks for reviewing!
Michael

Michael (5):
  target/riscv: add NEORV32 RV32 CPU type and vendor CSR hooks
  hw/misc: add NEORV32 SYSINFO block (CLK/MISC/SOC/CACHE)
  hw/char: add NEORV32 UART (CTRL/DATA, fifo, chardev)
  hw/ssi: add NEORV32 SPI controller (SSI master, CS command)
  hw/riscv: introduce 'neorv32' board, docs, and riscv32 device config

 configs/devices/riscv32-softmmu/default.mak |   1 +
 docs/system/riscv/neorv32.rst               | 110 +++++
 hw/char/Kconfig                             |   3 +
 hw/char/meson.build                         |   1 +
 hw/char/neorv32_uart.c                      | 285 ++++++++++++
 hw/misc/Kconfig                             |   2 +
 hw/misc/meson.build                         |   1 +
 hw/misc/neorv32_sysinfo.c                   | 201 ++++++++
 hw/misc/neorv32_sysinfo.h                   |  88 ++++
 hw/misc/neorv32_sysinfo_rtl.h               | 239 ++++++++++
 hw/riscv/Kconfig                            |   8 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/neorv32.c                          | 215 +++++++++
 hw/ssi/Kconfig                              |   4 +
 hw/ssi/meson.build                          |   1 +
 hw/ssi/neorv32_spi.c                        | 478 ++++++++++++++++++++
 include/hw/char/neorv32_uart.h              |  54 +++
 include/hw/riscv/neorv32.h                  |  54 +++
 include/hw/ssi/neorv32_spi.h                |  57 +++
 target/riscv/cpu-qom.h                      |   2 +
 target/riscv/cpu.c                          |  18 +
 target/riscv/cpu.h                          |   3 +
 target/riscv/cpu_cfg.h                      |   1 +
 target/riscv/cpu_cfg_fields.h.inc           |   1 +
 target/riscv/cpu_vendorid.h                 |   2 +
 target/riscv/meson.build                    |   1 +
 target/riscv/neorv32_csr.c                  |  40 ++
 27 files changed, 1871 insertions(+)
 create mode 100644 docs/system/riscv/neorv32.rst
 create mode 100644 hw/char/neorv32_uart.c
 create mode 100644 hw/misc/neorv32_sysinfo.c
 create mode 100644 hw/misc/neorv32_sysinfo.h
 create mode 100644 hw/misc/neorv32_sysinfo_rtl.h
 create mode 100644 hw/riscv/neorv32.c
 create mode 100644 hw/ssi/neorv32_spi.c
 create mode 100644 include/hw/char/neorv32_uart.h
 create mode 100644 include/hw/riscv/neorv32.h
 create mode 100644 include/hw/ssi/neorv32_spi.h
 create mode 100644 target/riscv/neorv32_csr.c

-- 
2.51.1


