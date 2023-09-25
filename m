Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF10CE7A89
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 04:30:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkdF1-0002pS-TT; Mon, 25 Sep 2023 00:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdF0-0002p0-2L; Mon, 25 Sep 2023 00:30:38 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdEw-0007V5-Hm; Mon, 25 Sep 2023 00:30:37 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-578a3069f1eso3433199a12.1; 
 Sun, 24 Sep 2023 21:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695616232; x=1696221032; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W3yybX3dRFoORug1HysTE/1Zuv/08SYd9d+hOJaZiLI=;
 b=Og+lxxqlEe0jWDhh+eDJG7oFRteNpkxvIQvkSFP3JLLrMR074bs/UB0jUFZTpyUyxi
 sWeqGOO3VxxFBL0PxdHp8hUYKsYDp4byYYUZ1Ekzo3+MDFbrwGGMY7Xk32klkJcjwjAG
 IFMwtRBWxjZ9rYoIrMWyDgL6jwe3IdUn+NVYHJvKpDORshzLC0qGWZpW5uDVM0vbieKs
 FKGESyzk96H9nu0uwSxAj4+UIjMGEIXeC8pSVENYQkUvpT5LtNHYsYuMHci7+DeqkPTw
 +onQIq3shikSULxJ3z+EuXLlZWy54xJiwcNpw2EnkMpoPiswqzBRxJUT62tbuIkv5PvT
 aNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695616232; x=1696221032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W3yybX3dRFoORug1HysTE/1Zuv/08SYd9d+hOJaZiLI=;
 b=oY3ZvROXKHWI2uGVCVDier4vPNy9xrI/QGmxCz19aYcq9OFDTWt9olLRo5zRBVurN4
 EiPCN+ssGIZcJ+GSpUGmOY8yEy1bM9uK64BVyd0UEhab6saGOiGi/YAyuYWNdri0q9Hn
 UkNvK979QSofvrzc8rfxxzlTIyF6cGNoeDANBBU5/EOjts0/zY32qli5UaJ7/kSGqIJf
 nQ/CN0jazvxTyqIYYkq8tjD+XXP2/y3/AhW5rZ8jymKE2beOA3PvHXWaylv72mHpUHq8
 9vEQGWfm7i/YpQmhK0Hvrx6INU98OHUvh+kdKxmakGdjPzCmnfTM3dr/51qeDK71r0v/
 ikzQ==
X-Gm-Message-State: AOJu0YxzXmg8ayAbu6ut6oKUQMWQraaJndd29A/YvCyWpB7vv8OHaCuw
 im2SnmJFqyHwjQDuI91II0RQn8zPs0DPQg==
X-Google-Smtp-Source: AGHT+IFkN/P2I8oja1vvL4eiViV8MCy70j/k0Dy3vsFaL+/OcYkwdeZvOYCctWO/2cXdp0ps6fGjkg==
X-Received: by 2002:a05:6a21:a59e:b0:14c:ad99:22a9 with SMTP id
 gd30-20020a056a21a59e00b0014cad9922a9mr4702502pzc.32.1695616232492; 
 Sun, 24 Sep 2023 21:30:32 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a17090a134e00b00276fef82025sm6002161pjf.35.2023.09.24.21.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 21:30:31 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: david@gibson.dropbear.id.au, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair.francis@wdc.com,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, palmer@dabbelt.com,
 alistair23@gmail.com, dbarboza@ventanamicro.com,
 Alistair Francis <Alistair.Francis@wdc.com>, liweiwei@iscas.ac.cn,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 0/4] RISC-V: Work towards enabling -Wshadow=local
Date: Mon, 25 Sep 2023 14:30:19 +1000
Message-ID: <20230925043023.71448-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Bugs love to hide in such code.
Evidence: "[PATCH v3 1/7] migration/rdma: Fix save_page method to fail
on polling error".

This patch removes the local variable shadowing. Tested by adding:

    --extra-cflags='-Wshadow=local -Wno-error=shadow=local -Wno-error=shadow=compatible-local'

To configure

Alistair Francis (4):
  hw/riscv: opentitan: Fixup local variables shadowing
  target/riscv: cpu: Fixup local variables shadowing
  target/riscv: vector_helper: Fixup local variables shadowing
  softmmu/device_tree: Fixup local variables shadowing

 hw/riscv/opentitan.c         | 2 +-
 softmmu/device_tree.c        | 6 +++---
 target/riscv/cpu.c           | 4 ++--
 target/riscv/vector_helper.c | 7 ++++---
 4 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.41.0


