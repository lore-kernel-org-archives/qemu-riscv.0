Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaom-00070L-V5
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoj-0006mR-No
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:45 -0500
Received: from [2607:f8b0:4864:20::432] (port=35749
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoh-00072H-P3
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:45 -0500
Received: by mail-pf1-x432.google.com with SMTP id p13so7790150pfw.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZL0vHwErqt2DCDapRPpE+y8AgaRUbb713wyO3FaWts=;
 b=HBt+sB9FfROapy5IaHcAThNXvyJVU769wQzChB5F2cayXQp2CSDGadQ0TLYe6/okOS
 0+mHRel4EyZeyigU1OD7pUSGBVsMDqq3aHGo7+xco5Aq3F6nUQ30sxVYCQIyRNx3kYcZ
 Y3iNfF4xJOE8GZqLdr3tl0VKhENi9TF6ophahk9zrIO3LnvL5iRM5iNDzS6ePv8v874o
 peU9mMZ2bCwiG8OnxzKdOlmw0tG0/VQfhPM0ZmsHW3uZwpNu+2XB5lMGDF95EYBXhZqW
 dBsXQBY4ZK/p9OCx+oOXyACd9XVo1CmpqooW5IZ/FH58EB+ONmGIw8nIOfXCmktpeZXK
 RV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZL0vHwErqt2DCDapRPpE+y8AgaRUbb713wyO3FaWts=;
 b=k8TfG8S1rOEkpGeoER/hjCVHqDCZsh+KDyZEuSNpea7putzhZH+dx0c56DXI+M+aWC
 +9ZQha9o3b56N+ZRVjMU8SLVDG6m4TRl711mDOmTO+EYSguRdpyHjUiZiISftoW2ygHC
 yZp63hOnvCAsip1tBPt79kDx0MsEeZleJw/bpyvm2pFAYX5xabq1kpF7wfgXzYPDzfjL
 7i6ieUs1O4wO6HT2xH25vCwhzAR2ccZTXMHKAMeb2beB2WvFgvtylbdqmDuukLixL1rp
 PtHdw6Zwily2FutDAdzqQzsEe8SWIxg7Ap+sJhW/UYiCG4JuhYuiFsk1LaeW88T9Z85O
 B0Hg==
X-Gm-Message-State: AOAM5337snNdeP+GKz7tqV4M6rZ1Uv1+oHoEoL9kRnU+WRBVBu+wR8AN
 pUTbFP2xgLeeXm5GwCf0QafD0w==
X-Google-Smtp-Source: ABdhPJxUwO/1YrH3bcnhKN9ktvIkuYvv7LDClidNo1ltCE1wRBiYqshSDP2EQ5yA8iYLeJb5Cx0haA==
X-Received: by 2002:a62:1cc4:0:b0:49f:99b6:3507 with SMTP id
 c187-20020a621cc4000000b0049f99b63507mr16768911pfc.76.1639123182556; 
 Thu, 09 Dec 2021 23:59:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 50/77] target/riscv: rvv-1.0: slide instructions
Date: Fri, 10 Dec 2021 15:56:36 +0800
Message-Id: <20211210075704.23951-51-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:46 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f883fdf474..d79f59e443 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4430,17 +4430,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong i_max, i;                                                \
                                                                           \
-    for (i = 0; i < vl; ++i) {                                            \
-        target_ulong j = i + offset;                                      \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
+    i_max = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
+    for (i = 0; i < i_max; ++i) {                                         \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
+        }                                                                 \
+    }                                                                     \
+                                                                          \
+    for (i = i_max; i < vl; ++i) {                                        \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = 0;                                    \
         }                                                                 \
-        *((ETYPE *)vd + H(i)) = j >= vlmax ? 0 : *((ETYPE *)vs2 + H(j));  \
     }                                                                     \
 }
 
-- 
2.31.1


