Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F143C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:12:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhJN-0004iS-4v; Thu, 31 Aug 2023 09:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhGI-00046W-AG
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:59:07 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhGA-0005kx-6u
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:57 -0400
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-76ef03f76c7so42725085a.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486733; x=1694091533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5bbQfYGZZhyRdQ+SvkDiLWY1Nv20tz8tbv49oHFS9o=;
 b=M9Kat/cjpOlQ4+vKeehxL0ZEAhBnTWjoAVq2lrBsC41Cv76EbGJqlK0c41PF1KA9oe
 zT5iegc6BRHpyKo0C15n4FFT+uavz+/xeYTohsNFKqn7pSukA/wg4ltULf4aRu4qY3ub
 76VgYQa+nFm62a0dEtAFIE9yreLgWhQ5/rQyyTWOOUsAzMDOBVqNNtTs8Tgse9peZS87
 Zo/I89VYStVcc3RNL9Wqbf5JPwwIRlmxyN+GFzuC8qs9069O6vbxKUAEj5KgivXpQiT2
 IB96Ow6jzI00aloAeg1ml0paT7kyV6/FSV2ss42whd5C2JWH1jCrqDuuuwKkeFCqg+3X
 fZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486733; x=1694091533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5bbQfYGZZhyRdQ+SvkDiLWY1Nv20tz8tbv49oHFS9o=;
 b=jHu90P/2htdDgy9fmPunNjrH3lJ2vS0juTRIcG8/PfR7/otDn7/rJSB149xhT4EOHc
 RHKSui7B4wZsYYwrtCK35BHZjrnuIhT5RPf4Zz+OLIQIDzrFvmnLQicCEuTyRlK8pVPq
 G84O41i27uAdiuZ9bcDbvdf5isbL12HZKZjWR0mIF7nJeMYKuhqw1NRP46agzIDU3+fS
 U9EewTWd1Iy6bmfoR4UW8MoL9uyIXhx6Nw1F9L7XfYxLyQXLJ0R/qMVcqsUOXn4HCrZv
 qw4WWPnH17tFD7c4jZ6F6o42y5abbxhUcD+G3J8sMcJ5mh0+CkCFX374Xv06SOt5fW7q
 hU5g==
X-Gm-Message-State: AOJu0YyXspacfw6evYcwDD4AXJCYxDJV+yq5N3v/5HXAW7AaUxo2r0yZ
 aD7d1YlKRn8yJaQB01LYUdgJzw==
X-Google-Smtp-Source: AGHT+IHSW+yUN1e3QEfwoIt7a85zO9JIx6I4sMjkHWm5PSwgA+H4gEM/01+PRHRrH/VU13UgKf//Qw==
X-Received: by 2002:a05:620a:17ac:b0:76c:aff9:9f27 with SMTP id
 ay44-20020a05620a17ac00b0076caff99f27mr2915897qkb.59.1693486732897; 
 Thu, 31 Aug 2023 05:58:52 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05620a03c400b0076cd2591629sm576981qkm.6.2023.08.31.05.58.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 21/41] hw/char/pl011: Restrict MemoryRegionOps implementation
 access sizes
Date: Thu, 31 Aug 2023 14:56:23 +0200
Message-ID: <20230831125646.67855-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=philmd@linaro.org; helo=mail-qk1-x735.google.com
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

The pl011_read() and pl011_write() handlers shift the offset
argument by 2, so are implemented on a 32-bit boundary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230710175102.32429-2-philmd@linaro.org>
---
 hw/char/pl011.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 77bbc2a982..73f1a3aea2 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -358,6 +358,8 @@ static const MemoryRegionOps pl011_ops = {
     .read = pl011_read,
     .write = pl011_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
 };
 
 static bool pl011_clock_needed(void *opaque)
-- 
2.41.0


