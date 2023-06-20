Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12D5EB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:10:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDk-000685-7q; Tue, 20 Jun 2023 07:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDi-00066e-Vo
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:23 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDg-0004Iw-6Z
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:22 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-519274f7b05so6070121a12.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259298; x=1689851298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vdmp9g0LETEOImAoeAZ0vz3CHG5eCYIT92dyMVPeN7s=;
 b=POXZzDwbBxVX8W7rYgGEU1p3NOiohanZdbS6eqbZd95rSQ28b8KjIpQEXgLolavkIl
 U8v5G31gB6S1zxvNNAFb8WR8Elr9DLRUueBe2IVA1yOtFXRF4/38cSj4V26+4VAzcfbC
 QEcCF3hg2l/omEgBApSMvnXihuHqVeL+96Jj+fG8j4zmnqYuv25wmN/E292eFjatEcjm
 XlYOemqRvbJKA9FvbD9Wmxjh1TqD3u7NySWEU6h4G86J0twSu9IZK4lOZG2fS5Gg5jM6
 NBGvFPGxrz8HBRt/tIppt+cJgUAZR4bIQ/83p/VF0qGKUOzOOxzlLtL3DBXWgqEIWgmu
 sc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259298; x=1689851298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vdmp9g0LETEOImAoeAZ0vz3CHG5eCYIT92dyMVPeN7s=;
 b=FQAXCsAtBtJ0l0mQ1LRwbDedcuyNHWo09TqiZCzdl/DO/iCPrgcxcz4P4fD/Ftuu+7
 JMfmx70fccnZtw7glYSLkuEl+0m351xxBZ+3Sd6hRKmeg32o1/PT1VilavEK9CgSzUG9
 q/jUqvHSJlkUkTPM7i2apHV2CQJFgO3GK7xr8jjSklN99L70hpZafsDJzbQ5LgpM9YWo
 OrzK9nOIBxppyaF+j0mSUXjgUafW4nOQafQF5iCjDDaNZKYhNA9ehlkK7aMvhyt6v+4a
 fRtoDnF0b6osGDqXR6JYjBL07EyBtsfj8jqYMkrFOQ0uFwS2uW5rwCTn8Y0plRp3W8Cs
 PN/Q==
X-Gm-Message-State: AC+VfDyBabmoSR1PC5reCKNZfyiKBR0gh9fGbo5uU8+etT/peEua8x9J
 iUAhdOuuNUo8D2tGaJZBE/H9aA==
X-Google-Smtp-Source: ACHHUZ5WWPutOkvLN9+PVTteiYXFt3FURMhofhqJtAFZyhbrrKJGvohnK0+vfx//gXD3e8ClKrqjAQ==
X-Received: by 2002:a17:907:1609:b0:986:4789:1029 with SMTP id
 hb9-20020a170907160900b0098647891029mr11972896ejc.23.1687259298750; 
 Tue, 20 Jun 2023 04:08:18 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/37] target/i386: Use aesdec_ISB_ISR_AK
Date: Tue, 20 Jun 2023 13:07:33 +0200
Message-Id: <20230620110758.787479-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This implements the AESDECLAST instruction.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 63fdecbe03..0a37bde595 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2177,12 +2177,12 @@ void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i & 15] + (i & ~15))]);
+        aesdec_ISB_ISR_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1


