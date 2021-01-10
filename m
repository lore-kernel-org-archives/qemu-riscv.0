Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyfoK-0004wl-Bj
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jan 2021 13:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfoI-0004t6-P3; Sun, 10 Jan 2021 13:51:30 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:36375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfoB-0006gu-AS; Sun, 10 Jan 2021 13:51:30 -0500
Received: by mail-lj1-x232.google.com with SMTP id n8so1159419ljg.3;
 Sun, 10 Jan 2021 10:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Mld67m1rnnRARepF6vxc9waC1fg/t/IXiL4+iPAQ58=;
 b=qcIIHXKaySV3O3Tei4oEgLb315I6f56nGvxmZxQYzidtXMgrPXEGW571pvrByxNJUm
 i7ffYR3KqhEzJkDpCERkAhsvPgZoc/Vgt0/F+ZtBf0cD03tfQW8NMYtqLoYy9JhNGyFy
 Cam0YgRmEa1nMdm2HBLRduVXJVjl0xoCa1RbA7tuFvSGkOX/pm21Q0/VW2EcS9EdfqIj
 UYIIi3XtBjvJG/BM7DJMtPny7oxMZfqW/ArwmtS2IK7VcchlLCyp9rolU7pHQnchBzRU
 bsaGGRxPq7rPMHvA/pOdz1d0pnC3mG3JqNA/lvuxsRtmC5IXLyge5EjyL2hn1vXEFtzR
 O2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Mld67m1rnnRARepF6vxc9waC1fg/t/IXiL4+iPAQ58=;
 b=QvNBlExJmQfx9RnSmvzzs5bc9UkQy0m6fzEiNwwdU91UIURr1hEQkMX+WM569DXnpK
 iZGT2eni7IyFpkMsaNAzNeYouXQNe1acIC2HViYM4pRCB0AfvcSulqq2/AX7lbNTSt6e
 X5kLDPQxftqf6jKQ+4TqPcvccRbmq05G3yccZD15xmkjRvA+pdOwWZAiDSSkLMGnrnnT
 ZJrscSwUL5p4y35bgQq4SN2hYmWAgztAFOXLeTBrvwmzPMQcNX7WE0sp11ZHzbB7Ql4+
 4uyz1kTp7/48zGUhM7KwQbYCfUxkpVW8qIL4dJ0FU6HVgnP7prHvK3HtjF75TmBv7hxl
 J4CA==
X-Gm-Message-State: AOAM531MgEFjRoKFy48paZOB7+F8OWS9zbZCGNMn6UWqG5wGDbl2C/MH
 /hM1w/MAHInyl0ACmr6PQ0g=
X-Google-Smtp-Source: ABdhPJyaa0Dg9Bgn7IJHlfLYGdKGUjIdSF7Bppw38cH+sbsWpgSXG8GIi+zwCi5cecJNFOe2BA7UIg==
X-Received: by 2002:a05:651c:1b2:: with SMTP id
 c18mr6241295ljn.385.1610304681531; 
 Sun, 10 Jan 2021 10:51:21 -0800 (PST)
Received: from neptune.lab ([46.39.229.36])
 by smtp.googlemail.com with ESMTPSA id l1sm2795267lfk.201.2021.01.10.10.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 10:51:20 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v7 3/6] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Sun, 10 Jan 2021 21:51:06 +0300
Message-Id: <20210110185109.29841-4-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x232.google.com
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
X-List-Received-Date: Sun, 10 Jan 2021 18:51:31 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d50f09b757..19398977d3 100644
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


