Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375BFEE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 08:46:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeAeD-0007By-K9; Thu, 07 Sep 2023 04:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qeAe0-00079a-DV; Thu, 07 Sep 2023 04:45:47 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qeAdZ-0008FX-Ic; Thu, 07 Sep 2023 04:45:19 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68bed2c786eso614076b3a.0; 
 Thu, 07 Sep 2023 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694076315; x=1694681115; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6gZUcfML6Qtk7QndXvhNoRD/lzswcGgAHIhmy3SRM6A=;
 b=iq8NFoqMMtLfnEhD/HjlYHkjMTZT1vt+2VD470BMVsIeT7iucy5fPLPScrfRG1y/n6
 u1cm53MtZrKT6A6RWpRzqp+QiShIp0LeFli+wWSJw1XLorT48rWBQ51A7US1GHPeC8Rt
 imHfZlnISrEgJJPwMARKuDEPktppzHPnIONlBfA5jXYueEaoLYhonxrrd22uV8pbsxDF
 qKNUatvSl3pKRndqwynXNhV8ayYl8HPJ3FSi+3zIO3ouUIM6qopT21/fPyUWJZNpsxYx
 1GBP02qoN62pEXyoBI+ecjEo411A+PANuPL7pMVfYdp0ZhWzKnc+DRdc/rM5kx0L8a2N
 I7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694076315; x=1694681115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6gZUcfML6Qtk7QndXvhNoRD/lzswcGgAHIhmy3SRM6A=;
 b=MG8OONPvWfeybMFOAhffzjfwq41w98pjSZyAwdKcdYiRURfOajeh4akmM9Jpuzz5ys
 +Tk1u4uZqrvaWYj54coHZgtHoVkLqviJQJgTbvZOEnRFAOB4i2WAH2rsJ4DuWYk4hWec
 S4DDloguTHngOc09/l+QR2d+NhZcfWIDag2LL24y80HwT8mSnImkw/dVBq//qYXPxiqs
 vYvmTcl9uDuclwh8TC6rjwoph+RwOYV9+kBx2Qs5U2Qlc30N5q4SHFKLHbCR1vmYV6dS
 OkHaNQHw/zPeVp3ubMi9pz6Ex6vN59oBtYNHmxp6/GpWo97k+tfAEsxKbzcq6K/2yNSw
 +l+Q==
X-Gm-Message-State: AOJu0YxR53Ci3ZpYograviZ4vaIz2X70gQFVH8QvQhYY9QHJA3Oz7HF8
 1jqiX2y1kOMy8JZfUOnn3CGMoBPueUyTVCBY
X-Google-Smtp-Source: AGHT+IFJz4c/X0G1HbvFV9KaogSVGhxfA8DDVqNZ83Yns7QnHNSMfZDItRhZhQ/DTIXYzVVofYsYyA==
X-Received: by 2002:a05:6a00:24c3:b0:68b:e29c:b61 with SMTP id
 d3-20020a056a0024c300b0068be29c0b61mr19238990pfv.19.1694076314885; 
 Thu, 07 Sep 2023 01:45:14 -0700 (PDT)
Received: from localhost.localdomain (36-226-231-9.dynamic-ip.hinet.net.
 [36.226.231.9]) by smtp.gmail.com with ESMTPSA id
 g20-20020a62e314000000b00688214cff65sm11923722pfh.44.2023.09.07.01.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 01:45:14 -0700 (PDT)
From: Alvin Chang <vivahavey@gmail.com>
X-Google-Original-From: Alvin Chang <alvinga@andestech.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com,
	Alvin Chang <alvinga@andestech.com>
Subject: [PATCH] disas/riscv: Fix the typo of inverted order of pmpaddr13 and
 pmpaddr14
Date: Thu,  7 Sep 2023 16:45:00 +0800
Message-Id: <20230907084500.328-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.27.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=vivahavey@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Fix the inverted order of pmpaddr13 and pmpaddr14 in csr_name().

Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
 disas/riscv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 3873a69157..8e89e1d115 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2116,8 +2116,8 @@ static const char *csr_name(int csrno)
     case 0x03ba: return "pmpaddr10";
     case 0x03bb: return "pmpaddr11";
     case 0x03bc: return "pmpaddr12";
-    case 0x03bd: return "pmpaddr14";
-    case 0x03be: return "pmpaddr13";
+    case 0x03bd: return "pmpaddr13";
+    case 0x03be: return "pmpaddr14";
     case 0x03bf: return "pmpaddr15";
     case 0x0780: return "mtohost";
     case 0x0781: return "mfromhost";
-- 
2.34.1


