Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapp-0000mx-Ib
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapm-0000gG-Kb
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:50 -0500
Received: from [2607:f8b0:4864:20::631] (port=33356
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaph-0008C5-1R
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:50 -0500
Received: by mail-pl1-x631.google.com with SMTP id y7so5798014plp.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tlfo0cSvfe+EcMV73lW1RdpdLIcQKGUGA5CQlKVfIxs=;
 b=YsWiSa2C0rMgzLKIyzIjVJz9426aLe0ifEuO9hKgz3LjTEz+FGZRE1xKraea3W1EN4
 OJW6EhAZkWrn+rqVV3u+1F7M+ofK6OzZTbM0aulIn/107Z/8nlG8zOkIGuA4rUql7nKW
 9Cc0bUtzS4pcPjE91CkIeCikOpXJbuBweWArXVdF+i5NerwqyUCAv9mWk9wNrYIBB9QX
 bBTOZVbCNCoApySuBLxeAHlJJ8/olpLIwOO9apLhiwNSuTze5WYVRvCVDOgXkOxTDOW6
 fX6RHatRNiKpm8yRSovySXgS6PcPsk5lqIQpNXpFv7AN7zjmBvaCdGubCGUyP5xq8lHV
 tE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tlfo0cSvfe+EcMV73lW1RdpdLIcQKGUGA5CQlKVfIxs=;
 b=h9wF09xPRBYiugqob2Pg+Dfk/Y3PjAoBOEo4HcZAON2MqXt49Z61/eqLa9FAstz6K/
 bk/Jqiz3L08VTtinAT9p+W3i4t1wXSKxDdcOeE/f22jtXXOvPt3ZwN8Buh50os5yVu8w
 M2DTptQrSrH1VadZ3rg/fu3Wo0M4z1M64cVJP3oVoiah1jNy7qAlo4bhAn7FNQ+k5aYe
 qZUTds9YDA0sU1QQ2KIWtvvaoE3wgst+YuSAEz3KpjTln0j79xRwlcTWP2XYvRsNa7EM
 8s4QQeZdbpgIrK5FRzAeQtY4VHz4K70k6r/EJ4OE0j/b6G+1B9A9QH2Lk/SQAI/CdvvB
 0DKg==
X-Gm-Message-State: AOAM533pvlxLi1fA7SgHMDtqBhGc7ZWm4ts0E0lbYKWCjylGJqtOUq0O
 MvOvz3OgOwOSs/pxhChJvb4tzQ==
X-Google-Smtp-Source: ABdhPJzjmfzrcgM9ZsVnnEy5stHw1im8drLDMHkEMxMLuRa4ilxp8ny5UnnIHpNnSsukaq3i6WOqtA==
X-Received: by 2002:a17:902:f687:b0:141:cf6b:fee7 with SMTP id
 l7-20020a170902f68700b00141cf6bfee7mr72055123plg.75.1639123243123; 
 Fri, 10 Dec 2021 00:00:43 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 73/77] target/riscv: rvv-1.0: add evl parameter to
 vext_ldst_us()
Date: Fri, 10 Dec 2021 15:56:59 +0800
Message-Id: <20211210075704.23951-74-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:51 -0000

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
index 946dca53ff..83373ca6fc 100644
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
2.31.1


