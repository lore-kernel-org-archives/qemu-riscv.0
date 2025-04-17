Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECABFC369C2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 10:56:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u5MsI-0007T5-1r; Thu, 17 Apr 2025 06:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Ms5-0007Nb-Ud
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:53:30 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Ms4-0003Kr-8k
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:53:29 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-73972a54919so467383b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 17 Apr 2025 03:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744887206; x=1745492006; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cbCfnAY8k2Soyd1n/D0nC/2pTKzsneNdm2pbb2owQHc=;
 b=RIC7CshzBm2+A7T45AmgiQdQtOCv7iIxUeCsxbderNno4latHpIhaqmxTEEE/w9ihs
 LhekSRZhk9ikxA6V79c6FbIOsM3SDc2KFI1S37Y0S7FAFT0mvzR2zdlCYlpFyzBDPuaB
 rfik6LaEhKtmRxdLy5XDmbJ1HY1A0y2Fx5g8U+lTZGD/+X7IfmIaTLpLRu6/DHLcUS1y
 rtJxu1fhWqPyL7ZrnbZy+gyoulYgJrkbtVWxN3w/vcvuzelQY0P5q3t0jG/rUW6XIdkx
 /zXkFbwu/YNNsBjw29cxxASp4HbEBixz6+3oJ2CGdbOXf2g1JHhvvAH80KFesR7iV/HS
 6+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744887206; x=1745492006;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cbCfnAY8k2Soyd1n/D0nC/2pTKzsneNdm2pbb2owQHc=;
 b=o2SULsHEjCesiCZiTDtmmWUu/mNuc0HPlA5EjA/7eKAvSbV+5WK/7H12+dCF7Od8nv
 X0eieRFxfpAG0xF7oGapO22BHlFEMvUS4qCoOilFazxhWOlytuSGNQZBq9tvYIYjnueR
 pT4r6KNLyePE+rmEcLB9iMPJ0tmIQxhH5oLD+Ct1gAED/5lCccLnUxPcVzGyZ3YM9Tr2
 plRiffuUCA8/h1G17WOZCUv1g6kvYwWefTpiTZbVrKkwEp5u/ZmRVkKbpMKF5sciW0um
 6jpMeFv4imGovr34SmLXFyAtlXWSp+s76RGMD7FQfYJc6ppMh9w85vi5ShcQliR0ldYA
 TVng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWep1/KyBMUjX3XhVXc7Vv8OskXEbhBkewWt3x9M8Iv0sk2uZDDFmtYqERX1631kShYvXvrWdH7x1Gz@nongnu.org
X-Gm-Message-State: AOJu0YzEIrnLLoMloM9Zuy8zjPV5XY9JFezxKdZSc4B8FG/Q24TyWAcw
 o7GvcJRz7HVm5lrg5lijHT6X2x9cjESIhBb5CxzMeeVPBY37OPV39JiBnd5NC9A=
X-Gm-Gg: ASbGncsKLdor14N3CPxjeJDLTHgI+9Xqq2wJqPV27rne2RBXHuchGgTczl6blJVp5EL
 AAxMEAycc/WZeYSkwaCQLc9XBQN6FCEECoOrWXUJ8QFBJzDK3EWYPiHc7kRUKDEVavFsJktcV6i
 y6M8FGg/Ygt7pVhnKEps7kI7Z+BYt7zKoJ4oFiS4poG4nAqb58znXFwh3y0m/2UoLstMS0Wrca6
 x/r6kubNr8qcRbaR2f9KkcS+tGSYjkStGSGWCmCrgvrde9GDUlZWevYdbJ3FguIUffvWgUZtsb2
 9SdO8lD7aA57vBDE4hWQ2vego6oafQvztoiswdkjgfytVUVdg10fctFs0Z7cZrw=
X-Google-Smtp-Source: AGHT+IGcw0tpnbx9LmA6EQEP0d8jXvgNFw4H5puxgT4ARXRg6weIMd+yOOKSUy/JqgxMO5Lay+zBvA==
X-Received: by 2002:a05:6a00:801:b0:736:532b:7c10 with SMTP id
 d2e1a72fcca58-73c267fe0f0mr6994875b3a.21.1744887205746; 
 Thu, 17 Apr 2025 03:53:25 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230ddaasm12366251b3a.138.2025.04.17.03.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:53:25 -0700 (PDT)
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
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 04/18] exec: Add RISC-V WorldGuard WID to MemTxAttrs
Date: Thu, 17 Apr 2025 18:52:35 +0800
Message-Id: <20250417105249.18232-5-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250417105249.18232-1-jim.shu@sifive.com>
References: <20250417105249.18232-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x430.google.com
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


