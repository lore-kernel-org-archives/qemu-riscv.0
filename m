Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D24C27C75
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 08:16:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHJ8E-0002Fy-Mx; Wed, 12 Jun 2024 04:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8D-0002EG-88
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 04:14:57 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8A-0006J4-AZ
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 04:14:56 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1f64ecb1766so50546435ad.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Jun 2024 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718180093; x=1718784893; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N1D0EBwsV6VQtcv780/DUEjjt7vhGVA63Te3ctWhZfA=;
 b=mti9qCRsNJmelYIZR/D/m3ezfW3mxqAD7hGR4vnie+B3dDRqxjcd0XSWdzAPcAjl8h
 /ALR2RQHk3Oaxb7nqqmovjpBQw5GfCAd8Xchpn+SRwNFY+uc9IlnaSvDi0eM11N14vZN
 j23lYgRUCgci6ihTZS3lRHmmfRWDLYP/F8I7/mMT2BZVYm7JtPID2TEMUJ42aa0T0g56
 88KnZMyspzaDVC+Nf7ZTHp1dqBZVOf/w4fxoAgqEACVQm6F2CLCwkN8GHJs4FCqEWgVc
 Crj5WOC3cJMb7nduWEGSrGUiUoCyvQ7lTHKlRC+xjzj6yd6pW7d7k/Xn85PDHu8AfS22
 LbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718180093; x=1718784893;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N1D0EBwsV6VQtcv780/DUEjjt7vhGVA63Te3ctWhZfA=;
 b=sLSzQIME5Li0u0ZMi3Lp01Q22qicz22qKi9DlPxFAiEX1Pa/D4RAK31jPuNmomkk9Y
 ZdPj4My4jU6V3JV2YBgOmtoF1oaQx8Q8tpLDzT0hpX6u2/BzWadYW9g36KjPm0Q8g9s/
 BFkGwH5srsarFkjnmpPbiwxauvaBqmeT3d34h13fTOP037GsF+/ixWszNQmYVSJPLvXw
 VdZaKgj9HBcwZ59WfhHB7o+KetIQwlDdrR7GMyILL6jQiHzIkU6+o1i8+WTrh5wCW90W
 UsUEt5vdFKsybOah8BrqpqajsvBf3qQHLDmlbBdxV21Q7bmTFM0sf6XsVTIvv6L9qn02
 xgBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULEKcJy/Ztj2VwJ4usxlJ/32UfedeaJFNjfc8KPsAK+CE/4IMSQNMqFAsmVU3yHnzY28/0rpzGrILG/i2t0/DW8K66Q4g=
X-Gm-Message-State: AOJu0YzZNLjyXJaShnn7uZQH3NL4uODZtHGcSXJDWrUO129BImqJjeys
 tEspnNaYlqgEAaBrfCZAFvd0bblVYHDmVd8yjFcFrDimQn9cjp17zQArl8me/f4=
X-Google-Smtp-Source: AGHT+IHAWHsJkZE4953kpysrVK4yCFesw23yF64Dnflq1Ntro1lAaQJsWtSgpvQzgG6J5tDpW9DiUA==
X-Received: by 2002:a17:902:cf08:b0:1f4:71ef:98f8 with SMTP id
 d9443c01a7336-1f83b6990aemr11303805ad.16.1718180093024; 
 Wed, 12 Jun 2024 01:14:53 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f8393e8e53sm11363875ad.16.2024.06.12.01.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:14:52 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [RFC PATCH 03/16] exec: Add RISC-V WorldGuard WID to MemTxAttrs
Date: Wed, 12 Jun 2024 16:14:03 +0800
Message-Id: <20240612081416.29704-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240612081416.29704-1-jim.shu@sifive.com>
References: <20240612081416.29704-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x636.google.com
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

RISC-V WorldGuard will add 5-bit world_id (WID) to the each memory
transaction on the bus. The wgChecker in front of RAM or peripherals
MMIO could do the access control based on the WID. It is similar to ARM
TrustZone NS bit, but the WID is 5-bit.

The common implementation of WID is AXI4 AxUSER signal.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 include/exec/memattrs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 14cdd8d582..d00f3c5500 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -52,6 +52,11 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+
+    /*
+     * RISC-V WorldGuard: the 5-bit WID of memory access.
+     */
+    uint8_t world_id;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.17.1


