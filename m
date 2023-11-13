Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1982EC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 09:56:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2Tg2-0004zE-NP; Mon, 13 Nov 2023 04:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r2Tg1-0004y1-3x
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 04:56:17 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r2Tfw-0005Vh-AT
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 04:56:16 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9d2e7726d5bso639298466b.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1699869369; x=1700474169; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TpoeZYCWTUq5CdN7PYnr/ePp9EG3VtTF568C8FQQ5+0=;
 b=RRJ8DA2G0cByAFc+F9qVHQWTEr9+yW74leveDO87W2+iyDgp5mt8DDDDX+SEnMB1HJ
 OEDDhct+Jvg+rIZxAh6Bz26IueylZyDZGFYYoSV6EjVIhgrY0YaWowmzaY7VI1MQizq9
 3PFAq4dOXPm/3gPtYwPh39kgNf+pqi99E/+8BIZzZqs7bvxpIvx5rn4grJr2n6AXyRri
 +LydELVkQhsZsd/mCUfsSgfplHuk7/vJGn+UucPUg/hxoIgG8CNMZqj73DiieaF1hNd3
 uo36S/GB6eq1MNUDdSHrwQdAjf8Or8JGprlIh5C9uETwSESLTxdYdvo56640vasq5U5c
 1LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699869369; x=1700474169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TpoeZYCWTUq5CdN7PYnr/ePp9EG3VtTF568C8FQQ5+0=;
 b=rQO552RpGEQ1oJKsMzUY9YIVlNBghF7HqJT4JgCcujTq85gqO4NNQDDgV7CjkZD5w/
 TUg9aKvdRV7Dw7cp9mZm3CdLH/CWaHU98BWg/AW+h/ngByyVY7/v25petTZs9LmLfY5S
 yqayksjQrZEMafesr0+/OMSARRi8xq7ek/Mm8MtL/nlX6G5ciJuBgDpMac6EJa1/qeaB
 xoK6BuZSm4e1ob7HHX50stmDUChH5rl/XWEnPlbrdlZmJv9ehHeexeb3xGW9ZxFspqMV
 +XGepVI9veB6nOiZbHnbs1bTfAvQvJDk77EN/m5vqNzGRXU+w8b/+VZba7LXQuvmyuzC
 vVcA==
X-Gm-Message-State: AOJu0Yzc8fYn+ksD9Gty/q6/PyY1e6ts+YzMwYEDsuO6XbHhj5Rw/OWS
 Dnx4/sQOz7mAM00KXK0qCPwwQiEwIXltSieaud0=
X-Google-Smtp-Source: AGHT+IG5pra3NKWG8LJr/1zkAS7U9uF1BKn0CMZWU3hwvYMaVvFvtc0dKi82M4510FiDhsvuWsIaEw==
X-Received: by 2002:a17:907:36c7:b0:9c6:10d4:d09f with SMTP id
 bj7-20020a17090736c700b009c610d4d09fmr5515696ejc.63.1699869369065; 
 Mon, 13 Nov 2023 01:56:09 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170906190b00b0098d2d219649sm3807321eje.174.2023.11.13.01.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 01:56:08 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH 0/2] RISC-V: Add TSO extensions (Ztso/Ssdtso)
Date: Mon, 13 Nov 2023 10:56:01 +0100
Message-ID: <20231113095605.1131443-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x629.google.com
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

This series picks up an earlier v2 Ztso patch from Palmer
and adds a second to support Ssdtso.

Palmer's v2 Ztso patch can be found here:
  https://patchwork.kernel.org/project/qemu-devel/patch/20220917072635.11616-1-palmer@rivosinc.com/
This patch did not apply cleanly but the necessary changes were trivial.
There was a request to extend the commit message, which is part of the
posted patch of this series.  As this patch was reviewed a year ago,
I believe it could be merged.

The second patch adds support for dynamic TSO following the second
draft of the Ssdtso extension, which was published recently:
  https://lists.riscv.org/g/tech-arch-review/message/183
Note, that the Ssdtso specification is in development state
(i.e., not frozen or even ratified) which is also the reason
why I marked the series as RFC.

Relevant in this context might be also, that Richard's patch to improve
TCG's memory barrier selection depending on host and guest memory ordering
landed in June:
  https://lore.kernel.org/all/a313b36b-dcc1-f812-ccbd-afed1cbd523b@linaro.org/T/

Christoph Müllner (1):
  RISC-V: Add support for Ssdtso

Palmer Dabbelt (1):
  RISC-V: Add support for Ztso

 target/riscv/cpu.c                      |  4 ++++
 target/riscv/cpu_bits.h                 |  3 +++
 target/riscv/cpu_cfg.h                  |  2 ++
 target/riscv/csr.c                      |  9 ++++++---
 target/riscv/insn_trans/trans_rva.c.inc | 11 ++++++++---
 target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++--
 target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++++
 target/riscv/translate.c                |  3 +++
 8 files changed, 60 insertions(+), 8 deletions(-)

-- 
2.41.0


