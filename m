Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbfSz-0004F9-Sp
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 04:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSp-000433-96
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 04:54:47 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSl-0005JJ-J8
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 04:54:46 -0400
Received: by mail-pg1-x529.google.com with SMTP id e7so10855688pgk.2
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNRuPJRCcQRqPIYjRsxdxp2S24G0fTNG/5ailoIkAOA=;
 b=knixvliGovfClwtCf6zjrzj0WMFQWbQhmbTXaqefz+exS2sPsYC09ItWBYSHQHhVCO
 gHiZLu4IuSr3kpkeJ0F1Qf3Psa7m+G7EmU5cJs91TUK80mMeATKo1K3jGJ2GbNPHBtJj
 sQmV8Hn3RKH4MV6vyE0LafkzUsIWQ8j43DDZpqilNDYOm8zHXlP995ancm4KHnDq50BQ
 rOAsXeeETmXanPxsiO56xz5DXMVYS9EVDotcxpOIpK+fIbDORGr9EnEqYME403WWXY1N
 Csiu0mBATWzGGFB1wTrpVcsJchBiUx2aoYW/p6yr6RiKjfpbOLfcMaFlYcqHGvIGBx4A
 F2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNRuPJRCcQRqPIYjRsxdxp2S24G0fTNG/5ailoIkAOA=;
 b=e4/WV3OqTysId9C64zyK9D+vpq0GgcaUa0neqQC7XUqN600ZG5HDGPi1Z2QkqImxB3
 99QJNW08e1wYMwENG37kZOTqH5477Cbd+nOM9IRswm+Z4PrJ1W+m1YwzZFRqqPHH6T26
 qQAkyhzlebucppqtyvhWMWndX6oaAEKb/oxrVrxQE1IrdhZLpHYa5DJVLSuQBoORrJio
 4fH8jpFPnQLoA2g02wjScCixtNGgF2Q9xKYALhI32AmEN9iCUcepyYxFjmauTyBDIK5K
 DdWNVlmWgcxNnNBiC/EsYMNSqtj6+rdXbKfcnl2vZu8ElHMSEDpD/BnVkawJCPU7AG8O
 Q4/g==
X-Gm-Message-State: AOAM531THrtRgr3xUdODdbMgDMnOaN0nQ5FJNbNyKd6xEm84SN10kdAU
 9UBr9YPlIKDYKSDSuAGpG16DsA==
X-Google-Smtp-Source: ABdhPJzmIkZyWRelk5ZYg1UwdJEnXobooU3vHoI6Ws8NEbcFRdYz2B2hG0guqakganrcRqMzTBqV9Q==
X-Received: by 2002:a63:7e45:: with SMTP id o5mr12921242pgn.445.1634374481609; 
 Sat, 16 Oct 2021 01:54:41 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id p3sm7028691pfb.205.2021.10.16.01.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 01:54:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 2/2] target/riscv: change the api for RVF/RVD fmin/fmax
Date: Sat, 16 Oct 2021 16:54:27 +0800
Message-Id: <20211016085428.3001501-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016085428.3001501-1-frank.chang@sifive.com>
References: <20211016085428.3001501-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 08:54:48 -0000

From: Chih-Min Chao <chihmin.chao@sifive.com>

The sNaN propagation behavior has been changed since
cd20cee7 in https://github.com/riscv/riscv-isa-manual.

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
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


