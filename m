Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2TC-00089C-DZ
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2TA-00088E-EZ
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:54:00 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2T8-0007xo-Ue
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:54:00 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-544787916d9so81689797b3.13
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3FEu/nTbPKwKvyLx5sbEt9ZFhxKMxxn+3nzIHWc9gU=;
 b=xt5CBf3e03tjYIzvRNwQcqLRcRfXVS51ELNoBVaQGW75K36OV2N9nbuBybByYBTmw2
 5CCDakKViIgwjyEBqnhuwwpZbleWTEJ2ssprUhTB4R8jZ9cNMc8eIG1TFnbvPGtkLe2M
 hKbKAbPohfrBUgOjA5kKblCr4Nr6nqnyY5PdDlQB/orLGU5eHkrSXJLmsbqyrDx1sJWX
 loKisrzuaG45lWaiLePAOc1u3vx8BVOJYbFEamqstbhLOfkQnViU8Tzx1himJdwgcXFf
 tPDyArZvYXucvqQoixIQ4tEke+28eljBt9icrKxhODypBwjR0fyOYyow3sQgyxpnfEG2
 /l/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3FEu/nTbPKwKvyLx5sbEt9ZFhxKMxxn+3nzIHWc9gU=;
 b=QphMSl6QBcuGaicXzHVzKTvGw8DSbI+n8TKYAjZlktlApxume0O3O3Ip47kgRbi620
 aq6q18BJBcjq5rArCCu1GzPLlFwhNX0BVkryaOO+3yxKRRUKDjTvESzcOgtOz44BhBO9
 aS52X8tEi4e8P0VUFB3MxAKJ8Ljep0NZCkhWGlAukhkqe2+c5N1AMlpLt55HZKs0bJJf
 xe7O3VP79GD7Me/b0t27TPmdgVvig+XKEn6cNajdvT+MTQyJ2GpMtEcxhAzSTOk2rqef
 PVSFWdQDmZl+3+t5+K4PYFpcLd+Z/q7RQ5cQrtqzB2pgrMThXS4iViciDcW32xHvYsga
 ulJg==
X-Gm-Message-State: AAQBX9dTpRjhtV4hx2DgvRX6R88/8xI2niX6g15Eg7cBfGzezO03bkMc
 eq+/JkzoQQWBr/MAn34NWAYOynN3+bGoH8JXHA8=
X-Google-Smtp-Source: AKy350YxUxBcUZoUYTeRvKW3PpZvY9cxXhwx72rX1UZALSva9WldJnq+fUDx0YUN2ra3FYjMb+o0KQ==
X-Received: by 2002:a17:90b:1d0b:b0:23f:2661:f94c with SMTP id
 on11-20020a17090b1d0b00b0023f2661f94cmr6313885pjb.47.1679741687456; 
 Sat, 25 Mar 2023 03:54:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 19/25] target/riscv: Hoist pbmte and hade out of the level
 loop
Date: Sat, 25 Mar 2023 03:54:23 -0700
Message-Id: <20230325105429.1142530-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1132.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 11:54:00 -0000

These values are constant for every level of pte lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 833ea6d3fa..00f70a3dd5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -870,6 +870,14 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         return TRANSLATE_FAIL;
     }
 
+    bool pbmte = env->menvcfg & MENVCFG_PBMTE;
+    bool hade = env->menvcfg & MENVCFG_HADE;
+
+    if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
+        pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
+        hade = hade && (env->henvcfg & HENVCFG_HADE);
+    }
+
     int ptshift = (levels - 1) * ptidxbits;
     int i;
 
@@ -930,14 +938,6 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        bool pbmte = env->menvcfg & MENVCFG_PBMTE;
-        bool hade = env->menvcfg & MENVCFG_HADE;
-
-        if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
-            pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
-            hade = hade && (env->henvcfg & HENVCFG_HADE);
-        }
-
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
         } else if (pbmte || cpu->cfg.ext_svnapot) {
-- 
2.34.1


