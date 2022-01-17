Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9SC3-0005Y6-2m
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:37:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SBq-0005Vt-V0
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:36:57 -0500
Received: from [2607:f8b0:4864:20::22d] (port=35725
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SBn-0002HT-DA
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:36:52 -0500
Received: by mail-oi1-x22d.google.com with SMTP id s127so23432482oig.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mYUrPuAx21gJEjUJ5875VouJqz1EtIq2aKoQE+ku+s=;
 b=bsVQe/pO0kukuBueydcue4yr0gcp9T7XhMB7k1ZQ+ak0vpb1zMBWo7mWEEQIW6aHoj
 DulaLWJsFMnBw2WThrHfS4VKki2J8qj3tCMkMxVKDA1husnCWbe5Q7wmTDj9WZf+ptT0
 tPn+oIPDnO8egOM+KWH7803AmUpPja827M5ov35ZUuOE8rTmFcIm0TythD0KjmBXwukD
 tyV73krezj16WMefwH1rCy3iNZnMQQkl/jMOoUsd0g0ruKl8ljE+pO+wNwiT/8vKChfH
 RETrR1fewbkd1+nwEwO4mB5pRRi/oexXRyPcwFHFSJ1jjVf9GanJye4YRGX0VIXrFAC/
 QWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mYUrPuAx21gJEjUJ5875VouJqz1EtIq2aKoQE+ku+s=;
 b=wuy9yAB6tZg6fv4Pyozw8CAHEdGuJ/5es5OodMpznKdQOd+2qPeugzG14910W9Q8XB
 xcQBEvdgDTH8aW9f8s+xzG4rR2VgMKa6uAbq7snOZNl6RbfXG4bKRWOkZAC/CsEHvxkr
 jqmlYf2T1idEu+0yAH2zlrI92Dm7nhTOoDpZWiqZeQLJrjopnxPtg0AMi71xjVv0jxZ0
 a1OBC+NbhkU8CDyQAvR0f53ImOwPEd18zcxZ0amvtaMcHldyFktOcApImkqo0Bg/IDBj
 GEitP6G9djXOGVxh3TZcQNepFuDLKQX1fHwxz9PmHBMXoWrjeAto3lU1VIW8wl+nA5NN
 OWnw==
X-Gm-Message-State: AOAM531NMvQl3F4fCMfRayGOlc5ynLJmTt+EChbnxonnPsddvyPhn7Cs
 WkLE3tv92pzceLhoICNWy8QkFrlluXSMWw==
X-Google-Smtp-Source: ABdhPJx1c9pBzKSjz+X1RpyM2EXYPZPRPI68CXAZfmeGf3TwL+Oxk/Y4UkZZXXzC23NHDjs4vs6GfQ==
X-Received: by 2002:a17:90a:1d0a:: with SMTP id
 c10mr24986643pjd.243.1642426178978; 
 Mon, 17 Jan 2022 05:29:38 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:38 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 06/23] target/riscv: Add AIA cpu feature
Date: Mon, 17 Jan 2022 18:58:09 +0530
Message-Id: <20220117132826.426418-7-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::22d;
 envelope-from=anup@brainfault.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 13:37:04 -0000

From: Anup Patel <anup.patel@wdc.com>

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2c04826496..71a2fd1da7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -77,7 +77,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
-- 
2.25.1


