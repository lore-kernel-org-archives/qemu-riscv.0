Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKOy3-00015K-SN
	for mharc-qemu-riscv@gnu.org; Sun, 29 Aug 2021 13:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOy1-0000xk-Qh; Sun, 29 Aug 2021 13:51:37 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mKOy0-0003Ow-Br; Sun, 29 Aug 2021 13:51:37 -0400
Received: by mail-ej1-x632.google.com with SMTP id lc21so26041263ejc.7;
 Sun, 29 Aug 2021 10:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CzLI1V1RBbTVShrcM5t43RuOwi5FDM0N4x74gJANtTI=;
 b=Tg7pOEK4T2nzgtipOOJbJS18TTJoPUbndMIsHxe/Fv+z7eytHpJDmihtMd1Ig+2bZr
 /IkKPYHAf9GveMVe+iwpoLtaA3uzAZDY9YgLM//7/HHfjjVRiB1cWBRMwhMvuaHGcVrB
 ZPDbu+A3MsOdEReHkNZi2p5vW2KCTu66oVq+eJ/O03crV+wSHXjCN418X3GIVBlSPDGQ
 bg/UNektIUFupSmB5FqrfIhv1l8ZWBOS2ZHj4TQKMkP1dvCHbGmQxEnztCDgBJRLhVmt
 SU23+E9sBIm2ASkElnqPWaRrRG8iLcAxPjtUZUh5hxmuKD9zFc2+vo+CjWOi8S34C60s
 fD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CzLI1V1RBbTVShrcM5t43RuOwi5FDM0N4x74gJANtTI=;
 b=iWjE3385H1RVw+wMVKo+9Z0XnJ6KcS2LE34AefH/2F24y8i7kYwy/O7bQSL2PBLEZp
 ZFb9w4P20VibjM211M+hMVLUvqn9euV8hH6kJI8iYJLMiToc3KB0/m0cvrpd6wTttHMf
 knFnN2Q9qMdRuPE+97jE0HaeUn3QyWiosQi4gr2ie8b9+xTomuc15eg9A+KwdghQmYoO
 Axs8E5+Ee2EKvDQEJq1czSarbIdX/LVdhnGFzlN26p9nDq5A2YUcDJLhHCOVHaLjHax8
 72woLLJ1rgT5VSoDcmmCB7yxqTcG3y7/59w6ilKMqSxcWg47a+R6N0gU6e2gkJI6noV8
 4LVg==
X-Gm-Message-State: AOAM533Vdp1DBC9tAWDwsF6Zu8DqrlO+5WPvOJo3f7iK3wHOtP8MYRPA
 nEpCFqRrl845pGHKtyk6/fA=
X-Google-Smtp-Source: ABdhPJyKBpz50BaG5Vhvl51Xgl/psew/pGjtH9UahVKBl5F86UaVfrBV4Wmhzj6RgpMWGLIWSeEj+w==
X-Received: by 2002:a17:906:a0c:: with SMTP id
 w12mr20651569ejf.376.1630259494794; 
 Sun, 29 Aug 2021 10:51:34 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id e22sm6564361edu.35.2021.08.29.10.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 10:51:34 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 4/7] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Sun, 29 Aug 2021 20:51:17 +0300
Message-Id: <20210829175120.19413-5-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
References: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 29 Aug 2021 17:51:38 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4178eecbec..ab8c81cb5e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -300,6 +300,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
+    if (riscv_has_ext(env, RVJ)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mmte    ", env->mmte);
+        switch (env->priv) {
+        case PRV_U:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmbase ",
+                         env->upmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmmask ",
+                         env->upmmask);
+            break;
+        case PRV_S:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmbase ",
+                         env->spmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmmask ",
+                         env->spmmask);
+            break;
+        case PRV_M:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmbase ",
+                         env->mpmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmmask ",
+                         env->mpmmask);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.20.1


