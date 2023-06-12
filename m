Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C94C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 11:11:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8fRf-0001dE-NX; Mon, 12 Jun 2023 07:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRc-0001bU-0i
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:44 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRY-0002LU-QS
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:43 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9786c67ec32so693732866b.1
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 04:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1686568238; x=1689160238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ChrILf9mMsOpKfWzT5RWwGnEHbrvKAG0Hs1QYdC+Vic=;
 b=OpTewJVrleWpz8iCVwyl7hgWzZc9/Uq3P2iTK12ulFEXsu81fkCds6dOSjQiLH9kj8
 NoZ3QPhJjm+emXQKl5fcAa/Uut1AZ83pTQF+1HUES3Vuhoc4/z9RzxSKVyWNlwgKpJ28
 9u2Wp4xC0U02SRK/IEyxXYwIf14RQrsTQ+fTkKR95EDUwWOQF+GkKvQC22Q0QYeXxqvB
 mlk5y87QgA4U+9QjvXEovl8jZQ6wUKjCmOX1v0gmkjZrXKcBRUd4M+wyE6eoSdoZ64gl
 hwR2jjtHuK4ONv5u2VjDHCFCqobjcxKbXcS+BEcYCijJyxbmbDM0dlgYywHbEqtGC+u+
 OhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686568238; x=1689160238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ChrILf9mMsOpKfWzT5RWwGnEHbrvKAG0Hs1QYdC+Vic=;
 b=SGM1rR99bh0eIRm1BdkXhgmImF16lEo/pu1Bxinpou4Ng1xhoD73712HT+mNnUN4yN
 uE+D5fw5bls6dTF9T9axy36m/gpqzI1vzf9nlZ5CNznN8uwK+3sGlHd7UF/gt6oj3UoY
 gqouVVkiEhDYoEhCnFfx4XY56/uq8v72N4bqK4ZPGexU1C2AyX3mhYcXv0lXQ50Z+08a
 mLr6/s9E6Aot3CDaxSx5O7NsdGanxNvvYDbMzKQye0E2G4X4ygDo3Inl5XmTEhoR+Dp0
 +xoa2m4QEqjNI25I3wMnz9n70DGdxGnZlKbGkg4/gfIpLM50gmKB1blwpRQsCf7+7X8e
 GhOw==
X-Gm-Message-State: AC+VfDxI7K2UrwiEOUmmYtUbU5I6SdRt7HPqodYqFGMqU2lHRO2ZuCew
 pzoPwa+5j32sXFXgNam03m1Pxi2NlaEiXcsKk1A=
X-Google-Smtp-Source: ACHHUZ7jzivJK7F7QWEQG+clSQA/7hAq1CsB/u4IA0MkgvZe1C6nM56REoa9ywzau53UOGrvrfQN2w==
X-Received: by 2002:a17:907:7da3:b0:97d:cda7:f097 with SMTP id
 oz35-20020a1709077da300b0097dcda7f097mr6477574ejc.75.1686568237767; 
 Mon, 12 Jun 2023 04:10:37 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1709064a1700b00978723f594bsm5000948eju.101.2023.06.12.04.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 04:10:37 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v2 0/8] disas/riscv: Add vendor extension support
Date: Mon, 12 Jun 2023 13:10:26 +0200
Message-Id: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series adds vendor extension support to the QEMU disassembler
for RISC-V. The following vendor extensions are covered:
* XThead{Ba,Bb,Bs,Cmo,CondMov,FMemIdx,Fmv,Mac,MemIdx,MemPair,Sync}
* XVentanaCondOps

So far, there have been two attempts to add vendor extension support
to the QEMU disassembler. The first one [1] was posted in August 2022
by LIU Zhiwei and attempts to separate vendor extension specifics
from standard extension code in combination with a patch that introduced
support for XVentanaCondOps. The second one [2] was posted in March 2023
by me and added XThead* support without separating the vendor extensions
from the standard code.

This patchset represents the third attempt to add vendor extension
support to the QEMU disassembler. It adds all features of the previous
attempts and integrates them into a patchset that uses the same
mechanism for testing the extension availability like translate.c
(using the booleans RISCVCPUConfig::ext_*).
To achieve that, a couple of patches were needed to restructure
the existing code.

Note, that this patchset allows an instruction encoder function for each
vendor extension, but operand decoding and instruction printing remains
common code. This is irrelevant for XVentanaCondOps, but the patch for
the XThead* extensions includes changes in riscv.c and riscv.h.
This could be changed to force more separation with the cost of
duplication.

The first patch of this series is cherry-picked from LIU Zhiwei's series.
It was reviewed by Alistair Francis and Richard Henderson, but never
made it on master. I've added "Reviewed-by" tags to the commit.

Changes for v2:
* Rebase on Alistair's riscv-to-apply.next branch

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg03662.html
[2] https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg04566.html

Christoph Müllner (7):
  target/riscv: Factor out extension tests to cpu_cfg.h
  disas/riscv: Move types/constants to new header file
  disas/riscv: Make rv_op_illegal a shared enum value
  disas/riscv: Encapsulate opcode_data into decode
  disas/riscv: Provide infrastructure for vendor extensions
  disas/riscv: Add support for XVentanaCondOps
  disas/riscv: Add support for XThead* instructions

LIU Zhiwei (1):
  target/riscv: Use xl instead of mxl for disassemble

 disas/meson.build        |   6 +-
 disas/riscv-xthead.c     | 707 +++++++++++++++++++++++++++++++++++++++
 disas/riscv-xthead.h     |  28 ++
 disas/riscv-xventana.c   |  41 +++
 disas/riscv-xventana.h   |  18 +
 disas/riscv.c            | 378 ++++++---------------
 disas/riscv.h            | 299 +++++++++++++++++
 target/riscv/cpu.c       |   3 +-
 target/riscv/cpu_cfg.h   |  37 ++
 target/riscv/translate.c |  27 +-
 10 files changed, 1246 insertions(+), 298 deletions(-)
 create mode 100644 disas/riscv-xthead.c
 create mode 100644 disas/riscv-xthead.h
 create mode 100644 disas/riscv-xventana.c
 create mode 100644 disas/riscv-xventana.h
 create mode 100644 disas/riscv.h

-- 
2.40.1


