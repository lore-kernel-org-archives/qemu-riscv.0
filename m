Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A322CC61DBE
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 22:07:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLlG-0005BS-9x; Wed, 26 Aug 2026 18:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLlF-0005BK-OR
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:06:21 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLlD-0004jV-FM
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:06:21 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2d72ae08fa1so596855ad.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 15:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787781978; x=1788386778; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5s/MHm9pZEMHdIBltCKmL5mdgHKUgYmEicbJN9o3MIY=;
 b=kPnJWTtrSOWXHBUK3CcFj+Y477DBb+O39wVwTevmwj6zK5r6iU11X/9tzcqIAT53AF
 pNYJqn5yEc/rE8ycUGRRV+g3eHK+PyPixbRgJ6VHCuT24A7/4rRnxgBXcnDuEtvfUK5E
 7gpaMzrSJjm9cwlXue98YOfe3S3qHhQv0QJzMH5REserP9csJGhrP03BYxuKS6g9yTcl
 iPoNk5xpb0IO9qDRR+IHU/5h+L5LJiVy0ZJbrL/6cj6zaNvkMvVEvxfuCO5M9lsZEg5e
 9jQ/OzFaMlEvqDv3ho0IqsnEXxnBz1m7EBEliCIoVRHHNR2MViyVBcLYIz6ifQyQ+Ihb
 Xz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787781978; x=1788386778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5s/MHm9pZEMHdIBltCKmL5mdgHKUgYmEicbJN9o3MIY=;
 b=Lc4G6tg/DUmW/PXF/1aGhPYP84IO2HA442I6sx/m5Q8COcqHNVnL97s6iQAzSnYf8M
 Grq4/0YsiU1oPo0n7jxxqOn6zTr1LrQuZjxYwi8VyJjrCqSuni2F1WKzTgdagrc57i7d
 CHhyQgySbsn56RAMJY49ShwVS35octhylf0Vf2zLeJVfE59u/y+DtoO/8K10X31uWCkm
 MfXACSVkxzQy2NNIMEzElDNzEaSpwNnpIo3ml0oSPfbA9U+Y4C4qYmY9GgqB84XWpdGJ
 fZnztKuJCkphB1hVCjbXchbmHRHa9TacsRrJC/F1hZUgFxe6CvWjUQE9Jce/SnLt9+rj
 p3xA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpEPKid5B5tYyEckxrIpZH7TCJK2PDp819+nn64TJlNLhSk5rrvH/Wtvb4sCGXV1y6jf4S2dj8fKZ3q@nongnu.org
X-Gm-Message-State: AFuF++kCOJG24ZR7uyf1xilb4MFnksGBHneFDE23rF+TvIoeVswa1x+B
 n3UEq8fmKOfxS2PpJfax8F9lr2dg7DGYZpPN1GvLw8zL2xsjO+a9uFqx
X-Gm-Gg: AR+sD13QiLFZdR4H6pjPlPhkaxkda/RXx3LKn1G3ErNS8S73Ypi5QjOSd4lK3g9uN7l
 eisPKOI1Pyfcd4BWXx5B2RDBhFsXVW7Bv6WJDbLAXCyyYfGj0ZSerT/l3AebPzJDaT8qSMBIbgQ
 lEE2RHhkbqeyn3F7mu0fO0m12Cx7HE+hwZP3J7/HiIPnUSf81bOHKLNochPg33tuJtuXPvdIQLE
 jJmUUHiKFDlNVpnMoRbXF8g5+ywKw7js/2kUudZ02yz6CB5EMrpXOyZrugLfgonkQhAcuH6rJFv
 3+F0E1taVoyY5551QzdpyoaXmPqjHuQUPRjS7S0n1wGqgj8adMEHzmsJo0IKxGmmz4V/UnCliK4
 LOSbPn8KI2p7M9HvpHgMC+ZloXFDt1xGIa4GUOLdSLweOXfF5n5W6MaMhzh9oRlz85HiftZmhHi
 HFNQzFdCdqqfaXRglAR4iTEEvgBdBA+3GicqX3Sr2F1duH+AUyAN9D7XjP2ssSUfGwZNmo4QNCc
 wETk1b9/fYw32cI9AyJW7oXylYvVToBSCHDMMh2AUnxRfst0hSbdu+bY1WLYq1cmcZ+M8+i7EAM
 2wYuY2n/xcQ114wVZ9Jw
X-Received: by 2002:a17:90b:4d0d:b0:396:5cdc:4bea with SMTP id
 98e67ed59e1d1-3966d457015mr16838564a91.5.1787781978020; 
 Wed, 26 Aug 2026 15:06:18 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39668a573a1sm5789956a91.14.2026.08.26.15.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 15:06:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 06/16] hw/riscv/cps: Map interrupt controllers in SoC container
Date: Thu, 27 Aug 2026 07:35:16 +0930
Message-ID: <20260826220528.54516-7-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826220528.54516-1-joel@jms.id.au>
References: <20260826220528.54516-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The CPS device maps some devices into a container region, but the
ACLINT and APLIC were mapped directly to system_memory.

Pass the container memory region to the interrupt controller helpers so
all CPS devices live in the container. The location of devices in memory
for the boston-aia machine is unchanged.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/cps.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/cps.c b/hw/riscv/cps.c
index d2fd9638a08d..21daaf4943d8 100644
--- a/hw/riscv/cps.c
+++ b/hw/riscv/cps.c
@@ -135,7 +135,7 @@ static void riscv_cps_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < num_of_clusters; i++) {
         uint64_t cm_base = GLOBAL_CM_BASE + (CM_SIZE * i);
         uint32_t hartid_base = i << MHARTID_CLUSTER_SHIFT;
-        s->aplic = riscv_aplic_create(get_system_memory(),
+        s->aplic = riscv_aplic_create(&s->container,
                                       cm_base + AIA_PLIC_M_OFFSET,
                                       AIA_PLIC_M_SIZE,
                                       hartid_base, /* hartid_base */
@@ -143,7 +143,7 @@ static void riscv_cps_realize(DeviceState *dev, Error **errp)
                                       APLIC_NUM_SOURCES,
                                       APLIC_NUM_PRIO_BITS,
                                       false, true, NULL);
-        riscv_aplic_create(get_system_memory(),
+        riscv_aplic_create(&s->container,
                            cm_base + AIA_PLIC_S_OFFSET,
                            AIA_PLIC_S_SIZE,
                            hartid_base, /* hartid_base */
@@ -153,10 +153,10 @@ static void riscv_cps_realize(DeviceState *dev, Error **errp)
                            false, false, s->aplic);
         /* PLIC changes msi_nonbroken to ture. We revert the change. */
         msi_nonbroken = false;
-        riscv_aclint_swi_create(get_system_memory(),
+        riscv_aclint_swi_create(&s->container,
                                 cm_base + AIA_CLINT_OFFSET,
                                 hartid_base, MAX_HARTS, false);
-        riscv_aclint_mtimer_create(get_system_memory(),
+        riscv_aclint_mtimer_create(&s->container,
                                    cm_base + AIA_CLINT_OFFSET +
                                    RISCV_ACLINT_SWI_SIZE,
                                    RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
-- 
2.47.3


