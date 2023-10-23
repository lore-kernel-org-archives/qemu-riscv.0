Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99166C004C0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 15:40:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qux1m-0000Qt-BN; Mon, 23 Oct 2023 11:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1k-0000OL-Mv
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:36 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1i-0003pU-GQ
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:36 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5b5354da665so1718277a12.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698075573; x=1698680373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZvXM7AaW2Y60q+B7f4IUXU4G6PCHA5WXlL11bm4JvwA=;
 b=gMV9zdUR0H1/CDVxLV5VuB7a019LsrxbstQmscvNS4GfRPiQNrC5zCwPpTgGBUfTY+
 MFohI76NrrLg4JPJR6PTsmA+eBF6Qt/MsyeCjrhJjfN+P/AoO1hLPbVDyKfFuyqWvl9w
 EpC1DLT3tJdcrDRAHr2yooBE/hMW8iYQJLWYspTyimcA8VvOLWAJ9yY035O0IlXqkZMb
 TpszBANWRILijKNMcvZaJZlfuVkU51pBaPx0mqPhCYJuip8ZO3A8cZx4UYFQ0HNtWRTp
 d+uQ8XBJoBwobdkmwz3mhfKSwiKf4ymjTNDaCQifcuvTBOymLVP73ZQr25qnT7JR385I
 j59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698075573; x=1698680373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZvXM7AaW2Y60q+B7f4IUXU4G6PCHA5WXlL11bm4JvwA=;
 b=TK2WIGe5yZyLMJClhP7c98HLQ4h+GUVpAr68W8PuLZtqv8AJFDMPkYoHQg/0TvaxlV
 V6fw3ktu3hi9F4pMHL7P9QdRa9BKc2ur7zfnHJ9PzE9tdhktB0JntabXDuDb1gQYwlWl
 zM80OwtP7p+9+9jOp0vtvFZOpI/i6mM3HPD3SqTPVVhrLeyh3u/yxYi64933mbIRXffI
 sG4vv0H1KYqQnMK3OSGlnsVwuKB2ugyzrAcRncWZXb57lKlOD+Dk+NY4V8VJ3ag8krzj
 i+w9UuqYgTEuof951y9CXafA/xcdwpRv3hJKm8Aahu/KSz4cgOOqg22aPdWy0WpBYACA
 6LwA==
X-Gm-Message-State: AOJu0YwyOpPrPXA1gxCTmRlCOkmIDLoeu4BJFjv7b2SncLxK84sQcAF3
 T0P0O3d5KD+YXOW3o7KeE+nFGw==
X-Google-Smtp-Source: AGHT+IEWdN4ZbqNCdlfYxkkJH8bEsP8YgyPLm6Nkr1DIxinzyQ0YRI5zaJPBrSy2pGBs64MgyrPDuQ==
X-Received: by 2002:a17:90b:4a11:b0:27d:2763:a13a with SMTP id
 kk17-20020a17090b4a1100b0027d2763a13amr6638834pjb.48.1698075573130; 
 Mon, 23 Oct 2023 08:39:33 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 k20-20020a170902ba9400b001b891259eddsm6053063pls.197.2023.10.23.08.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 08:39:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/4] riscv: zicntr/zihpm flags and disable support
Date: Mon, 23 Oct 2023 12:39:23 -0300
Message-ID: <20231023153927.435083-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x531.google.com
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

Hi,

In this v3 the patches that added the extensions flags were squashed
with the patches that handled the disablement of the extensions in TCG,
as suggested by Alistair in v2.

No other change made. Patches based on Alistair's riscv-to-apply.next.

Patches missing acks: patch 3

Changes from v2:
- patch 2: squashed with patch 1
- patch 5: squashed with patch 4
- v2 link: https://lore.kernel.org/qemu-riscv/20231017221226.136764-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (4):
  target/riscv: add zicntr extension flag for TCG
  target/riscv/kvm: add zicntr reg
  target/riscv: add zihpm extension flag for TCG
  target/riscv/kvm: add zihpm reg

 target/riscv/cpu.c         | 15 +++++++++++++++
 target/riscv/cpu_cfg.h     |  2 ++
 target/riscv/csr.c         |  4 ++++
 target/riscv/kvm/kvm-cpu.c |  2 ++
 target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
 5 files changed, 44 insertions(+)

-- 
2.41.0


