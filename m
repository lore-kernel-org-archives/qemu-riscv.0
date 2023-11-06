Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1559C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:19:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxTg-0007aZ-70; Mon, 06 Nov 2023 06:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxTe-0007Yk-Eo
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxTa-0005J1-K3
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:06 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32dff08bbdbso3000718f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268940; x=1699873740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0/vWnFHt+cyNHMvzu2dssx7xYyn6IEpyeIo7MQjzWQ=;
 b=ATOHgHNsCkKb89JaOnwl8QH72EF8YZw+TFI1xlV8vgO5T92YyWphdlcIsoMHqk8+TU
 Vc8e/AXE44m4xrOGH8R0XBa4X29NorWbvjte/FwV44YiBOH26UxPjIl3yr+E8fvbhl5T
 4TdP6raxusiQSOxyVH4A+XuZgoMWD2bqPV0o0W1KTCAn/bhZX7v6O9rXyB7xkjFlDRt8
 iMP5QdazlChzlSDHosx9ur1yL3CVSXshPF/tPiFjLneC3UAax7BGhijhlzeiPx/w8Vmy
 TtAF6/94PMk1ZnD63cDtm9CLAtAB6p6QaUHEBgmZifi//6pe/lMdnWN0AnO7gJoCMLJi
 Bhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268940; x=1699873740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0/vWnFHt+cyNHMvzu2dssx7xYyn6IEpyeIo7MQjzWQ=;
 b=CTuCGytSAnH6pdrNtII0IFv9obqtmZa0VWV4HZACR2K/bc29n3yKk/iQdWpWdc6+Fd
 UNCkWvjAjyBFbTBXUBC0hVSjtm+0VUOR+xucBhsBY8Oa7O/nxdK1OOMcNKB1kIwnJaw4
 cM5qHNqy0mibAelUnJtRFRBxhTriU6Kp6DfoXeXBTpw5t63axODD4uVtofFPSESfg+VU
 B5wnQVKICeQy8TyyYeyNSor8zV+zjSn06+TdlFC40eq2b/e24b0Lv53MQEglOhW64/+m
 rtmim6f1TUxT/DhO3cf2UIts31v7nnDR2estjZbgEgjer+oZ3uEQXWzaX8GtvkTaZm5O
 DkPw==
X-Gm-Message-State: AOJu0Yxcgc44JYfCyFYoh0ud9iRP7yurSjyY16vyY6Mi58BVPhlTBtDW
 F4ilOfrDrkfvpWKgjCxu1ZS8uQ==
X-Google-Smtp-Source: AGHT+IFsbitm3bJThRshzHVNkwv0m7bE7yeAZoRxHUIurMBc1Abgxn0QnxImhW8tuDAE+j3RuaAyCQ==
X-Received: by 2002:a05:6000:1361:b0:32d:9b80:e2c6 with SMTP id
 q1-20020a056000136100b0032d9b80e2c6mr22417154wrz.26.1699268940275; 
 Mon, 06 Nov 2023 03:09:00 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 z18-20020adfec92000000b0032da8fb0d05sm9132494wrn.110.2023.11.06.03.08.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:08:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Fiona Ebner <f.ebner@proxmox.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 simon.rowe@nutanix.com, John Snow <jsnow@redhat.com>
Subject: [PULL 47/60] hw/ide: reset: cancel async DMA operation before
 resetting state
Date: Mon,  6 Nov 2023 12:03:19 +0100
Message-ID: <20231106110336.358-48-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Fiona Ebner <f.ebner@proxmox.com>

If there is a pending DMA operation during ide_bus_reset(), the fact
that the IDEState is already reset before the operation is canceled
can be problematic. In particular, ide_dma_cb() might be called and
then use the reset IDEState which contains the signature after the
reset. When used to construct the IO operation this leads to
ide_get_sector() returning 0 and nsector being 1. This is particularly
bad, because a write command will thus destroy the first sector which
often contains a partition table or similar.

Traces showing the unsolicited write happening with IDEState
0x5595af6949d0 being used after reset:

> ahci_port_write ahci(0x5595af6923f0)[0]: port write [reg:PxSCTL] @ 0x2c: 0x00000300
> ahci_reset_port ahci(0x5595af6923f0)[0]: reset port
> ide_reset IDEstate 0x5595af6949d0
> ide_reset IDEstate 0x5595af694da8
> ide_bus_reset_aio aio_cancel
> dma_aio_cancel dbs=0x7f64600089a0
> dma_blk_cb dbs=0x7f64600089a0 ret=0
> dma_complete dbs=0x7f64600089a0 ret=0 cb=0x5595acd40b30
> ahci_populate_sglist ahci(0x5595af6923f0)[0]
> ahci_dma_prepare_buf ahci(0x5595af6923f0)[0]: prepare buf limit=512 prepared=512
> ide_dma_cb IDEState 0x5595af6949d0; sector_num=0 n=1 cmd=DMA WRITE
> dma_blk_io dbs=0x7f6420802010 bs=0x5595ae2c6c30 offset=0 to_dev=1
> dma_blk_cb dbs=0x7f6420802010 ret=0

> (gdb) p *qiov
> $11 = {iov = 0x7f647c76d840, niov = 1, {{nalloc = 1, local_iov = {iov_base = 0x0,
>       iov_len = 512}}, {__pad = "\001\000\000\000\000\000\000\000\000\000\000",
>       size = 512}}}
> (gdb) bt
> #0  blk_aio_pwritev (blk=0x5595ae2c6c30, offset=0, qiov=0x7f6420802070, flags=0,
>     cb=0x5595ace6f0b0 <dma_blk_cb>, opaque=0x7f6420802010)
>     at ../block/block-backend.c:1682
> #1  0x00005595ace6f185 in dma_blk_cb (opaque=0x7f6420802010, ret=<optimized out>)
>     at ../softmmu/dma-helpers.c:179
> #2  0x00005595ace6f778 in dma_blk_io (ctx=0x5595ae0609f0,
>     sg=sg@entry=0x5595af694d00, offset=offset@entry=0, align=align@entry=512,
>     io_func=io_func@entry=0x5595ace6ee30 <dma_blk_write_io_func>,
>     io_func_opaque=io_func_opaque@entry=0x5595ae2c6c30,
>     cb=0x5595acd40b30 <ide_dma_cb>, opaque=0x5595af6949d0,
>     dir=DMA_DIRECTION_TO_DEVICE) at ../softmmu/dma-helpers.c:244
> #3  0x00005595ace6f90a in dma_blk_write (blk=0x5595ae2c6c30,
>     sg=sg@entry=0x5595af694d00, offset=offset@entry=0, align=align@entry=512,
>     cb=cb@entry=0x5595acd40b30 <ide_dma_cb>, opaque=opaque@entry=0x5595af6949d0)
>     at ../softmmu/dma-helpers.c:280
> #4  0x00005595acd40e18 in ide_dma_cb (opaque=0x5595af6949d0, ret=<optimized out>)
>     at ../hw/ide/core.c:953
> #5  0x00005595ace6f319 in dma_complete (ret=0, dbs=0x7f64600089a0)
>     at ../softmmu/dma-helpers.c:107
> #6  dma_blk_cb (opaque=0x7f64600089a0, ret=0) at ../softmmu/dma-helpers.c:127
> #7  0x00005595ad12227d in blk_aio_complete (acb=0x7f6460005b10)
>     at ../block/block-backend.c:1527
> #8  blk_aio_complete (acb=0x7f6460005b10) at ../block/block-backend.c:1524
> #9  blk_aio_write_entry (opaque=0x7f6460005b10) at ../block/block-backend.c:1594
> #10 0x00005595ad258cfb in coroutine_trampoline (i0=<optimized out>,
>     i1=<optimized out>) at ../util/coroutine-ucontext.c:177

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: simon.rowe@nutanix.com
Message-ID: <20230906130922.142845-1-f.ebner@proxmox.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index b5e0dcd29b..63ba665f3d 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2515,19 +2515,19 @@ static void ide_dummy_transfer_stop(IDEState *s)
 
 void ide_bus_reset(IDEBus *bus)
 {
-    bus->unit = 0;
-    bus->cmd = 0;
-    ide_reset(&bus->ifs[0]);
-    ide_reset(&bus->ifs[1]);
-    ide_clear_hob(bus);
-
-    /* pending async DMA */
+    /* pending async DMA - needs the IDEState before it is reset */
     if (bus->dma->aiocb) {
         trace_ide_bus_reset_aio();
         blk_aio_cancel(bus->dma->aiocb);
         bus->dma->aiocb = NULL;
     }
 
+    bus->unit = 0;
+    bus->cmd = 0;
+    ide_reset(&bus->ifs[0]);
+    ide_reset(&bus->ifs[1]);
+    ide_clear_hob(bus);
+
     /* reset dma provider too */
     if (bus->dma->ops->reset) {
         bus->dma->ops->reset(bus->dma);
-- 
2.41.0


