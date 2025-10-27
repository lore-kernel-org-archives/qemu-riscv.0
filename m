Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEA5CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 10:10:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDKAo-0001vD-9W; Mon, 27 Oct 2025 06:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@videogpu.com>)
 id 1vDKAk-0001uX-WB
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 06:09:55 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <michael@videogpu.com>)
 id 1vDKAc-0003zx-AC
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 06:09:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso10253205e9.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=videogpu-com.20230601.gappssmtp.com; s=20230601; t=1761559781; x=1762164581;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dSIrBetGG+wfDz8yd4lntslaRbGzk4PwkgYTU3dLOJU=;
 b=Y+qDLrOk1Jxx8YOHzSRzrChaysB/WrrI84ZXCD7CgoMQfABEZtifY0wuH0gqXGwjhU
 RNpOMe9Yur8QEWkbN0tAzrkuFUADJD8AntU+LURSbsGkMESAM9ME2LnjkxFQbf3F4Jjs
 UP0mbCpjObKTnIU0djflufsCP5nxoTFdyeEFSDEsYMhWOtiXsv9nR7qcRyo/AjZ5hmRl
 HDvFclw055IoPLeQQ1S+/9uZmwWaYoj+gjc8lVlLQ2ao/Bmc+ne7Ud1zCm60qjj6VpfU
 s8uPIz8tFf0Ke7ilo4UALWMbEQi3cRuRuFiUGlJZ+i246rnZ9Bp5fcbwl+kjOTQfBibx
 QA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761559781; x=1762164581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dSIrBetGG+wfDz8yd4lntslaRbGzk4PwkgYTU3dLOJU=;
 b=MslvfAnmHofPzuvrkVzkmA+UV/4PCfvfy0mmsljElIG8PkTqZ2EY3Fl93paan+6Kkv
 18faJd0H2pEViE9vStAx4KzBMDJfhDzycJiiYxNeiqpdUmXmTYKZ0HNUDr5DcmLhhYiR
 SoXn8vvRY5QNfPypsu3v7vj3RBF8VibLAe86TGmyykHdr8+np4n3AclvzhbO3ZC6skWN
 b1k0I+F8xOdr2mkj5W487hsBOG/eQs+6kI6xPAnvlMec1/l03ewprO0Bt6FiyYYyFvVv
 SjZmwP8Vg6kBz8Co7v6E+gPtB0zhLBzVZf6YAQdnw5nwhTPhwF2ZHj6wcUGxgO9KRuFM
 WmHA==
X-Gm-Message-State: AOJu0YzclbL1MbJkBBpTzVoU8znqgUhMupNGH6jwtvq8jgqLdFddkYGb
 amEJbNLfjc5A7JVC1SyqYzzNiW1+GSxWm4yUaQ8ntD1nVWCvdmAwoXyekB7H1ZW+g3A=
X-Gm-Gg: ASbGncsOuUaQWg9XGuPRJ0qrrNnbfau9UNyVc0ylPe5C+D3FOOJJtwYgyzxKivFEVb8
 xq+W4PRxopoLoVJ624EQMM8Z+OxUl67n4hVKIRbhol+S9Fq2HBc+6fAVZP+//zGaATt+mT7XAXS
 flCmzVzepBSzbM8PacVTSyCrcfeIbrk8j9eUkyHU6VOTjJRKy2Exnnvt2Mfu1jvHan2Jkq9RiI1
 z259qFJOKNAa19EFsghDcaMqPPd4HbJHBob0dsiRyYeChkdB6QGaQ3u70pHfdkEbBQshkImExYX
 3uIRHKOdgMdbPVCRt9HNpsCTxhsghRsyzsTwQFxHR1dicmQPSt0OeDhatnJL4C/nKprXJLpyqLK
 Plm6Jg/tlGqsoIyul1gEV4k9DnBSUKGMoz+Q+WPi+ZKCCqsma0KnnI+JWsI3KKW/K2yh18LPlTO
 Pf915Thfiy14gwByQ=
X-Google-Smtp-Source: AGHT+IFoTLc4HvdxaBdw971nYTQW98A71R4PKctc2laELDqjB5RvIm7nSkWsYkKSn+I8Si+qmzuTHQ==
X-Received: by 2002:a05:600c:528e:b0:475:dcbb:7903 with SMTP id
 5b1f17b1804b1-475dcbb7927mr53656205e9.9.1761559780655; 
 Mon, 27 Oct 2025 03:09:40 -0700 (PDT)
Received: from DDesktop.local ([2a10:8012:d:eea4:f4de:376b:66b1:d7b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd494d5csm128625465e9.9.2025.10.27.03.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 03:09:40 -0700 (PDT)
From: Michael Levit <michael@videogpu.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, pbonzini@redhat.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 liwei1518@gmail.com, smishash@gmail.com
Subject: [PATCH v2 0/5] RISC-V: NEORV32 CPU, devices, and machine
Date: Mon, 27 Oct 2025 12:09:33 +0200
Message-ID: <20251027100938.11822-1-michael@videogpu.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::32e;
 envelope-from=michael@videogpu.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This v2 reworks my initial NEORV32 submission into a small, reviewable
series, following feedback to split the changes by subsystem.

The series introduces:
  * a minimal NEORV32 RV32 CPU type and vendor CSR hook,
  * the SYSINFO MMIO block,
  * a small UART device,
  * an SPI controller with command-mode chip-select,
  * and the 'neorv32' RISC-V board wiring the above, plus docs.

Tested by booting the NEORV32 bootloader as -bios and chaining into a
Hello World from an MTD-backed SPI flash image, with UART on stdio.

Changes since v1:
  * Split the monolithic patch into five functional patches, as suggested.
  * Dropped the accidental '.gitignore' hunk.
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


Michael Levit (5):
  target/riscv: add NEORV32 RV32 CPU type and vendor CSR hooks
  hw/misc: add NEORV32 SYSINFO block (CLK/MISC/SOC/CACHE)
  hw/char: add NEORV32 UART (CTRL/DATA, fifo, chardev)
  hw/ssi: add NEORV32 SPI controller (SSI master, CS command)
  hw/riscv: introduce 'neorv32' board, docs, and riscv32 device config

Thanks for reviewing!
Michael

-- 
2.20.1

