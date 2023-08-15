Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C50DC04A94
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:48:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2pW-0006k8-Tv; Tue, 15 Aug 2023 18:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2pV-0006jT-4V
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:48:01 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2pJ-0008FB-Mx
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:47:51 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6bd0a0a675dso4991431a34.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139668; x=1692744468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yaT80b0uGe7TRt+cT3KOPD+VP1/2tqZFwghXCAGQGtE=;
 b=fN3Ny0OHaFMHKdWUS4QUCtRS07nSqaR60Lhr//aftq/AT+LbJx80u/y3mRbwubk60D
 BcQUp0dR2/JCgtum3PFBhPQ6OebVrt+8dkkiWA7RczL9mrPdhWug4igi/cz/l+jNtnSg
 dLm6p6V5NjZpQJ8jVgKDEYLgdJBp86q6y89eH6+09yGSR020NOjtnHX+ashl8cubLSHu
 PxflvuaWDpev/6Q99DcOWYDJs/ckpKD5Dv7zIbhFRbJ13fR2aY4W1TByLhOlAGxk3mw5
 Al1O8vhVSZpNHr8Tt7V3jlSPBedGEU4ZrkKHtYEQXOkmBdKozVuqpOetkWXnTBdEP+q7
 yi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139668; x=1692744468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yaT80b0uGe7TRt+cT3KOPD+VP1/2tqZFwghXCAGQGtE=;
 b=UnKQ0JYm2tsCFRxa4/6nRKM8gWt806oQlRbu8OHEs6PoaBcT9KAFNx3SNpH29vX8hr
 a5cLXjmTu222WjyhlWX61C/8LqaW22Dkmyaf2f/Q9Ds9/sMqqeEaAjnEWvE4s+lvBd6g
 ltoLwUQD7PaZ6ls/iH/b8i+pcDTl9fEYwgFpWxgi37qT6r0v54UQUq7caDljYPtVTtyd
 mZ/ptu/PQrNDUhqMCulNqYntffJFaeaFnHvVb/qvny4XovaLm5n0bbFGZ1f1IBDvbbR2
 UKEK/BgGSjwTcW8ZtGGc897F4qxpsJ7h0ZDOrWTiaF+AjYV20fBfc4wWUfR5axQYJ7u4
 kZww==
X-Gm-Message-State: AOJu0YyYWj1GJqfAV9HmwAGFDP8TLyIN1zr06lI3gufVaARluc6ny8vz
 P4UJmh2Vk0qVEjqpOSLmvs0A63/ADvYogw//GQo=
X-Google-Smtp-Source: AGHT+IGwZif4nACepuCfmdU+Edbq0+Y3oCOaNV9RcJbNI+n+mWJu0oC93uoWG6BLcRYOrfmWT4jASg==
X-Received: by 2002:a05:6830:1e19:b0:6bd:93e:460b with SMTP id
 s25-20020a0568301e1900b006bd093e460bmr73288otr.19.1692139668346; 
 Tue, 15 Aug 2023 15:47:48 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a9d4b09000000b006b9f26b9b94sm5655668otf.28.2023.08.15.15.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:47:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/8] riscv: detecting user choice in TCG extensions
Date: Tue, 15 Aug 2023 19:47:25 -0300
Message-ID: <20230815224733.434682-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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

Based-on: 20230815223741.433763-1-dbarboza@ventanamicro.com
("[PATCH v8 00/12] riscv: add 'max' CPU, deprecate 'any'")

Hi,

This new version was rebased on top of the new version of its parent
series. Recent changes made there conflicted with the previous version
of this work.

No changes made aside from minor conflicts solved during rebase.

All patches are acked.

Changes from v2:
- rebase on top of [PATCH v8 00/12] riscv: add 'max' CPU, deprecate 'any'
- v2 link: https://lore.kernel.org/qemu-riscv/20230815203635.400179-1-dbarboza@ventanamicro.com/

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


