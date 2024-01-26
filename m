Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2206C47DDF
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 13:32:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rTMIZ-0000pt-Pw; Fri, 26 Jan 2024 08:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rTMIY-0000lX-1v
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 08:31:10 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rTMIU-0007bM-E5
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 08:31:09 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40eacb6067dso7838035e9.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Jan 2024 05:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1706275865; x=1706880665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RVWt+St3Ao7R6IQtw+wm6ZjZD9uCy5mKNVtcNByTS0E=;
 b=IeQwgOQ7vBckQ0DNx8H9kA1oX7cu/N9QIfuBZneyUbbRGyeYHVlPAr4kdLntGCDyXI
 yeSMRFhSLrFbsDfyQWRIH/MCJfXn+MmuWCWzMRDqoxTt6GtIeQzzsVU8OFurNPXlgowZ
 RsV5FMoydVE1r0RHcWCES8x14AMIp/haRgI5QEUvE/tVG8jjAGG4fG+s7nPFOjA+E5qG
 hIzxIoWp7cBiZvY4rrOBGlDi/jXR12BoEBBNsb6pXB+Bks2kYTI6Sqc6E4ucXMJ2t5dh
 ZJAx+itjDoyuuwm4o1nrICmBZSYuPwPKJ9fAVTG8/0hXCD+CQJJTOxobAmFi4s4wQQXV
 dkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706275865; x=1706880665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RVWt+St3Ao7R6IQtw+wm6ZjZD9uCy5mKNVtcNByTS0E=;
 b=Kq9SVyRbASQPaiRNwZmb4RxpkeQLR3HJ9JOrwlsNVt1pMi4R/9P++fXbtWgPTkHPhD
 xb3IUlbAUpwbSKoZLPGBjPqtqw1Mk5kvZlZYCsYcGGV5IDwSJxwHZ8fWJXidNU0cdtSN
 mtPLTS3SOHkpsmxmjNfcQO5T5stQ5W0InqPu9tIfE0GlATL2Uwb1QNaW8RePloKogzmQ
 fB1V7w8DBOtJG9prl8ovoAgXMs1DqFRV5VYSxlGR5YknrR0zKGhz5n10QAESbjASzt0A
 FoFhwbIiHVRAngULYlvbK5doCxwv2yCR6fE014rFhUw1ZLihEqYHgQLcz/IV4EmHlS0h
 EP5Q==
X-Gm-Message-State: AOJu0YwJEp3lx8Dh/k/Vv3KSlReqORBvG8jDxnGUq9Dx4GV6b/s1vgnF
 hL2ldIs3ih0TZtt5pppVc3wGJyf1PoR3A+ATNHqjfbHlEW3yFri6ffF2oh+PUbY=
X-Google-Smtp-Source: AGHT+IHP6LQoTNmZHR2oodocUL7BmkJZvjTK5udXH74C2vxgw35NBxU+8nXWncJRB05FM+LlJS0KJg==
X-Received: by 2002:a05:600c:3785:b0:40e:c7fc:a44d with SMTP id
 o5-20020a05600c378500b0040ec7fca44dmr547990wmr.355.1706275864754; 
 Fri, 26 Jan 2024 05:31:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 b26-20020a056402139a00b0055c4c97b1f2sm591166edv.91.2024.01.26.05.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 05:31:04 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 dbarboza@ventanamicro.com
Subject: [PATCH v2 1/6] target/riscv/tcg: set 'mmu' with 'satp' in
 cpu_set_profile()
Date: Fri, 26 Jan 2024 14:31:03 +0100
Message-ID: <20240126133101.61344-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126133101.61344-8-ajones@ventanamicro.com>
References: <20240126133101.61344-8-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Recent changes in options handling removed the 'mmu' default the bare
CPUs had, meaning that we must enable 'mmu' by hand when using the
rva22s64 profile CPU.

Given that this profile is setting a satp mode, it already implies that
we need a 'mmu'. Enable the 'mmu' in this case.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index da437975b429..88f92d1c7d2c 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1107,6 +1107,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
 
 #ifndef CONFIG_USER_ONLY
     if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
+        object_property_set_bool(obj, "mmu", true, NULL);
         const char *satp_prop = satp_mode_str(profile->satp_mode,
                                               riscv_cpu_is_32bit(cpu));
         object_property_set_bool(obj, satp_prop, profile->enabled, NULL);
-- 
2.43.0


