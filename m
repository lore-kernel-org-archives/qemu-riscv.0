Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2D6C25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:18:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw28C-0005gu-Um; Thu, 26 Oct 2023 11:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw28B-0005g6-4y
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:18:43 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw289-0005SX-Gs
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:18:42 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5aa7fdd1420so829104a12.3
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333519; x=1698938319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tgo45F2v/Qe9G4XbyaSiDt48CWp8Ravgjs2/JNux0zI=;
 b=Pq2qtuWNd3oYEljh7GhsxzAVBFfM67vmh3oEpxN2+w5V/+tWSh5VcPvGii3S76HZzf
 blSve0HUf3jPZjPR88DZNYjwS0BdWTmXTacaaqhK8+YroMLQui9bmqh+4eLXDW0rzZTL
 y5iaRbcP4Lm1kgLuRPUufN53NynGKYmUqtOYBccHhIdpsZCWrXCT986j3N73VAOeFKjP
 WFvcNZ9gUwWEZVwby1vFGeUOQW7gArsxYGo2+qDm4IAmYii3N1I4vz6Db4Y2LfQD8Drr
 WAghJA8NeIBsM/HLFQxFOmzHg9llGjUf/uuwzLVclMY37jL2HyfO7qVnh8adzPqzSQ9K
 u7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333519; x=1698938319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tgo45F2v/Qe9G4XbyaSiDt48CWp8Ravgjs2/JNux0zI=;
 b=ZSwRW7qbeNFLUGKp8/nj7BnS/LUx4GPC1Q36zJGZszLMpHxe6QFs576JNeo/ykgs1e
 p+3l0ftygrEGRBBVKpdbvmwknp8UK+yo4KfKsGX6iRcDWsMcUJEKyO7QItajcYd6ajCi
 CnJthK6dgZKoymwz30mrCCe92dN58nbr/2z4zExBPYWs4VqaJe3MbrJ6naHW8aTHKgAG
 20bHH8sDYxznmr8L9oUNiRx7v3e9aOKfuGVQy/bu1gRw7iUZAB3t8np0Vh/KDw0/D5wX
 dOFBtUdu4FJWJO6GpPw6takmSEle/qImiY4VAw7ftPXXTIuiAuhJvG6Ele3QHDzPLq+O
 QMSg==
X-Gm-Message-State: AOJu0YxGro/P7YgnrmHoiNMZ0Jzkx+0AIXZYXXPDJo1GQlHGbdwCLrBX
 S3RIfsWQtOeAV0n8gWuf7nQ5aA==
X-Google-Smtp-Source: AGHT+IEBcZ4ucV+iN8mh6sptL6UX4aOKFMiDogn6b4dkAbHNCAAuVwpujjJ8QfkLK/WZxurN++eIzQ==
X-Received: by 2002:a17:90a:744a:b0:273:f584:40ca with SMTP id
 o10-20020a17090a744a00b00273f58440camr15402498pjk.16.1698333519100; 
 Thu, 26 Oct 2023 08:18:39 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:18:38 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 00/14] Update RISC-V vector crypto to ratified v1.0.0
Date: Thu, 26 Oct 2023 23:18:07 +0800
Message-Id: <20231026151828.754279-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x535.google.com
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
ratified version v1.0.0 (commit 1769c26, released on 2023/10).

v2:

- Fixed the instruction order at disassembler part.
- Fixed the vror.vi disassembler format.
- Verified by code examples provided by vector crypto spec repository
  (riscv-crypto).
- Rebased to riscv-to-apply.next branch (1f910f3)

v1:

- Support Zvkb, Zvkt, and other shorthand extensions(Zvkn, Zvknc, Zvkng,
  Zvks, Zvksc, Zvksg).
- Support the disassembler for vector crypto extensions.
- Moved vector crypto extensions from experimental extensions to ratified
  extensions.
- Replaced TAB indentations with spaces in disas/riscv.c.


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

 disas/riscv.c                            | 157 ++++++++++++++++++++++-
 disas/riscv.h                            |   2 +
 target/riscv/cpu.c                       |  36 ++++--
 target/riscv/cpu_cfg.h                   |   8 ++
 target/riscv/insn_trans/trans_rvvk.c.inc |  37 ++++--
 target/riscv/tcg/tcg-cpu.c               |  48 ++++++-
 6 files changed, 258 insertions(+), 30 deletions(-)

-- 
2.34.1


