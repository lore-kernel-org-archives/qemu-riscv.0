Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC55CC6B2D
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 00:30:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xH9LX-0001fH-61; Wed, 14 Oct 2026 20:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xH9LT-0001eO-WC
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 20:29:20 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xH9LR-0000xN-AK
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 20:29:18 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-3ac7a053626so128372a91.0
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 17:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1792024156; x=1792628956; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EgVncG2NAYs4I+Cx+kp7rFgEZbzHj90F8O/5aLpub/I=;
 b=U4GDIRUDTzeFfEbVUmesqLXaqS/yPGZ2GyFj0+2Tc3oftBPsTwQoejN/IZUWqkj5kc
 ZHORmrflhhbDR3GoyJ36dRDJiaghQj20NewXZEujYOLbFlu5QoaaAMwAblQ1L/kmo+Dq
 aBQYHz0IGpxwxEhtKFEtgzy/aWjwGmGROhVIXzIa5ruURWkpgweuwaGUqbEFk8xGiYqV
 us+RtNNQ12vmoS1JQH90wBP3ajHdkNDXK/8b8v+zIMmNolaLB/gR1H+H062UVeWxQ4fh
 UIl+t+f9KPjmmwPx2jMRTxpX5i0O2cm5LWCatv8O93Jq4Q6qnxsQMw9nWtw3sP0Q5ks+
 bD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792024156; x=1792628956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EgVncG2NAYs4I+Cx+kp7rFgEZbzHj90F8O/5aLpub/I=;
 b=Tkds/4gVYv+PKn3vMvGysCgKFUztjRATlGJ4K5Gq+/pg/k0WhZcXRVNSv/tAV1wta7
 CLKKkJyTN6HDyCT2MFD8IrzWh+0BeSWHgVJW5VtdXSShy+Zt2PN4naM3wHKJywdF0SDT
 yy/+T7d5o/edKphB8o8XeF0Es15nLHFfOTdKqZEwlEU9EyfwWvqR89iAwxatw+i1e4ff
 gtUtTbtHTF70Z9WAEJmu/A/3NDt8ZIjQoI8DzbCxO0tSxvBE0YRL7a7cpaIJCvI8mF6+
 GKq+9SYp4k6z80DZipIpmVkhmfZRce0CQ19g3NMoWSGmLSyJrKGp3FlUg0milA3AN3xE
 UJjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwoQxmN1nCh+Ny1dsTNKuUMtAHz8hv+zZKPyWiSMW2xNbfH7imqhhVS1sxyc7yVht3ffK46fKp2Fxq+@nongnu.org
X-Gm-Message-State: AFq9FYK8LZsF7TaZTz7DQttEMfTAuzf1gUDbfls8tZ/fyMkg424ZEOlo
 ko1jIUnbAK41h0MQoMi7nRwkel54IpupIHsfaTEHNG4+nLtuOSisIJvclVIliyA9jCw=
X-Gm-Gg: AYBFou1g5o9WmuMsn6rQV6spbU6tE/D0TWztcbyId0csFL3eH1GN71jkF8NQi5dMLyL
 qd5nGGErEeKee8Ncqcsbh4Kuca/HPzcDqoUyOMUdo9DfIwMIuNdHp045BjLKKHDQTnYIca2H4f0
 GJXQICAHlp5seqpKh9y5BpLwEjWNgxNdp+WxDBZT2FSjHvXVHUfGQFyWhbTgyNcosk3NFciit0P
 zJCFf2LQsCGPygUYMhM/kWcUyJ/WwRArJlczSI3gG7wcnQ1K4csKaRQeqO2q6MCL3OBXizovA/F
 0IvrHQEqRHu1boQcDPKeztKCb9oMSSnF5tw1Bw6aWDZMfda5AmkG61sQpUK0SP9xXR53InO9KN1
 jYUFNbkDwBmsV9wnL5pXX5G9kCQYGFacVmlX3uANJ5Wl4MMnMOMkGzBhq6oaqjSpE1eGaYYe+8K
 ulOj5OfNCK/ZLVp1OLnVJj1gp9fMMUU7NYaMZslDuA1Yq15sx26a45d+yqr9TtIbRAtDZQjAWlP
 J5P5FiniF8eNvvC8mWvacUpi0urRHqM0BcO9JUVLPv73ec=
X-Received: by 2002:a17:90a:d44d:b0:3a0:c162:51af with SMTP id
 98e67ed59e1d1-3ab39fed8b6mr23063896a91.0.1792024155483; 
 Wed, 14 Oct 2026 17:29:15 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac92a49d7bsm795730a91.0.2026.10.14.17.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 17:29:15 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 Michael Ellerman <mpe@kernel.org>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 3/3] docs/atlantis: Update Atlantis UART documentation
Date: Thu, 15 Oct 2026 10:28:49 +1000
Message-ID: <20261015002849.1640109-4-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015002849.1640109-1-portias@oss.tenstorrent.com>
References: <20261015002849.1640109-1-portias@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/tt_atlantis.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_atlantis.rst
index 539c22354f..d94d064f4f 100644
--- a/docs/system/riscv/tt_atlantis.rst
+++ b/docs/system/riscv/tt_atlantis.rst
@@ -13,7 +13,7 @@ tt-atlantis QEMU model features
 
 * 8-core Ascalon-X CPU Cluster
 * RISC-V compliant Advanced Interrupt Architecture
-* 16550A compatible UART
+* DW8250 compatible UART x5
 * 4 PRCMs (Clock and Reset Controllers)
 
 Known limitations
@@ -25,9 +25,8 @@ real platform. Notably:
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


