Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E0BCDB482
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 11:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsLbo-0002dP-2t; Mon, 16 Oct 2023 07:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qsLbm-0002cE-My
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 07:18:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qsLbb-0005ba-FV
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 07:18:02 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso44402165e9.3
 for <qemu-riscv@nongnu.org>; Mon, 16 Oct 2023 04:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697455064; x=1698059864;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+F6mdbwIf7VWgRHBUtKQ8tcMl+i/89eXu3BnJbXKMw=;
 b=TFrneycy72Aha6XCrYo9SRmzy7rB2+kATw51tjLD3UJVH4ZzKr/IYYpi0Gsbn/vEOl
 rNKsQaqpl6mMt4QLC6cXkidqiZ4YWw/oNcmjXw5DrhqW0ZIF4nI3WpDRGE5rE6ilgnXb
 VDsML+3Q6Mkv5rDXvC5Nlo85xCReQn6mi4elp2QygD+Ic1Hj2q4Rjpcj/V4pu4GBGVXI
 wKqnVHUNMwagY0eh6xzxdtuXaQKJ2M+VyMC1iU0WziquW4tpCdQaOl2/UoNmcJs/BIqE
 p6zBS4TieJM8h6qcMmZVhfQvSV5DjunY/bApR/DmquVZ9wTvvQMSf92ShmWvEML2ziHG
 ZpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697455064; x=1698059864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+F6mdbwIf7VWgRHBUtKQ8tcMl+i/89eXu3BnJbXKMw=;
 b=AoCmYCkcPu2b41/JYpRyeozQzQvK+Jb1LdeXfJqYgd1pfgKZ9ky3wxicau4WNxDAMi
 6zXH3wVZYM6A9wp7WvDAFQahCoSqNTLKFjJPERjrtB1BBE1GN6HYgdTTOlIbIz11T6K2
 U4fimzcMkoP+kxh0i4LZ4W0YJMACEyHKfXFHm6dC8QmA+bxFew+mWAhlG6oUGSsoU2hs
 c6FV5RUyA5Uz5utzaOf43QrTgdDVufiBRRiZFWQeqJHze9bJd1+p5ezbLimIvpU3zk9y
 /t16OBOfYFidcO2hS+rd4iLkx1fmqxX3F7nLsQUS6N3dJP0q3kcJQmKulSDLBYWJDplX
 RfTg==
X-Gm-Message-State: AOJu0YwOvQa1GRqp+3ccyyvSmcI76x8ZuIzYl2MjeubQH2jKLhK8rrDH
 5kUF7O8Qz8uJxxjNPcg1hgyY8Z1nRGWJJ6Tq8iE=
X-Google-Smtp-Source: AGHT+IGjw+yNBUSw2WyVLNbPBUEyBJz1aOhbnaRjRqAfrxdXfvcyKdUHc2HQi/yvn0Dr88vFXCgP1w==
X-Received: by 2002:a05:600c:2195:b0:406:53aa:7a5f with SMTP id
 e21-20020a05600c219500b0040653aa7a5fmr29442993wme.10.1697455063974; 
 Mon, 16 Oct 2023 04:17:43 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b0032daf848f68sm3114299wrx.59.2023.10.16.04.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 04:17:43 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v5 3/6] target/riscv: Set VS* bits to one in mideleg when
 H-Ext is enabled
Date: Mon, 16 Oct 2023 12:17:33 +0100
Message-Id: <20231016111736.28721-4-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016111736.28721-1-rkanwal@rivosinc.com>
References: <20231016111736.28721-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

With H-Ext supported, VS bits are all hardwired to one in MIDELEG
denoting always delegated interrupts. This is being done in rmw_mideleg
but given mideleg is used in other places when routing interrupts
this change initializes it in riscv_cpu_realize to be on the safe side.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/tcg-cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 418b040d6d..bbce254ee1 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -618,7 +618,12 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                           riscv_pmu_timer_cb, cpu);
         }
-     }
+    }
+
+    /* With H-Ext, VSSIP, VSTIP, VSEIP and SGEIP are hardwired to one. */
+    if (riscv_has_ext(env, RVH)) {
+        env->mideleg = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP | MIP_SGEIP;
+    }
 #endif
 
     return true;
-- 
2.34.1


