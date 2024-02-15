Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67B3C4829E
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 19:31:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rahQA-0001nJ-JT; Thu, 15 Feb 2024 14:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rahQ4-0001kv-Vl
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 14:29:17 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rahPj-0004hz-GF
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 14:29:15 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d94b222a3aso11769465ad.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 11:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1708025329; x=1708630129; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gEt4deq/UXy6XjJi0lNE/l34mZOHICza+3YtE+V4xPU=;
 b=aLXYWJAH7BfLmCtSEjsfLQENezwx4n7JvzqGWJuc0o6ZUU03Yb3fYU2RWYziSbT1uL
 kwueU/j4N9mirvNqZ+BfjQ6tiKuma1DwHTzw4R5XC2bDvRsjj+VFXme5aUNdhmovB5j+
 agyWb/Z/BjvkSw+q3p/Uc4d5KAtugPz6zPw7BdZsqJP6Njhx+ma+HbiAav8z+Pl1ruXM
 4TWzxKqB614QgmcB616Js3X0Ir4JK+ncQtL/ekDn11Hu/GeAt3hfU9Z7TbFBjgfxy7Z5
 QCq/3ZwnbBUDwLkrSdyePr7El0q2BaiUSiXAf/MLivlvXQS1ir4K9ZsMO2h8zH7atXUB
 uZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708025329; x=1708630129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gEt4deq/UXy6XjJi0lNE/l34mZOHICza+3YtE+V4xPU=;
 b=vDyZmQzPZIx+Eo5Q7mFOluSHssVAPoOj5/jY3gFE51KsGs3hASnk5UfiMX+GQk6xct
 4V3vn4ux0YTtaxGijqpv+uiPd8pvXt9mbzhCIOk9mLFpbIUBW6IR5b2jYma62obG4Hgx
 zJ/wTX6XbGeN4ue7sRUrDdq2Co+DHH7g4cfORa3XUKKpEHWSutnp5w+D+a6JGozOG71S
 +O+zIcxEglEmN59y84nh9dx3CFNVMQJjIfqhkwXekfyO3L53y1NU7dQM1p8DbUBZRG43
 Mm04ttkIqhv0BYc9rK+ugg5+FIxiWa/wguf1lhyRtxquPibxLdjyBTDZk13CIuXGprZb
 VMCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ5k7+tX4xNR7LSDDWF9VawFwkUzeg3aqS1i6aaTrTkX9uCySHEphuzy6/rWaitZG9BPSl30xauaAD/A+ukiOVg0cUJEE=
X-Gm-Message-State: AOJu0YxOiBEFaNKK6iANjjFdV7FgOJSZtvPCu+WqI62WU2JWxOzOPhia
 mBH967Bx76k8iK9yUzrKum8cYvPIFfsW7AXaPSDJCNS8/Zk9fzV7LkMQ/ad33qI=
X-Google-Smtp-Source: AGHT+IGHAHX1Tw7jQlHnb04leAp3wxKMj30AYnshK4kIzS48wvnjbVhwfahXCANJ18i+CPSkRl/wkw==
X-Received: by 2002:a17:903:24c:b0:1d4:cd4d:923b with SMTP id
 j12-20020a170903024c00b001d4cd4d923bmr3115439plh.54.1708025329019; 
 Thu, 15 Feb 2024 11:28:49 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 u8-20020a170902a60800b001db5ee73fe9sm1618653plq.114.2024.02.15.11.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 11:28:48 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH 5/6] accel/tcg: Inline do_ld1_mmu function
Date: Fri, 16 Feb 2024 03:28:16 +0800
Message-Id: <20240215192823.729209-6-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215192823.729209-1-max.chou@sifive.com>
References: <20240215192823.729209-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 accel/tcg/user-exec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index c5453810eee..803c271df11 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -963,8 +963,9 @@ static inline QEMU_ALWAYS_INLINE void *cpu_mmu_lookup(CPUState *cpu,
 
 #include "ldst_atomicity.c.inc"
 
-static uint8_t do_ld1_mmu(CPUState *cpu, vaddr addr, MemOpIdx oi,
-                          uintptr_t ra, MMUAccessType access_type)
+static inline QEMU_ALWAYS_INLINE uint8_t do_ld1_mmu(CPUState *cpu, vaddr addr,
+                                                    MemOpIdx oi, uintptr_t ra,
+                                                    MMUAccessType access_type)
 {
     void *haddr;
     uint8_t ret;
-- 
2.34.1


