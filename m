Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41982C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:38:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW0mU-0006MU-7J; Tue, 15 Aug 2023 16:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0mS-0006Lv-QD
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:36:44 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0mQ-0000xZ-9b
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:36:44 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bcae8c4072so4009473a34.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 13:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692131801; x=1692736601;
 h=content-transfer-encoding:based-on:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7V5CTyM9EV/u0OOr5ukN/3gUzFVWrP4ijt3E++QW1kQ=;
 b=HN3/zdPiIjzREdHh6rkgD/oKJxZTwYEhWZP4iYm7hzJZ/+rM5iEpVQHL4XZWfztp16
 AubeVXbXWdf47GDbMgI+W1og17vlHhfGU9Mcb/zIROtNyP889bl7KGtvH6fM0IB1GTJx
 pj5YwHJn1iRdP2mtfjv3pNj1cF55o932rJ0C7HwI3nGZJwHo56Dh0c0kt5pY6cOcuLCj
 Oo/b13Z6RRlYuqbYIKZaJb6VJwXKdAMQ57xoiSEPJdJG6cWpzf0K3OnhSICyTWOoFP2L
 12CaJ8rmjcYcAwonvaEGZAUZNEn2kpfIRH8PSBamj/1pDF5XXYluRrXIiNd7G7vbZaYr
 f8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692131801; x=1692736601;
 h=content-transfer-encoding:based-on:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7V5CTyM9EV/u0OOr5ukN/3gUzFVWrP4ijt3E++QW1kQ=;
 b=HbdYmOSRr9aMJB2kQgc5esXlBwQQUk6j7zswJ83l2h9UhcIAvCywuxkYHXgpwIoOyS
 3ax3KrYu/gxYzsC/FtbxMnFS62HY5lUUYPOdEGua4t+n0fZWR6kHoF9kTp1cGjjkDnua
 ZEjvhlI990aVf6IAQMkIE6rmXpfnFWKNfxgx0KElpY+l2SvMGNvuVqrwat5tav5PRPC7
 wtkdxjsffAxWU0+/DRB1KCq9eUENTyYLjkChG66dgSQJxoR8k0i7BseunExQjhkG9pNi
 ryGZEWEJBqJP3/I1NwEC2t6F7zVXui5wZJ3BqSpL0rNdN2lZPJKNqW9QHQgJBkJvUTGt
 3CBQ==
X-Gm-Message-State: AOJu0YwjUhE2dY1iwFH6YHzdq8vxV724TazASDpNwn74GL3cGjxzZxxT
 q0X29NhbZZd5gha/f1IuR1tRSQ==
X-Google-Smtp-Source: AGHT+IHIDdrUOONT0wEwRl6Nznvf4U3FcoGCfdNRnJ4RvGOpfEveB2fuscgBdcTrD40JDXQbtu2eJA==
X-Received: by 2002:a9d:6ac2:0:b0:6b9:6276:c64c with SMTP id
 m2-20020a9d6ac2000000b006b96276c64cmr11234107otq.12.1692131800751; 
 Tue, 15 Aug 2023 13:36:40 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a0568301bcf00b006b94fb2762asm5526849ota.23.2023.08.15.13.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:36:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/8] riscv: detecting user choice in TCG extensions
Date: Tue, 15 Aug 2023 17:36:27 -0300
Message-ID: <20230815203635.400179-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Based-on: 20230815201559.398643-1-dbarboza@ventanamicro.com
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
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

This new version is a rebase on top of the new version of the 'max' CPU
series:

[PATCH v7 00/12] riscv: add 'max' CPU, deprecate 'any'

The changes made from v6 to v7 conflicted with the code from v1 of this
series.

No changes made aside from trivial conflicts.

All patches acked.

Changes from v1:
- rebased on top of "[PATCH v7 00/12] riscv: add 'max' CPU, deprecate
  'any'"
- v1 link: https://lore.kernel.org/qemu-riscv/20230728131520.110394-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (8):
  target/riscv/cpu.c: use offset in isa_ext_is_enabled/update_enabled
  target/riscv: make CPUCFG() macro public
  target/riscv/cpu.c: introduce cpu_cfg_ext_auto_update()
  target/riscv/cpu.c: use cpu_cfg_ext_auto_update() during realize()
  target/riscv/cpu.c: introduce RISCVCPUMultiExtConfig
  target/riscv: use isa_ext_update_enabled() in
    init_max_cpu_extensions()
  target/riscv/cpu.c: honor user choice in cpu_cfg_ext_auto_update()
  target/riscv/cpu.c: consider user option with RVG

 target/riscv/cpu.c | 400 +++++++++++++++++++++++++++++----------------
 target/riscv/cpu.h |   2 +
 target/riscv/kvm.c |   8 +-
 3 files changed, 266 insertions(+), 144 deletions(-)

-- 
2.41.0


