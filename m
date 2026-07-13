Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8193C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 03:53:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wj7hr-0006oV-42; Sun, 12 Jul 2026 23:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wj7hp-0006ng-JE
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 23:51:45 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wj7hn-0001LW-TG
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 23:51:45 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c998fd549a8so1686605a12.2
 for <qemu-riscv@nongnu.org>; Sun, 12 Jul 2026 20:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783914701; x=1784519501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jj4m/zER4YcebdRR1iHI7o6k2JeRUvyIhqyN0AekG4I=;
 b=Lr3JTXUJ57bF9IE6gC0anRYqPWVvBofHbhT3KwmKNFCKgUBjzEYYIGfqzb7z1UjjHW
 nbRWvWyaJaMlE8Ws/Vmtnxlyc8nIqp5OHBuV9xDePTZt8OS79ZTc28hC2+HBbr5OTRih
 o0YfcRxtPjjAnBAQDUUfzhQkfmFjIju5vNhPzfAZIw9Waa5dDORHbq896FAT5grrkl4A
 KYrzyCIAkny0NEqRd7zQnFSYhAfFwzirp8rBtsWKbkuZ64m3npTSZwfabB/xrARe8QRB
 /IhZRcg05ZQYBgJr8cqzKBuGlkR//cngJEYoRVa/GEjcugUj5pf+5ZNonrg+T7cEe8wV
 mv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783914701; x=1784519501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jj4m/zER4YcebdRR1iHI7o6k2JeRUvyIhqyN0AekG4I=;
 b=jv2YF7A35+3Ei40qyAqn/E0DnRPmgKI1hZbf57VsM3Zi3XU0b/qLe8nBk93fM5PJq6
 CAKneDzc2PjmLk5IPRnxtINVtnJ/AINKgiKOLI+urBELDk7QiHbN9WmV9hPebKonQknm
 q1L4326YuhoQDcQGBWCwFN6yTWzAO2Ut+pDSXHo3JkoE0+y4tL84RHFdOJurfwDoxM0s
 cXMv6awKZ4ZNOyTrDaMaQgWwBXQLvR5LZ3iL635wzU9V8zcGPhHSMdfaQJ9K3VavftnB
 zJQ/XjZIamYkItkXUusc5r80fZfj0IEVrmpmsRP5iMIE+ZIlz/ERZRDIfT48tPQe7RQW
 a4jA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrgITV44BEmJ2mGhfx/1p4CujdiIQpdDlAl/pKptuTbOhpsMVwAokRmWHtJRDe8FSwcnIsdnwjfb/z3@nongnu.org
X-Gm-Message-State: AOJu0YyhF7ET0A2EEqLhveZaJs8q8RgfmS7wSDdFLTQbv5MpAnS88dtf
 TLJvas1vonbdZNLkEt6Q08UqbW41Tg9RnPs3hsJl70QQI2wMOxAOf8rdk+c67RvMyCk=
X-Gm-Gg: AfdE7cn7bjlbN/OiA8gtu//rM4bxFSFwKf7XbadJyAI5YcjRXYc1KlX8cp5ic+GtRyH
 nOhldqnich15Iq98CXMbKqe+g7+m+WBN7CXqNmjvkmBATrfealrOm59M7htC25qD8C/0rU7jR26
 LMqE7TjPj1YF6TzcQJUiqhtz2wzxgyVzboyv5X++S94lLBmG6pPnquxN2UcX9vsYUI9svvQXITq
 UDu7J1vj93cCNJ8s6jNIADKDlEVizjQqaHBWJAgdcQZfG7qzwJ4Lj7hTdrMX/rXNus5PXbha8UG
 H4UBi7nhmIw2Czw7TayaiK6k1v1Z5hQHKMon+0Jdlbz9ze1OD9G9QQJWAITjNBu53cX7YlmWcvm
 5IS7WCGLF20qrnotzdSp3INEZ77jpmDwmwNYi+2WRRFg9lxqDN2Ye7jevjTFR/Uva9KG2exLLVM
 BhhB6PF8+MTSUyv2tAXLiygwUmzU9/eQF08OxSMVs=
X-Received: by 2002:a05:6a20:450f:b0:3c0:9c19:65a8 with SMTP id
 adf61e73a8af0-3c110a30fb2mr7832625637.64.1783914701427; 
 Sun, 12 Jul 2026 20:51:41 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b3162d3csm7739884a12.18.2026.07.12.20.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 20:51:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 0/6] target/riscv: Support the true Zicclsm extension
Date: Mon, 13 Jul 2026 11:51:29 +0800
Message-ID: <20260713035135.3996990-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Support the true Zicclsm extension so that we can trap misaligned accesses
when Zicclsm is disabled.

To enable/disable Zicclsm, simply set zicclsm=[true|false], e.g.:
  -cpu rv64,zicclsm=[true|false]

QEMU will raise a misaligned load/store exception when executing misaligned
load/store instructions if Zicclsm is disabled.

Changelog:
  v6:
    * Reorder and squash Zicclsm CPU property and RVA22U64 profile patches to
      make every single commit to pass `make check`.
  v5:
    * Add Zicclsm to RVA22U64 profile explicitly.
    * Rebase to the latest riscv-to-apply.next.
  v4:
    * Align ROM reset vector data at 8-byte aligned offsets.
  v3:
    * Enable Zicclsm for the compatible CPUs.
    * Rebase to the latest riscv-to-apply.next.
  v2:
    * Use (size_memop(size) | mo_endian_env(env)) to calculate MemOp.
    * Use (log2_esz << MO_ASHIFT) to calculate aligment MemOp for
      vector load/store whole register instructions.

Frank Chang (6):
  target/riscv: Add Zicclsm CPU option
  target/riscv: Enable Zicclsm for the compatible CPUs
  hw/riscv: sifive_u: Align ROM reset vector data
  target/riscv: Support raising misaligned exceptions for scalar
    loads/stores
  target/riscv: Support raising misaligned exceptions for vector
    loads/stores
  target/riscv: Expose Zicclsm as a CPU property and update RVA22U64
    profile

 hw/riscv/sifive_u.c                         | 11 ++--
 target/riscv/cpu.c                          | 10 +++-
 target/riscv/cpu_cfg_fields.h.inc           |  2 +
 target/riscv/tcg/insn_trans/trans_rvi.c.inc |  6 ++
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 18 +++++-
 target/riscv/tcg/vector_helper.c            | 65 ++++++++++++++++-----
 6 files changed, 88 insertions(+), 24 deletions(-)

--
2.43.0


