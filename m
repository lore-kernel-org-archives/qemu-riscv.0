Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC834CF8840
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 16:34:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swlG4-0004Pz-Vt; Fri, 04 Oct 2024 12:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlG1-0003rv-Fm
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:34:21 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlFz-000651-EG
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:34:21 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2fad15b3eeeso28107911fa.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 09:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728059657; x=1728664457; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXhl0xEMfTxY7A/pldYaZefOo2LKk36HnCJi2vt2Dc4=;
 b=SzPpt6RHFygxgf0Zop5pieCHNBIXPTQOBvuzK2gY1SvfRXzASxyhtbOif9L2LlovnS
 +oVmthXPOnKG8fD+l1szHZVtIyWMioabCayNVKK3M+cgwOQhAmdo6QgBBelOJGk3pbkF
 XoFpMQDYDtWDhhqlKrThejqewClb61RXLZsHfKkKmOenr9AGFVC17lx5tBozbI+FJcdl
 6bhH79IIi3Sy2ADUDStrpTL93tRoil+sTlNzOSYhHBqiQloGTW6yhKKTBBWqe4T/TjW+
 RLMfzwRnYAllJkhA9qVBMvGXqKPNHWGRE7u23IBIyVLNx7wFArcdiUmPbnMhJF++CN/X
 8LSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728059657; x=1728664457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXhl0xEMfTxY7A/pldYaZefOo2LKk36HnCJi2vt2Dc4=;
 b=ibxLQQEfzqRI2/PE9cr+l7ItpSKFL5T/xVuB9zs6KT9362GcvM271WCha2eJ7PqoOE
 Zr/qPPFetQiOAQwZRiN1mXwkHnigda8nrV+WZtbo9HurQI+6aMWD2Re4xizZSpP5uUSA
 7PExpVjEYs+/BSJ4mj2Eazww4D46H6oIhPc9WiyEm9SI/M1dv3cr3pBmS7GhU3oui+jg
 hUcVEyy9bKZ3QTKy1H0eGBd4vPcxuUj9ulo9l2+I9voNCDishKsfd4MjjXWtcB7XgGWf
 mvyUawUYQThHRDV72XAUlA38m+0w/INw1nUUXSo1yo4RtfOn0tCNvu84VHSgoQxqNG9V
 nI8w==
X-Gm-Message-State: AOJu0YxEuxQvN1dbh9nmbhHGcNmxgesCV+45tkzE1F4P3Tkw4EGu51Qx
 eGNUyO2SowuqKr3dO4By69Mg9GEkRFG7Iu3/fOHum2z0464MNAEjPaODtzObRog=
X-Google-Smtp-Source: AGHT+IFSTgZKlya48UFvXDektzLy1IE9Nc2pyEaM/u3ALTn2dbLHkA8CPFiR02Iydbr1v/q8arxrcw==
X-Received: by 2002:a2e:a542:0:b0:2f7:51a2:96f2 with SMTP id
 38308e7fff4ca-2faf3c011dbmr15140621fa.8.1728059657380; 
 Fri, 04 Oct 2024 09:34:17 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.150])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9b339b0sm194261fa.124.2024.10.04.09.34.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:34:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/25] target/tricore: Use explicit little-endian LD/ST API
Date: Fri,  4 Oct 2024 13:30:30 -0300
Message-ID: <20241004163042.85922-15-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004163042.85922-1-philmd@linaro.org>
References: <20241004163042.85922-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
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

The TriCore architecture uses little endianness. Directly use
the little-endian LD/ST API.

Mechanical change using:

  $ end=le; \
    for acc in uw w l q tul; do \
      sed -i -e "s/ld${acc}_p(/ld${acc}_${end}_p(/" \
             -e "s/st${acc}_p(/st${acc}_${end}_p(/" \
        $(git grep -wlE '(ld|st)t?u?[wlq]_p' target/tricore/); \
    done

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
index 29a70051ffe..0b73b1280e0 100644
--- a/target/tricore/gdbstub.c
+++ b/target/tricore/gdbstub.c
@@ -124,7 +124,7 @@ int tricore_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     CPUTriCoreState *env = cpu_env(cs);
     uint32_t tmp;
 
-    tmp = ldl_p(mem_buf);
+    tmp = ldl_le_p(mem_buf);
 
     if (n < 16) { /* data registers */
         env->gpr_d[n] = tmp;
-- 
2.45.2


