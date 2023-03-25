Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg3Ed-0007mE-1z
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3Eb-0007le-NZ
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:43:01 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3EZ-0000LQ-8y
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:43:01 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17ec8963db8so4532429fac.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679748174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOdvlCRUUrcZC9U0eZGQ9ggXWyuOCCNFNeedj3EMSZ0=;
 b=CzCkxdyDItyunwgHTEw8anUL81veCDWXKuS88zqRMMV1FxEofHCCWJaq8+erJYBSFF
 8OJGbJ++LahFXFmzLUSKdqKotEYcBp75jDcXpNe6sBuYH4PcCo9nZsV4VmuLmJuS+egA
 zldRnahlckQfOTupl8lBoAimM3M8HGGJNJb4MUV5lVhs8dUwymPjGf2Tr6kaYkfAeYiC
 wR+ondJToh8BIfwL528Itotx7313F6vCa8jZavIrD5SkR+oRQPqhG9og8yiECN3yuq7d
 pV7F0oymXJ2yABCGwD/6wNTW1UWlhtmO1kCPPZRpWWhfIgi8+yk+5ef7PG1CjLAUPGXe
 CroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679748174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOdvlCRUUrcZC9U0eZGQ9ggXWyuOCCNFNeedj3EMSZ0=;
 b=0v3lZ6OaAsNHT8y3VtqKPmQrC8QZRKS1uwc7OVwlkKaJVbSo63s+BH+lKizRUGCrmC
 uKyZaKktFwTKvJUd42Lfse8u6XNe3OPr1qm9MI2FVAS4ywzmKNwQb5g31x4HBruRkOlX
 7a2aI1n8JQngpns6zvpbOVHc0laHqPJ+XIZKIaIMYO7NYf8hu55hvqwJVoVSwMUOFpVr
 LM/hjGFltTBocBLqnY/SJ37BP+powrKRcCeCaBwkg8fWP36UT8BwnLieSkQJY73DZPrL
 U5476to1U/Dr8N7uLlKVK4vyZkldlaJT4jdusvm47Y70awQE0s1sBiKQGys/Vq5POLhm
 TH4A==
X-Gm-Message-State: AAQBX9eVi0OBip7Ax6MY217cNCZSAzoHPWAJEj2DfxFL3fV7QUgrmAX1
 /CdN0li99SgW0nkt931callBoBxTedfk0GLtl6s=
X-Google-Smtp-Source: AKy350Z4bz/UalHHSBO0kOdp4DzlXiYZXEH6Y7lxAZiE+ltj42QrrgpmbozR9sNv6Gl6kmi+Mx58Mw==
X-Received: by 2002:a17:90b:4f91:b0:23c:fea5:74ca with SMTP id
 qe17-20020a17090b4f9100b0023cfea574camr5981631pjb.23.1679741683969; 
 Sat, 25 Mar 2023 03:54:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 15/25] target/riscv: Move hstatus.spvp check to
 check_access_hlsv
Date: Sat, 25 Mar 2023 03:54:19 -0700
Message-Id: <20230325105429.1142530-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 12:43:01 -0000

The current cpu_mmu_index value is really irrelevant to
the HLV/HSV lookup.  Provide the correct priv level directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 8 +-------
 target/riscv/op_helper.c  | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8a124888cd..0adfd4a12b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -784,12 +784,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    /* MPRV does not affect the virtual-machine load/store
-       instructions, HLV, HLVX, and HSV. */
-    if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
-    }
-
     if (first_stage == false) {
         /* We are in stage 2 translation, this is similar to stage 1. */
         /* Stage 2 is always taken as U-mode */
@@ -1251,7 +1245,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     /* MPRV does not affect the virtual-machine load/store
        instructions, HLV, HLVX, and HSV. */
     if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
+        ;
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
                get_field(env->mstatus, MSTATUS_MPRV)) {
         mode = get_field(env->mstatus, MSTATUS_MPP);
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 81362537b6..db7252e09d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,7 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return cpu_mmu_index(env, x) | MMU_2STAGE_BIT;
+    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.34.1


