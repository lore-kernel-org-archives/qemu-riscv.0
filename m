Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135EFC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 16:19:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMsLS-0003i7-WC; Mon, 08 Jan 2024 11:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMsLO-0003h4-Lh
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:19:19 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMsLK-0007m6-Ol
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:19:16 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6d9ac5bd128so937553b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 08:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704730752; x=1705335552; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NC8ZxDXMUOXKVvgPmJVKM8apS65XacC27+UbLDmLPLI=;
 b=Q9WmgPil7gN/C69OPaS+fAE3/kKJQ+fsNgow3J4MXsVAWO01soY/qYJmxpC8hOFrgN
 buRIAiV/75Pe0Mf03dHbpRODjDrM9H1qB+iLdh8lf1cn7EEL+THZovbMi/SYPQb4Pveg
 BeqqTIPHCZC85/0L5+rFNcdG9jk4Pj/6Xla5fxiPFYusRrKQj9NGb4KNNGyQfCcnojOd
 pgWlHIFehs87iQE+YOjQEsgb9dRjRldyu6fW400RFVqmpxkQxh+uzIbeCq4lDr/JVcVT
 +lD3YlXkm36cXriQua3QpoVBPU8bunTRA+PDmu3pqmwDiGM73Uv4cAMgeWpgRdliDfVM
 h5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704730752; x=1705335552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NC8ZxDXMUOXKVvgPmJVKM8apS65XacC27+UbLDmLPLI=;
 b=nfyGTE66qKx1e8xkXKN25SpAQHYtNK15NgZtkYsnuqWnzO4jBJpBNpQWjxinPJDQEY
 V+EGMR57uWk5TeR7SJcQn2RnTWRLXQhmSwl4B5J1QCIi8GPvbvyAbhhhne3WcLt4J8Z0
 viF+r/v68idrN4eYfhGWWkPwX3xvdFHnUG9UyK++Y771jOmkCo1lqQofZ73Q9j9ZR80j
 Zb+lFcPukbc7i3/St2aWDc9Be1cpacV8MdrOl+JZutq1v4rUAquNog04O8fGbx4NsRxI
 xNVodS5utMCOs1wbiovszE2OsDk3mlOKI4lKJxCdO84RkFwVuIQYXLSlDz2GXTrEPf7E
 Q/UQ==
X-Gm-Message-State: AOJu0Yyfrez1/wXYJyih8AMgSHTKCuaLDbpMyJMzUlsCjXrH5bJYSbE5
 C9un+b1VISAnfoJ9f1yUFnWqbHCuRpdfdw==
X-Google-Smtp-Source: AGHT+IEJt3fJc/NZqda1fLHxAfGp2GzESRzpW2eOiP8t8jaTwY/RtiuOeYs3Lc7ADupmeN4uob/qgg==
X-Received: by 2002:a05:6a20:6a2b:b0:199:3fde:1226 with SMTP id
 p43-20020a056a206a2b00b001993fde1226mr1506064pzk.46.1704730752602; 
 Mon, 08 Jan 2024 08:19:12 -0800 (PST)
Received: from grind.. ([189.79.22.11]) by smtp.gmail.com with ESMTPSA id
 b29-20020aa78edd000000b006db056542e6sm49151pfr.190.2024.01.08.08.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 08:19:12 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/2] riscv: add rv32i,rv32e and rv64e CPUs
Date: Mon,  8 Jan 2024 13:19:01 -0300
Message-ID: <20240108161903.353648-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
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

Hi,

This is the second version of a buried patch series:

"[PATCH for-9.0 0/6] riscv: rv32i,rv32e,rv64i and rv64e CPUs"

This version shrank to 2 patches since most of the prep work was already
done by the RVA22 profile implementation, which is now queued in
riscv-to-apply.next.

The motivation is the same as in v1 - give users a cleaner way of using
a customized CPU, from scratch, without the need to disable default
extensions.

Patches based on Alistair's riscv-to-apply.next.

Changes from v1:
- patches 1 to 4 from v1: dropped
- patches 5 and 6 from v1: merged into patch 2
- patch 1 (new):
  - add a new common cpu_init() for all bare CPUs
- v1 link: https://lore.kernel.org/qemu-riscv/20231113213904.185320-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (2):
  target/riscv/cpu.c: add riscv_bare_cpu_init()
  target/riscv: add rv32i, rv32e and rv64e CPUs

 target/riscv/cpu-qom.h |  3 ++
 target/riscv/cpu.c     | 64 ++++++++++++++++++++++++++++++++----------
 2 files changed, 52 insertions(+), 15 deletions(-)

-- 
2.43.0


