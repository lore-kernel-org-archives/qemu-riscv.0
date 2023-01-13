Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGOEM-0000zJ-JQ
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 12:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGOEK-0000ty-0Q
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 12:52:40 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGOEH-0001Xc-GB
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 12:52:38 -0500
Received: by mail-oi1-x244.google.com with SMTP id r130so18266016oih.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Jan 2023 09:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sxp+GM5ymPv6TyvkEfOVeU9wh4EBckYHO6VlmxtLwwQ=;
 b=W3/jNkNoP1yswlxOKBBSpZ4by/K4sh5PxE0QUkXnn8DER2vDe8s2mqypFYdxz7NIsY
 xZaiFoIjtEgTP2Db3migiXHXH/uxnwDhdRYHeN9pp/y6HM0pHqlBsO13OUdoIxHzDo/i
 2kguM0+EPL+JyJGLQMSM+9g7TNpM+1Lv3TINTDwPA4Ksjz00BeEgzBpZP4rniUb9Pb9q
 nS8t4/IUecZhOjFJlZNq833lea6jeH/Cxx6KmbE5vo8pCpbwi/wpVNtTYq1Gm2GIeBSV
 mCi+LwzpoNipYEuiFnJKVyn5gE/1Zak9UvbJULZ34HO/wYW3hx8Jn1/fS49l+pozxr0J
 PIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sxp+GM5ymPv6TyvkEfOVeU9wh4EBckYHO6VlmxtLwwQ=;
 b=01v31CZ/P8kpfCCAtngGhwZ70kkc8zYflLswwXLnfCL5RoArKx0zIKGtGnsUz7HRG2
 7mrNz4D8jkJnBjuBlCbRfJTSQrhy467mTWPhyvRqsdDpSGnR28G3V9HiFTgirv2vofwc
 dlvMWq2uPK/tA43Nbdm+dASIIaxQJiC2sn6N5dCTR6/s0cmKvQQW24hRVgPgDuXjHUjK
 iAkLyeCkdYW2pj+8S5lPZsQa2uR44qdatAQYLx3WQL27cmsC+xI+9ou3UobfNPKrHKZe
 IU2nrUkziLuRrPLMWtM0YDTi/JZ5wll1QgaR5cDphmJf/CdSD/ev5hYO5KeDfUgEapfm
 ZKSw==
X-Gm-Message-State: AFqh2koOComNt+Zc8iYA9NhQQzqX39E6dO0b+FXGGWyhBS1s9XIlK3T6
 X6yb+hvLU/Qq6Z8ysyOLCvI3Qw==
X-Google-Smtp-Source: AMrXdXsVcgC2kJbiG9atFWHOvQnLsLwMd7OGoMOTJoImoPzQvoVU4dm2uABhwsltgbHlqM++8QD3Uw==
X-Received: by 2002:aca:2b04:0:b0:364:5f65:952a with SMTP id
 i4-20020aca2b04000000b003645f65952amr6600094oik.27.1673632356264; 
 Fri, 13 Jan 2023 09:52:36 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 2-20020aca0702000000b00363ea5be014sm9549276oih.3.2023.01.13.09.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 09:52:35 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/2] target/riscv/cpu: fix sifive_u 32/64bits boot in
 riscv-to-apply.next
Date: Fri, 13 Jan 2023 14:52:28 -0300
Message-Id: <20230113175230.473975-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 17:52:40 -0000

Hi,

In this version I fixed the commit message typos pointed by Bin. I've
also added some notes about the code repetition the fix is introducing
in the cpu_init() functions.

The patches are based on riscv-to-apply.next at c1e76da3e668
("target/riscv/cpu.c: Fix elen check").

Changes from v1:
- patch 1:
  - fixed commit message typos
v1 review: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02035.html

Daniel Henrique Barboza (2):
  target/riscv/cpu: set cpu->cfg in register_cpu_props()
  target/riscv/cpu.c: do not skip misa logic in riscv_cpu_realize()

 target/riscv/cpu.c | 439 +++++++++++++++++++++++++--------------------
 target/riscv/cpu.h |   4 +
 2 files changed, 249 insertions(+), 194 deletions(-)

-- 
2.39.0


