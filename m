Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA45C04FFE
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 May 2024 12:53:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s92Uu-0005cI-0U; Mon, 20 May 2024 08:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1s92Us-0005bl-R1
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 08:52:10 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1s92Uq-0004Pw-Bk
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 08:52:10 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ee5235f5c9so70348055ad.2
 for <qemu-riscv@nongnu.org>; Mon, 20 May 2024 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716209526; x=1716814326;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RkJmPsus5kgePaO+WyyT7Ou0hnTgJhrfaJIEcSKdHW8=;
 b=UGquwx8mIfs/FyEcgjNNufuQzMx1yxG8ix6PC0FKHhK1AOrYGZ2SwqnRJHzSJdKNND
 0zvl9h1ND+/punm5XcqL+b/os5gY5ujAqv/KBliv9RLFjRZSqpzsW0/ckyzxrFGXcbYH
 0amLpi+v8KsQmxSHf7ATPpIjXYVsFV8uOBo2FOUDfgpuqAOQRWapfTzdias2x3dtf0Ht
 jqa5LbyeTGi2gXm7exOw4ywOdOpvfjZHgI9ll2OhUl6HwsPdOiKKZVNdjltfgGI+0Z+H
 YJo3UwsQYWCVguxOiaXxK3zY+GSgq3D5Rz358KzTtt/vk/eESuWZDmjNNRnf96rfzZRq
 7FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716209526; x=1716814326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RkJmPsus5kgePaO+WyyT7Ou0hnTgJhrfaJIEcSKdHW8=;
 b=RW2AkhcMupbn1cjY4CoKexDzzYnNnK+PhqkK59eC5yJbLhinv9g3N1AZ8liR5MAQFt
 Sd7FIV4127UZPjGgcsUhxVhFwDpaNMiqnlXU7GfJItLsPwp2NRw9xmcJqqgNbFyRPU2V
 CFLpnuJuSmxBEszN3FBHRNIis6Y4NXY1NzCZmBL2Rres9+0+rrAwPmEfZ88fJCCZMYXt
 8cYXDLLGk+BcvrPSPklhCBSdfmFxPpb3NU+d2No8cKTpVuCVs384WyvXSbTFu1Nrinq9
 MkvbC1mVejZJNGl2+c7M+Y80lAaZNi0CRhcBLj2WsZ7NG/M+W+qmD/Rfp2EMkD6zLckR
 YFeQ==
X-Gm-Message-State: AOJu0YyjBA7MroESZoDjo1Bf0um6vXkLthwANghp/B3M/GQvNs5qh5/R
 nzbhsEXux/2u+zIuGduHd+0wZSIUWrFfSSLR0HQk4yl3B9f5eIkra5xCdRZRUStFD0GmsESryjd
 twiQ=
X-Google-Smtp-Source: AGHT+IHtvJ58LROYjoAvmFssAn4Urt/B4oJcEnoT5MT7clGUUmc0RhNPggdsHoevItYCDW+1DSyR1A==
X-Received: by 2002:a17:902:8e8b:b0:1e6:7700:1698 with SMTP id
 d9443c01a7336-1ef43e231f7mr265293655ad.35.1716209526335; 
 Mon, 20 May 2024 05:52:06 -0700 (PDT)
Received: from localhost.localdomain ([51.52.155.79])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c139465sm202905145ad.269.2024.05.20.05.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:52:06 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, rkanwal@rivosinc.com
Subject: [PATCH v2 0/2] target/riscv: Minor fixes and improvements for Virtual
 IRQs
Date: Mon, 20 May 2024 13:51:55 +0100
Message-Id: <20240520125157.311503-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=rkanwal@rivosinc.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This series contains few miscellaneous fixes related to Virtual IRQs
and related code. The first patch changes CSR mask widths to 64bit
as AIA introduces half CSRs in case of 32bit systems.

Second patch fixes guest and core local IRQ overlap. Qemu creates
a single IRQ range which is shared between core local interrupts
and guests in riscv_cpu_init(). Even though, in the current state
there is no device generating interrupts in the 13:63 range, and
virtual IRQ logic in Qemu also doesn't go through riscv_cpu_set_irq()
path, it's better to keep local and guest range separate to avoid
confusion and any future issues.

Patches can be found here on github [0] and v1 of the series
can be found here [1].

Patches are based on alistair/riscv-to-apply.next.

[0] https://github.com/rajnesh-kanwal/qemu/tree/dev/rkanwal/irq_fixes_v2
[1] https://lore.kernel.org/all/20240513114602.72098-1-rkanwal@rivosinc.com/

Changes from v1->v2:
1. Check patch fixes.
2. Removed commit title split from Fixes tags.

Rajnesh Kanwal (2):
  target/riscv: Extend virtual irq csrs masks to be 64 bit wide.
  target/riscv: Move Guest irqs out of the core local irqs range.

 target/riscv/cpu_bits.h |  3 ++-
 target/riscv/csr.c      | 23 +++++++++++++++--------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.34.1


