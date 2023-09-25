Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E534CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 04:31:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkdF5-0002qH-77; Mon, 25 Sep 2023 00:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdF3-0002pr-Of; Mon, 25 Sep 2023 00:30:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdF2-0007Vn-97; Mon, 25 Sep 2023 00:30:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-27763d36661so391880a91.3; 
 Sun, 24 Sep 2023 21:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695616238; x=1696221038; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNNI0O3SzKHU7vUAvRWqz/iywCW4aWcpOWziFo+dg/k=;
 b=fo+tZC+N3bkmMktvaNf8zyf0oyxmBCVJ6Bgnqb3E8KYnWG6hhf/0l999xm0uIFcBRt
 Xis9Y19fdvJI80eBSy9Ec9HnVDbGweejqvXtsWlhNnGTzpxjj8tfWFMiHb8intRAjVQI
 FF/ooch+mpdDdd1oBs6Kmcwrf3XjZC+6ftAsa+MZej1fjxA+Aj0ELgAOUIwxxxaTIwTU
 EtHLD1DAhElBOqWvQQ2dyeuR5e0XE3CRmWRx+zILklgysxyLbFDH8giuPX2zNXUeCB3h
 7LmTki238h9sOUz5viR9jDDrmtUEliFggTQscVxJTjApaJ0wwlExcHiM/CKP5VboxdLo
 mB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695616238; x=1696221038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNNI0O3SzKHU7vUAvRWqz/iywCW4aWcpOWziFo+dg/k=;
 b=McaE2xOtGDU+kApDCNdp6W8MvhM0DjZxnyzWc9EasqPGA9zVGY9RCOl9dIfB6qCD9I
 OeUoRHNJ1HEWGPt0p/Qu0q6zkUXiM5WJ+9SmPKkfIFWMc012NvsY5O2CNFMQ303WSTzH
 xn3GOCVFCE3yO7IRkOtKnkFCezU4LAs9F8bPhujbtQCG3ocZ1y2XJxxEqN+RAcZIS+ki
 TLfAuH4o3LGhzrEfhnPolml2P46c6Gq53vaNdz5pLtfN1t4JMxRT8KgFvszuhhQ9byr0
 BRWxDg0H2Ems0gkM4Ql7hgwAc5keoE9rzMkz3+UtvGUGzUHXpAZ88wmjL3K5oKU4O5kA
 ROqQ==
X-Gm-Message-State: AOJu0Yxut3cLANhZbNRZ+BJE+foPjmQzyDs9chdSvp/lGhu0dS2PDBjU
 BXuIjIlpBAfD6rT1oAVSN/8=
X-Google-Smtp-Source: AGHT+IE4cBlFMyevsXFhg/gEMPofdWP6CQjh2d5+cXfcRa03uoYaD3laf9LX2mkQ7bqnT6Ip8lzZQw==
X-Received: by 2002:a17:90a:4e4e:b0:268:f987:305f with SMTP id
 t14-20020a17090a4e4e00b00268f987305fmr5222831pjl.46.1695616238397; 
 Sun, 24 Sep 2023 21:30:38 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a17090a134e00b00276fef82025sm6002161pjf.35.2023.09.24.21.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 21:30:37 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: david@gibson.dropbear.id.au, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair.francis@wdc.com,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, palmer@dabbelt.com,
 alistair23@gmail.com, dbarboza@ventanamicro.com,
 Alistair Francis <Alistair.Francis@wdc.com>, liweiwei@iscas.ac.cn,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/4] hw/riscv: opentitan: Fixup local variables shadowing
Date: Mon, 25 Sep 2023 14:30:20 +1000
Message-ID: <20230925043023.71448-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925043023.71448-1-alistair.francis@wdc.com>
References: <20230925043023.71448-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 6a2fcc4ade..436503f1ba 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -227,7 +227,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                                            IRQ_M_TIMER));
 
     /* SPI-Hosts */
-    for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
+    for (i = 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
         dev = DEVICE(&(s->spi_host[i]));
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi_host[i]), errp)) {
             return;
-- 
2.41.0


