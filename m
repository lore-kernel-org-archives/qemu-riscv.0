Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2aM-0007u6-8k
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2aK-0007rc-Q9
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:01:24 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2aI-0003ii-Hi
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:01:24 -0400
Received: by mail-oi1-x234.google.com with SMTP id bf30so3117248oib.12
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+p35/oWwAnwR4nkxv4vCszWfRwgaL1NMREdWhFXiQdY=;
 b=mFCE42HNUT9X80hJjTO+nGrScCelfTIU9KaUAP8XXhQGo3dZiO3wcTDMj/3XwMgbnE
 TXisu0My9/7aYwZy/FlLh01FrCoeKYzO6DrzJ/+fMzvaZDPPciFeRD9mDASdWkk3KegT
 avzDbStL+1IMvB0Sk1z5/i/DU0J8S/Q94P4mc3HFLG4Vc78zqI1OlISc4kezGQYW0Fw3
 LZerbkFbrJRQTZr3sBgr4NouHLDmnfWMdfehvZMfIEsN61kSCQGYUhS7rpTOzpeZXick
 JzoNqKgXQov9EmRz2cga0hoFhGPoaIdlX+z8hHGr6liDDU/eNiAtpA66Dy8iyzVPj16i
 77cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+p35/oWwAnwR4nkxv4vCszWfRwgaL1NMREdWhFXiQdY=;
 b=dCzFlrSzs+zJAAJa21iop0LvZHG5YCkdhQo4CQTHbtMswuxVZWoiiM0lDxn0NPBqBr
 B/qLwJ+fZGtiKFq2X5BPdyaCkoEGRKObDd1/5CJ98m8tVB2RlNFZi/Q1g+uLe/mAMhFm
 8MXYJhcsuMHDFjCTZ+V9O9c2PN3XMucdSmxnC7np4p8tbD/LiBGRJHLZLvBwzYpGDbaK
 +sKmFlWlk4x1EJmv+Tojsl355Ze6qRZaZivXwEI63qYvPtooC6XJsHqQ9Dzcko9TwPAz
 4LJ4zfnJWVNiS4MoOHcoZ60uhtKWdkNEozsMrPYZG4RGy+GfbdUHpyPJADxZyM6mptOb
 xJHQ==
X-Gm-Message-State: AO0yUKWEAkArciLBuOlxbFl9YrWWNhMhdO1RUkcUSLZF5yHEGUAd7e7D
 cqpXpS+fy2cAXjoNXzfjlCTQqLdXlv3kRWGUaQk=
X-Google-Smtp-Source: AKy350ZNHDDSFMh+cpvIsuDH7keH4t+m4yBlyDvCSQeRZ+t3Rf+wjE56zKIj4EbAQvJsYmCQDPHs/w==
X-Received: by 2002:a17:90b:4a46:b0:22b:b832:d32 with SMTP id
 lb6-20020a17090b4a4600b0022bb8320d32mr6155611pjb.9.1679741685769; 
 Sat, 25 Mar 2023 03:54:45 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 17/25] target/riscv: Check SUM in the correct register
Date: Sat, 25 Mar 2023 03:54:21 -0700
Message-Id: <20230325105429.1142530-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 12:01:25 -0000

Table 9.5 "Effect of MPRV..." specifies that MPV=1 uses VS-level
vsstatus.SUM instead of HS-level sstatus.SUM.

For HLV/HSV instructions, the HS-level register does not apply, but
the VS-level register presumably does, though this is not mentioned
explicitly in the manual.  However, it matches the behavior for MPV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 12 ++++++++----
 target/riscv/op_helper.c  |  6 +++++-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6c42f9c6fd..0017ecbf37 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -42,11 +42,16 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 
     /* All priv -> mmu_idx mapping are here */
     if (!ifetch) {
-        if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        uint64_t status = env->mstatus;
+
+        if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
             mode = get_field(env->mstatus, MSTATUS_MPP);
             virt = get_field(env->mstatus, MSTATUS_MPV);
+            if (virt) {
+                status = env->vsstatus;
+            }
         }
-        if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+        if (mode == PRV_S && get_field(status, MSTATUS_SUM)) {
             mode = MMUIdx_S_SUM;
         }
     }
@@ -838,8 +843,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    /* status.SUM will be ignored if execute on background */
-    sum = mmuidx_sum(mmu_idx) || use_background || is_debug;
+    sum = mmuidx_sum(mmu_idx) || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index db7252e09d..93d4ae8b3e 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,11 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
+    int mode = get_field(env->hstatus, HSTATUS_SPVP);
+    if (!x && mode == PRV_S && get_field(env->vsstatus, MSTATUS_SUM)) {
+        mode = MMUIdx_S_SUM;
+    }
+    return mode | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.34.1


