Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbStt-0008SC-Nx
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 15:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStm-0008KN-Tj; Fri, 15 Oct 2021 15:29:46 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:43930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStk-0008Qt-Ch; Fri, 15 Oct 2021 15:29:46 -0400
Received: by mail-lf1-x12a.google.com with SMTP id r19so44767809lfe.10;
 Fri, 15 Oct 2021 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K05JcbwHzwcb6rZL7rDmh7yc1UsvDdWX5/9rOusuP/8=;
 b=HoSRjFMdNmaw/BW65xbn1+1yJD4y9356MMNRNCTECtEMZnwD4dqKlHzG+Gnb1TLMSP
 ifBaWrhBC5lBBwSHwEELDyMJF2FDD+NTfn6uH2psS33eSl8QB+M2dc08qjfMQNqYHk6v
 5SO+afrSFSLx4Ckkbrsb1e+ntKagXNXbnmlvPuIj27c5qbiNPHgo2gyJrVNBpypcKyMi
 0Kk1XbN/2gWBAuNw9WYl2XiL0L/AjfLJv8QcG4ppeeSwzQzIVOvnIu6Pmjt/BrR5Znjg
 8z57r9uw3H7HlBxr9d07gcOtQgswVYbVINbDT9ubUqKp45k2QbqbdlfhQuTHGVuOMWmR
 YCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K05JcbwHzwcb6rZL7rDmh7yc1UsvDdWX5/9rOusuP/8=;
 b=3APFR9ss9W+YpLxfiZI0yxjPO3SoRCa74lQcFmw8N6Ykr4fRAhB7K/LKBjbzyAYkK3
 wI7X294KCgsWmkiuJkqZE1dAzgB+EnuIO69XMPtBTLrUqUI4TjNcmwvRaTzA6rYlhir6
 wPcUrjnGCvWthhg2mXe4ka8pmp/CHUjsC4gruIVMwmMw7O9hWko0pnMK5pZ98L9LsLry
 EhVJUZ+WUs4srcZzTjCmZE678Y0J1o2dzIKSKCjpnYcYE39Bhp0zzKer/cPA5MtgUaXH
 aLz0JT7N0ioDnFuCVot4svQ+B91iC5XvbD8qf1iIeJ/yRW90NfT59lb+Z7PNqGRelMTI
 9s/A==
X-Gm-Message-State: AOAM532j+e2P/5ma1YHzQmh9u7LwRYJT5DBfCKhLbBIhrUgUQaA48sax
 MpyZTgcne7FEGmW2P1L4Fsc=
X-Google-Smtp-Source: ABdhPJwtgELK2Zl1EB/9AqqbLEkTHDdQj+W1ZNwg5vwBA2bmew8/+kcuIUXcMoOyg4S9R9n33Pnwrw==
X-Received: by 2002:a2e:bd11:: with SMTP id n17mr6876385ljq.273.1634326182332; 
 Fri, 15 Oct 2021 12:29:42 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id n19sm527261lfu.207.2021.10.15.12.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:29:41 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v13 4/7] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Fri, 15 Oct 2021 22:29:28 +0300
Message-Id: <20211015192931.227387-5-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x12a.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 19:29:47 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 75e8b8ca83..7f9dde70b7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -295,6 +295,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
2.30.2


