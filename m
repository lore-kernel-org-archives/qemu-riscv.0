Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB21BCAC58E
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 16:08:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uwjpE-0005A5-LG; Thu, 11 Sep 2025 12:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uwjp9-00057X-L8
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 12:07:04 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uwjp7-00069r-RV
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 12:07:03 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b523af71683so760355a12.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Sep 2025 09:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757606820; x=1758211620; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOAYaDxWDZsV2hmIOq3wdPqI2Hus4uIY85BIAbPxojY=;
 b=fsTERi90km2/mij+CL5OYPQcw38r7rNujSGTSjAl0FCYb6Wfi3flX/Dj0p0W9BnF68
 ArJ+69deWTxiYLtln4WupP0Zwz+TPwmjrYMI41JIIHgShIW4FJa/8vGCdkbrjye6x8mi
 TqW+CUvZeXYPfqcwi0PpMnsEjK2vAJsz+fUTQgUCgW7ASwEJF68bbEFH2b1MFK/IxFe2
 yUzCllK29KM589H3SlMMkgOpgV1AiA+HfgEcRYPkhn0Rs5r8k0z8lOISmpIopOx4i+mC
 i/r5X68H765ulevXOpBHUibVw2NefhRMT1XJmdsP8PkuBPSDscWK+Vdlzt0fgRNxLecp
 mDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757606820; x=1758211620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOAYaDxWDZsV2hmIOq3wdPqI2Hus4uIY85BIAbPxojY=;
 b=os+VmZriOQYhalu6SC0j5Q4VZd/r5K8HomCTA0cJtHYNw1PZBBQIPMhcvtclmKNOBB
 T1rwE+ZI4TVyMK21eGsM5j4qt4uCTEZexHGwvTQfsePRWUO1B8QVbd+VskGfhP2d27LI
 J013gQcIk8q21kIKTOsgeAoN0g8nb3hjLCvdsZzgnVPcpxqnTC6MM6UKGfTBIOOCtWnn
 QA0LQ9D549CNHyCcb8OFPChPcrHwxc5uOvnGdgeCUuAEwCd5B9vvrfsVla92FrDinJs8
 FxhhYWG6QMxFl+IKRywdp3RM5bQiQYVshPxtp6sP+npCQXFX/seE8f+C9o/7I/4QW+N0
 nAQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM63GfBVnY4NHlOvVnvlwgc/wRirKehgB0ABhdhG6oNfEVeTYZcV41h9PD3E3yhYVTYT0pSDn/7wOh@nongnu.org
X-Gm-Message-State: AOJu0Yyt+VagzAp84+faKCmf5WR1Ps25a5DIgF4HSLKkiPcFAuX2f4XK
 +SsNdTJfSuki6BVZrBSD9h+s3Ja5R5fldYnRfUP9bVMEJCJbMZ2S9OLxM9IO+KM3C9s=
X-Gm-Gg: ASbGnctg0g/OeQ40z7MWB1CP949N1Lkacd05qm/viulPbS6Nz1VVsNiJZ5spWFLgybs
 0+k5kTB8JBhGpLEGl41tcwNuyc0rtPWdjwn1rsUM+P7363FvfR2wVmfBpNcmkDv9FpxKgs9UTC5
 eAAWmbIKP3RoSXw+8dxWOerpw7LYxxEqQc9CYNH8EeYiY0h0YcLT1+aYVG0PAX69C1OTN5peiSF
 yCXWUdA+7ENCgmVFKu3nvktgcMDCQ7ksC6i2g+AqRSSOdu/tJDTOLIAPqwZImvNlTDwSxwoNvxH
 US0tuDhRmtmdmYAA3HVEBRzvoYq/AsMo9hembImwwRxBetW8nyYNN91wxXnogiRfiE6zQ10sUP9
 wyQOct26zCOrW11iKPwgdfac4MRU5oUsRIm/b9coVM4ffKL6D3w==
X-Google-Smtp-Source: AGHT+IFF3wVYM4l1p86RBmrAbQ/XlaasdQuUrymGbpxc89MHBDtqcizKMgN0UYlu+xGL1QiOu6nQcg==
X-Received: by 2002:a17:902:e549:b0:251:493c:43e5 with SMTP id
 d9443c01a7336-25d214f424cmr475355ad.0.1757606820254; 
 Thu, 11 Sep 2025 09:07:00 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd9903a2asm2618765a91.24.2025.09.11.09.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:06:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 3/4] hw/char: sifive_uart: Remove outdated comment about Tx
 FIFO
Date: Fri, 12 Sep 2025 00:06:45 +0800
Message-ID: <20250911160647.5710-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911160647.5710-1-frank.chang@sifive.com>
References: <20250911160647.5710-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Frank Chang <frank.chang@sifive.com>

Since Tx FIFO is now implemented using "qemu/fifo8.h", remove the comment
that no longer reflects the current implementation.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/char/sifive_uart.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 401f869680d..baef0bd9c28 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -28,12 +28,6 @@
 
 #define TX_INTERRUPT_TRIGGER_DELAY_NS 100
 
-/*
- * Not yet implemented:
- *
- * Transmit FIFO using "qemu/fifo8.h"
- */
-
 /* Returns the state of the IP (interrupt pending) register */
 static uint32_t sifive_uart_ip(SiFiveUARTState *s)
 {
-- 
2.49.0


