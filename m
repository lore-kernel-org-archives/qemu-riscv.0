Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6IqM-0000I5-Gh
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 17:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IqK-0000Bp-Kf
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:06:12 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IqJ-0005jm-0Q
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:06:12 -0500
Received: by mail-ed1-x52a.google.com with SMTP id v8so5524559edi.3
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 14:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dy6adUSc1nsjjorplxmdwlzsWilNUT+uX0VNLymafXA=;
 b=eM6dbvzbw9G+VkSBiUjAPDEjFVVT4aAyn7KM95Kr6qhis+o5F0RhrqhzlX2PNUXJ1T
 RGJFH1ybuZUC3l2PBEyxjpzYwbD+1INMwDIfjVk0IUsnekUf3YogA3zFVQUKI2TLhrbp
 mx1nEo/ZuEa931Xp43uy1wu4oqxSt7AI9VcHZji28EtqwzjzXaZlTSOnC+tO4hpdNIFS
 JWyUDJ+QzGFzCa4J1U/CYEBk8DL0hBoic46kdz143Rhca1gGmoFYT1W3DR7hybXpf8qY
 N0zNvbmmidy8YMipvkZM6V6X2YuDEljXaeUDng2xBZBzLf1pfNMXTNIgnDFsFVG1VbFN
 4h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dy6adUSc1nsjjorplxmdwlzsWilNUT+uX0VNLymafXA=;
 b=qrfXBTiQ9Xl6YJ+5UMDWFheUs4kkjouRZGRbSDV8nhm8VhN+bTKLzqoBjvLeTvC22A
 WJTa1rTZri2L8L+COSdtmgs9asj7RQe8h0WrfKsPjdydwmX47DwQitfX4wJeeE9kdChc
 pxrHD8RnvRfQ/QHGA6bu2S3DB+ZC3YrXlUsMhcZnIaCmaNcPdNpsGGFiXmnzFRX7RF6H
 DiVfggalqnoIvfFUFrO2vQ6HggNzMOjmNK/KmEK+fj2LNp946tjBJ5cEKAQu0j0Ax5qD
 +3ac2r0VFNhCRgNnDOz0/QUxgRZsnYz9TA2z570mwyp8UtQC8pr3LUfE9jmHPUXUdv3n
 +gYw==
X-Gm-Message-State: ANoB5pl0vOtoLIVQcGXTFpS+HnMcGpdf1xSLx1EiDaJPqNqwf2By+KqU
 fruxXtzorlCLKlE6lwHC6vI/lw==
X-Google-Smtp-Source: AA0mqf54HJIDDvUvhcXMlzFPOIzUIel+CrLPjrZSL5TtP9gcLUipu+HRY3e0edPLwknuDPjy2mPFUA==
X-Received: by 2002:a05:6402:14a:b0:467:8e69:ff10 with SMTP id
 s10-20020a056402014a00b004678e69ff10mr29352682edu.26.1671228369763; 
 Fri, 16 Dec 2022 14:06:09 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u10-20020aa7db8a000000b0046bc2f432dasm1306181edt.22.2022.12.16.14.06.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:06:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/10] target/loongarch/cpu: Restrict "memory.h" header to
 sysemu
Date: Fri, 16 Dec 2022 23:05:33 +0100
Message-Id: <20221216220539.7065-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 22:06:12 -0000

Missed in 0093b9a5ee ("target/loongarch: Adjust functions
and structure to support user-mode") while cleaning commit
f84a2aacf5 ("target/loongarch: Add LoongArch IOCSR instruction").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index c8612f5466..2f17ac6b47 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -12,7 +12,9 @@
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
+#ifndef CONFIG_USER_ONLY
 #include "exec/memory.h"
+#endif
 #include "cpu-csr.h"
 
 #define IOCSRF_TEMP             0
-- 
2.38.1


