Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C603C369A1
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 10:40:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u26NP-0005AO-FT; Tue, 08 Apr 2025 06:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26N3-000536-Cj
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:02 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26Mz-00085o-9O
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:39:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-736c062b1f5so4397959b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744108790; x=1744713590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KkJpg2ZaCQwylmwZcNazfm9o1z46TaCaXCXoOTWAtWI=;
 b=gWGnqQ0B3LZfHy7K4861Qoiu8uwhyIBQnh9bjdCMga2jKM3k6QydfmtbS+o2IC1HOf
 5z7sCr30+fe5dzHxUiZdnLFjhiof3zYwc56rhhM7mUE/wCNZiApKS3QE7wUg/AdN1ZTe
 MtDxDFejZpA79d7MX2BhC3NKLU4z3c0omSK7ZUGPn+GqeJK0rpuh4283ndqDDR/yaJQC
 sYS34da2aRopBhS8T24yxEzW+8Hkk5ctfh2BmNaZXqcyt8h8TekkCitvfbdU/ZBb+TbJ
 qvF1wHEqaY+6z+b6Rt7aec/ftv4M9jB+7zmkzQysP2QWIWpmXdagQB8ol9qUpnRsxwpJ
 CA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744108790; x=1744713590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KkJpg2ZaCQwylmwZcNazfm9o1z46TaCaXCXoOTWAtWI=;
 b=WVhh6mSRBEGV98BlEw79FWKyNiZwjsRuBP8wFKLt19nWArv/ZbWXwYjxTA5BrOtTBt
 adb0+QI59yrU7Cqw/Qcme+8mqaDsXMEcv4w7DaobxDpYm4UaNH6sk6Zo5eaIn3vcnZdr
 clGQZYxIVsow6XJ3MWgWPNHvf3V7XtSe4EMKlze+W8uO+fBrfmdssTqAao+vRCVZGdRK
 XH0bLVpl6qLA3jIbjCtizJ/lwvkKfaCSUcTt6ECLfgrkHaPx6UxPi+0SymseotXu+kd8
 FYdZM8y4JCxdeMCgpUhpRcdVum3Pz43x8nEWDUGTsf4cenmQMNIgmXgtLIJLdTptQajq
 mH8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQax8B9Wn/v5rskYtwfHH7P9Inb7tHbGMOUprjz+urG0s0x5KO1vnQp8S3emlJk0/Fy9HGpEhg9ffH@nongnu.org
X-Gm-Message-State: AOJu0YxN0tKTQuewN+hBybGI/wpTx8tq5VbrwWiCeJs1ApkUlJ/q8kUd
 p5UkGDxTVFKhE+eNpXUNLc812btluhIWd/4rgrRFlKGXOYoiJbKWMf0sN8izj44=
X-Gm-Gg: ASbGnctLyPAxNKSYpPNbjdERlmJmrC5pH+nIxjMoC+048XLhkN3avqRpaNVo05CoXz7
 8ExqqAz/x2/+6TLluPZV/yB51cA22W2jkxOLU9bakhsCNuPncFb35d6N9w3ce5lNsCMeHNBlPid
 cxjmHeAt4IOu0ZMikoemrvenkg2W3QBBEkq+rSFpD4LkodEeOZ18ZGO3ypd+9m32/kNK2BcfxUZ
 mIAeYrDFkyfI89nvU4FnqemctAiik9mg3fjAJc1AJGKbJZGi3uH1JX2ng9ZwjmPoQvI1lw1FLDp
 HuxidlxDOOx+x+7S9CUcDfEdyX3R6T85LkQoUZpcscnQcyJg/mXV0wHqteQnTNpnimyS7GSiWnp
 BAARC3BiNEW6zpQ==
X-Google-Smtp-Source: AGHT+IG5eAmpHJec2s7kapxyVgpzkGEG3qBtC1syrf3cIEk3WOtmMEpw2qNU2xXprjJ62suK/qr9Kw==
X-Received: by 2002:a05:6a00:2d8e:b0:736:55ec:ea8b with SMTP id
 d2e1a72fcca58-739e71439cfmr24221199b3a.24.1744108790449; 
 Tue, 08 Apr 2025 03:39:50 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0e3734sm10532380b3a.179.2025.04.08.03.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 03:39:50 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 00/10] Fix RVV encoding corner cases
Date: Tue,  8 Apr 2025 18:39:28 +0800
Message-ID: <20250408103938.3623486-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42f.google.com
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

This patch series fixes several corner cases of RISC-V vector
instruction's encoding constraints.

This v3 series addresses:
- Merge v2 patches (3 & 4, 9 & 10)
- Remove extra blank line in v2 patch 5
- Remove redundant co-authored-by tags

Thank for Daniel Henrique Barboza's suggestions and review.

Anton Blanchard (2):
  target/riscv: rvv: Source vector registers cannot overlap mask
    register
  target/riscv: rvv: Add CHECK arg to GEN_OPFVF_WIDEN_TRANS

Max Chou (8):
  target/riscv: rvv: Apply vext_check_input_eew to vrgather instructions
    to check mismatched input EEWs encoding constraint
  target/riscv: rvv: Apply vext_check_input_eew to
    OPIVI/OPIVX/OPFVF(vext_check_ss) instructions
  target/riscv: rvv: Apply vext_check_input_eew to
    OPIVV/OPFVV(vext_check_sss) instructions
  target/riscv: rvv: Apply vext_check_input_eew to vector slide
    instructions(OPIVI/OPIVX)
  target/riscv: rvv: Apply vext_check_input_eew to vector integer
    extension instructions(OPMVV)
  target/riscv: rvv: Apply vext_check_input_eew to vector narrow/widen
    instructions
  target/riscv: rvv: Apply vext_check_input_eew to vector indexed
    load/store instructions
  target/riscv: Fix the rvv reserved encoding of unmasked instructions

 target/riscv/insn32.decode                 |  18 +--
 target/riscv/insn_trans/trans_rvbf16.c.inc |   9 +-
 target/riscv/insn_trans/trans_rvv.c.inc    | 166 +++++++++++++++++----
 3 files changed, 153 insertions(+), 40 deletions(-)

-- 
2.43.0


