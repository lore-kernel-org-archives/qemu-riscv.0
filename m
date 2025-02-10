Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC51EC0219D
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 10:27:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thQzm-00019E-Ji; Mon, 10 Feb 2025 05:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thQzl-00017M-1h
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 05:26:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thQzj-0001kM-C3
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 05:26:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43944c51e41so7265175e9.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 02:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739183186; x=1739787986; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZ1fgmbr6UR57aQyXOIyNIPPA+qrJvYb0dDxQG0PMFQ=;
 b=YOj/gxdeCTgggDrSyojcYwPe1bwC9uehCGvIslLKMeXzeefyIcBOOZDWVcdsfW2NCR
 W0LH15UgADyzWYXJ7gCV4wEVjefq3DI3p6lcRRP9a1J/srP3HfdojoDnM0djzFLsmHV4
 HmkupWavTp448uxAMyHRUZ0Ln4ib5SoAf42vDx+7T8X4hAfdyGmowxf4/tW9iLnBdjjW
 hJLjKgWWq7Su90gI48aDMjEuXQ6jxJ+ySdXPzbIkONYgbeVkzLEqF1pLPxWOqVmT3CvP
 4D2LmgGKiqe48HwBW3+c3gm0C/tNwbtYOgcWiBiUILi0v30k2xTrsVHpWSsECjgS0Wza
 yvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739183186; x=1739787986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZ1fgmbr6UR57aQyXOIyNIPPA+qrJvYb0dDxQG0PMFQ=;
 b=cfhHV9w96KYqbygIdj5HKD3RE7QSxdwPB3Wy3zeWOOLBVlIGiCoTWDZWlH+iP/jIv4
 oaO0c1ElNEa3cplkSLbDuEQA7e/TQ52+nVE8gXOJjg2uGmV/FqW24anRCtmfrjp4JUii
 lp6MSYCsQeHO6bBwP+iLr1GqtsdkvjWQj2iVQ2LVT400eoYz0mQ6m4+iBPREGVpqZuVI
 F8qz0I9wXiWRqZAP1sTTfZTyab4DzRi1fIopv9Rh009DmZpxiW5qKfD5Ac9O1mltrC1z
 c3U5X+M+kO2Qt+b8CBRvobtC5sB5E2ubBI/MmyYvakQPzSYoMza5fV/Lh7lCX7IhIlk5
 skNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF2mzsawcemyl8WQbPufIJ3V+XlJx4k754BSv2fj9KRzqsuof0I8tk9PJfFeSyR8IPr7e4ejSl/GrC@nongnu.org
X-Gm-Message-State: AOJu0YwrXnYusDUWvlsGol/TKG7dl3gVNF0sxxk1lWgVYrVIch+R68E+
 7QfGZGSLgTIjdLjSQJHTEtrO2k1QBiIVu/tz/8Wt9+PCM2kGtwWjhHSkKI5PsxY=
X-Gm-Gg: ASbGncv9qWdIiYf8yRXvRChagzMzLtvoVnERjVa5HqcWvckKdjlDYpO/S82jnuj29eI
 kf3WjsMzin6DO0XjgiMZasC6cQStqgwopqwFwFJ9kDd0T9uJywa25+V8zJh8/Jj7KZW9JO5W9Zv
 8Wv+QhZbN5cEdsQ0xcsena5Z/LwiEIqoTrp6ggXn4GnZkZCG8GEz+V7nkxEZOFKV1xoPd86msXo
 b4JzSitvSWQIpfAxhjRKukEMjxRpjd4YfxtYyUyEiCUJJJKnYRXDBpKodXAoBS0bHNz2SuSg/NY
 cLoKfdqzkLlHm4za37CH1FU63LlPPYJWp5C+jDvzMAofO9UKoT6CUrL15vFdMVyFphyuHKw=
X-Google-Smtp-Source: AGHT+IF8YzpKZLGjHS4ok2TrSBGEWx7W1lWRfYmFewnlMdq+Cw/FaTKqr2s0y+9c5O5oeC7ftG+FnQ==
X-Received: by 2002:a05:600c:502b:b0:439:3d0e:f10e with SMTP id
 5b1f17b1804b1-4393d0ef265mr37718925e9.28.1739183185839; 
 Mon, 10 Feb 2025 02:26:25 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm178043805e9.30.2025.02.10.02.26.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 02:26:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org
Subject: [PATCH 04/10] target/riscv: Declare RISCVCPUClass::misa_mxl_max as
 RISCVMXL
Date: Mon, 10 Feb 2025 11:25:58 +0100
Message-ID: <20250210102604.34284-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210102604.34284-1-philmd@linaro.org>
References: <20250210102604.34284-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Cc: qemu-riscv@nongnu.org
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 97713681cbe..fbe5548cf5a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -529,7 +529,7 @@ struct RISCVCPUClass {
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
-    uint32_t misa_mxl_max;  /* max mxl for this cpu */
+    RISCVMXL misa_mxl_max;  /* max mxl for this cpu */
 };
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2c..f3ad7f88f0e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2955,7 +2955,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
 
-    mcc->misa_mxl_max = (uint32_t)(uintptr_t)data;
+    mcc->misa_mxl_max = (RISCVMXL)(uintptr_t)data;
     riscv_cpu_validate_misa_mxl(mcc);
 }
 
-- 
2.47.1


