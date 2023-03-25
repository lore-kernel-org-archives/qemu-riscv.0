Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2Rg-0004N5-KK
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:52:28 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Re-00049i-ED
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:52:26 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2RZ-0007jX-Qt
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:52:23 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17ec8963db8so4446835fac.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Qi45RbjVmBVTz34gjl4oQKcVrFIWG+fLl/XiM+HKu4=;
 b=Scm878mXvgukp89dwG8ZCvcSE04jk381TlE32zatyzYIUB95TBgF6i092VnRCCFujU
 pVUQdS7crTNO9JbYdQgYrjwg105NFZvF1m/Ypp4IyTsTHyRwwFSTCNKVwIx+1XZ+uXBZ
 xmCrhwGwPhQunoyuJJm8vkajldECWba5XwSvi2TwCb3COhk1nV5QHLRaLB8rJLNUsRe5
 KOLT80vuEcplv/jtdVBxENdYLgO9xaVqNdJE1hObgVnfvfcwjDcrUDJZw3cAEECRQ21f
 LMCvtWrAxwdY50X4LraFZNXmnOZ8cHNoAfn1S4P8UgWU3YqIOOG3tpGwrElvXCr1aHE/
 7R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Qi45RbjVmBVTz34gjl4oQKcVrFIWG+fLl/XiM+HKu4=;
 b=2SLG9LUsG8jyM9IJVfDUeAVvwhcY09cPSTtMq6Tq8Exy6Wqz6eZ74jq3mb8TYY2FBE
 VHy6bVxVywJkfP3jAKnvfe3Uf3xFlKonANrnTIqHOwkG9to2lnCXuIoMepV4Ffejii+D
 /hZzqv57Ehu5Y6KNIUUcmh7eRlokoYwjGp4ar3zbKaTeBGUpyNFbyPI3CISp+BjxDdp/
 pC5x46MVV8UAQFNkcj3i1GAv0RXJuccIrW+ttJK8U7mAjBIDuGmPOEUe+2b04wiDK/Jd
 bvyBiVR5EAD9pjIoLYQ3KONCAlF1iY95ce7L2fZZ6nTgZN+7luvPOERPlx8ggLSx6Rjh
 BfVw==
X-Gm-Message-State: AAQBX9c+cdycwfgQ6vEmH4ClTyHZ212RQfRI67nJxDRCRq8cF7ksO8Ng
 qxjvSsZgl5ofQrBkOu9qotR3dTroJZCqes6Y/nI=
X-Google-Smtp-Source: AKy350ZFbLOFm2BeqkYOUROUzhIQdwbe9nbfcUqMiTMjMAs+Dhwoa9x0I/EXllZxov9GIFMSn6R5pQ==
X-Received: by 2002:a17:90b:3502:b0:237:8417:d9e3 with SMTP id
 ls2-20020a17090b350200b002378417d9e3mr6330234pjb.15.1679741681283; 
 Sat, 25 Mar 2023 03:54:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 12/25] target/riscv: Introduce mmuidx_sum
Date: Sat, 25 Mar 2023 03:54:16 -0700
Message-Id: <20230325105429.1142530-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 11:52:26 -0000

In get_physical_address, we should use the setting passed
via mmu_idx rather than checking env->mstatus directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/internals.h  | 5 +++++
 target/riscv/cpu_helper.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 7b63c0f1b6..0b61f337dd 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -37,6 +37,11 @@
 #define MMUIdx_M            3
 #define MMU_2STAGE_BIT      (1 << 2)
 
+static inline bool mmuidx_sum(int mmu_idx)
+{
+    return (mmu_idx & 3) == MMUIdx_S_SUM;
+}
+
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 888f7ae0ef..7e6cd8e0fd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -852,7 +852,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
-    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || is_debug;
+    sum = mmuidx_sum(mmu_idx) || use_background || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
-- 
2.34.1


