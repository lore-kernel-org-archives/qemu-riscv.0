Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9DCC5DF7E
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 13:37:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwJzx-0007qq-Hj; Tue, 18 Aug 2026 09:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <0860734llx@gmail.com>)
 id 1wwJzG-0007DY-LA
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 09:36:18 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <0860734llx@gmail.com>)
 id 1wwJzE-0000hg-VN
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 09:36:18 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cab973140bso70381465ad.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787060175; x=1787664975; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/D6HjVKa4QQ4IcscIfUtE4RoMhIMfrZSlP4SYUTz+h4=;
 b=EX7HgWXK2txQwGpExwEjSvsQpbpo+NfoDTvvFhZm/DYVjRZSST3tr0uqj0Oxll8hs4
 is0cgZi5U0dqo3GlbLl6NUT5WE7d01v1cs9AbcxRhduS2MdZjOwrtCN/zBzKWVb7bREP
 i3p5P+FV3qZu+3bBP/oJaPQJ3FbVCJqWUOAb7ILuFpOy/oZyhrKX4U8pPVu9GLFNngVZ
 KfWg54T3NUeg78ragMpAr8+RJr/noxAF5wHfWYaSyj/GH3GXYNGY68OEJ6h5FpuCdHLv
 sykaw1iFx5HtKkVgPpsH/AT/SzMPhUUVehIGxTEubyuHE4E+n/BqhnW7bUjpzD/cNmx1
 1mBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787060175; x=1787664975;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/D6HjVKa4QQ4IcscIfUtE4RoMhIMfrZSlP4SYUTz+h4=;
 b=Wrz7NkQrmKT46GEhJXnfj9Uo7BKjsuxanGFzgcj5jb0qsQjQlE6Ai5PXVtoo1K5fP3
 3V1JQfJFv+BzWESxmEOfOXOoxn/Mj0+qiR259BxN6lmpz8Hp3sH06MyOa1WWz6otnCye
 SRbvi6yINZZlWUtmdOqoW5Dk+0erBU5H+b3Fe98D6AyCYbUpy0Vbh8UlByU4gHf/haAb
 +nCiMSSrHopR07oGe0ppwdKfucN30qi+wdpUKtwWHCnFj2ElvsYTxldf1uPeD2eeZsU5
 zACG+2ARMkB32vCQ6GzNoEZhGfe22KMcLAbaHwEVHE3jl/GVl6pKt/LqWzBfAu6rosSL
 V7Cg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBYl2e1KMQQ4taO4WomqClFrrpRZc1bxQ7EstDh4juZP6jA4QtV/yAaiRj8L8kh1XGOJ72u4rf/Qln@nongnu.org
X-Gm-Message-State: AOJu0YwBUMaha3tqt9iekUGD0kVcpl3Saq5wufci92OuVHLbWtqdGxs5
 UHQJxd5aiXhtqOHoEhaiHTmb5emvjAzwrYZwdcULHkIRCjgqnqLZknzb
X-Gm-Gg: AR+sD13NXmcRW/MJ2aGV8ck4KS1frNOzbPw10W0PjZdzNL0mFwAybeY5toEf4H+Ez5x
 bhlTejR1cv8nCVFMW+dD3RXyHTSx0PHt1r3NjyyWWn9K3TDG+WTBpxU/WnDhrJoaFkMtUGnOZgZ
 2GEA0if7l9cscNn6j8SdHbx9lQ7TVIzR7DmOvProp7ZC8DaDGD6ysUe1mXmS1hVE0NoC476fk/C
 l8XnkNAAJVAJp1wU/a9eQZH8LyieW8dHCkfhkWW7FkApyAzrX02rG+hUx/Z47v2/2avfn+K+kAp
 wWcvNYZf9ALKjb2CMAyA9U1iAMtFJSneRBbiWAEE8OIzgrhJWlbo02dVYNroauBP34ZO1WTfztr
 Xyy48PgNSb86ziLUME15dZ0RPQ0wIr62u/N76roAbdUiC4/qKOkN+8PE3B7MZOuDrYN9Cv5Eeo7
 yHp+sg5o1QIuFB3mc7lNZ59jMrv5m/Xi9UoOyBd7GtHxAYjns7EcPNKjcHPnH8Ox90bvuBVsPmI
 RaXrGcgSdW8
X-Received: by 2002:a17:902:e746:b0:2d0:cc92:f7c2 with SMTP id
 d9443c01a7336-2d3b082b6aamr374365415ad.1.1787060174984; 
 Tue, 18 Aug 2026 06:36:14 -0700 (PDT)
Received: from [172.17.0.5] ([42.193.175.155])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d5d014d965sm8066845ad.35.2026.08.18.06.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 06:36:14 -0700 (PDT)
From: Simon Law <0860734llx@gmail.com>
Date: Tue, 18 Aug 2026 21:35:53 +0800
Subject: [PATCH v2 4/4] docs/system/riscv: document K230 CMU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-feat-k230-cmu-v2-4-57eadb98f40f@gmail.com>
References: <20260818-feat-k230-cmu-v2-0-57eadb98f40f@gmail.com>
In-Reply-To: <20260818-feat-k230-cmu-v2-0-57eadb98f40f@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 Chao Liu <chao.liu@processmission.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.16.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=0860734llx@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Simon Law <0860734llx@gmail.com>
---
 docs/system/riscv/k230.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/system/riscv/k230.rst b/docs/system/riscv/k230.rst
index cea8202e55..dd50b0bd2e 100644
--- a/docs/system/riscv/k230.rst
+++ b/docs/system/riscv/k230.rst
@@ -18,9 +18,31 @@ The ``k230`` machine supports the following devices:
 * 1 c908 cores (little core)
 * Core Local Interruptor (CLINT)
 * Platform-Level Interrupt Controller (PLIC)
+* Clock Management Unit (CMU)
 * 2 K230 Watchdog Timer
 * 5 UART
 
+Clock Management Unit
+---------------------
+
+The CMU model provides the register interface used by the K230 SDK U-Boot and
+the upstream Linux K230 clock driver. It implements the four PLL register
+blocks at ``0x91102000`` through ``0x9110203f`` and the defined sysclk
+registers in the ``0x91100000`` window, including the software-visible
+``SPI2AXI_CLK_DIV`` register at offset ``0x108``.
+
+The model implements reset values, writable and reserved bits, PLL control
+write-enable semantics, and write-one-to-trigger update operations. PLL lock
+and init completion are deterministic and immediate so that Linux clock probe
+does not depend on virtual time.
+
+The CMU does not propagate clock frequencies to QEMU devices or alter CPU
+execution speed. Peripheral reset, power control, and a guest-initiated K230
+system-reset backend are separate hardware blocks and are not modeled by the
+CMU. Consequently, a guest reboot requires the future K230 reset subsystem
+and matching OpenSBI reboot backend; QMP ``system_reset`` resets the CMU along
+with the rest of the machine.
+
 Boot options
 ------------
 The ``k230`` machine supports K230 SDK boot through M-mode U-Boot, which then

-- 
2.43.0


