Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD9CC3DA61
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 17:57:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sYUYy-0004Fq-Nh; Mon, 29 Jul 2024 13:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sYUYx-0004EU-9n
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 13:53:35 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sYUYu-0000Fu-Sy
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 13:53:35 -0400
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3992195d08aso22375675ab.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2024 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722275611; x=1722880411;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H2xLJgXw6R/0lG6wGj/srvFAJLdIcJcWhzPHGC34cMI=;
 b=UqSyJ36TUrxff1Bbk/r4gKUw4A0bQDNCIm/Th+cSNMiWGceVfhIYPEl1SVMRVo5tQq
 X/Blm3GoroAJZpB2O9sdNYsGanYTuGZyD6f8JvHVNgpyHtxma2rsSjfcriVG4Le+2Bd/
 FBCTvQsGQAgJPnaC6oIbh8Vyb3KmCAQ/Nz8XXEh1XhGdngnw2mPU+HCfPxlZPCa/sstc
 EdNUfQR/ND0gIPcVjbfGCKkAJJuO8X5uuq8HqdMNrLm2SWbGlsM5Jn61fTZHgIDJTtih
 uAA6mJRhoqAwt4xDoAN9BleXxg7JkSTE1iLqZEdWkl5dWJlBBNCSv/uEOiFoLaaGM0U6
 FgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722275611; x=1722880411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H2xLJgXw6R/0lG6wGj/srvFAJLdIcJcWhzPHGC34cMI=;
 b=a48YOvkYvkn+BtKRVwJsqTIcqwq2YKfG2+C3RY9vPAlirDKX9Oauj7mXNy7b9dImi6
 oDGDdh+68J5SsEeyWfmL2yNiP7PYww00kZ4aQi6hUHFnTyEUTW4nGkVc0Nb225OMYZBY
 BKGNqQmD6nNLL8Tf2okJbNE78BVtiCHL3txTmQRXntox4Fs3Gb0K/iOHIGE2Wt6Nb3nO
 1W4lebyUBp/lhtroY9Um0SzBbtQnGHF7AgLQfKRdd7ktDFfy0CN/3XIkwtw4rGwyScBM
 IRfopiDsfTL8xxl8i/4coO185Y4sYYOeM8L39ScpN1bIzSsmavjv3/sUmtJyjbh4P2qV
 oL6w==
X-Gm-Message-State: AOJu0YyyYtYkFwj9OF8GA2tYzBYQVhlpH2HhEu+KvVHBHJIGttNku7Zs
 m2sy1G+cp+BjFrxgompCwgqMcYUTV9+H1MmgqTmZxupO5aAISxqt/YgOxB6iuVg7eH2/avnBUDf
 X
X-Google-Smtp-Source: AGHT+IEGKCNlxHTksWgOLIyUyF7sGOiGtpkAYlptUjNARFeWALKxMN3cJCEn7zBLF0dm24gEAl4Daw==
X-Received: by 2002:a05:6e02:13a2:b0:398:f487:5a04 with SMTP id
 e9e14a558f8ab-39aec2dcde3mr98824885ab.11.1722275611018; 
 Mon, 29 Jul 2024 10:53:31 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7a9f7c71b15sm6303141a12.18.2024.07.29.10.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 10:53:30 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, jim.shu@sifive.com,
 andy.chiu@sifive.com, jesse.huang@sifive.com, kito.cheng@sifive.com
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v2 00/24] riscv support for control flow integrity extensions
Date: Mon, 29 Jul 2024 10:53:02 -0700
Message-ID: <20240729175327.73705-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=debug@rivosinc.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Sending out v2 for riscv zicfilp and zicfiss extensions support in qemu.
I sent out v1 [1] last week and had missed adding `trans_zicfiss.c.inc` in
commit titled "implement zicifss instructions" and commit titled "shadow
stack mmu index for shadow stack instructions". Revising both those commits
and sending out patch series again.

[1] - https://lists.nongnu.org/archive/html/qemu-devel/2024-07/msg06017.html

---
v2:
- added missed file (in v1) for shadow stack instructions implementation.

Deepak Gupta (24):
  target/riscv: Add zicfilp extension
  target/riscv: Introduce elp state and enabling controls for zicfilp
  target/riscv: save and restore elp state on priv transitions
  target/riscv: additional code information for sw check
  target/riscv: tracking indirect branches (fcfi) for zicfilp
  target/riscv: zicfilp `lpad` impl and branch tracking
  disas/riscv: enabled `lpad` disassembly
  linux-user/syscall: introduce prctl for indirect branch tracking
  linux-user/riscv: implement indirect branch tracking prctls
  target/riscv: Add zicfiss extension
  target/riscv: introduce ssp and enabling controls for zicfiss
  target/riscv: tb flag for shadow stack  instructions
  target/riscv: implement zicfiss instructions
  target/riscv: compressed encodings for sspush and sspopchk
  target/riscv: mmu changes for zicfiss shadow stack protection
  target/riscv: shadow stack mmu index for shadow stack instructions
  linux-user/syscall: introduce prctl for shadow stack enable/disable
  linux-user/riscv: setup/teardown zicfiss shadow stack for qemu-user
  disas/riscv: enable disassembly for zicfiss instructions
  disas/riscv: enable disassembly for compressed sspush/sspopchk
  target/riscv: add trace-hooks for each case of sw-check exception
  linux-user: permit RISC-V CFI dynamic entry in VDSO
  linux-user: Add RISC-V zicfilp support in VDSO
  linux-user/riscv: Adding zicfiss/lp extension in hwprobe syscall

 disas/riscv.c                                 |  71 +++++++-
 disas/riscv.h                                 |   4 +
 linux-user/gen-vdso-elfn.c.inc                |   7 +
 linux-user/riscv/cpu_loop.c                   |  50 ++++++
 linux-user/riscv/target_cpu.h                 |   7 +
 linux-user/riscv/target_prctl.h               |  70 ++++++++
 linux-user/riscv/vdso-64.so                   | Bin 3944 -> 4128 bytes
 linux-user/riscv/vdso.S                       |  50 ++++++
 linux-user/syscall.c                          |  40 +++++
 target/riscv/cpu.c                            |  21 +++
 target/riscv/cpu.h                            |  28 +++
 target/riscv/cpu_bits.h                       |  23 +++
 target/riscv/cpu_cfg.h                        |   2 +
 target/riscv/cpu_helper.c                     | 166 +++++++++++++++++-
 target/riscv/cpu_user.h                       |   1 +
 target/riscv/csr.c                            | 106 +++++++++++
 target/riscv/helper.h                         |   6 +
 target/riscv/insn16.decode                    |   4 +
 target/riscv/insn32.decode                    |  23 ++-
 target/riscv/insn_trans/trans_rva.c.inc       |  55 ++++++
 target/riscv/insn_trans/trans_rvi.c.inc       |  52 ++++++
 target/riscv/insn_trans/trans_rvzicfiss.c.inc | 155 ++++++++++++++++
 target/riscv/internals.h                      |   4 +
 target/riscv/op_helper.c                      |  63 +++++++
 target/riscv/pmp.c                            |   5 +
 target/riscv/pmp.h                            |   3 +-
 target/riscv/tcg/tcg-cpu.c                    |  20 +++
 target/riscv/trace-events                     |   6 +
 target/riscv/translate.c                      |  80 +++++++++
 29 files changed, 1114 insertions(+), 8 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicfiss.c.inc

-- 
2.44.0


