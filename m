Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38D8C0218C
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:34:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFB4-0000aS-Aq; Tue, 21 Jan 2025 09:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAv-0000Wl-Sp
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:17 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAs-000342-3f
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361c705434so40942115e9.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469452; x=1738074252; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GxmkPvBiu38d4nUnNXUTFzs0Gc1uo0/SVUn8XW+hnMU=;
 b=TjRGMuDOEFgJpuQbrjpiGAGfGLBjEeUWM5sfnTrFiYV9bhsUhPig3Z7YzBkdKgVL1Y
 411d6tyr6Wbrnlt7qGoECwX05YYWKssi23GenIOtMfdoPOXVIdw/8dX3MDBYkfZ21FKL
 MVrbGTTvHLPLDkODw15gwrH8mQxnMUVjAooWGOUWQ5ei8Q8475WA2KBJUdnq+9lTG9Ec
 dB4+tBiC7WKRXpZrA8vK5Lq+5nbXdzfy0LHhPd5aA/hiDMdH/wLxtBJwc8Tsu+aFmojr
 QvXfepxz9v52KHHiXpARzUai+KYGqWlxcsgP2TazembSabebXUuz11YLqzKX3/OksM6U
 jgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469452; x=1738074252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GxmkPvBiu38d4nUnNXUTFzs0Gc1uo0/SVUn8XW+hnMU=;
 b=ja9Qc7RYSpjq6KeZOc35B3KsV4kSQkT9xvB1GqhSVanOn2gNdEArn96EPN50+XRPHp
 zEEB7SoeXPQ5OgALS6C4z66e7ya9CTQ7rLWpoc51t2Y1zJGaeQz3txlhdi52NqxgUlFj
 Mr07SKrY5wYvq1NkjqQBTGNJ0KdlRNfIcjgqGfN6DlqX7JfTxb0+qk2pQ8iSktwFoPUZ
 JF8UHZ7CvAcptoUobOm6AnbuA4cPpeNlUPzZ0Ss4EAORIY6LNsiJsvmR25eBw8baz4tK
 wlximiDxvs9uNv+UPlzHs0kih2+BWOazkTyjAoEDT8vE9PeEGPdCWOENxnf/Obq7V0vS
 jwyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW91zq6SbQRftmTomWgwJaf7xmM4mGETH6kffbu2wXnqe8t11qavCaXP+tn9QTFsOr7bp1UnrqYmcF6@nongnu.org
X-Gm-Message-State: AOJu0YzAc3XZ9fJJJeKnyj3AqQhk/VKpaFm9PHoxZNwpKIk3am7o0zbm
 kGKUhvs/pmqwTchOyv51NIblEYEQaZmChgF3KzUV42osALqx2qnknaq/47R3U1I=
X-Gm-Gg: ASbGncvGA0rLcAM3En+BntEMqClcHPxRURM7LrmC7ZuUSsHi76HGSStj2sAZ4MUZoki
 FU1fumX9Kttraq4gva9p4GYLNsrxN0qBDXGhMc7O+rBiXCOr5Wfa5YuxVd4wN3RRZaBsqN6xEMl
 1w8bUfTfKtkho8laAPz5CVc2Wuyd+VSDPXv/Bn8bIaWPlPlLiDCsCsxky/YRBgD1BUyWGVC1f38
 5hfR50uKJEW+xCq5Ra18vqhaYSHj+JVP7CGsFbOo5aG7T+6H1/C4bU35bJ5oGFcv5Lk0DhK86ds
 Ke2jLgy5Z3UcbdaP9PuINucWTbKN+uDxxO4zgPnodgTn
X-Google-Smtp-Source: AGHT+IFZrFESwsFNUaYJimOkejXsWSHj1fmxkyRQ7dWj7lO3cgLc/tLtR93I3PvPnuqUDGaw2gsplA==
X-Received: by 2002:a05:600c:4511:b0:434:f871:1b96 with SMTP id
 5b1f17b1804b1-438914388e5mr185146615e9.29.1737469452073; 
 Tue, 21 Jan 2025 06:24:12 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389046885esm177866955e9.36.2025.01.21.06.24.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/28] cpus: Un-inline cpu_has_work()
Date: Tue, 21 Jan 2025 15:23:19 +0100
Message-ID: <20250121142341.17001-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

In order to expand cpu_has_work(), un-inline it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 6 +-----
 hw/core/cpu-system.c  | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e094d54949d..d64c823e768 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -756,11 +756,7 @@ bool cpu_virtio_is_big_endian(CPUState *cpu);
  *
  * Returns: %true if the CPU has work, %false otherwise.
  */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    g_assert(cpu->cc->has_work);
-    return cpu->cc->has_work(cpu);
-}
+bool cpu_has_work(CPUState *cpu);
 
 #endif /* CONFIG_USER_ONLY */
 
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 37d54d04bf8..16d5efee12d 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -23,6 +23,12 @@
 #include "exec/tswap.h"
 #include "hw/core/sysemu-cpu-ops.h"
 
+bool cpu_has_work(CPUState *cpu)
+{
+    g_assert(cpu->cc->has_work);
+    return cpu->cc->has_work(cpu);
+}
+
 bool cpu_paging_enabled(const CPUState *cpu)
 {
     if (cpu->cc->sysemu_ops->get_paging_enabled) {
-- 
2.47.1


