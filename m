Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E6CD0E6C4
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:56:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqiJ-0004tP-IL; Tue, 25 Nov 2025 05:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqiA-0004Y7-SU
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:55:57 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqi8-0001p0-UT
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:55:54 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-429c7869704so4458737f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 02:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764068151; x=1764672951; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQ3G/f5z9MwEGa9QMBSOfQ0OhqIrmAfETxxhBlriST8=;
 b=HW6ICViWFx8fuSrzOcD3jeSkj6qEn196PIb5nJnkcVf6mwMMiWEest23aJ6iS6oaBG
 6aJFQlwLlAgxF66RadU/Y6/uoZGSjnk3q0e3b75EcSW94Cbh+tmtusREBacM2zN2Anz7
 zk8PVRuuG0oQjk9xagBy6JsMNYqm/pIT7aTftTTF59ef8E/zD5qZg/OcHKV/XVbMbrcz
 D9voG5wGgJxmmpc0DbDNf8EhHcA4dLrQdzHHUvZSOv+tD1dWxoSg/DU3Ef3RT7lt/Dwr
 11gkUpl/M2yOgK0MyAqcGAyfe91kgVArvx7LPtA5asUGuQg/n7HrNtHpLCDqv6TFpuaa
 Ew2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764068151; x=1764672951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yQ3G/f5z9MwEGa9QMBSOfQ0OhqIrmAfETxxhBlriST8=;
 b=lULOdbnhh/V6sSSK5TtGJfvEYOyI1rk5LM+w8im23HrEka7e8CAKaeyfoozIYuSEt/
 S3dxqkfW2/M3pHdlwQsqzKPgyrq+/ZGGJHV+QzZJnCj5YYVu8jmUdXYArK0270fkVmkp
 PcpIWX2GMUD0h5SCIuQ1WCWLe3BHzyNDq1xAI1FZems1j1KAlEQZaRUMv0QHd7OZ3ATi
 g5Drn/Bx+KDC+wmAXbW/PjAccHA+w6spB1pUrrPWkJHnRe7Ow6a/4YjqJsFmUVgLhv1C
 +dYnm6mFNaRtPkannKQqHA9ahMQjooy/lL0YnmAIeSOSeQ54P8h0vdbp83DYuHiMKNWP
 kb9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyRs2eCeXlYdSjbzp9nDl9+3/aaoFhE6H7PXbftRaYYaFkZsofkmaS07yHW5Hm6aXKapSZ9pMIzQxG@nongnu.org
X-Gm-Message-State: AOJu0YxcvunE6JKOh5ZoJ8Low6gbbZ75tEIfP5T3IFuFbGSPJ02ID7aG
 HPBiwkc0TvjdXssDwNIk8sB1lyUsSnvLLXXHxDtseI54C7i+07kHdZK9dpBzWQf5soo=
X-Gm-Gg: ASbGncsqaMGdZZ6r8U2AVtFwRIlSOTzxX590pR0IycQzGxefJ3EttazpENfkKm8ipsS
 qMQ+f3lkOf00Q/uGRcSr1EVu3P7utCWK9Slpobd9D6aTplPtCKWFIX/LixBkK7bwZKI9MQWkeMT
 b4WRonJ4T16sxOWG4KlyUiTTTxW5v7Rbbfg/fpLkKL851Z6Y0HhBhugOLJ8WPeV0ehlT2NiCH18
 ZK8uc8CFGvwPrm+TZF7LkVnmOsnMkZJITmqyWqAluBHx5S4XdlbxoIWdlsqblvvNCXKbkDXcWTG
 J6pFV9DSjL2uEPCCI3csg0PKcvbGLWXpZm+CatFlbB85q21oXEtNpOxP/fXu22JUQdUsGBgXp9J
 tRgHCLmb7GnnBFluDm3eVsu4RCV8FecKO0M0a/c3NRjkp7QBlc5qEAXa6jcT4ldrqY6VTQ4l+MB
 PuULbSijwWluxETa9W9YC2XqOtZZ0RbJbomcYEkrw0b6lMJ5nXMIu6nmuKN9btzeaDFp8bk24=
X-Google-Smtp-Source: AGHT+IGmr8rG25zaL9CLrRLJSz/n7IqXyNjVat0SFDPCDEhkxdniYE3qgen3PT1iXCuE3DIPg9nYAQ==
X-Received: by 2002:a05:6000:2c0c:b0:42b:38de:f00b with SMTP id
 ffacd0b85a97d-42e0f33f7d3mr2380017f8f.35.1764068150673; 
 Tue, 25 Nov 2025 02:55:50 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e556sm33315291f8f.5.2025.11.25.02.55.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Nov 2025 02:55:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Subject: [PATCH-for-11.0 10/12] target/sh4: Replace cpu_stl_data() by explicit
 endianness variants
Date: Tue, 25 Nov 2025 11:54:31 +0100
Message-ID: <20251125105434.92355-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125105434.92355-1-philmd@linaro.org>
References: <20251125105434.92355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

See commit 852d481faf7 ("SH: Improve movca.l/ocbi emulation")
for more context on this code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sh4/op_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index 557b1bf4972..63515cc5e6c 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -143,7 +143,11 @@ void helper_ocbi(CPUSH4State *env, uint32_t address)
         if ((a & ~0x1F) == (address & ~0x1F))
         {
             memory_content *next = (*current)->next;
-            cpu_stl_data(env, a, (*current)->value);
+            if (TARGET_BIG_ENDIAN) {
+                cpu_stl_be_data(env, a, (*current)->value);
+            } else {
+                cpu_stl_le_data(env, a, (*current)->value);
+            }
 
             if (next == NULL)
             {
-- 
2.51.0


