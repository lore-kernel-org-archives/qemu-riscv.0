Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD7BC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 21:40:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2eeQ-00064u-1f; Mon, 13 Nov 2023 16:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeO-00064e-SF
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:20 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeM-0001SW-A6
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:20 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cc3bc5df96so35316725ad.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 13:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699911556; x=1700516356; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IEMfgPxivRPfZEQuzebp3ydgpLWJc4wlD5QomatEmu0=;
 b=kzlsnV6QnpTYVg1OKmyohVVs44J/VM6+mVPHCKWpnuxxqvZBbDLjiHzwWSE4QVus1q
 wj5E3cy+xRd4n8kOMB50/EjNdFhbCaYrn5yYBTEuwHZ+etwYPJbDLfWHnkPnHXy88zm4
 eKxcgp6/ZnzfeEAX7JITSpnICUHiPmkpc/nelw6QtbK4a0FpBCIsNn6ZmLchmne3U5lE
 mXCpRv01YNjpyYTn+wAWCmIcRAzhaz6BuCkSD20xIMYoi0QlC+MbWzo2Ptn/xJptHQS7
 LBR6WN3aG3ks5KwAxq/Px7EnGpcTRen1VRch7N9B66F1lZ8V9A7yCQMim50cfimNdmRl
 7pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699911556; x=1700516356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IEMfgPxivRPfZEQuzebp3ydgpLWJc4wlD5QomatEmu0=;
 b=uofqpoZ5PEPOflgXQ1ZUSt4in3o4riN+B+CTR7hOX7ToxRpg2Xi/2CX7iwPfw6FmGV
 b0zyT/x+Q329Z6NrAjQ8lcmWwHdB7J9h2J9gakZQpdxv3+pSEkHMmay8AdaJ26vW2TEr
 GnkJ8lNZl1Muqjf55SHh8M2nCtXRsGmrkS29+/97TzlNZQPTCx+vfw9cnGa577A6wTuC
 QrSOU6uHKyRAvv6+vRC0xJaDe86UWPBmHQ7+HIer37wjx4CsAWaWbIfOha4lhAckeaNf
 yS2VJ32GHf8zN9Yx4WsG05eWMBvt6f+imA85zW8ICU1w7dwXqc5VTmuTwCghKM0rqHW7
 M/oA==
X-Gm-Message-State: AOJu0Yxq0ztkPzLPDUUp3mc6w9yQ+/i6EbRMP7MBcYX7VWPedxTGjEsa
 RjdEMCDksrgQ5Ht2X/lbmURBVu7cATaaZEeT5E0=
X-Google-Smtp-Source: AGHT+IG6dmKaAUdAZEJEveFhnUP40gt1mEnMLmYDopTWJ04Sl5FetezyaRSiAx2ZxLD9Oddcu5EEWQ==
X-Received: by 2002:a17:903:d5:b0:1cc:b81d:a786 with SMTP id
 x21-20020a17090300d500b001ccb81da786mr381424plc.55.1699911555961; 
 Mon, 13 Nov 2023 13:39:15 -0800 (PST)
Received: from grind.. ([152.250.131.148]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902900600b001c736746d33sm4455423plp.217.2023.11.13.13.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 13:39:15 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 0/6] riscv: rv32i,rv32e,rv64i and rv64e CPUs
Date: Mon, 13 Nov 2023 18:38:58 -0300
Message-ID: <20231113213904.185320-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

Hi,

This series adds canonical/bare bones RISC-V CPUs in QEMU. The idea is
to allow users to create a CPU from scratch without having to deal/disable
existing defaults. 

A bare-bones CPU will avoid scenarios like the one described here:

https://lore.kernel.org/qemu-riscv/258be47f-97be-4308-bed5-dc34ef7ff954@Spark/

Where one has to disable a bunch of defaults from the rv32 CPU to be
able to use the desired configuration. After this series, the case from
the link above:

-cpu rv32,g=false,f=false,v=false,d=false,e=false,h=false,(... desired
setup)

Will be expressed as:

-cpu rv32i,(... desired setup)

Note that the idea isn't new. The rv64i CPU was already presented in the
rva22u64 profile series [1]. That series didn't make it for 8.2, so I'm
picking patches 1-4 (already reviewed and acked) and re-posting for this
work. In case this series is accepted first I'll rebase and re-send the
profile series.

I'm also adding RVE CPUs, rv32e and rv64e. The reason is that we can't
enable I and E at the same time, and all default CPUs has I by default,
so we would need to do something like 'r32i,i=false,e=true' to have a
base RVE 32 bit CPU.

[1] https://lore.kernel.org/qemu-riscv/20231103134629.561732-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (6):
  target/riscv: create TYPE_RISCV_VENDOR_CPU
  target/riscv/tcg: do not use "!generic" CPU checks
  target/riscv/tcg: update priv_ver on user_set extensions
  target/riscv: add rv64i CPU
  target/riscv: add rv32i CPU
  target/riscv: add rv32e/rv64e CPUs

 target/riscv/cpu-qom.h     |   6 ++
 target/riscv/cpu.c         | 145 ++++++++++++++++++++++++++++++++++---
 target/riscv/tcg/tcg-cpu.c |  45 +++++++++++-
 3 files changed, 183 insertions(+), 13 deletions(-)

-- 
2.41.0


