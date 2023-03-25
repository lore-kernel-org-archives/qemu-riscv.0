Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2XF-0005Mh-EN
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2XD-0005L9-JD
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:58:11 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2XB-0002RE-So
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:58:11 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-17aaa51a911so4467334fac.5
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7CakJiw3FQaq9CQRWEMSVcA4vdqDdKzHfEhTBS4YSs=;
 b=rkXibNtQ11drdXxRFv+0icuHlstykDVHcxbwJCbIuezsnRYNkR3HUjarNH40zM+NKW
 t4BDIFA17CYxhaTRDKhGvcQY1K2G8j45wTCjmYOX/cST1KSVWgeZOlc2HDAVB9pwvMVa
 +sjDBv/uRQUXmNB1fJBJ2bBt1Tbx7smjR6CejdxZP6Cf1QU/UQvS7Sn8QgeSCVlQgS4q
 UpJG6B4Gr7TX7dufTdmbs17q17FzgRppsmG22oP02y3H6gcrN22GobHX8jxiVLNMIvOE
 gU0IRY1iIUlT63YbrH6sAu665ocWAD3AxJtsYg2M3kePPSSIScTtTcHhtPEEBnsm87cB
 +NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7CakJiw3FQaq9CQRWEMSVcA4vdqDdKzHfEhTBS4YSs=;
 b=uUA6DhJchzG9r2FsgYL7DCrNY2NjXUzwWhhjlaXa9XyPL7euPXO5A2pqSS20yLIlSS
 bl7e/BrKrhM6W9BSzez9NMN1RYhBTS1HogzOVZYx9kPhVsswT9uaoutQHPV/fiIxi7j8
 Ce0lrpzZzcwzGxIrCmX6cX+Vji7WDqWKdhvZlqbtmA0j6pFFyRey1C+cT/a1K4CyFT+w
 7GgZ0sgGscNNaxCoFk1Gq5VAMd2folQWgnNxI7dxn1f34Dp8Ykm/QsurmEZSjCZxjphY
 lMcn5a8Mp+ZmYy7lBJQYUkEKumiL1UHncujHzUyl0+C0ieDqeW8K32T9Yg3FfxRzrDBa
 awuA==
X-Gm-Message-State: AAQBX9fESd6Vs9v3ExDtSn/FF+NncEaldBe7hS3WHNfTQ2NScri/Ha3X
 3ZouVq4FuCQ3340XmIQs5JyVens28LN3yK/VXiA=
X-Google-Smtp-Source: AKy350bUMtBO4/F2yR0lv6X0fjoYzf+2BCfWMM5kkQzdwXjGxGeZce/jh8Byn0yU0maVjSkawsK3yA==
X-Received: by 2002:a17:90b:38cc:b0:23d:4e0e:cf34 with SMTP id
 nn12-20020a17090b38cc00b0023d4e0ecf34mr6017114pjb.34.1679741682165; 
 Sat, 25 Mar 2023 03:54:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 13/25] target/riscv: Introduce mmuidx_priv
Date: Sat, 25 Mar 2023 03:54:17 -0700
Message-Id: <20230325105429.1142530-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 11:58:11 -0000

Use the priv level encoded into the mmu_idx, rather than
starting from env->priv.  We have already checked MPRV+MPP
in riscv_cpu_mmu_index -- no need to repeat that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/internals.h  | 9 +++++++++
 target/riscv/cpu_helper.c | 6 +-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 0b61f337dd..4aa1cb409f 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -37,6 +37,15 @@
 #define MMUIdx_M            3
 #define MMU_2STAGE_BIT      (1 << 2)
 
+static inline int mmuidx_priv(int mmu_idx)
+{
+    int ret = mmu_idx & 3;
+    if (ret == MMUIdx_S_SUM) {
+        ret = PRV_S;
+    }
+    return ret;
+}
+
 static inline bool mmuidx_sum(int mmu_idx)
 {
     return (mmu_idx & 3) == MMUIdx_S_SUM;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7e6cd8e0fd..cb260b88ea 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -771,7 +771,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * (riscv_cpu_do_interrupt) is correct */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = env->priv;
+    int mode = mmuidx_priv(mmu_idx);
     bool use_background = false;
     hwaddr ppn;
     RISCVCPU *cpu = env_archcpu(env);
@@ -793,10 +793,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
        instructions, HLV, HLVX, and HSV. */
     if (riscv_cpu_two_stage_lookup(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
-    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
-        if (get_field(env->mstatus, MSTATUS_MPRV)) {
-            mode = get_field(env->mstatus, MSTATUS_MPP);
-        }
     }
 
     if (first_stage == false) {
-- 
2.34.1


