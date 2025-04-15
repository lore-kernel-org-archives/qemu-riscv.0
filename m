Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E39C369AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 08:20:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4bPr-0006w3-9p; Tue, 15 Apr 2025 04:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bPo-0006lt-Nj
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:13:08 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bPm-0001vG-GW
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:13:08 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-223fb0f619dso55781305ad.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Apr 2025 01:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744704784; x=1745309584; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cbCfnAY8k2Soyd1n/D0nC/2pTKzsneNdm2pbb2owQHc=;
 b=HgQ6ixyCZAQ4VvQnfW/mj/N7gF0WpQwnrutb18idH32Flpo4f/s0+ePPL3Ny9zP9MJ
 hX67qgEvQJc0hplnblX1quJz+jK7Y7TFx8m3KlkqfbOZ2xMnJnvZn1mDa3U1OHPG6W5g
 P8vA7h+Mqb5v81TSdfKB8xZz+yyZe4K00IJ9bWnNRMh5SUvSBg9lZ25+gu5aGoJm1HpW
 2uhXJ7CZn6LefAf9qCk3aiu0CKCaZvRs87v+21vNwJkpMUBGwBAzG8m9uJQrm/HxXATH
 QCF+krlTCylboW62yPXDInfGvEL1EaASGi9vIES6JN5rYuVxn+XgPdPlH/bxAsyNLsjr
 t2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744704784; x=1745309584;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cbCfnAY8k2Soyd1n/D0nC/2pTKzsneNdm2pbb2owQHc=;
 b=Zuns8FRawsF6njKF6se52eB9PGJkIw3uo8jktQchvR+5oY91wNS2HLzO61X9Q63OwK
 c2dUxfLKL0kOgo5Y1TUyG0grWum/RC+jnGAZ+mlsObgRvP2c6bNvCSbKIWry3TCavpn8
 OmndNXDq6qSCskK7SGgkE3lwUnNjilYysrxdCIukaxh8HOq5HmAGarbOjGVFEH8+aHBl
 LT4qx4+GpdgAjS2ALcCSZYbvIAWHLZ7ofFkBbhekKPyAb26C5CcqoZM3SEXFJuUx5DrU
 TbEj7eqZ9+nkhp9ftrNjS7xs3ZiZlIgvu7/zgkLuK0f6KCr+We+UBn6BjK8fOglTuf/5
 847g==
X-Forwarded-Encrypted: i=1;
 AJvYcCViU440qU0PxNziLE+F6eGbEJqbvtiXNPfX6Te3Lwc9XEl8F/6Et2c1LAKUb23nNkXBnEUHQ58xK+lI@nongnu.org
X-Gm-Message-State: AOJu0Yz7AAYJvTezyzEpiyyQnACS8g14zd7GQDmzxMGeuF/ipBRh5Jl0
 WLI2aNjD7T+w4xc1Xxz1pg5ey6RLb+01qJriFZtGj7bJ/T+0xosvpYnxGjz60o8=
X-Gm-Gg: ASbGncu4Rl1F+BhluH42uVqPttprOn4ygXgFg3IvBUhk6+/Pl4BfaCOPwTxGc8cFM5o
 vkPqxTLXezdiL3Wc/b9IaH8oUMUQ+52mMp9694g7+2/jvksZ6OUr6OoF6xr7mH7o7K2qqmX6vw8
 Mv5pfVdWtT5gRokpDG4z9da78F89MCrfuPWpnIs9SBSRE0rTmU/JWJMTVe32fUTsP5zgdkImYvS
 OGR8yW3V74SGS6efn9+p0/dgqEZlGDsKIETsg5O4o3XoZs9TXrpdrYcrcxxdR6KtRHx5PgJbBZq
 Yq/OiSm8cwbyqDOmYEcnUxg16oxpcUs8RbexULPxAFu71Rr6Gic8asyv1iyK7SXS6BTpIu4fpA=
 =
X-Google-Smtp-Source: AGHT+IHfKdGnCEQTD5NofF2J+e+AwCYuEOZQAjp/NYqoqKLGEbN1vmIPt92YBINEI+6c5wH19W9IgQ==
X-Received: by 2002:a17:902:ea01:b0:21a:8300:b9ce with SMTP id
 d9443c01a7336-22bea4fd0a0mr220934125ad.49.1744704784188; 
 Tue, 15 Apr 2025 01:13:04 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c95cd1sm111082335ad.150.2025.04.15.01.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 01:13:03 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 03/17] exec: Add RISC-V WorldGuard WID to MemTxAttrs
Date: Tue, 15 Apr 2025 16:12:17 +0800
Message-Id: <20250415081231.21186-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250415081231.21186-1-jim.shu@sifive.com>
References: <20250415081231.21186-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

RISC-V WorldGuard will add 5-bit world_id (WID) to the each memory
transaction on the bus. The wgChecker in front of RAM or peripherals
MMIO could do the access control based on the WID. It is similar to ARM
TrustZone NS bit, but the WID is 5-bit.

The common implementation of WID is AXI4 AxUSER signal.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 include/exec/memattrs.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 8db1d30464..7a6866fa41 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -54,6 +54,11 @@ typedef struct MemTxAttrs {
      */
     unsigned int pid:8;
 
+    /*
+     * RISC-V WorldGuard: the 5-bit WID field of memory access.
+     */
+    unsigned int world_id:5;
+
     /*
      * Bus masters which don't specify any attributes will get this
      * (via the MEMTXATTRS_UNSPECIFIED constant), so that we can
@@ -63,8 +68,7 @@ typedef struct MemTxAttrs {
      */
     bool unspecified;
 
-    uint8_t _reserved1;
-    uint16_t _reserved2;
+    uint16_t _reserved1;
 } MemTxAttrs;
 
 QEMU_BUILD_BUG_ON(sizeof(MemTxAttrs) > 8);
-- 
2.17.1


