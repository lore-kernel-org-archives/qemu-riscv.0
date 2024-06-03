Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92464C25B75
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 06:06:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sE0pE-0004l1-BC; Mon, 03 Jun 2024 02:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sE0p7-0004g8-BZ
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 02:05:37 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sE0p5-0008Bi-Hk
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 02:05:37 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2c1aa8d302fso2597322a91.1
 for <qemu-riscv@nongnu.org>; Sun, 02 Jun 2024 23:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717394731; x=1717999531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8rxGb8yr1xR46RfOMNs4eCoE/qowlyeVm83wGnEZPA=;
 b=l0WScKmi0DIHpSVl7lpJ81RYIumPtOYSxChkPmRm8Gh0NJdufBhw65tbgfaueoaSW8
 My5ozWxkZvmxvcEOcM3aGUyv3ZgipJFbjX0dI4cnVHggaH09fSdP1JBx7MZn0Wdf0FE/
 klkLjgbJQiHRslQSGNnSH6wAh79aMHESsKqXNXRNLiOct34BcTqL6rryH8gfwJP1NbT6
 V+jDYGU/UMArXoIpkzGxh5+bptHNct4bo2xANkDn3zHDDrlBr4g8fbPxSP0fjkrOu0DP
 q3hyASsEM5iKVNRX+pijrr4X0Y21zJFL+wr5osxuvFypaM3xqrMYRo8/h1sUY2PpGLFJ
 0HHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717394731; x=1717999531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y8rxGb8yr1xR46RfOMNs4eCoE/qowlyeVm83wGnEZPA=;
 b=QPRgTHNeTFT+6u2HgMGyRp4HYbix7GzvM9m3YpLynMyhZcmvQMSbu/0ojaqg4fMaTx
 8ETJs4sLAPSa++m2hT72U+iNtxdAItKIgx/2JdqgkgdvYXpPsamyuiiHFW4Gwc00+XVG
 64HC625K5WwnNF7L4ybYNChUHdyS3pNRoNbDKgNO1e1fqp+rgA41LnbgLiFclZF7GnHb
 p/Y1VFakXhpCm/eDtfyvrPENkvfgm0eq8wkP3eazLh5fp8XUMk2KfGpz+hOa9Ushn/MV
 z8TYy9z9uE9uLdhU7rEE35as6jiPjZKqKATUzHdqQ3PBo1l9JugjPsaoqGoDoxf3hWL0
 rTbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFgo354DfqZMaz1iGWNayZaW5bPdJfpUTUUZ3LY6YQspEqIX1EmIJot6yZd4lMTYoUqmVAOVwX8aeMkZDakDRxG7Um4MQ=
X-Gm-Message-State: AOJu0Yxs5FtQQQjUR9wU4fISJxOSpxi9d79k8wuC3aTttxWoTEj/1pMq
 ujxuyd4dBi/9FHeoaNJbsOB37S/+uvLFd1FO3eZSye3jlpsOW3m1k1H0pX6Gurk=
X-Google-Smtp-Source: AGHT+IHP8V3hyMkTCKVyRE9B22PY/tcsaeL4jk+KA1FkYom4xh4eTUR1TAenSXWEpzUpS2Tx9unaKw==
X-Received: by 2002:a17:90b:4b8c:b0:2b6:208c:2aee with SMTP id
 98e67ed59e1d1-2c1c4453885mr10868126a91.20.1717394730955; 
 Sun, 02 Jun 2024 23:05:30 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1a77afa1fsm7149291a91.42.2024.06.02.23.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 23:05:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 0/6] Introduce extension implied rules
Date: Mon,  3 Jun 2024 14:05:16 +0800
Message-ID: <20240603060522.2180-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Currently, the implied extensions are enabled and checked in
riscv_cpu_validate_set_extensions(). However, the order of enabling the
implied extensions must follow a strict sequence, which is error-prone.

This patchset introduce extension implied rule helpers to enable the
implied extensions. This also eliminates the old-fashioned ordering
requirement. For example, Zvksg implies Zvks, Zvks implies Zvksed, etc.,
removing the need to check the implied rules of Zvksg before Zvks.

The idea [1] and the implied rules [2] are referenced from LLVM.

[1] https://github.com/llvm/llvm-project/blob/main/llvm/lib/TargetParser/RISCVISAInfo.cpp#L875
[2] https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVFeatures.td

Frank Chang (6):
  target/riscv: Introduce extension implied rules definition
  target/riscv: Introduce extension implied rule helpers
  target/riscv: Add MISA implied rules
  target/riscv: Add standard extension implied rules
  target/riscv: Add Zc extension implied rule
  target/riscv: Remove extension auto-update check statements

 target/riscv/cpu.c         | 396 +++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h         |  17 ++
 target/riscv/tcg/tcg-cpu.c | 233 +++++++++++-----------
 3 files changed, 531 insertions(+), 115 deletions(-)

--
2.43.2


