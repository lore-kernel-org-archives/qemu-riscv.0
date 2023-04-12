Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYth-0006Hv-BG
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtD-0004vi-F8
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtB-0002NR-3v
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id s2so7310240wra.7
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299828; x=1683891828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1b/kBvvVthJX/VbKnXsWeX6FiZxYMKF2JWi4jeCwEjI=;
 b=jfp6IJ9b6SfvDChBPWboAtWgpFxpKJNIvu7lhf0kVA7Eu8IQo2XlTqKRpz0rt/paXg
 4w6PfgYIt946339LuxW6JFkQxE/OaKO2mhL+B8VSXySbn7HywzBJpf90AU7vxSXfnkTV
 h+hNIxtWLpTcDL5tZLvJZm8e5039skLZYRe1Q49lDVzEXgmapyE3dJh6IuCpU/bswRHr
 HJmr7Y7mi5rHCefuGETh0/fLqzwYFcvR0atM7FqWAZ8WPNAWKSjEorGFD1tI8jLsmh/d
 pFlizOwI5NWUBKjoF/hLYZLnoAB8LGxECo+fRmMOfs+ttNQguj1yignVOd0pawzOa3h4
 jm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299828; x=1683891828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1b/kBvvVthJX/VbKnXsWeX6FiZxYMKF2JWi4jeCwEjI=;
 b=YxlwjHv9DgEQ03LfTLLVzjtbz2EV8+rJapvKDX2QSc0uHptBauPMIlINIUTPG8f6QK
 lvh7ZUaaqrSoIHafYu4ynQaIcvAWfyu02PYonO4NL67LWZ3t41lDh+BceM9qP4s7xZgA
 AdZvERxoW/cjS0KD7nttutolSlwtcsNS99vpIXZKD5QIENSQH2tRHHoEAjJ91Zv6imMR
 +uWqgy5OrtSs9JSOeRBi9ISoEm+G+cqLEhFdr/Ml6dQATecxFYkKJvJ4kRBo/czT2RUI
 gPelU1WdwtHdQJliE+doa49EXSZ90PogSBOmiDFR0f46apVzpB+LvWD3B5kdRMmPNLis
 bo4Q==
X-Gm-Message-State: AAQBX9emWn+qQo4DtxOFYplWL0evbOZEG9+QdbqUxeG1mWvY0URQcanx
 TG9GLnhQ9eByS1KIN0N4bcXcdQ==
X-Google-Smtp-Source: AKy350Zklz/sR+JJFQpTGIjMKnrtVHh3IcxpkkuU7U+heZ+X0HG7fk3a48HRreXt5LQJw7RVQy8m6g==
X-Received: by 2002:a5d:540e:0:b0:2f0:27cc:1e7 with SMTP id
 g14-20020a5d540e000000b002f027cc01e7mr4409096wrv.9.1681299828407; 
 Wed, 12 Apr 2023 04:43:48 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 15/25] target/riscv: Move hstatus.spvp check to
 check_access_hlsv
Date: Wed, 12 Apr 2023 13:43:23 +0200
Message-Id: <20230412114333.118895-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:53 -0000

The current cpu_mmu_index value is really irrelevant to
the HLV/HSV lookup.  Provide the correct priv level directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-16-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 10 +---------
 target/riscv/op_helper.c  |  2 +-
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9dfd1d739b..ccba3c45e7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -770,14 +770,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    /*
-     * MPRV does not affect the virtual-machine load/store
-     * instructions, HLV, HLVX, and HSV.
-     */
-    if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
-    }
-
     if (first_stage == false) {
         /*
          * We are in stage 2 translation, this is similar to stage 1.
@@ -1250,7 +1242,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      * instructions, HLV, HLVX, and HSV.
      */
     if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
+        ;
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
                get_field(env->mstatus, MSTATUS_MPRV)) {
         mode = get_field(env->mstatus, MSTATUS_MPP);
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index a5de3daee7..49c19d971d 100644
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


