Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AC4CD98E6
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 04:52:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1waRAc-0008R2-4e; Fri, 19 Jun 2026 00:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAX-0008Ou-Jx
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:29 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAV-0005SW-S4
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:29 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c859878eb48so758791a12.0
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2026 21:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781844566; x=1782449366; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUuEtyKtFhfXIoCph6bUYAge9pOaOKkGGobDBDNgwZk=;
 b=EzXHAZcL4JuGYFfgI7igb1+gN7CARIGHZLpT/EjgDqZTm6tTXNejsWjzEtBPe/HZCh
 6i/rF9UHO8fb28RQUTzBncbZjWDrG7POB2gr4fLIS4B2q+wT0MStC2qI3KhO3cd11gOe
 cnax4VCcEPNSRR8Y4/ukjrP+HBSmxsaA+2L5BXzsIB9UKP9nxMsEUs8Wl2zDJqooCrGU
 YFhZ4ompQRdL1GP1UpVNFezWKQZXzE4H/k1YVMAIAB6x0cIiul1FwbzGfaFVtANeTcxG
 dugBaw6UKGrQPfj0HfJkl+b62/1d3wTVSnESaZhZurJEOD3ggMUwOwvk1oS50ObY5ZWT
 zQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781844566; x=1782449366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KUuEtyKtFhfXIoCph6bUYAge9pOaOKkGGobDBDNgwZk=;
 b=SMfyVd9T7EC36S93Hr22ii7sDYwfbdbSKqQ5xd3UwBR26zb07sg5l9MVkapBvTmbLa
 S3Y+l567L6QTQo0askWEZqVDO6/hRghvCSSGtOoisgwrQg0Ely+oAMuP28RJTsGvIqti
 ma6Sdo8jKPCQFKgXNFOpqnw5tqrqsLDzeILzw92RyTPVoznaf/mdWGj9BaxuYgg/GYC2
 OWkvuDVIvmor0gH/txoaXZDWx4lrb4eaMf3fTMub73+TfAAegFZDScdZ4Mnhx92BgJaq
 zoxCLI54/2zpNgsAAPy2FW/Hy9O1uS/Z88YPutqDvR357zRSLdI6mvWmCH9ckDrW0Oro
 RgGQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8D6fStdqNaf4mJOKpZpa64rWJ2PG9tRL8+aEbh5NA0zpHp8opQ15amLl8J2C6c+zewg5YsIYk2/Gg4@nongnu.org
X-Gm-Message-State: AOJu0YzZ1o+p74+Mbep1SxjUVeArTD8tY5wXPSZYm68lWdf8YJCLU5LS
 bu7eKN6eKyerPNmYFSfXkGphvlp+IETX0tK5gIijFPXvp0ef/3VTlsnk
X-Gm-Gg: AfdE7clMvQ+KU9oVQpC//B+u7x+vE3rgTHoDxcGE/KKm1MW2jcAEOsk7mrUuotVnVq9
 Qadq1EFfgMhBt2ZVUoQgiFX9s7fduOZqjzUadgsvmffrVRxWa2i3tlA8+YOnNBJUiivFLgxJ6oX
 9aDrtVuK6BT4F1GwlKxFoODWvyUk8nsKg3cesX00LJyIp72OAQkxje6OKNaVlwRmbGxE9Hg9slD
 M4eCI4qBT8SWpj7gmZ7FJzkfLcOrntAyr34NuW7xwXv5VDcEToN98e2iF3X8JWJ+LUmrelao6w6
 ulp5xgCAzy6XfZWvUYFK5T9uzXXGLWJCBsU8q/oOG6qE46vVOEI9ad3VbQ4qx43iLnZr6A8x3e8
 6VXSet8fLS9zam+9nK4dqD6w63Yknq0JHOqTQaSRxtttkau37fMvHfHQ8zv7hVIeMRT9OgL0ceE
 22EoYiWgXYAH9Ifua/SOzBxh76AlnEcLMJ3BMn6ihAVmthDKzWSwAJRXx/JhxzsknSH9Sf5ETG+
 cpcxYr4+D+KKkfg6ss5K3gNt7T5fykEqS7h1ehA4RFhG2Sovxho
X-Received: by 2002:a05:6a00:339a:b0:842:83d1:ee6d with SMTP id
 d2e1a72fcca58-84550aff364mr2034918b3a.45.1781844565863; 
 Thu, 18 Jun 2026 21:49:25 -0700 (PDT)
Received: from donnager-debian.. ([144.6.172.18])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8455363da44sm870141b3a.8.2026.06.18.21.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 21:49:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chris Rauer <crauer@google.com>, Alano Song <alanosong@163.com>,
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>,
 Nick Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org
Subject: [PATCH v9 05/12] hw/riscv/aia: Configure stride for the M-mode IMSIC
Date: Fri, 19 Jun 2026 14:18:29 +0930
Message-ID: <20260619044838.1054677-6-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619044838.1054677-1-joel@jms.id.au>
References: <20260619044838.1054677-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x532.google.com
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

riscv_create_aia() currently hard-codes the M-IMSIC at one 4 KiB page
per hart and gives callers no way to widen it.

Add an m_imsic_stride parameter that supplies the per hart byte
stride directly. The virt machine passes IMSIC_HART_SIZE(0)
(= 4 KiB), preserving its existing compact layout.

The parameter only changes how the slots are spaced, with the rest of
each slot reserved. This allows future platforms that have different
layouts to control the stride.

Reviewed-by: Philippe Mathieu-Daudé <philmd@mailo.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/aia.h  | 1 +
 hw/riscv/aia.c  | 3 ++-
 hw/riscv/virt.c | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
index 5ad0a902be0d..565f91accc09 100644
--- a/hw/riscv/aia.h
+++ b/hw/riscv/aia.h
@@ -14,6 +14,7 @@
 uint32_t imsic_num_bits(uint32_t count);
 
 DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+                             uint32_t m_imsic_stride,
                              uint16_t num_sources,
                              const MemMapEntry *aplic_m,
                              const MemMapEntry *aplic_s,
diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
index 82ea9d48ea75..ed8916002945 100644
--- a/hw/riscv/aia.c
+++ b/hw/riscv/aia.c
@@ -25,6 +25,7 @@ uint32_t imsic_num_bits(uint32_t count)
 }
 
 DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+                             uint32_t m_imsic_stride,
                              uint16_t num_sources,
                              const MemMapEntry *aplic_m,
                              const MemMapEntry *aplic_s,
@@ -47,7 +48,7 @@ DeviceState *riscv_create_aia(bool msimode, int aia_guests,
             /* Per-socket M-level IMSICs */
             addr = imsic_m->base + socket * (1U << IMSIC_MMIO_GROUP_MIN_SHIFT);
             for (i = 0; i < hart_count; i++) {
-                riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
+                riscv_imsic_create(addr + i * m_imsic_stride,
                                    base_hartid + i, true, 1,
                                    num_msis);
             }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b62864559f57..b10f347a5cbf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1418,6 +1418,7 @@ static void virt_machine_init(MachineState *machine)
         } else {
             s->irqchip[i] = riscv_create_aia(s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC,
                                              s->aia_guests,
+                                             IMSIC_HART_SIZE(0),
                                              s->num_sources,
                                              &s->memmap[VIRT_APLIC_M],
                                              &s->memmap[VIRT_APLIC_S],
-- 
2.47.3


