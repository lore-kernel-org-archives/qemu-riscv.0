Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE5BC5DF97
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 03:07:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyL12-0006nv-H2; Sun, 23 Aug 2026 23:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyL0z-0006lo-9t
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 23:06:25 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyL0w-00044c-Kb
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 23:06:25 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2caea3f742bso46774255ad.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 20:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787540774; x=1788145574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hSzeeNc519qewfjxDVo2U7VPXPLogh/HrY3PtLKPaJo=;
 b=kqhLu0rMC8hVJxvGvl0CnEDMuXiUyfWWQIUahOeliAmihCnPIvQO/bfUdSQQLOcV74
 cx0CASi8nt3GhUUBBAhybENAifAx3qyr/9IoN8Ikq4JccEGW9LJbN11xLvGAaCWLgK3N
 9XmTPg97RyPsHM42fe9wTaRBp6A6LJ1ni1aVnQrwJMesV9XcKikr/JfSYiydwtwkCnVi
 /U2dqAyDUOir3+e4qU3cYKY6TpETJgXvdEgOP4FlhfgH/1br8SglfoKjg1jY8KYTZoQH
 pY4PGFqb8hVvflT8LHGl5odeIh/mFRkpzRdhKaNN/kbIU33WwFYo+iN0hjsMD6yj07/J
 ES/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787540774; x=1788145574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hSzeeNc519qewfjxDVo2U7VPXPLogh/HrY3PtLKPaJo=;
 b=elyvzuQi7ns7MGxWvgbjs5DnfUDaJY/6OLBoV//E7cMVGkBHqvoWFCbK5DtdsxePCf
 3GPfPXuvD/NfDBlAxSSrlDTvlYru4QJeOc5/Qm+g0XgGHzEiQow9rwyJtBNewv5s9FaG
 H8J9u3jgvwQWfCO2v2C7sgACGkOgX65dfP3gAD69+RhX4XIwlJ9Vh2JOGOjlZRayBm+7
 dYlmHkoWrj/LNk1dlei5BuUNrhUHoA4OL1yf1UUMLIVfezKcRhFbQrSPx5zM6hjFMhrz
 ts+wROYkDiLDSz+peGSThIRsGQdf/QVEiEVImfWPCYw7qJtgW0Ok/brye2r9Zvf57Y04
 4Plg==
X-Forwarded-Encrypted: i=1;
 AHgh+RogP5fC1JgW11TGEjool6Axe3WDnHbFx+pVPvCvBe+nN1qhUFB2p3qK9Cvsio59SZouxM0PngnvqwV2@nongnu.org
X-Gm-Message-State: AFuF++nroZeYvkWhj4S8Pp5Bm3Ilscff9up7germFYOq52Gi33UpwN/U
 8t5NsRkkL2rY6GsGk6CeBI4Fr2EPxNb7aapnimzdDDUa4b6bi9wfu1mv
X-Gm-Gg: AR+sD13KkqPMr6CbNsP7mwbIUvtB9Z3MEQJLjAQnvBUJI8bULyond//FUWjTq1kIE+a
 Un2H3++7mZ//tlafhWBQl45IGGzN0t0MfEP1/D+x2lIZx3dct2In/LV3NZ+GjGUi1pwZyy1ihMN
 llcAPKDgTTsl9hRNOrkZ5c79A9WjxNrPJPWHRYv3SLIYTCu+GmATtV9KysVhGc8FYYHksxWqQzL
 TzQ5CkYnnJr23L7tXbxQ/DRlSpzUFeVynUb3UW7Jr5Yg9bqp5Uw3htr6eHHMp/i9Fx3BnitmdAF
 bhaacHRXCJFz7DxgJZwB59v2pW7uj3h1NSDR39Wy223W43c3wGL/A3Bx6jTeoMTb2PszMWcvs+L
 0xD+uARYJLbmQexUaPbK5l9ZEOBt129XeFUQHFz/4meo7zbSOxE81tda7OYgYrDE10p5AfAKU8u
 /s3Xm4HY9egveLI6UBp3ysGP4jaZFFYLRz2U4lLq5c4UvpNG0BppMzRSi/2UyGgRLF0jNrJPyIp
 5UIcdesYTMhlNSN3zHO/Y/+WhBGpZ85DrC0UvkFyBcDme3y9DSNwdBj3tnoAIsd/DfTolVqO+bB
 6+/HcXYQqWS/uvkqQqJtYg==
X-Received: by 2002:a17:90b:1c90:b0:393:19a3:4f1 with SMTP id
 98e67ed59e1d1-395c351d788mr39916418a91.6.1787540774095; 
 Sun, 23 Aug 2026 20:06:14 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395e4a4e5ecsm8299699a91.16.2026.08.23.20.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 20:06:13 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/riscv: Make s-mode IMSIC stride explicit
Date: Mon, 24 Aug 2026 12:35:05 +0930
Message-ID: <20260824030509.18078-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

This adds s_imsic_stride to riscv_create_aia so machines can separate
the s-mode IMSIC layout from the guest count. They are related but the
layout isn't necessarily defined by the guest count. Doing this means
we can fix a bug that was in the Atlantis machine that I wrote.

Joel Stanley (2):
  hw/riscv: Make s-mode IMSIC stride explicit
  hw/riscv/aia: Check for invalid IMSIC configs

 hw/riscv/aia.h         |  1 +
 hw/riscv/aia.c         |  9 ++++++---
 hw/riscv/tt_atlantis.c | 19 +++++++++++--------
 hw/riscv/virt.c        |  2 ++
 4 files changed, 20 insertions(+), 11 deletions(-)

-- 
2.47.3


