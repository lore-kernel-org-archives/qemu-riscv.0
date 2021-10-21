Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdacv-0003DN-7j
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdacq-00034u-Fr
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:09:05 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaco-0003M7-Or
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:09:04 -0400
Received: by mail-pg1-x530.google.com with SMTP id q187so761884pgq.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 09:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9tEcUEbq/W7hoeVzwLuM0tbgOGVONjT5DUAf8eknZOQ=;
 b=D+f5WkBZWVpod5UZRTOAZUAkJ9ZJpL1pCYvhNfZZbWmvvWLB8k2wGF6iXIQayvEyv2
 NGcU6uIw7uqqTzLW/0bK3QpwOxWTDl8FCXjbnIMCl1uy/RddNTQm4tMdAx45zueCA3HC
 cGe8SEGuTNX2sCPn5Qd13/fUytSxDxpjh4gZGpDaIrSX4gI9jsLhfHmoMBTy9FcGD4Z5
 BJ9PJmhVu/85CiIItPGHsLygqr34eLUiSqC0LAotWIbHhkT5H1GJQK6DNZI0oKA2E83Y
 Bc/xXYRXoPzhReAUv1hNIzClW/SA5ainiLWUcCq9pJThgkDUJIKKi1JUp10XasOIfmnc
 x/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9tEcUEbq/W7hoeVzwLuM0tbgOGVONjT5DUAf8eknZOQ=;
 b=mQ1g89HplSiZetev/hd0SbW+FPddf7L2Xeu/j+Ai36wJhB+ziDpKR3ES6ncG0SsUxG
 rxRpsUhwPWQQLNkNrcWue42pW4SOKHlT8pjepuiJyCJZcTUuGSg27g9eRTtWEG8yrrnn
 v3w3AOqYOgFo4MYaYXYBeFkV531RaQi0MfvQPcLjwvB7bRAoLRGYlrOGsfmG8CuCq2Vv
 2efAmK3q7hknPzn2Fq7+1i5cpzq4lglkPINGXPMKTcO/D9sfiaIelWh+/lU23gJFNzYG
 MreMtR+g1Vvjc8tcjZapbg1AREgMLzSfkyEjAQDWYJcnXjiR0YMiJAxvIghh+HPwoKUu
 BO1A==
X-Gm-Message-State: AOAM530bhcbroXr0tOAwJ7TkxrPuEfPs3lTjMdHKH4TKRBerfktIxEpq
 ZcB92e7nA5e/oyDj4vbprPw0BgdN8qdM9Q==
X-Google-Smtp-Source: ABdhPJxZuiBBmL6Zjiby5o74CvkLl7C7Q0fAyHut8YQPQSKlSh4oFX3vs92jjt7PSST0hCCUvvgEUg==
X-Received: by 2002:a63:710d:: with SMTP id m13mr5110788pgc.115.1634832541208; 
 Thu, 21 Oct 2021 09:09:01 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id r13sm5752505pgv.21.2021.10.21.09.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:09:00 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] target/riscv: change the api for RVF/RVD fmin/fmax
Date: Fri, 22 Oct 2021 00:08:46 +0800
Message-Id: <20211021160847.2748577-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021160847.2748577-1-frank.chang@sifive.com>
References: <20211021160847.2748577-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 21 Oct 2021 16:09:06 -0000

From: Chih-Min Chao <chihmin.chao@sifive.com>

The sNaN propagation behavior has been changed since cd20cee7 in
https://github.com/riscv/riscv-isa-manual.

In Priv spec v1.10, RVF is v2.0. fmin.s and fmax.s are implemented with
IEEE 754-2008 minNum and maxNum operations.

In Priv spec v1.11, RVF is v2.2. fmin.s and fmax.s are amended to
implement IEEE 754-2019 minimumNumber and maximumNumber operations.

Therefore, to prevent the risk of having too many version variables.
Instead of introducing an extra *fext_ver* variable, we tie RVF version
to Priv version. Though it's not completely accurate but is close enough.

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 8700516a14c..d62f4709002 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
     float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float32_minnum(frs1, frs2, &env->fp_status) :
+                    float32_minimum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
     float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float32_maxnum(frs1, frs2, &env->fp_status) :
+                    float32_maximum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
@@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 
 uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_minnum(frs1, frs2, &env->fp_status);
+    return env->priv_ver < PRIV_VERSION_1_11_0 ?
+            float64_minnum(frs1, frs2, &env->fp_status) :
+            float64_minimum_number(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_maxnum(frs1, frs2, &env->fp_status);
+    return env->priv_ver < PRIV_VERSION_1_11_0 ?
+            float64_maxnum(frs1, frs2, &env->fp_status) :
+            float64_maximum_number(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
-- 
2.25.1


