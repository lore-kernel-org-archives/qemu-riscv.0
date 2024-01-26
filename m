Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C85CC48260
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 13:33:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rTMIZ-0000pu-QL; Fri, 26 Jan 2024 08:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rTMIY-0000lV-0o
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 08:31:10 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rTMIT-0007b1-If
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 08:31:09 -0500
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cf354613easo3479661fa.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Jan 2024 05:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1706275863; x=1706880663; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0nf21EKXMPkJM8ze3CVTUdJSzYvTzNLrOGzIKTot8cI=;
 b=NGXOMCzhf7FnaY5lM1lGcQk4UUI9UplT7IeO8UhuTHGfaz4G7cgkPRgwwW0xxQHAea
 k3KWp7tTEtx77i5M1blaD5Y1049FbKGWqAyCVW0zC6oNB33IBKKQefcVCsQNASmKYgsC
 qbdSOeS+bL2gbVmgxV71rJLZww4XTd3vLIWaE9EsyroH+dUrw+sElz5GxdPv1ZORAUN2
 MpvPXV/sOtJx3PEnb/oZFIfiszZ0oBFLN54bSGHCk/YpCETDbbweATi6J2mAuSZdGEXs
 hNZsOLMBo65Bxy9hO9GnmmS+iWGAmSYiWhurevVd+TAVqQFLYETZAWMw6hm+LI6nMxvV
 VjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706275863; x=1706880663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0nf21EKXMPkJM8ze3CVTUdJSzYvTzNLrOGzIKTot8cI=;
 b=HIehJzbvEheZ5CZknBJLn2k5mraDVF3wPYOTyNu331KNCLJECcIKQv7L38innjETzq
 UdQxxtacxBgrIuVKRo/N+WObdlDfFQcAqIcYWVxCz5M2tqLfewdp+xTeTwguEYD6VVsa
 fVWyrqfeph0H++6VflrdJjhTCEAOragydXEgXEWUBdSgMvwEuq6Q9nIh1CKiayZt70Az
 ZTCVqWJdKdId0BK50rqNNfKKC1guDworIxdmOaJsVKJHKDIFpTvFKnm3wpKzp5glp1iz
 fl2nC62/MTrl5YMaY4sixVK5D+BTclqeST92oQWg5a5Ri42Hn0JXX37ZwnveuPhHyU9C
 yW0g==
X-Gm-Message-State: AOJu0YzximOphOG5Qh17Lmje/DoIdgsa61NMdjBgOXW/DJgUX/XGnDpF
 M2aY5LbH1MmFUebC51g/3EhD1KVhBGB2o3667X+/49NORssXREuoiIyltN8t3DA=
X-Google-Smtp-Source: AGHT+IH/3nPvij2/Z40gkyapC2Sm2N7u2M9Oa9iv2pAw6MCBxnf//mzepqHY+RDHMUgFr+hI9qOnVw==
X-Received: by 2002:a2e:b5c4:0:b0:2cc:fc52:df9e with SMTP id
 g4-20020a2eb5c4000000b002ccfc52df9emr682130ljn.12.1706275863345; 
 Fri, 26 Jan 2024 05:31:03 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 x16-20020aa7d390000000b0055c2b21be1dsm600205edq.35.2024.01.26.05.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 05:31:02 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 dbarboza@ventanamicro.com
Subject: [PATCH v2 0/6] riscv: named features riscv,isa, 'svade' rework
Date: Fri, 26 Jan 2024 14:31:02 +0100
Message-ID: <20240126133101.61344-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x230.google.com
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

This is a bundle of fixes based on discoveries that were made in the
last week or so:

- what we call "named features" are actually real extensions, which are
  considered to be ratified by the profile spec that defines them. This
  means that we need to add riscv,isa strings for them. More info can be
  found on the commit msg of patch 2;

- the design behind 'svade' and 'svadu' is wrong. 'svade' does not mean
  'we do not have svadu'. In fact they can coexist. Patch 5 gives more
  details about it.


After this series, 'svade' is promoted to a regular extension and all
the named features QEMU implements are now being displayed in riscv,isa.

v2:
 - Ensure svade is off by default even for the max cpu type


Andrew Jones (3):
  target/riscv: Reset henvcfg to zero
  target/riscv: Gate hardware A/D PTE bit updating
  target/riscv: Promote svade to a normal extension

Daniel Henrique Barboza (3):
  target/riscv/tcg: set 'mmu' with 'satp' in cpu_set_profile()
  target/riscv: add riscv,isa to named features
  target/riscv: add remaining named features

 target/riscv/cpu.c         | 63 ++++++++++++++++++++++++++++----------
 target/riscv/cpu_cfg.h     | 15 +++++++--
 target/riscv/cpu_helper.c  | 18 ++++++++---
 target/riscv/csr.c         |  2 +-
 target/riscv/tcg/tcg-cpu.c | 48 +++++++++++++++++++----------
 5 files changed, 105 insertions(+), 41 deletions(-)

-- 
2.43.0


