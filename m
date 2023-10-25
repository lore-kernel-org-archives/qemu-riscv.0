Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93FEC0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:14:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvfa3-00050B-27; Wed, 25 Oct 2023 11:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfa1-0004zn-OO
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:13:57 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfZz-0003WM-S8
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:13:57 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c9e95aa02dso8050155ad.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698246832; x=1698851632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rzFLCG1dD0DWc3iy0SenmxGvSX8q6ni48ZXSBYJ5zDw=;
 b=bTPaYasrSbGEFo4RSwS9QlPRzKdyplXSvxOwX8NTuNWomvx/uTr3nJ2w+pnZJYalDJ
 02xiz1Av7P48Bqg2Qkm1MQy1lqjHAOwAwa639Y5NDTC8NNLMahUqaDI+HCIzon/km1R8
 o1dHZCoBH0RyqDYfZg5rvKVQS2K2+UKpBQvouq8LLVyB09yOnaQ9DUnxgw9BQZCwc8ia
 +RDMsndJgLx/bPgRpqSqb+tCMQ7txEfc/x4U2wz3EsXaMetlprk8tIPaBP+UYrojv7Gj
 v/QFhF8NrQgGeqSw9QdyyAykD907ctWQpKQfglJHRQHKd08S0nA29mnz2rVdCmtEQV6H
 13Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246832; x=1698851632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rzFLCG1dD0DWc3iy0SenmxGvSX8q6ni48ZXSBYJ5zDw=;
 b=ZsG6CQaYJBanTKEdWJjyvOz74UfWF51dUxqyo+nITSGl7LIIAgXI0JCn2Ho0q5AZNW
 poXkqMEMM/PGomGHWf127/v0i0RSbH8PNYXMaarAYNvsN8+BWuvoYr1xcOt0IOPNju/v
 TCXnTYrhZtB9nB9sPKUzgdMZKDQdRc/zhYK8UbpJPi09xposeukzn47iwqpKsDmzfJpQ
 eBZqZuxVxrvUkqyrAFLblBdW3ZDnTlGPmLUtPFaR0bUzj5+3ffqy2W8AthD5hHmdvNU+
 bqLYfk69rfZlQkfhJhXRU3eSoQFYAclvmBIPLl0gRsutNcFtP4ck0mwIehjwPevB7Z0p
 XeTQ==
X-Gm-Message-State: AOJu0YxfnlFWJEzhN7gIvJZIA2w8aLxWhe4QEfzeY0ME5C6zKcrWuaek
 hk7yieaEteBTIjx6Ho2gHMOW7Q==
X-Google-Smtp-Source: AGHT+IFEjX9ROLdZZ5HmOGjEYZy7Bv5nSmcTXZxcrRcugY4fy6jMOVcvIT4/Rz/iV4hR19D91yWrUw==
X-Received: by 2002:a17:902:ce85:b0:1ca:c490:8548 with SMTP id
 f5-20020a170902ce8500b001cac4908548mr23761265plg.19.1698246832465; 
 Wed, 25 Oct 2023 08:13:52 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 w14-20020a63160e000000b005b8ebef9fa0sm2677807pgl.83.2023.10.25.08.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 08:13:51 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>
Subject: [PATCH 00/14] Update RISC-V vector crypto to ratified v1.0.0
Date: Wed, 25 Oct 2023 23:13:24 +0800
Message-Id: <20231025151341.725477-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This patchset updates the RISC-V vector cryptography support to the
ratified version v1.0.0 (commit 1769c26, released on 2023/10) with
following items:

- Add Zvkb, Zvkt, and other shorthand extensions(Zvkn, Zvknc, Zvkng,
  Zvks, Zvksc, Zvksg).
- Supports the disassembler for vector crypto extensions.
- Move vector crypto extensions from experimental extensions to ratified
  extensions.
- Replace TAB indentations with spaces in disas/riscv.c.

https://github.com/riscv/riscv-crypto/releases/tag/v1.0.0

Max Chou (14):
  target/riscv: Add cfg property for Zvkt extension
  target/riscv: Expose Zvkt extension property
  target/riscv: Add cfg property for Zvkb extension
  target/riscv: Replace Zvbb checking by Zvkb
  target/riscv: Expose Zvkb extension property
  target/riscv: Add cfg properties for Zvkn[c|g] extensions
  target/riscv: Expose Zvkn[c|g] extnesion properties
  target/riscv: Add cfg properties for Zvks[c|g] extensions
  target/riscv: Expose Zvks[c|g] extnesion properties
  target/riscv: Move vector crypto extensions to riscv_cpu_extensions
  disas/riscv: Add rv_fmt_vd_vs2_uimm format
  disas/riscv: Add rv_codec_vror_vi for vror.vi
  disas/riscv: Add support for vector crypto extensions
  disas/riscv: Replace TABs with space

 disas/riscv.c                            | 154 ++++++++++++++++++++++-
 disas/riscv.h                            |   2 +
 target/riscv/cpu.c                       |  36 ++++--
 target/riscv/cpu_cfg.h                   |   8 ++
 target/riscv/insn_trans/trans_rvvk.c.inc |  37 ++++--
 target/riscv/tcg/tcg-cpu.c               |  48 ++++++-
 6 files changed, 256 insertions(+), 29 deletions(-)

-- 
2.34.1


