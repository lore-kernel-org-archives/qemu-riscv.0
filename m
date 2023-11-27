Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC62C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 11:39:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7ZwC-0003mu-64; Mon, 27 Nov 2023 06:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwA-0003iy-CB
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:02 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7Zw8-00059q-Kc
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:02 -0500
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3b85dcecc62so1066196b6e.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 03:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701085078; x=1701689878; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GexgtkYnnohNVPjKwT9CoTH1w/uV/FYHysSfn0QoPcw=;
 b=b54l5vWdy7Iu5rN4WBZDDbYevGqduv+ci1jCN80NfcP5eCQkcrZFTLZ79BESIGzOqn
 MO8BtIdC1Ba6clafPLiwIelwq8XIm/3WYWginxKfDtkFUWo0DP3xhzXgf1xf5iyR+f1M
 g/xKfwTVzYDWsGSVhNl/EQb2uVUifYlMHp47739HCyGuctO3m4DwWq8W1Eu9wOyanbVF
 X5qAAZpE461q7tgu3ddrT6BXKe3c1CbCZC3SVWqQ+WoZckM9qbF8EnYS3QI336T7XJI6
 cAR0ijSrdvmL/DRjNSx/Tw6W7wisJwsRc78MpbL/mfOGrcsOy8IxOd3QSRc/RXcdh9rV
 7sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701085078; x=1701689878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GexgtkYnnohNVPjKwT9CoTH1w/uV/FYHysSfn0QoPcw=;
 b=bJQxl0twDSapnGCmTL7q1OZ+zWJdVufXWdiwenqOShoLqIzv5c3VnqSExBToERxQPe
 98L5pE/Cj3vV77aJpOyJb73Ap/ebAhVofnAYdyy5D091BnkAi/UDRB7esYLrZ8t6Rze4
 BUrLXHKbhcz0clGSlsLUIgWw2JAJ9GLW2A1u4LnM1SZ4415riIqCmIjy7BROWxiMtPnV
 DZMFyuqRHYZkV4E1bnxnpzGbcuwfk7Qb1vebPCfJizw781xlSs3eV8Yzx6etqBY8SoGa
 MSezKkmjW+InTpRIAeD5EhMLn/pBWSSN0LQkh0v7rV8W6FhjX5QGEWbHcW7v1nA7clcQ
 yURQ==
X-Gm-Message-State: AOJu0YztptLRgExdYo49MTz4YsvLMN2LHyAcd7z9YtlYPErnxQ7oUGoi
 rR11JbFt2hmfE84QIOkLzm25GA==
X-Google-Smtp-Source: AGHT+IGV3ojx9WQDeINmA0if4ot2j7uwmwMGQk8Hykf3vA9P0316j7cuWyXO9lavMuIy+IQN/KLkUA==
X-Received: by 2002:a05:6808:3195:b0:3b8:4f79:a0be with SMTP id
 cd21-20020a056808319500b003b84f79a0bemr15527077oib.52.1701085078386; 
 Mon, 27 Nov 2023 03:37:58 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a63e94f000000b00578b40a4903sm7618323pgj.22.2023.11.27.03.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:37:57 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v2 0/8] target/riscv: implement RVA22S64 profile
Date: Mon, 27 Nov 2023 08:37:44 -0300
Message-ID: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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

Based-on: 20231124202353.1187814-1-dbarboza@ventanamicro.com
("[PATCH for-9.0 v12 00/18] riscv: rv64i/rva22u64 CPUs, RVA22U64 profile support")

Hi,

In this second version the most notable change is a new patch where we
added a 'parent' field in the profile description. This feature was
suggested by Drew in the v1 review. 

RVA22S64 is then declared as having RVA22U64 as parent, plus any other
extensions, named features and other contraints that are specific to
RVA22S64.

Another notable change is the removal of riscv_cpu_validate_svade(). The
helper (a single assignment) is now open-coded in
riscv_cpu_update_named_features().

Series based on top of:

"[PATCH for-9.0 v12 00/18] riscv: rv64i/rva22u64 CPUs, RVA22U64 profile support"

Patches missing acks: 2, 6, 7

Changes from v1:
- patch 1:
  - removed riscv_cpu_validate_svade()
- patch 2:
  - add RISCV_PROFILE_ATTR_UNUSED check when validating priv_spec
- patch 5:
  - removed stray blank line
- patch 6 (new):
  - add 'parent' in profile description
- patch 7:
  - declare RVA22U64 as parent of RVA22S64
- v1 link: https://lore.kernel.org/qemu-riscv/20231123191532.1101644-1-dbarboza@ventanamicro.com/ 

Daniel Henrique Barboza (8):
  target/riscv: implement svade
  target/riscv: add priv ver restriction to profiles
  target/riscv/cpu.c: finalize satp_mode earlier
  target/riscv/cpu.c: add riscv_cpu_is_32bit()
  target/riscv: add satp_mode profile support
  target/riscv: add 'parent' in profile description
  target/riscv: add RVA22S64 profile
  target/riscv: add rva22s64 cpu

 target/riscv/cpu-qom.h     |  1 +
 target/riscv/cpu.c         | 67 ++++++++++++++++++++++++----
 target/riscv/cpu.h         |  5 +++
 target/riscv/cpu_cfg.h     |  1 +
 target/riscv/tcg/tcg-cpu.c | 90 +++++++++++++++++++++++++++++++++++++-
 5 files changed, 154 insertions(+), 10 deletions(-)

-- 
2.41.0


