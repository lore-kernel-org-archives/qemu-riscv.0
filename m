Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6b0F-00022T-55
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 12:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0B-00021P-2F
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:29:35 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b09-0002OJ-IH
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:29:34 -0500
Received: by mail-ej1-x62d.google.com with SMTP id u19so12919334ejm.8
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdJpVnm+gFNOeX+qvDUbYIefgKH38zq9W4n0ljJdfLo=;
 b=fXMKAdasNRudqC/+wHt0wHLOntPFsm3uaGXpR+hb5haWkI0s1NTuJgtD+gjno9cqOK
 U5jwk75xoFPZn9s0tPD9Phfjp52CumJG3TNzkT+dqaV/XbNE/Palzd/unmtaejUNzO7F
 dMbc4XogpIYjZBzkxmFGN0+0NAmn/IeuZD2Y0FKZ5VRIxFwqya4P+v3h/buVEqy2LSdl
 iji0KyUrDtwEVwHRnOshPTxeHPqUttht3rK3uLMMNk8nETAiw3fzcNvUM04kEx9HMo1X
 fv9EpFCSP4ULOfRq1UqrGqAP5zmT707TPUQizQKL+EHznCrIw1sFG16HYboyGFAQMWzP
 4ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdJpVnm+gFNOeX+qvDUbYIefgKH38zq9W4n0ljJdfLo=;
 b=Vj+72fmaWbDNo3REUg8NSm1Xmh36GpybGz1r+lPRS4tCmRcK1dYMTE26446Nnw499/
 bWsbjuDUWo1pBTchMcwvNfY+fHtSClSgZImgWLB7IRQelJAjFKdsvp5oOmbRO3dpCEWs
 rQLnaF7g5XUI6FYZy4WPk5FyAb64lK0lvwH8zHHTgU12bboGL6mnOcloIPZCRtxUIE8b
 QEjJliJFSWirk4nUfEWOoczmRIRG9lEld5eCUiT+ku4SyvvC+jehoCZul712EB+a8NsT
 JB/ku/uMddlPAcBa+l2S2fmSzVASdl396veP0lT9lH8JgBQ8lmRw4jNKMCVs9w/dec/u
 twTw==
X-Gm-Message-State: ANoB5pnKg903kJVwpgy+1BXFTt8cTyq2NgVPycWsustLqLzJFqZpyEK7
 g4gtRiIwjHAzv6EzrmlpG05sog==
X-Google-Smtp-Source: AA0mqf5lrqx5SyTOy9VltHp07f5MXVPkuVZFX6LMndnW00UHYwOqtqjNcCDnXOet/VQTL4RhPmS6KQ==
X-Received: by 2002:a17:906:2582:b0:78d:f459:716c with SMTP id
 m2-20020a170906258200b0078df459716cmr44793306ejb.23.1671298172208; 
 Sat, 17 Dec 2022 09:29:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fx9-20020a170906b74900b007c1675d2626sm2210331ejb.96.2022.12.17.09.29.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:29:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/9] target/loongarch/cpu: Remove unused "sysbus.h" header
Date: Sat, 17 Dec 2022 18:29:00 +0100
Message-Id: <20221217172907.8364-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Sat, 17 Dec 2022 17:29:36 -0000

From: Bernhard Beschow <shentey@gmail.com>

The cpu is used in both user and system emulation context while
sysbus.h is system-only. Remove it since it's not needed anyway.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e15c633b0b..c8612f5466 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -13,7 +13,6 @@
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
-#include "hw/sysbus.h"
 #include "cpu-csr.h"
 
 #define IOCSRF_TEMP             0
-- 
2.38.1


