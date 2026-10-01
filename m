Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4799CA5FC1
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 03:18:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xC7Ix-0005sx-KH; Wed, 30 Sep 2026 23:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xC7Iv-0005rv-DD
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 23:17:53 -0400
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xC7It-000797-SX
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 23:17:53 -0400
Received: by mail-pj2-x2b.google.com with SMTP id
 98e67ed59e1d1-3a4a98a79b8so323804a91.2
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 20:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790824671; x=1791429471; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+TTn21w83ryZAXqA/4mfJtd7RuJ4wR4uT9J5sfKbEiE=;
 b=C2pocef/5wO9zkxmf5kv6NXcCwMk7WHIX1YVUAAGvvJ+A5kQqgj7x6+NUGJqeGcR2+
 3qzkihkZ2T2ABS6t3M2rjgj0mIjgxtaGVc+0H/iOxvvtXVk2rkTKzNi41jUcbne6f3KJ
 w8mMg3mwH3T7SXvVPxNp+B9r8PAn2KqpepJ3p5jf86MBiZNYbcZzqRDLOtP/HI0PgIEx
 fVL84dSuNjtPP1BjandFLwqjVNzuHmxsKaCD8ivF86rCmKIs8ygPjPIvILis8g8zdoeT
 5EgCF2M6SOUURZD1A3qWYq7AkvMGMvrsh5p4zPKk6IynJKDMCoTbQVL0/Ox6U4RZ/0l5
 X46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790824671; x=1791429471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+TTn21w83ryZAXqA/4mfJtd7RuJ4wR4uT9J5sfKbEiE=;
 b=AOu3gqDgLdTNjCAbWnqAnSeS123riXgBXKkRF4qOGg5kMCVHbzSYnjjHVi9Pb0CZAx
 D4aj9rA3I2W7bILvRAD/8cP3O5wgp4pl7U4u0bI7GxWdySIiVzU1zWm11zLAfv7bsuuQ
 7JIF8BvDQsYCE0YaXCxMswMBW2rCHipU/4qPXKk46ygblKw/7GXWdHSPBHNgakxHNgAj
 4adYQBTp/rH5Kz/BTcua9+EMHRhAx13O3UTvY32qGFQiW+0DuIjedboeelItuHPR0CfX
 H0uYSDcYLEGwpS1xDzdXDWyr53hDyLbFhFWL7HtqANF6ayBKnxry5PG9UBNHE/p35NLk
 WERg==
X-Forwarded-Encrypted: i=1;
 AKwUvByK3eRrk7UX9dU1JkOVhXRFLk6C9i2v6vRnDpIfEWtau6C485IxCFcmQEul2n407VcNYKsqC1S4gy9K@nongnu.org
X-Gm-Message-State: AFq9FYJOVD52HnjhgyUBvvoGMfG8udZML0zUmA0FFyrw0Ds/9Y6fim87
 BErfS2lMcUOd3vNw8ORQQZcvvlcicJVEy+W/UGYqZ/8eixfDBcgPDLzVmlGsM7yiiEY=
X-Gm-Gg: AYBFou1lMoCRbmpMAKvTU6Ikhz+AmHio/RniNZvwrSrnpD5voQEBFu1kRCfgFAQFw4Y
 3B5nHkP2t6cRfNssaEgZ/SqzqiMMuPJSv6ofaGzgQ5G0F6FgEqgSBZ4FwTIg2QLzuJpHtrMeiJv
 /0QskLk+W9/0VSM0ICAmMz2rDw+7NZyMlNZdC4Y+TKJ5oBgtiyG1ywS403/KgxA32LSvy6MTrg3
 SKr41yJsH6y2R6wpp61mx0awXWWexditmGe2caGzsTQnC6YoiI+s21N0NLRPE/e7txdCQIGtzDB
 1LdoWga/oqsVNJ1ZIVdurxiSdf+syVVlne03zKx4AGfj5xe8ZG0Ozdb6UaibIi7IixwKHLEHZeH
 WInMDzy7Y+Vv/zqlC0pa5Za6ZsSvJTBmOnSOXvrZ6yE/1XUQ7XPeLYo+yc6FBoHetNsyTbSoUCt
 TihO5NmQZdlJecrs+qGOodeB1M1No6npECdZ9Kbl1+CT4eJrTXqcKUikXrhoiKFUYDqnMDS0jUE
 hotsJGu5PrEhG784Rm+D9Php8FT2GniUlZu4QmDPh5dRuA=
X-Received: by 2002:a17:90a:da8b:b0:3a4:9fcd:6189 with SMTP id
 98e67ed59e1d1-3a4d11c7652mr4861455a91.2.1790824670652; 
 Wed, 30 Sep 2026 20:17:50 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a4f43f833asm2255552a91.6.2026.09.30.20.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 20:17:50 -0700 (PDT)
From: 'Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>
Subject: [PATCH v2 4/4] docs/atlantis: Update Atlantis UART documentation
Date: Thu,  1 Oct 2026 13:17:20 +1000
Message-ID: <20261001031720.2334056-5-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001031720.2334056-1-portias@oss.tenstorrent.com>
References: <20261001031720.2334056-1-portias@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::2b;
 envelope-from=portias@tenstorrent.com; helo=mail-pj2-x2b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: Portia Stephens <portias@oss.tenstorrent.com>

Add documentation describing how to use the console machine property to
control the console.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 docs/system/riscv/tt_atlantis.rst | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_atlantis.rst
index 1f2880d617..e8176d96e8 100644
--- a/docs/system/riscv/tt_atlantis.rst
+++ b/docs/system/riscv/tt_atlantis.rst
@@ -13,7 +13,21 @@ tt-atlantis QEMU model features
 
 * 8-core Ascalon-X CPU Cluster
 * RISC-V compliant Advanced Interrupt Architecture
-* 16550A compatible UART
+* DW8250 compatible UART x5
+
+Boot options
+----------------
+
+ * ``console`` to change the UART which is on the first serial interface.
+   Most users will be intersted in the Ascalon boot console ``UART1`` but
+   Ascalon has 5 UARTs and this may not always be the case. The RCPU console
+   is on ``UART0``.
+
+To change the serial console and use device ``UART3``
+
+.. code-block:: bash
+
+  -M tt-atlantis,console=3
 
 Known limitations
 -----------------
@@ -24,9 +38,6 @@ real platform. Notably:
 * There is no PCI host bridge, so virtio-pci devices cannot be
   attached. Boots that need block storage must use ``-initrd`` with
   an initramfs.
-* The DesignWare UART is modelled with QEMU's ns16550-compatible
-  ``serial_mm`` device; DesignWare-specific registers beyond that
-  set return 0.
 
 Supported software
 ------------------
-- 
2.43.0


