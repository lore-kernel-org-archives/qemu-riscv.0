Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EC8C369AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 04:32:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4XyD-0005gT-TT; Tue, 15 Apr 2025 00:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4XyC-0005fN-Kz
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 00:32:24 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4XyB-0007QC-4G
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 00:32:24 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2c1caacc1f7so3032693fac.3
 for <qemu-riscv@nongnu.org>; Mon, 14 Apr 2025 21:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1744691541; x=1745296341; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2ObnKcIJ284kbbZaP0rCwvkG59a2UZ5StXk2Y3mXSNE=;
 b=fxVfa0/RKS4ckVGEaJ3MuV3bLn0PQ0cKETBlVufE1SufzwIC9H4kSKTxNoFcxdFFJb
 FxZXrFKzNKfrnsoqEQMj8GwthxxWcLTQ4pkoedCP52+a4qUHNQpzbbyZLFL4GTiohcUn
 Fm5yV/BopOM0LLermY/trJvTUDMZa/CgcA+wTjDxwGE9kGxN7XKZmdXL7P/dQQEJh0Aa
 1edcDXE+CaLvawj62RZvZfve72lBKdLcpnLvvqBain5ylQ6FMpAWgGtiZQDD5GVbfS4r
 p0WvRd/lKeHQzpg7EQP58yxtt7Mkt6HRxpWoCvT08rd/xkKjd6r3N01p/5yqgtrS8ftS
 WkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744691541; x=1745296341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ObnKcIJ284kbbZaP0rCwvkG59a2UZ5StXk2Y3mXSNE=;
 b=ndUgNHottElvXPn47NxuDWmEkkKo/wmW+BF5rYzNrtMV6zhkXPJSwQvreq8217UvTW
 jKsDlxrHWsnKCTuUNjoZ3yt3V7tR0Egnh/GPnyPUSw6PpniGDEYSPZOaro7iepRFUiJQ
 sMQFLVNbDI4fJXiti+J6AxcQdWu7yMGUU9Yj2ZMzRhTy3NqAix4dVZtRBtR1McendnHJ
 IcQAidUf5LFPv05FqUvVu0KLCKz5ieoU5IvfwbjpTg5C3j1Y8YXDUhg6D06X9tyw08ES
 Q4nofkVxNhQ/JtmR+UZK6vZjJzL/mlq9SXIXUjLSCJPkwI1L+FAs8BbXeGr9K91dOjQs
 c+dg==
X-Gm-Message-State: AOJu0Yxp2aA2hXuKrRzQKD2O+5va3szw3Yq9KYPEf/vmMHI5rJ645mOO
 rorpqaxJDHLtMBq5s61Q3mfBAIueVh0I04sSK/eIWDwPsB0dVQaDybpDKOe08Gv2Cxen9rhMX2/
 BCq0=
X-Gm-Gg: ASbGnct8EyEN6Xo/p+QJU7slvV/G1P9mAUhRQb9s0Q9GLQhVRvxP05yoeJuH/ZreiBl
 hjj5rKAr8Q0BUfW8A1Jlh/k1Nw85XO/26KLkznrkcDr0ZQx7IIsw2gvlPShOX9YQpMtKAqwr6k0
 4b6mCNekqXmTjph2gR+KrJX554nLHZcBU8TBzUl5XvJ2iQsgBs1iExoFGMfzVaDqDAMFKyOjNEt
 153lF/JRvrgOCviPXbewP4IOMzdW8VMQR4vCsCARxbCAafCXXA/EhBlMlG6D63frZm0y89YQc5c
 GzkGe/qrNPbgyo3Pk+pzlyP5kNQZ/iixffWNcTpxI/813x7/4NqvTheT5ZwOeM5MtP1Y5xTcrI4
 =
X-Google-Smtp-Source: AGHT+IHoQ7sT8HPDW/y+Ad7krvgf7LF9YXWmKBX1U/m8xGvZuNTv+uBDYZWVUqsYqNQOS/S1YX3Lew==
X-Received: by 2002:a05:6870:b024:b0:2c1:6735:4abb with SMTP id
 586e51a60fabf-2d0d5c01db1mr8987028fac.5.1744691540695; 
 Mon, 14 Apr 2025 21:32:20 -0700 (PDT)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d096d4af59sm2728816fac.46.2025.04.14.21.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 21:32:19 -0700 (PDT)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.or
Cc: max.chou@sifive.com, dbarboza@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, Anton Blanchard <antonb@tenstorrent.com>
Subject: [PATCH 0/3] Fix some more RVV source overlap issues
Date: Tue, 15 Apr 2025 04:32:04 +0000
Message-Id: <20250415043207.3512209-1-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=antonb@tenstorrent.com; helo=mail-oa1-x33.google.com
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

Thanks Max and Daniel for helping to resolve the RVV source register
overlap issues. I ran some random patterns against the Max's latest
patch series (comparing QEMU to the Tenstorrent version of whisper)
and spotted a couple more. Max: can you please check if the fixes I
made look right?

Anton
--

Anton Blanchard (3):
  target/riscv: rvv: Apply vext_check_input_eew to vector integer/fp
    compare instructions
  target/riscv: rvv: Apply vext_check_input_eew to vector reduction
    instructions
  target/riscv: vadc and vsbc are vm=0 instructions

 target/riscv/insn32.decode              | 10 +++++-----
 target/riscv/insn_trans/trans_rvv.c.inc | 23 +++++++++++++----------
 2 files changed, 18 insertions(+), 15 deletions(-)

-- 
2.34.1


