Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0CBC25B76
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 06:32:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sEkBx-0000nH-Qt; Wed, 05 Jun 2024 02:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEkBw-0000mv-2B
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 02:32:12 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEkBu-0007Bm-9G
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 02:32:11 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-70255d5ddc7so3119364b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 04 Jun 2024 23:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717569128; x=1718173928; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Vi9flPZ/5mcVO9gcD0Cmk5m90JyfmhcRz13qooMoDA=;
 b=Juv5biO0Xu2zBSJqLuJYSX8mZOYrR3BxYhWoFQ//ohZY0ByLlh5YA4ooTpDfndGq95
 iqlW3TczOaMERc2hSLy0VQf8+wKHEr6UUJRVKVI5u+jn+lK5t+z5oXTj68TFOn/T5bIj
 1WCqleEae4oIL4HjbhpXxMSsGjF6jaISB7gjKMOrMQbUICG8csruUkkw6TRz+pLvscHM
 kU95klxaTtOC3rFy/3yzE8gpLORLku4yyDmO03GFSXAXlSRO0rO2v1Y/Yzfjd1BuHWTb
 Na+vRdkytXxPLgLjUEooKOL/pEwUFkusbCqeTLnRpL2RI0DaVGGGrRnIWDd5FcKTGmu0
 U4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717569128; x=1718173928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Vi9flPZ/5mcVO9gcD0Cmk5m90JyfmhcRz13qooMoDA=;
 b=l5o0TTinVwF/vu2R9GngKbj+3B+DaCaX1kSYdA3CGEOE5IMr3RaBGT3orPh+MsztPv
 oGJN67SqbMlXO2MiTO8N5oCzdlWeQaQwcRhuts2gnPNVDDalDuw2GS3XlgTbh7dwf3Vw
 Prpak0n8M7zuQ5EglTFMRu7CEd9kUKbECuS1Ux3idTD+aUmywQrL4Md3VNRaxYYJt2ES
 vA687FDaA03kPq4xWtEYzfnrVVXT4j3QffBpsanOaas5svCg5cYPxE9r347+oMG8ALgs
 tgKk9XF7Ept27m8In92odMSlxbeKYM+/QNU8zhpxnhT/Nq3RbTU1e4tAycbunAwOcNfp
 8F6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdxthLUXXMqY5LdFcXB5My4ZAN/ri2YNBJdnrCiKtBguxmdte6IEYmKcWDWXY0vuz0lLAUR2HULWbW1l0z1AymtVXOn3g=
X-Gm-Message-State: AOJu0YzcfRhc357l3W1W2FPBxI2hNZZvlzriFiQeLjZGgK+vyjhDXvF8
 4BAIkg1b5IIZ51Hij9FWG5jinf2R0hvrXadE9FbcTDxzuSY5Knr6HYds5oo3Gzk=
X-Google-Smtp-Source: AGHT+IEoN8msu0LPRA9eKI7YSyVm8ZP/8eqgvBMs+ZAQP0MrXla99LWwFBlhsCQ7xsKf+LEGiJT6Qw==
X-Received: by 2002:a05:6a20:6a2b:b0:1af:d44c:cfc4 with SMTP id
 adf61e73a8af0-1b2b6ee62efmr2264186637.17.1717569128466; 
 Tue, 04 Jun 2024 23:32:08 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f632356c84sm94819725ad.76.2024.06.04.23.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 23:32:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH RESEND 0/6] Introduce extension implied rules
Date: Wed,  5 Jun 2024 14:31:48 +0800
Message-ID: <20240605063154.31298-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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
 target/riscv/cpu.h         |  18 ++
 target/riscv/tcg/tcg-cpu.c | 238 +++++++++++-----------
 3 files changed, 537 insertions(+), 115 deletions(-)

--
2.43.2


