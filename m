Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62C7C0218E
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 07:23:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbwyH-000533-BA; Sun, 26 Jan 2025 02:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyE-00052S-3j
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:14 -0500
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyC-0004H1-3M
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:13 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5f321876499so1886410eaf.1
 for <qemu-riscv@nongnu.org>; Sat, 25 Jan 2025 23:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1737876129; x=1738480929; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xt0LMIQ7NZAu8NqvvkKKQdk2axfzopl3xzJEcR0k5d4=;
 b=IJdMvQjbhMj5a9y72MmcQnRQEcY8AZbMdhbrfQVy3zzGx7zFuubMQBHeS+XKGHG1X/
 b0C6EelFUX/J7Tb+BvlYunF1b6CxgSCn5OTdqlhkfjpmoRiD4kAqPHjqd285jnEnwjzU
 +pe/NVZ4IT2UJZywvK1CdRo6I6xw7Qs0+UOOPEZKs4URWuhdd344X6itAoY8FSAuAMmu
 7oB1x0iSBKyPhbP0T/hvRZRwzMkWSnl5RBuDxO1P8vzNkyH0SuzIDOHsgt+j4aW4vF/5
 TW/JBQ4OKcJqLmGo0dTUjgtirNxEKrNEBXk1uyWRb9sUqYwKjvFe96ZvAT6wyZ1Q7KsH
 Sj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737876129; x=1738480929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xt0LMIQ7NZAu8NqvvkKKQdk2axfzopl3xzJEcR0k5d4=;
 b=giaBkr3Y5HPZKxMN5p13uxJBqqQ5l9bT9CTx9vo8ISMDQ5wBXCRGZXjCHjUSLxTlgv
 S56GirlJWFH1YCrpiapq3GMlxqJrNo8/XvXHepzDDXMQRnB6slhMHkYnF/zDIL1PR1tw
 Dqucu0nUtTg3o7KTsSNzhC2UB17b2KC8IM9qgYATca3WZgqL7KLf+P/M7/gb2LhRmsRx
 2dgue/D6eKImFrHnwegQigQB7uvUirTnHJr3AuoLjLuos6nUk6gNwYqWg/zUsw4eOeKY
 Kodp/qMC4eW8Y0M4MuSSQO+nY/A3NAuRyCccCwIcRq5PkvKRACWO8ZNuLOb8zZbQYJc1
 yMzw==
X-Gm-Message-State: AOJu0YxE8teoZmP31M6cg9kdpqdcEU4BRRPOWcqtXWDOj3xn7eJJwOq8
 AFnvFl9lsjMx/lNIP6DobByso8PlDb3aQjeE/2wE7qHVS679i/k3bTYh/tA1L2CHkFcRsA4KhCd
 cE0mERw==
X-Gm-Gg: ASbGncu4UTkv1pJsElzsKpVWUmts/OXuAROyyAdHFE6iMGDrNfx7Fi8ENr2fXPg9tEY
 z1OSrAnLZL2fKIWbd7kWCKibx8jYspunFkdO1lfnjozJBbiNnGeyAIDD/WRU0IQnmkSz0LTBdsy
 euWThw1b7Y0CTCpv4JP5kQCq4USB7feXYvTxv7JyJ3tGBeTcuKLMSXTZ67gva5aR3mR7JqJRLKQ
 L+qhlRih/OArZi8qvaxASZonFgezncPgLAawVBaD3VeXgwvmY2+EHpIU7AxgY0Nd6EALzB+HUaZ
 u4V0aoEV1Reo7R0GajPTk1WrFjXqC+yLvJLksHg=
X-Google-Smtp-Source: AGHT+IF7eCrv0ziwoCHlNjCL/kVUG6QfwaGkWtKEUTKnnr/D2Ct2V3FV8rmkTwAqnNuvbVj0gmx8UQ==
X-Received: by 2002:a05:6870:55c8:b0:29e:4b60:d992 with SMTP id
 586e51a60fabf-2b2913bda2fmr5498114fac.13.1737876129627; 
 Sat, 25 Jan 2025 23:22:09 -0800 (PST)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b28f1d887csm1814281fac.29.2025.01.25.23.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 23:22:09 -0800 (PST)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Anton Blanchard <antonb@tenstorrent.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 00/12] target/riscv: Fix some RISC-V instruction corner cases
Date: Sun, 26 Jan 2025 07:20:44 +0000
Message-Id: <20250126072056.4004912-1-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=antonb@tenstorrent.com; helo=mail-oo1-xc35.google.com
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

This series fixes some RISC-V instruction corner cases, specifically
illegal overlaps between mask and source registers, illegal overlaps
between source registers and illegal overlaps between source and
destination registers. These were found by looking at miscompares
between QEMU and the Tenstorrent fork of Whisper which models this
behaviour better than Spike and Sail.

Anton Blanchard (12):
  target/riscv: Source vector registers cannot overlap mask register
  target/riscv: handle vrgather mask and source overlap
  target/riscv: handle vadd.vx form mask and source overlap
  target/riscv: handle vadd.vv form mask and source overlap
  target/riscv: handle vslide1down.vx form mask and source overlap
  target/riscv: handle vzext.vf2 form mask and source overlap
  target/riscv: handle vwadd.vx form mask and source overlap
  target/riscv: handle vwadd.vv form mask and source overlap
  target/riscv: handle vwadd.wv form mask and source overlap
  target/riscv: handle vwadd.wv form vs1 and vs2 overlap
  target/riscv: Add CHECK arg to GEN_OPFVF_WIDEN_TRANS
  target/riscv: handle overlap in widening instructions with overwrite

 target/riscv/insn_trans/trans_rvv.c.inc | 139 ++++++++++++++++++------
 1 file changed, 108 insertions(+), 31 deletions(-)

-- 
2.34.1


