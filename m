Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CEEC5B543
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:43:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uMs9X-0005WQ-3S; Wed, 04 Jun 2025 13:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs9P-0005Uh-KH
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:43:43 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs9N-0004Aa-Ho
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:43:43 -0400
Received: by mail-pf1-x444.google.com with SMTP id
 d2e1a72fcca58-74267c68c11so205312b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Jun 2025 10:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749059020; x=1749663820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I1II+3YQnG90HksUR5dl1/2JKfZzGM6a2Go/eJtjLcU=;
 b=IJxBcksJFgCqbuIlHjMfFqrzOLXEFWWLkz89p9uV5DC9tSr8KodR+uPWxg/Yh1kfsM
 KtABKdd41LlClbdpqq6JBkoPtnqAxbPg6414lF+X93hCASvVamglwfX5nbwC8FRKGJwk
 byXuRtnwtOvYOTyIuZDem6/WT2EhlbhulZKM/z8UvV9OhNk4ZUkpEzrKxIRnc6qAH/s+
 iiW5yodgV6acznXw+OwRA32DIT5Hws/OKRJtYwNMqAFuqVpiyCGgToojrigFyp0le3a1
 /OhOmwYhS4at3FgA3Pm+uxiW4CiP0My5MuDYsPOre2cvz5qKNc1brjm5vW49fN3ZSN5L
 DgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749059020; x=1749663820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I1II+3YQnG90HksUR5dl1/2JKfZzGM6a2Go/eJtjLcU=;
 b=SlclJgcKgcgkuNlcS9fR+yESk30uBZR+IhbJGrSU8fqnjXsboZrX3HKmHJk5fBPqdc
 K8NEIv3ccx64uIZLAIIY7mWy4yncPidOOIRphQOjXKFO91eUoB2w3DNbN4+aVZdciloo
 7FG0rtdZc1p//+iqkxFlWpSUqWDhKOGHY/1fkcuL1FaqpIb6QW/YTUFZ1nbz33Q0FPHs
 Tl4O0F2LL+Vjj1V+fOdysImiF0bxr2iCzoESGzUUaDURTRUQGe2aPMh7INKLR2K4Ulpl
 n22RTXlFpQ2u+JguCSZm2Q9cn3BhOeApqTLWXnAHtYrygAs2WOheqOVJCEq0JA4IXvII
 62Vw==
X-Gm-Message-State: AOJu0Yzuz478dH6MSHdC111cbKFpYQ7cd6a1S5aOWZHy7WKx16J38J0d
 e1d+tGUGfHu4KkFFFaWQBuXewPOANfQmxqWoh2L/NBRdBYTm1b3qCaD60JSEFlWNVVQ=
X-Gm-Gg: ASbGncsc7v1YoAeKEaE/2o6L8F6kUlHfrEqBX6A52joiXfcAbi5tyfj6xxa9Ai+Cy80
 2KH9Dm0vfmkACy7d8FkoSRNCO7NN3JTYJCcQLOK3yw1qIfeGgfuN8GuY85ntXioZ8L9g1pNC3+f
 Ce17RYgeTJ4RMV3NzW6O/fx2Nve40zT6MfI8cv4Qxr+qWqB1L6JHptEZgsTM3BHGy/BGh34ahwC
 8Rg6yGWvSA7z8Qiist3YjmM3mos9+AQgAjxKRBhvJ6NUA1Qqbj3TuW2bbtaMYOGrNNFU8yf7FEJ
 cdlwFpxVUeB6Ttzt2P9DEdwfpjIPvfB/5jO5ou4ErKjEqY2CiYtCAgucfuVGr9I6xqpVV23HvOQ
 JJWVco+qpyWGNQNw=
X-Google-Smtp-Source: AGHT+IHqtgoICqVAuvq4Ca0rxlMh3OSJolAgEZpAIkxQFIzjMJ1H4ssElrc+LOrrNn4k5JHCxuOtuA==
X-Received: by 2002:a05:6a00:14ce:b0:747:ab61:e4fa with SMTP id
 d2e1a72fcca58-7480b4972bcmr5356255b3a.14.1749059019869; 
 Wed, 04 Jun 2025 10:43:39 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeab109sm11418482b3a.40.2025.06.04.10.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:43:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v2 0/3] target/riscv: add missing named features
Date: Wed,  4 Jun 2025 14:43:26 -0300
Message-ID: <20250604174329.1147549-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x444.google.com
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

In this version I fixed the problems caused in bios-table-test qtest by
patches 1 and 2. 

A small change was also made in patch 1 to avoid spamming "Disabling
sdtrig due to priv spec version" warnings when running vendor CPUs
with priv spec < 1.12.

Patches based on alistair/riscv-to-apply.next. 


Changes from v1:
- patch 1:
  - skip the warning and disable of 'sdtrig' for CPUs that have priv
    version < 1.12
  - update bios-table-test
- patch 2:
  - update bios-table-test
- v1 link: https://lore.kernel.org/qemu-riscv/20250529202315.1684198-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (3):
  target/riscv/cpu.c: add 'sdtrig' in riscv,isa
  target/riscv/cpu.c: add 'ssstrict' to riscv,isa
  target/riscv/cpu.c: do better with 'named features' doc

 target/riscv/cpu.c                |  16 ++++++++++++++--
 target/riscv/tcg/tcg-cpu.c        |   9 +++++++++
 tests/data/acpi/riscv64/virt/RHCT | Bin 400 -> 416 bytes
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.49.0


