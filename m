Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF8CC624D4
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 05:53:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x20NM-0006VI-Ce; Thu, 03 Sep 2026 01:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20NK-0006UG-Aj
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:52:38 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20NI-0006Fk-PC
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:52:38 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-853f8c34ba4so3120058b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 22:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788414748; x=1789019548; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=sEf0pnR2YMWUNR1E9QteSUNz7ULUPAOBGN/IIXi/q0U=;
 b=UW0ujbnAxlZeXN1G3yVo55LVctCOvMIWA24TRLjMLzVRPY9EQhG3O8AlNEOG4QwL6j
 Fkt59XhDQCRb4lmjoeXYPfuTrTXYiyMQ8FAXaZrgAGP3yDly9da5v0GY5pTnKzJtPv37
 qZM2cyyRteO5uK7h0M14xDELvOr8CNH+XaMm7OI1/7W1q2XV4g8MxRpZDoch3MSpI5YJ
 mDtEQiWIZw2T/vVDnBH5DhZVYoqtzkAguXNSwRjPcRFuDASIdKzBD6+MmTtc6Glg7e/o
 x3ACLfFkKMDDZTI+LeBaEKftOOUq00S/Mfwizg98xDvAO0jNy3Z0D7EYL1LI7oZrPIla
 0wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788414748; x=1789019548;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sEf0pnR2YMWUNR1E9QteSUNz7ULUPAOBGN/IIXi/q0U=;
 b=Fid9gq+vubgi/KShBtJdisfLPCdv1Ru6o4pQFB/Pwr3ak23mzD/okqBh70ksOPm0E1
 bAuVRxu+r2VhElpJOJz7zZ3HHkiU0KI75NHm1TukjmCqQxEK30hLQV5JGdT6DQyvYuLt
 aYXTQpOJ/I1+35v63eoG9EJXwuaDoNMhEmIjI1plOxsNwj9/740T119DDihrY0oDdrxz
 9KXzLOk7FVCYkE2h7yYbAsTxmO9j97whnq5YYeRnAAPZ/oE/p9YvweSt4ihSxmtD8lak
 p1QClIgQdzglaRgu/7+rHd0obC2ZMZknbcGEGpJpVNFir3/Rk/639BXxyWiG3TX4qPvT
 UGeg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzR+RJoyemIv+vn0px4qJsFEQFawS+Voslgzt3t4U8s93t5wczQKtOFDu/EXCH7LzkA9rCEwEdMShc6@nongnu.org
X-Gm-Message-State: AFuF++lHbN0meqvvP1AYdlY/V4q3RZtBKMoDTpY7YFyAIeLo/SVdw65n
 CGMW3G9Czn3H+8wAE4ZMBEDOmWaXSQGjZmXiLmHX1qVRYqlcE/93uZV0
X-Gm-Gg: AYBFou2tbfSap4jLjuEA9iR419gWs8+LYejUh5qtn3nmXorCXKWOtaW47ty8Av2XxB5
 HIDSj3DkMoXL+GB+XOMi9sdWYo/ZPdgJpHqMvKxEigMKBeEXJTOtcn3cA+q3GAM2LFjM1EwUuvM
 Y4ucRxNPkB8BIovoKazrClgSQ/2NJl0+Ic+UVoyV5UdAUt+UorfqSEOHU758KCkz273T1LDDbZR
 fNZWcQlMBA2V5ixfOyp6T9En5CxT4s5tEkKPJbCy1zUJEvdlRI+YkodF8Zu1qKHsp5z2c08LUco
 duow6YEz6Oy9OSDGfN5UVYGAWLtyJkoqQLB0erb4SG81IgI0i62I80/Rn2ruw4fMtuj1P6T2sYn
 eMLd5sclEeZUWv5m7rEpXg0LkLYz57tCMCkkkVG38czlDpicxhJPtwD30O9nfrozazc6tOjpqgb
 hbW6thSf/5Q6aNJJ3s5ooLZii7vv0Xl1rKcggV1DgMbiSBOt4dbaSncWYfwPaowRk8o783fyDk/
 mu2xFShCiO3nmPF7GPfokZa/BZ0k4B+n7sBlj/evHkvPT/ZCtlEORFE6pNe8udSehbtQ/1KCLc6
 eNaZ6CO40No72/zEVByh
X-Received: by 2002:a05:6a21:6004:b0:3d0:88f5:f813 with SMTP id
 adf61e73a8af0-3d9b05238admr16697934637.11.1788414747753; 
 Wed, 02 Sep 2026 22:52:27 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1431990a39bsm2770619c88.3.2026.09.02.22.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 22:52:26 -0700 (PDT)
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
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 01/16] hw/riscv/aia: Take a MemoryRegion for the created
 devices
Date: Thu,  3 Sep 2026 15:21:15 +0930
Message-ID: <20260903055131.257903-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903055131.257903-1-joel@jms.id.au>
References: <20260903055131.257903-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42d.google.com
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

Add a MemoryRegion parameter to riscv_create_aia(), to be passed on to
the IMSIC and APLIC helpers so a SoC can have the controllers mapped
into its own memory container. Both callers pass system_memory, so there
is no change in behaviour.

As the controllers don't yet take a MemoryRegion the parameter is not
yet passed on. Changing riscv_create_aia first avoids churn in the
intermediate commits.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/aia.h         | 3 ++-
 hw/riscv/aia.c         | 3 ++-
 hw/riscv/tt_atlantis.c | 3 ++-
 hw/riscv/virt.c        | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
index 3b6d7f962506..5df3292610e9 100644
--- a/hw/riscv/aia.h
+++ b/hw/riscv/aia.h
@@ -13,7 +13,8 @@
 
 uint32_t imsic_num_bits(uint32_t count);
 
-DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+DeviceState *riscv_create_aia(MemoryRegion *container,
+                             bool msimode, int aia_guests,
                              uint32_t m_imsic_stride,
                              uint32_t s_imsic_stride,
                              uint16_t num_sources,
diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
index c1a5982856c5..e11382e512da 100644
--- a/hw/riscv/aia.c
+++ b/hw/riscv/aia.c
@@ -24,7 +24,8 @@ uint32_t imsic_num_bits(uint32_t count)
     return ret;
 }
 
-DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+DeviceState *riscv_create_aia(MemoryRegion *container,
+                             bool msimode, int aia_guests,
                              uint32_t m_imsic_stride,
                              uint32_t s_imsic_stride,
                              uint16_t num_sources,
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 812051a11fd4..f395236d88ab 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -498,7 +498,8 @@ static void tt_atlantis_machine_init(MachineState *machine)
                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
-    s->irqchip = riscv_create_aia(true, TT_IMSIC_GUESTS,
+    s->irqchip = riscv_create_aia(system_memory,
+                                  true, TT_IMSIC_GUESTS,
                                   TT_IMSIC_STRIDE,
                                   TT_IMSIC_STRIDE,
                                   TT_IRQCHIP_NUM_SOURCES,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index de7b99c6a51e..6480a3f0a9c0 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -809,8 +809,9 @@ static void virt_machine_init(MachineState *machine)
             s->irqchip[i] = virt_create_plic(s->memmap, i,
                                              base_hartid, hart_count);
         } else {
+            bool msimode = s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
             int imsic_bits = imsic_num_bits(s->aia_guests + 1);
-            s->irqchip[i] = riscv_create_aia(s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC,
+            s->irqchip[i] = riscv_create_aia(system_memory, msimode,
                                              s->aia_guests,
                                              IMSIC_HART_SIZE(0),
                                              IMSIC_HART_SIZE(imsic_bits),
-- 
2.47.3


