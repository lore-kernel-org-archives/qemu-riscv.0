Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92A9C197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 12:11:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3bD1-0006sj-B4; Thu, 16 Nov 2023 07:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rcardenas.rod@gmail.com>)
 id 1r3bCo-0006r8-Cg; Thu, 16 Nov 2023 07:10:46 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rcardenas.rod@gmail.com>)
 id 1r3bCa-0008ND-4d; Thu, 16 Nov 2023 07:10:43 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32f7bd27c2aso581325f8f.2; 
 Thu, 16 Nov 2023 04:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700136629; x=1700741429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a+oK2BI5FX0kNdpxIq+ER+WDfFF2odsb7hqi+ZwJyoY=;
 b=mgPFNwgPr+OXTwl2ruXnGt4xTApKFNkgEtXvRCC3oU8Q8YlKLnfJS4iEXOAVlxKhLr
 bY51ZXvDkkVFotb/Ph4WPe5KYM9tD8FQnh0dEMsZ3uHbT84K5jxFJbABvAvQyTdTgMV6
 7qOG2aYoMEMWKdgNYVe/eT4rhy4HjRyL3+8KuWniTXgMgYvPAPhjwufzyFuDADZ2mcrC
 opoaLJXKysNEjouLP2QaBgEfcYbdfgQvqFojssc17sPF+Ol81n9JurheBfDZYM7RWoNe
 ufRUfsRCmjje0Ub7p0vFyODy1U/oqfQ7faxLy8YSSBXVIqNdk8+pwBl1Z3axSnAoj6cO
 f73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700136629; x=1700741429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a+oK2BI5FX0kNdpxIq+ER+WDfFF2odsb7hqi+ZwJyoY=;
 b=IDG1EaD0wXnsYgnHwHKKqq3UbidUkwba3v8i27aGma/35LdQ8wCnaRhdep2kkBTJF+
 7kYQ7PiHLAssyDVveoxjiT7pekAxWpjWKQTZXJwZwJFmRJnj7bGOskJljtrg5xA0SxLu
 dV34StOgZaJktqtERCXzfxhe2NSYpIC/pUhc+WUY5ssX36M2JTUSeB7e7fgGNQL9fiYp
 H+968b1GPLDXM4Q5gh5/H4PSyb+fThFHBvO6whDmA7RtQS/2owyYEJLiBtljSST28VBd
 aL/ZF7Isa9D6j5LxW5nI0rNTgsnbK8YK+IHCQ/cS8qFY9zyPO1mqynutyY8hPBCKTm+K
 eg9g==
X-Gm-Message-State: AOJu0YymPJ9FnbnQiyNFegXd8XqHfc42bZW0P5nqoU5OGEm4ECBBPAez
 /vQ1gQT4Rf4TYtjJo9Vgzn9WLuJHj2Rm6FLB
X-Google-Smtp-Source: AGHT+IETD+tNjc5vnK8rxazPJV12t/pL8MZ/8NjniKNIuMG8D+QbfTOVkhW+yOem1nV+KasvJWOnqw==
X-Received: by 2002:a5d:64c6:0:b0:32f:8920:48ab with SMTP id
 f6-20020a5d64c6000000b0032f892048abmr11237215wri.65.1700136628859; 
 Thu, 16 Nov 2023 04:10:28 -0800 (PST)
Received: from localhost.localdomain ([213.94.54.170])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adff9c7000000b0033130644c87sm13493243wrr.54.2023.11.16.04.10.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Nov 2023 04:10:27 -0800 (PST)
From: =?UTF-8?q?Rom=C3=A1n=20C=C3=A1rdenas?= <rcardenas.rod@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 palmer@dabbelt.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org,
 =?UTF-8?q?Rom=C3=A1n=20C=C3=A1rdenas?= <rcardenas.rod@gmail.com>
Subject: [PATCH] Fix SiFive E CLINT clock frequency (#1978)
Date: Thu, 16 Nov 2023 13:07:03 +0100
Message-Id: <20231116120702.53170-1-rcardenas.rod@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=rcardenas.rod@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If you check the manual of SiFive E310 (https://cdn.sparkfun.com/assets/7/f/0/2/7/fe310-g002-manual-v19p05.pdf?_gl=1*w2ieef*_ga*MTcyNDI2MjM0Ny4xNjk2ODcwNTM3*_ga_T369JS7J9N*MTY5Njg3MDUzNy4xLjAuMTY5Njg3MDUzNy42MC4wLjA.), you can see in Figure 1 that the CLINT is connected to the real time clock, which also feeds the AON peripheral (they share the same clock).

In page 43, the docs also say that the timer registers of the CLINT count ticks from the rtcclk.

I am currently playing with bare metal applications both in QEMU and a physical SiFive E310 board and I confirm that the CLINT clock in the physical board runs at 32.768 kHz. In QEMU, the same app produces a completely different outcome, as sometimes a new CLINT interrupt is triggered before finishing other tasks.

You can check issue #1978 on GitLab for more information.

---
 hw/riscv/sifive_e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 0d37adc542..87d9602383 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -225,7 +225,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
             RISCV_ACLINT_SWI_SIZE,
         RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
-        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
+        SIFIVE_E_LFCLK_DEFAULT_FREQ, false);
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
 
     /* AON */
-- 
2.39.3 (Apple Git-145)


