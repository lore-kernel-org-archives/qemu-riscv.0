Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtn-0006vw-VJ
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtK-0004zH-R2
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:44:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtI-0002N2-Sc
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d9so10668990wrb.11
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299836; x=1683891836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ia5N2/U/AO+3qNL0VIGZiWVWDwXAJ3RRrVuamnKN6gs=;
 b=XGws3MzszdtAXrTZpOBPFyrF/g1amQqNqyEbNRxDOwD7oWlsBcdQXtlhco9Smf5EN1
 bgexxb79eii3srT78wW9PzidwBAw1lOsClDuJZ7iKOAyA0DoEjdVkqUN075p7SFEROad
 10fpImO4APwZkyYjpvzdLq3uTCyK3xvI/YAjbWqKv76rPt2ga6AklUamSoGmSs6PO5D8
 CcjwWnCuXkrSjZFZT/wt/bf2GgrpPW0LEqeu/mG7QU+TASaZGeyv35DkKXcBPhWNvDW7
 OCltDL0t6a5tEpcv0Vlppj6g0VC5u9KNGjHBBKUdCYP39AM1KwlWtnzu++iNdfuxvUpa
 pASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299836; x=1683891836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ia5N2/U/AO+3qNL0VIGZiWVWDwXAJ3RRrVuamnKN6gs=;
 b=Pv1Esd/0DO7jzGiiBRzHV2B/aYPuBvuegmEzfvWPMHtNmFmTjCWPHi3xxP/bLGESje
 t/QBX4Wlhf8XUqGBN/TxR2kA9lPp+y0kQTGEP6v2KXjiAzQ/ixqGwm5vIa4c7w2nqWY1
 UNRMppx0KMcyMl6H3LNQeYCjMrd3XInLcBsKu15anSP3za5z9nVuVczMf9TaytgvrIn2
 a2eyft/7NQxNlhP8SqOGGQFu1XzgESvBQugIpoQRErgLDzO/NtApze4awLKc7ENYqbBS
 8sN080Cu5k/k7W3VbatGI/+My5Vp2TQbTATOFjpSAzVyD6HIdnQXyy+4xjymF04DB+kw
 7ThA==
X-Gm-Message-State: AAQBX9dv120nDzl7svHPg+Gk/ZCrkkaKvQuTDrspPXh9G/BZf7Bbff4a
 vw3EWVioBoO7Q58LOwJ6bTwKPw==
X-Google-Smtp-Source: AKy350amyyNG900KSwWIZYNuYiUqBLxaMVcb+rlyRP9dclH3Erp84FzmET7kEnXjjkcjKnJivuOCKg==
X-Received: by 2002:adf:f545:0:b0:2f2:542a:6f50 with SMTP id
 j5-20020adff545000000b002f2542a6f50mr4488081wrp.56.1681299836216; 
 Wed, 12 Apr 2023 04:43:56 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 23/25] target/riscv: Merge checks for reserved pte flags
Date: Wed, 12 Apr 2023 13:43:31 +0200
Message-Id: <20230412114333.118895-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:44:05 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-24-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9a2b944990..c7c384bae3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -962,14 +962,14 @@ restart:
         /* Reserved without Svpbmt. */
         return TRANSLATE_FAIL;
     }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
-        /* Reserved leaf PTE flags: PTE_W */
-        return TRANSLATE_FAIL;
-    }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
-        /* Reserved leaf PTE flags: PTE_W + PTE_X */
+
+    /* Check for reserved combinations of RWX flags. */
+    switch (pte & (PTE_R | PTE_W | PTE_X)) {
+    case PTE_W:
+    case PTE_W | PTE_X:
         return TRANSLATE_FAIL;
     }
+
     if ((pte & PTE_U) &&
         ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
         /*
-- 
2.34.1


