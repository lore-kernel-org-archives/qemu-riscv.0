Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15963EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 09:14:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFABq-00074g-PM; Fri, 30 Jun 2023 05:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFABn-00072s-4x
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:13:15 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFABh-0000A4-Uu
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:13:14 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9928abc11deso195043266b.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1688116387; x=1690708387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3KTxLg4dSDtZAVmzzFfuOvvIA3stkgiJMugzNvO/Dvc=;
 b=d+hDpfCFompkkMMkk4YdyO7fnWob5EA8Jxjx3aH5wirhO/Eegyuo3CgH83wkMwvSjx
 COf0Xf1I5aN9Lg9sI8a3/XgI+PoKmkHAYDsgzuoPoiMMLZsFkGB1oU9uKDuP2+KM4+Cm
 Sw+1KHMkecGqHkNOMjE1SatTNkNo5u2Ki22RGckkWhJ4T7h+yCOjluYvvJKDDCexRYHX
 9UZ6Fz6Ih/UkkFTWb+IhRN+nh1I/trLZDEx+iKVi0lNC/q2A1nG7xbrr6lazq/3wtV1u
 OhGkCemAJOn+453h2gpFmCEbPcYcoVs4tCeKgblAjzcxkKZfO3mn7DspolHDromgiAPm
 CB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688116387; x=1690708387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3KTxLg4dSDtZAVmzzFfuOvvIA3stkgiJMugzNvO/Dvc=;
 b=ScxkcL3g2ltE/1FGK8IP1tymWo+E8H586Sg9Iu/82y+BWekDTPmjjGVmtm+gHX3MhE
 eO+4ciEnOohJgo0RtleWDzAvtGCWgxIF+CaS1+8iIAV4Ev2GjIfHwcQC+huQBikVhTq8
 qdqoUtlWyqOqRfMCAK7roI6HSQEMQ++nCB6T19GuO7f3Qvs1ABXzVfzX6HYz7KG5LIDj
 p9jOURzFIgFIhExVLH7NoCe/C0KSOEmOgQQ7FvJdGH2C76zjRlS7m3RpWLt6eTjKRnL8
 BoCES/slD9TbQwKl3tGtpm4L7Ok0NBJDF9/nlfHwJ9ShpbsW2A9o2mORncRPOtHlkoOb
 J5lg==
X-Gm-Message-State: ABy/qLbEPK/UfzqIklXw/I4eez83lk7ALn3Qn3MVtf+1j3KxXPaMEdqq
 g6LV8etl+alVNK3mSCeSP4ErX1hA+UwthIR8dkE=
X-Google-Smtp-Source: APBJJlEDYF2NoNR54zKAU1xFnl18o+ZdMM0tGH2d//JcJTQh6EVuJQmub8yRP0HbMPtHLsVtKdi0vw==
X-Received: by 2002:a17:907:76b4:b0:977:eed1:4510 with SMTP id
 jw20-20020a17090776b400b00977eed14510mr1139808ejc.21.1688116387238; 
 Fri, 30 Jun 2023 02:13:07 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 lc1-20020a170906f90100b00988e953a586sm7869892ejb.61.2023.06.30.02.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 02:13:06 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jeff Law <jeffreyalaw@gmail.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, liweiwei@iscas.ac.cn,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Rob Bradford <rbradford@rivosinc.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 0/3] riscv: Add support for the Zfa extension
Date: Fri, 30 Jun 2023 11:13:00 +0200
Message-ID: <20230630091303.1676486-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch introduces the RISC-V Zfa extension.

The Zfa specification can be found here:
  https://github.com/riscv/riscv-isa-manual/blob/master/src/zfa.tex
The Zfa specifciation is frozen and is in public review since May 3, 2023:
  https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/SED4ntBkabg

The first patch is mostly equal to v3 (plus resolved rebase issues and
fixed whitespace issues). The second patch changes the implementation
of fcvtmod.w.d to use float64_to_int64_modulo(), which is provided
by a patchset from Richard Henderson:
  https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg07022.html
The third test contains a test for fcvtmod.w.d, which was used for
development. Since compiling this test requires Zfa support in the
RISC-V toolchain (which is not given), this patch is not meant to
be merged as of now.

Changes in v4:
* Rebase and resolve conflicts
* Fix whitespace issue (thanks Rob)
* Add patch to implemnt fcvtmod.w.d using float64_to_int64_modulo()
* Add (demo) test for fcvtmod.w.d

Changes in v3:
* Add disassembler support
* Enable Zfa by default
* Remove forgotten comments in the decoder
* Fix fli translation code (use movi instead of ld)
* Tested against SPEC CPU2017 fprate
* Use floatN_[min|max] for f[min|max]m.* instructions

Changes in v2:
* Remove calls to mark_fs_dirty() in comparison trans functions
* Rewrite fround(nx) using float*_round_to_int()
* Move fli* to translation unit and fix NaN-boxing of NaN values
* Reimplement FCVTMOD.W.D
* Add use of second register in trans_fmvp_d_x()

Christoph Müllner (3):
  riscv: Add support for the Zfa extension
  target/riscv: Use float64_to_int64_modulo for fcvtmod.w.d
  DO NOT MERGE: tests/tcg/riscv64: Add test for fcvtmod.w.d

 disas/riscv.c                             | 151 ++++++
 target/riscv/cpu.c                        |   8 +
 target/riscv/cpu_cfg.h                    |   1 +
 target/riscv/fpu_helper.c                 | 198 ++++++++
 target/riscv/helper.h                     |  19 +
 target/riscv/insn32.decode                |  26 ++
 target/riscv/insn_trans/trans_rvzfa.c.inc | 529 ++++++++++++++++++++++
 target/riscv/translate.c                  |   1 +
 tests/tcg/riscv64/Makefile.target         |   6 +
 tests/tcg/riscv64/test-fcvtmod.c          | 354 +++++++++++++++
 10 files changed, 1293 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfa.c.inc
 create mode 100644 tests/tcg/riscv64/test-fcvtmod.c

-- 
2.41.0


