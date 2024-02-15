Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2807FC4829E
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 19:30:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rahQC-0001om-Gl; Thu, 15 Feb 2024 14:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rahQA-0001nM-R2
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 14:29:22 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rahPm-0004iX-TH
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 14:29:22 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5d42e7ab8a9so977282a12.3
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 11:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1708025332; x=1708630132; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hnoQZWyM3IQrdfNlHpKnjwy/1Zr4Y+mdXFsSbK4jOXc=;
 b=CtdvXNJ4VbnpEP0ovK72hVQ2e6ihvnIHCCvhQ5BFEq3My4WXqYYvmIMyN/PtfFL5uN
 FnRnHw+zOcpYl79z4uQZfjUgNYr9NtndKML7XPMcN1fYvONv8ZvV3lbU7s3MViuy4y0g
 Y4Dx27UFdLgDfzVoD3YV17SKPTT+HqBIONrSxcQN84uRsu7JmAYP6EtA9i/WB1i6kMSo
 ZJFmBWtcieSSuPrrqan932hvPB5YjYekqWsljeGq5+uahqoX5tKKTcMmPVfKondu/A40
 3gEl1DfRTm8fFGe6GnGlJFP4AYQ3y8HmjOJJd9cD66V22N34YmaOErdweeYBh2/szn5e
 25Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708025332; x=1708630132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hnoQZWyM3IQrdfNlHpKnjwy/1Zr4Y+mdXFsSbK4jOXc=;
 b=cZEoIuySZuihvt4YL8/uHBGjMUPAugRuCOzjkr9CIKyCJg5+QxO9n3GV1WzVmSdrp+
 9XwiJU8MnluR4v1NwZHJt3Vdb6YtLbLGY8oBURmbn4Lc9Qy7+DxH8W1bJBJz2m93kZks
 KhRmZO9TgVehjQrOOnb0QUEqXEIlRW0ZcEdUBa9fcYcVaFVfi/vrE3TP2uZMDRqoDxx2
 d96J+tMcOJptJMnDF9sQsW0UqCpqGDRz7EP17/MjocCmWPMKHguMRz2i9GO4Ssq+PBLC
 tVE6/EFPDT0eOW3yVbWdnEw54M3O4pUm6Zda9Q1jTIVkJojZDa9vK4asoAZn5eIv8166
 Cr5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJU2PVUSMp5xnw3aTC2xV8GmrIWfI04Xb+g7pl/qDEjd36CV0QZM7z9z7s0biR0VJ+E3A52EGPCMzrySDTA/zodZfyjmk=
X-Gm-Message-State: AOJu0YwxvNLAYS0S5xCJJleQDstoN8VLi5xhB8NM2I3TvwGY/AhFeiHq
 oVKMcWk+cc6RFtQS5VTMPbWNaBcNJF3WYdG19TsFviEZEwgbLMR9NlDcY3QSzJY=
X-Google-Smtp-Source: AGHT+IG5YuTs6vjhF3Bi69Xsf/3ASVE8egLuLKosMtoQKuXI34cy1tP7UDdbE3vL9XaQUz9VElWqJw==
X-Received: by 2002:a17:90b:154b:b0:299:ed7:24fc with SMTP id
 ig11-20020a17090b154b00b002990ed724fcmr1910269pjb.49.1708025332282; 
 Thu, 15 Feb 2024 11:28:52 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 u8-20020a170902a60800b001db5ee73fe9sm1618653plq.114.2024.02.15.11.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 11:28:52 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH 6/6] accel/tcg: Inline do_st1_mmu function
Date: Fri, 16 Feb 2024 03:28:17 +0800
Message-Id: <20240215192823.729209-7-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215192823.729209-1-max.chou@sifive.com>
References: <20240215192823.729209-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 accel/tcg/user-exec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 803c271df11..9ef35a22279 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1050,8 +1050,9 @@ static Int128 do_ld16_mmu(CPUState *cpu, abi_ptr addr,
     return ret;
 }
 
-static void do_st1_mmu(CPUState *cpu, vaddr addr, uint8_t val,
-                       MemOpIdx oi, uintptr_t ra)
+static inline QEMU_ALWAYS_INLINE void do_st1_mmu(CPUState *cpu, vaddr addr,
+                                                 uint8_t val, MemOpIdx oi,
+                                                 uintptr_t ra)
 {
     void *haddr;
 
-- 
2.34.1


