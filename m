Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C72C02182
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:47:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6to-0000Ki-9B; Thu, 23 Jan 2025 18:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6tQ-0008Ah-6x
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:45:49 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6tL-0004P8-RB
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:45:47 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso1183752f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675942; x=1738280742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GOf7cXhzVFnELwvvE/9oD0dVEdIwULgdsVx2rdQEX18=;
 b=y9cJ233jkEU2cGiX4rydtYd7iaCv5DVQkPevCFChp1S0C0KVzJuAEk6EL8NVS2Ybwr
 fw4tlRA4hoYwW3Vp+3mnwdol8qnGX3koIrOYLL8AIlr7DSGtQDxvE5J77CtOCtAhjiKr
 9cMJZkFi9C99mO3W5fxZvrbfBt6BOYAAmBzmnk8KVtoNBwSgUq5miVijVjzyKjsgb9DI
 IWbdJInt3o4UT5Al3lYATYeI4lJOiyMYp7BbVo7OLIREWsGv+rrDLuzygqUCzzU3/2DH
 9Q29QONNT59iaioLwVHIXkC+bPAmMKI9MMvkYP2azlRpFiQXYtBB3bLEjLBKI6TtC7cr
 cvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675942; x=1738280742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GOf7cXhzVFnELwvvE/9oD0dVEdIwULgdsVx2rdQEX18=;
 b=ONuHaahx5kwfzrhN53w3cI7J2sYDpTB0DFDkKjfrAmg0ZF485hUJenBhY4ivLwE+CR
 +mZjrbcOs0ccAKOq8cIR6wNkwGfWQvffh0ZN2anuTR68Q30vQYoxp7SwTBDrjeBo6VK2
 2xbKo3nrDSuF6Y7pvivQI7pyyyxYs9cldaAUSNGVY9xxDpzb1SNvNLmE5weCsbe3tMUH
 SB2mDl+rBwc0+WY4Zi3pT4N3gOlqslvN8C61QUWk9NO6itbwXOWVAUjdhzZnXgCK8Rkz
 Ql+uKvDUsnmisUm2/NyVqolowwe1MjL5qwSX11fcxZFhnPER6N64Y+nZIExoRTCmEhs5
 OWcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7J7yeHiQ98E09Mh661MTFx3oiwrrIsxMueyLlk+pAV/nKG9bq1m4EdMlyKh9HYGHGtoMGklcL21xq@nongnu.org
X-Gm-Message-State: AOJu0YwFlLVH5iwW08Gfsr5O574wEvFl501JmpUKwit3A3jRTbPwVkrO
 N6qdKWxSMMQC9+iPovqR68Sn2tU6t41R1WDxRbuWf740z4MK/mMQ4rku3ESi/Wk=
X-Gm-Gg: ASbGncsKJoAuBXKH/YSlQZJda+a8W4bbBONcqjOfctXLuqpgagyvbpzAMIt6esPbwWR
 b/kd3Ir0lv6TZRSU8ZglJBnMImw803MLFVlu6WQWzwOkfNTRYbYraHlH4/7IdHaFpScB4dG0HQd
 hVggX46Vm4h3op1VjlK9ZcH9MZgVMT7KaazIDfIS7H1JDtmSB7DwUJLBFvPyCn0ENMka5kV9oC3
 7mNT6FtJOW1HeGhi0TfWPOxF+FH+nwxszOoz6vetqQTQspf5SAlVd/ljeEFULztn7FpRYFhjrjg
 fLMwDZOWB0F9e2pEw85Xmgg3WKCDwqqDLKf9eKUXuSxGMrlFB3N5BCs=
X-Google-Smtp-Source: AGHT+IFFvdlRkBEFpuvRapz+0/bX2s0BjBYZ6M4itb1IiIpdMWapxxpC9ppUNuB95mK5m+Q7pE4GZw==
X-Received: by 2002:a5d:47c9:0:b0:385:fb56:5596 with SMTP id
 ffacd0b85a97d-38bf5663956mr20431872f8f.19.1737675942270; 
 Thu, 23 Jan 2025 15:45:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bad87sm971133f8f.74.2025.01.23.15.45.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/20] cpus: Fix style in cpu-target.c
Date: Fri, 24 Jan 2025 00:44:09 +0100
Message-ID: <20250123234415.59850-16-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Fix style on code we are going to modify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 6d8b7825746..a2999e7c3c0 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -47,12 +47,15 @@ static int cpu_common_post_load(void *opaque, int version_id)
 {
     CPUState *cpu = opaque;
 
-    /* 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
-       version_id is increased. */
+    /*
+     * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
+     * version_id is increased.
+     */
     cpu->interrupt_request &= ~0x01;
     tlb_flush(cpu);
 
-    /* loadvm has just updated the content of RAM, bypassing the
+    /*
+     * loadvm has just updated the content of RAM, bypassing the
      * usual mechanisms that ensure we flush TBs for writes to
      * memory we've translated code from. So we must flush all TBs,
      * which will now be stale.
-- 
2.47.1


