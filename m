Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA81CCF9E8
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 16:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1stV2q-0006PM-Ar; Wed, 25 Sep 2024 12:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1stV2n-0006LN-M4
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2024 12:39:13 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1stV2m-0005Ty-4Z
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2024 12:39:13 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so6278866b.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Sep 2024 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1727282350; x=1727887150; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Z435ziM7/tTwXvzSmTfZy2EC4XDAX34xouZ7aIOlIs=;
 b=LwY0OXgteTGCTGimU5Js2JGUcwhWKj38pGphZ/qZJ7iHVz1GAEPBS5qGdq4N4PxkCQ
 PCHk+2f0x90FYwCStR9iogfoiMOnM3qpFzGXgUDG1WsL4t6IUmOmTsOVnHMehBFCUW5c
 f6qYsqzxo9ImzdDl4K9uBXcSdWTBYRmPJWNBc/ssof9YxzVxW6I8xjFdzvEybjdceKkI
 xRwpLfu2aEvO/omXweedMEY3zIcG0SFIIumqYK29ScV3b9Rh8RhBr65dP2dXbIdoStiM
 F8pnqBFkWjERGpcuWWSP1PLKVi2/nX2YRUe3Z4DQo0/T1gq3s7Km9i7vIeUckqchYq39
 2gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727282350; x=1727887150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Z435ziM7/tTwXvzSmTfZy2EC4XDAX34xouZ7aIOlIs=;
 b=fIId/z4i8381XstpuxIBwlzT7cFKx79N7nzSuCuvh1+A4xIoxKj6FoYmJYzmqnlSrV
 J0RSC/qOrw1vQj71n3aEyN0lTQrsusTy2t1mHuzo9OPQab6MMewsIscKOZXk5lKaeev8
 Ogf66gztFc1g+VDKoCxHH7Q5OogWJmDWNIAbmc8M4uLyW5kZ9dZOMCEY6pXgv1EdFhdk
 a4T2wbakK+S81O8Rk4a9GisBtBp4gFyJK42hmOSA0a9UqGrcQuzASCyXC5pO0iQSPXsb
 5ftTt6B/0MxEjfnsjINVrDUDTg568+Ui39AeBtWN+K83Qz0pRyWWNNMPgEM9DqdXAyOf
 D5PQ==
X-Gm-Message-State: AOJu0Yw8OFvx6y5XU8YtUUB5yisgbpx6q6v2pTzyE+J0YyEpsxEODr8E
 yQXGmjtHvxmd+BauiokwtiaqMsrHW+xzD6Uav3cF9wAlXo10ZAlh6afjJxzpuL904BqAeCgeCdz
 h
X-Google-Smtp-Source: AGHT+IERX02swcPEoiblQuuic3gAEeqmOswgPsVWcbmUh+C8ghu3DeH4LxWkSEre3wbkr5Qvqi67YQ==
X-Received: by 2002:a17:907:9487:b0:a7a:8586:d36b with SMTP id
 a640c23a62f3a-a93a03305a3mr326532566b.3.1727282349900; 
 Wed, 25 Sep 2024 09:39:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f4fb94sm228009766b.58.2024.09.25.09.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 09:39:09 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com
Subject: [PATCH] hw/riscv/virt: Comment absence of #msi-cells
Date: Wed, 25 Sep 2024 18:39:09 +0200
Message-ID: <20240925163908.215456-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

commit 6df664f87c73 ("Revert "hw/riscv/virt.c: imsics DT: add
'#msi-cells'"") removed #msi-cells. Now that we have a Linux
commit to reference add a comment explaining why it was removed
to avoid it getting added back due to DT validation failures.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index cef41c150aaf..4fd9c0edf038 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -552,6 +552,16 @@ static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
                           FDT_IMSIC_INT_CELLS);
     qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller", NULL, 0);
+    /*
+     * Per the DT binding, we should also add #msi-cells with a value of zero.
+     * But, Linux which does not include commit db8e81132cf0 ("of/irq: Support
+     * #msi-cells=<0> in of_msi_get_domain") does not properly handle #msi-cells
+     * with a value of zero. For this reason, the property has intentionally
+     * been left out. It's harmless to not add it since the absence of the
+     * property and a value of zero for the property mean the same thing.
+     * However, since the DT binding requires the property, DT validation may
+     * fail.
+     */
     qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
                      imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
-- 
2.46.0


