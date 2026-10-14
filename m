Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43DBCC6B19
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 03:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGpbN-0001ev-Nd; Tue, 13 Oct 2026 23:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xGpbE-0001Xb-WF
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 23:24:17 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xGpbB-0000CU-M9
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 23:24:16 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3ac6008c914so73209a91.3
 for <qemu-riscv@nongnu.org>; Tue, 13 Oct 2026 20:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1791948251; x=1792553051; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5Yrq0zmhnCQ6jmfiCd+0Py/eNG5Woc0hw6n8wML7KAM=;
 b=QsctJxzm9L6M0oLnJQWuQOLwBUvuP/UhWk9QkFstG4EHPNSMYfTvR3BmZfen185aGl
 BbICq3bQ0mNEwmQozimiFqTDTOurqkA08koXEt5hNvXM6W9gDgjQQZBGbctoXJm5uMKe
 gKUnPJ5WuQKpMfJFHMAHLrLpFaFI82cy8qj+9pYhqAdLoxi08KFMI0Yd5hlC8gdZIzrZ
 3EBOpHONYzV6ljquRFca85gqPgPmfYYVB6zGf8CiYEEfiXUK4C1DfzHojycfeBBX2Jir
 wc+8KzlLLrm5BjGbD9MlPOEMxWytpmtXUuq+FHzIHIeZyF2gtsUHvTt+xCwQDx7vSYrr
 7yoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791948251; x=1792553051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5Yrq0zmhnCQ6jmfiCd+0Py/eNG5Woc0hw6n8wML7KAM=;
 b=RfAOpPW5g6f2d6jHYhQwBL3Ksf5mOp6YmxPkcTGeGre5dHGp3tjEQDxz8E2lOrEyXS
 yxEp9cerj+WNJQBMhHST0i8VyAhBto35y7tk3pQKmu+N1bybp6ZAn7wmRu1bl1LlUAnX
 bMUq2Ka3Ee0/9XGOIHsqdGkQLNDQ/6a6P/a8YoyumlefZzi0deYmln4f0ERQXAj6wDmM
 TMXfJXSK0+QaJPXPgciT3AH/tgoWeWOJVUC4Oi36MiQj+EKziQ4wDjEWwq8iqmQq3Ye9
 bz8rh2GT2Pli9m8WP63tneM88wizLGCvEYuToYMZfguliwFTfLqY0bE1uG0vgeVauVP0
 T3DQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByl6yvXzJcSBRmUm+u3codTx/Rcv7djLE/mKK34gUxKyFxiUgXK9qSGzLIpqFrAo9WyJTyucXkw4qLD@nongnu.org
X-Gm-Message-State: AFq9FYImJHUlEnJKYAnaZIWuIB4/4e6EuMaTAsKLSSLZ4DdurmwDeyaE
 CIYDhI1x3LF3YjxBdgGw7ZUICCb+fEBv28dE9+rRnwoPswKdmNlqk17YMrd5r70DYQE=
X-Gm-Gg: AYBFou0t+YeM1pbH65CnOTuI4eXKJYKSvYP9fnLdVqN2+LdFFWPzu+FhID/5MTcAfsa
 EP749Uk5I2t3IjyzOqpFNakrWc4tuuBWwnMOmXHFcM4foR26DmUxqRMktlyieyfmjmOz39vJLjZ
 EyuTxIsuHvGjNY62qxjzVWAJM5jcIsLrFPg7X0XSaIGRdaTxYK2kl0z8aww7KrYu5rCGFq878M3
 /9ZNCMeW7bkhOKdZJ8VcQA/Hd00m7h7UkK/jiJnpynkev9FxHptaQR/HtRwZUbuw4qqyf9BWzth
 Xt4HzLjLT1LLyAIooY/cMQjM73drXOivEy94bFn9J7LoKYM3ui00POaremBcazhWeShz890v8Dd
 tJ+L2yCO5VpuTBBX9bdJiCv/AtPf7ACpc5oOdWJcInVzD1prPl3kYXx7Nu/dntf39fszZzFXwwQ
 WUlLBGr/frdltwQJeau1/FKWaxMtFOaVsBQkbzaIT1XgDTSSl79uz5Jc6rjjgE0S4ncEG44fnRF
 MzDKi2jLONE+pXXIaabmYsrqaVltFM0ZMtOKRbL0pfGLaQ=
X-Received: by 2002:a17:90b:3145:b0:3a6:f7be:fee6 with SMTP id
 98e67ed59e1d1-3ab3a346e9dmr19919437a91.1.1791948251551; 
 Tue, 13 Oct 2026 20:24:11 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac6069ca15sm2211261a91.11.2026.10.13.20.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 20:24:11 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Ellerman <mpe@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v4 3/3] docs/atlantis: Update Atlantis UART documentation
Date: Wed, 14 Oct 2026 13:23:46 +1000
Message-ID: <20261014032346.732257-4-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014032346.732257-1-portias@oss.tenstorrent.com>
References: <20261014032346.732257-1-portias@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Update Atlantis documentation to describe the DesignWare UART used.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 docs/system/riscv/tt_atlantis.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_atlantis.rst
index 1f2880d617..0150140a39 100644
--- a/docs/system/riscv/tt_atlantis.rst
+++ b/docs/system/riscv/tt_atlantis.rst
@@ -13,7 +13,7 @@ tt-atlantis QEMU model features
 
 * 8-core Ascalon-X CPU Cluster
 * RISC-V compliant Advanced Interrupt Architecture
-* 16550A compatible UART
+* DW8250 compatible UART x5
 
 Known limitations
 -----------------
@@ -24,9 +24,8 @@ real platform. Notably:
 * There is no PCI host bridge, so virtio-pci devices cannot be
   attached. Boots that need block storage must use ``-initrd`` with
   an initramfs.
-* The DesignWare UART is modelled with QEMU's ns16550-compatible
-  ``serial_mm`` device; DesignWare-specific registers beyond that
-  set return 0.
+* The Atlantis platform has 5 UARTs but only ``UART1`` is currently exposed
+  on the command line serial interface. ``UART1`` is the Ascalon console.
 
 Supported software
 ------------------
-- 
2.43.0


