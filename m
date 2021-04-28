Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbbfE-0001OU-Mi
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 00:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbfC-0001IU-Dh; Wed, 28 Apr 2021 00:19:02 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbf5-00064K-Q9; Wed, 28 Apr 2021 00:19:02 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n2so92534609ejy.7;
 Tue, 27 Apr 2021 21:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I5tnfyh15+1Hzqs2BbpAsHKgrqdCLD3z3hF5NAd03tM=;
 b=gKZnGGLisWyTs1F13bVgGwBzC76GUIOBlzaRFa1GFgUheHOxf1nWv8wchTXM+8FGpV
 2taf5Jsf0f+g/0Xw139b31Hm1oKqAywWFVJVtCXqRTrhIwPEw001KRq8VRUVT2Kiyaif
 w8lkcOszIU5x8THCubXd0m96TR9bPYGLeX+lsHhH+aGEeb7utGXrwR/6Ho1vAQdOrYze
 F+domrIn+8cM5FVcJpYm0/WM6sy4cp3Rr/2yyIcIGghRYOKtfBggztAAS+9vwiA0KCdL
 OJx1xUfrOhnzlJDxpz4AgFFGDb1lRD19WmmaGKUO7jRofISjlWao22He4lvZ63cf8/Zt
 Bkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I5tnfyh15+1Hzqs2BbpAsHKgrqdCLD3z3hF5NAd03tM=;
 b=Ql/P4hbDnvTILhu/wz09yxB6ZzFgKTAEmDkDCyQYg4tUD+gBPiSWKIfOx4FDOUGve5
 kY6m8/xlQFCD7uoN+ruYaJ0FemD5sD9bXRsqivuSTpUcpRQj5C93fUywknVibGpu8iMe
 T+HCWFvVUgxJ8VW/kD4jDYKCJK6xYzmUlGsILRjkJfADfjqLi91CE8xIkxucJMY+EDT1
 H9QBkFJPpqGqHBpuj90AlgYir616I1i5LK4vqmAJ6BK7p/uXola+VKFIQELeKU6+1Xbj
 hWLpbw/SwZ7SgPEOsxjh8gAsG7eTXBD/ZNjvszhJqWj/SURXGnw0FH3Rx8U4Yhh75rzh
 QNYg==
X-Gm-Message-State: AOAM531kmd6RAYJOKREhiQZ8dgF8Tb63xa+xtnVIIcRxGzeGd4d3otbn
 oIB5x4HGyiBn0g81isQlksY=
X-Google-Smtp-Source: ABdhPJxLNoOEpLAT2Tdr/NkmnWD98RmWyOUWqL0jYnTi9NTrCbAkMzDa9Yv9sxNkOJDC0mdzteXfIw==
X-Received: by 2002:a17:906:a20b:: with SMTP id
 r11mr26978903ejy.323.1619583534228; 
 Tue, 27 Apr 2021 21:18:54 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id s20sm3759565edu.93.2021.04.27.21.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:18:53 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 3/6] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Wed, 28 Apr 2021 07:18:45 +0300
Message-Id: <20210428041848.12982-4-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
References: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Wed, 28 Apr 2021 04:19:03 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c04911ec05..0682410f5d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -287,6 +287,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
     }
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


