Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFEDC3DA6D
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 May 2025 17:24:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uHQgv-0000tp-Gj; Tue, 20 May 2025 13:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uHQgu-0000tC-2h
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 13:23:48 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uHQgs-00059a-GK
 for qemu-riscv@nongnu.org; Tue, 20 May 2025 13:23:47 -0400
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4c34dcdaf88so2198940137.2
 for <qemu-riscv@nongnu.org>; Tue, 20 May 2025 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1747761825; x=1748366625; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FbnhFvL+Xckg4Tz2j+XMYiP2ecfnROLPqe0PL000DBA=;
 b=gWA+v56tiTdTn9fvwI/8oeyRg8/PIhrJea1hzg8EEOVp7+duyu/ZwfPbQcPn0ooDf9
 BUEJMzx8/G02AwZWd9G5dsDduR0FnkLSiTNtaSnPIpnGLO27olsDV6Pt5ku/avSDAlyh
 K4mlSrdMr3pnpOE5RvFkEDMMc0vEems62U+tYB9koBRwkZNKBlAK6b/XeZVkx+1IMZHF
 jKy6VHuiHtAGIkoWzbnjP5mxfRHLbZMuaMBdTX1Ai56b7Y0r8pQUDMr95LG430VF7qXb
 oewCbPkDEhoraaBzH2EDwl+0Nfwm7TOcdcBWuvV4YfQVMWwBAo8hyV3W+iEO/uwlltR4
 9iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747761825; x=1748366625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbnhFvL+Xckg4Tz2j+XMYiP2ecfnROLPqe0PL000DBA=;
 b=aOOm5dJrMXVeyk6zHr9QegwLQdGA+fRhSkfZS5KNXbZrnlTgjLs/CtvEjKRQGxyadr
 kE9i4ls0srzuCJ6kr+H5efpnyLg9pavijQFZsTuCOhBkqxfuTehkHaP+ByXEdkuQhyGO
 YZg03hOTqckXtIp4YWxPXnONm+l+d5iTgEvLyoTimOcnjwnyT5f1VBFXAHqpZ14YanZR
 KbUubDgNkIr7V/0ZazTWP1tv+fVxWcttXOmmSLorqEfisf7whFzXee8UlsGd0xC8DhTH
 7j2LVCUhDkKzIxMMw0Zv5FdR8DbyPLj/xNJSbG1+kVphJt6u239WqXUfZPZrQ4XaJg6v
 T1rQ==
X-Gm-Message-State: AOJu0YwVIbUbnHGArKZ6IBgOz9hAANLaXkJ+sGtDWnyPaG+G0dIaCW6i
 wEbW8fR0miHjnZKhKZg39XAaHINw4NX0w41OO49Hk4CDpJb67qR03X5HQNFntKj2Po8=
X-Gm-Gg: ASbGncvYAgQ3mWCwoNR5rqFYgHjgRUjumJL9+2bksHDivWsas0PPsidbBhTo5YXHpVO
 kY4wU3IVuoEvQr9x5U22k4avgTwSDLiM70YrCR1GSPi2Ri4cz95Nl+ar2AnT0bnaoek4IVfDPcB
 KWXB8qo4ybDE7CPuhdKBMZBQMwcvM4jRbIS3ZCTu3xVbJYUdPN9b7+u4jH62UXCbMCjJOIJ+X2v
 e6JbsSgg4mN58EKXNlAHT0JWB+mFE1knWB+PwUEaCxVGLK/iQZpqgM6mUAmxQxmjKnLJVRxZNW2
 eJQ3TFZzaN4eSyu1LwOBCSi7X7bHqNY5p/1jdWS42EQT7AppahIyna5lmaMBcqXvcUrI4afo1wM
 gRE5H
X-Google-Smtp-Source: AGHT+IGOgEu+tEofSgOTNiQonWjrnQ68QbK3YPqIOxqVfX57GgwmwPMSuayNBhioq9aPqCZGE6yGvA==
X-Received: by 2002:a05:6102:548f:b0:4da:e6e9:e008 with SMTP id
 ada2fe7eead31-4e049d18e88mr14192572137.4.1747761825558; 
 Tue, 20 May 2025 10:23:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.250.131.100])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87bec155e21sm7698107241.17.2025.05.20.10.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:23:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 bjorn@kernel.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/3] target/riscv/tcg: restrict satp_mode changes in
 cpu_set_profile
Date: Tue, 20 May 2025 14:23:34 -0300
Message-ID: <20250520172336.759708-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520172336.759708-1-dbarboza@ventanamicro.com>
References: <20250520172336.759708-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vs1-xe33.google.com
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

We're changing 'mmu' to true regardless of whether the profile is
being enabled or not, and at the same time we're changing satp_mode to
profile->enabled.

This will promote a situation where we'll set mmu=on without a virtual
memory mode, which is a mistake.

Only touch 'mmu' and satp_mode if the profile is being enabled.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Fixes: 55398025e7 ("target/riscv: add satp_mode profile support")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 55e00972b7..7f93414a76 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1338,16 +1338,16 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
 
     if (profile->enabled) {
         cpu->env.priv_ver = profile->priv_spec;
-    }
 
 #ifndef CONFIG_USER_ONLY
-    if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
-        object_property_set_bool(obj, "mmu", true, NULL);
-        const char *satp_prop = satp_mode_str(profile->satp_mode,
-                                              riscv_cpu_is_32bit(cpu));
-        object_property_set_bool(obj, satp_prop, profile->enabled, NULL);
-    }
+        if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
+            object_property_set_bool(obj, "mmu", true, NULL);
+            const char *satp_prop = satp_mode_str(profile->satp_mode,
+                                                  riscv_cpu_is_32bit(cpu));
+            object_property_set_bool(obj, satp_prop, true, NULL);
+        }
 #endif
+    }
 
     for (i = 0; misa_bits[i] != 0; i++) {
         uint32_t bit = misa_bits[i];
-- 
2.49.0


