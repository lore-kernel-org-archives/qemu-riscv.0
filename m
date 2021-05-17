Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liar4-0004f1-Ei
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liar0-0004XJ-5w; Mon, 17 May 2021 06:52:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaqy-0006Rb-Qs; Mon, 17 May 2021 06:52:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id v12so5873901wrq.6;
 Mon, 17 May 2021 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LYuLraEC+Lf0AE7X9E3rg+Tkdhm34seQsrx2hTp2lLg=;
 b=abvQwnd6/GTVfLWXd7yFPB0AsNvvX/bLI/kGd6bPv0P1pROZY9z8A/Ug/GMI4fzO9H
 DJ7vacfTrWjQ76CrTBZPJxyxEVycIQQKhszMXrItnvA7W0NO287Y292j+o8gjIkzYvLN
 KUJnz51s0xSM22hP8OFCxTXX0JzndU9/JpODtYwvSixHNAXVOtFQBvBmPZMkBszAlp/Z
 P01ZhIBUbXAAgV+/w/uX1fa6Q6y/M+YdWCjGTJU3BX0jTGMq49f9T5bLKdsrJE+C2YgB
 QxlRArNZpfpV9dZTkVRFK4slM4bi5nOnXn4TrwZOzvaXJGoMuPh2KQhWuHK0MkiAACQO
 SGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LYuLraEC+Lf0AE7X9E3rg+Tkdhm34seQsrx2hTp2lLg=;
 b=AoMVEm0W8rh0zkWx8ffV+lATHbtou53/XaqbSMFHCFyBaixbY8x8OeuYmKxZRD3gbv
 R3SFOTs5llE8Qa5W9W5hasIDllkocChqwuc4r+Rm7ONgOg4xdAW8kAp8YROAIthl/5zD
 RlZFFlt81HOiQ8MoALHwwE/GGPuvUoAKnHMGWqXfZz2e4iJbtwkoCDaWmE2dOivQKGMg
 Axrk2TsvTj05+PmJPy0Gik4BFVQCRx+z6VPWRoWdcZsrC54OCU1bzbgkW00viYt04UoS
 UrUt3ZoE0texWCw2dUJ3plzDbUnPhR9wJRiFwClBUxiEdeA3/Y9oZ6VdFp7mEDY/Qr5+
 ADXA==
X-Gm-Message-State: AOAM532lM8ggc+vyo2FALtpmExY0ujnDUhkBE8Un+z/NUHub2MzzbcUR
 dsv2KeruEMDjPWk2TsCdIIrBTNH8HsivKA==
X-Google-Smtp-Source: ABdhPJyvq4/NVQXgHcT6ZKk04BBuHd5GFvA4zQYxMlrCO4h9Q3VIxtGwTIKghiVya9UkC6ErFPdVKg==
X-Received: by 2002:adf:8b4a:: with SMTP id v10mr14829620wra.274.1621248722001; 
 Mon, 17 May 2021 03:52:02 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q12sm17140168wrx.17.2021.05.17.03.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 04/23] cpu: Remove duplicated 'sysemu/hw_accel.h' header
Date: Mon, 17 May 2021 12:51:21 +0200
Message-Id: <20210517105140.1062037-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 May 2021 10:52:08 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07de..919dc3435a3 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -34,7 +34,6 @@
 #include "hw/qdev-properties.h"
 #include "trace/trace-root.h"
 #include "qemu/plugin.h"
-#include "sysemu/hw_accel.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
 {
-- 
2.26.3


