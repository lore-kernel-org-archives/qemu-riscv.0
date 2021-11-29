Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX3c-0006am-9Q
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:10:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3a-0006U4-EK
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:10:18 -0500
Received: from [2607:f8b0:4864:20::52b] (port=44571
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3Y-0000zd-Op
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:10:18 -0500
Received: by mail-pg1-x52b.google.com with SMTP id m15so14521204pgu.11
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pX7up42eJdry9ST+fCOivX3QhMzdNXElxnzXTMtgVr8=;
 b=VwFjxnn4U32FBmmrXYVLv7DwXtO/Etv3u7irDsOj2aSIVtGBRfpQV/c4pdZ3hoA2/v
 8aKufuItFizW2Z62VMKRa7Po7R7MnkDOKqV1ZVWsxwA0UK3R3pbAOYJW9kBuAd+PWZEd
 4gRP8IxBcMTiefl13mUWIwTe/En7GWLZp5JI0sNFXEd+lCVmmUH05fXV8ZVsgORBQ/yz
 0qYM2vco65kJFSLIAKyiIpstccQjanjG9hzUlxqqQD1Aaom/xFe9xgOFkoQZdWiw2yVg
 f3zdydOw3mXb8DWplqSTq6jgg0gZpjnUha7PuS7zyjhXxsFpPwUbvVtba57p9fA6tecb
 mkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pX7up42eJdry9ST+fCOivX3QhMzdNXElxnzXTMtgVr8=;
 b=G0al7Wl65Zqc14HpqxwYMkMeEWKHN8HV4YVIHsh8oJour07hjGtTnnT/Asw8MnRGyx
 +ey27WOg7cCpm0r2qZL11eWeIjl5yx2b5u9WXWhVQ83TjyQwT8ikzh+HcY37T9yg5lh7
 7i2Ef9afzUIx83TASaGy+GHJt000l0Hh7xjHTzZ0E7Wdi9okeXPiNVH3taucBVtCOuqO
 QtO9Rp7WfdMHdcYUFSrhworodjN1G1NMF3KUIR5Eakawcn49/ObHfR5X6R2XSX/4i0em
 ngxKc99YuefC/6QFBfudmxhssc1bg57V5rMdJCwhVGKWCIcgD6WJpmEV7k2WzmYr123q
 P4FA==
X-Gm-Message-State: AOAM532Ik9mrpUbNIpeL0YT4jF3rLrl/rr3+4sIDwFjet8NFVz4uADeA
 jRoNQv1GaQTs4xkoXC/1Lx2Avw==
X-Google-Smtp-Source: ABdhPJzxdGSI+wqqNMwWEAWVGaiMosB7m/iyv0q5pzQZfJ8sitkwJImbh0eo0WMfy+5rXwM97ivsvw==
X-Received: by 2002:a63:78c:: with SMTP id 134mr13538428pgh.373.1638155415305; 
 Sun, 28 Nov 2021 19:10:15 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:10:15 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 73/77] target/riscv: rvv-1.0: add evl parameter to
 vext_ldst_us()
Date: Mon, 29 Nov 2021 11:03:33 +0800
Message-Id: <20211129030340.429689-74-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:10:18 -0000

From: Frank Chang <frank.chang@sifive.com>

Add supports of Vector unit-stride mask load/store instructions
(vlm.v, vsm.v), which has:
    evl (effective vector length) = ceil(env->vl / 8).

The new instructions operate the same as unmasked byte loads and stores.
Add evl parameter to reuse vext_ldst_us().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 946dca53ffd..83373ca6fc6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -279,15 +279,15 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 /* unmasked unit-stride load and store operation*/
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
-             vext_ldst_elem_fn *ldst_elem,
-             uint32_t esz, uintptr_t ra, MMUAccessType access_type)
+             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
+             uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, esz);
 
     /* load bytes from guest memory */
-    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
+    for (i = env->vstart; i < evl; i++, env->vstart++) {
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << esz);
@@ -316,7 +316,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
-                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);          \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_LOAD); \
 }
 
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
@@ -324,20 +324,20 @@ GEN_VEXT_LD_US(vle16_v, int16_t, lde_h)
 GEN_VEXT_LD_US(vle32_v, int32_t, lde_w)
 GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
 
-#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                           \
-void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
-                         CPURISCVState *env, uint32_t desc)             \
-{                                                                       \
-    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
-    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  \
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
-}                                                                       \
-                                                                        \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
-                  CPURISCVState *env, uint32_t desc)                    \
-{                                                                       \
-    vext_ldst_us(vd, base, env, desc, STORE_FN,                         \
-                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);         \
+#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                            \
+void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,          \
+                         CPURISCVState *env, uint32_t desc)              \
+{                                                                        \
+    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));              \
+    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,   \
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);      \
+}                                                                        \
+                                                                         \
+void HELPER(NAME)(void *vd, void *v0, target_ulong base,                 \
+                  CPURISCVState *env, uint32_t desc)                     \
+{                                                                        \
+    vext_ldst_us(vd, base, env, desc, STORE_FN,                          \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_STORE); \
 }
 
 GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
-- 
2.25.1


