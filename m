Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zw-0001cj-Rn
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zt-0001Id-Sq
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:37 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zr-0007vc-ES
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:37 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so5451074pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832954;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cOCkkpY1/6w/mGzzZZmxagwohDu2O0n7RpZ/Apo/tc=;
 b=g15ydl0N6qW2rZ4UUIL9sPF1fQCK6S1aqiZnUuBxes3bBlhh5hvjW0C8k7ZaobLe/3
 4wXLHIS946YfMPVQdRdyCGd8bxFQh+Ss2RHL8vKAfAKOcP0lUnwYkSnRrhUXxWKyWGlp
 C4UUYLa3ukdpZq/wJq/aj5IHP+QtUlGWTOLz/4X3RLDqD0j1gszU0FUwyS8QKajGAEQH
 uPio8EZYSdo3KsRK5qMlFxPWdblEqYMsvoim8PHYUlu6b2282QgEt6ls9ONkXwQFYsdC
 WEXx9uXPxKi90ksToq7oUtlVVZVgzfJ7t+Vrfc0FqEwE0cIm+SLf7cwHDJ7cucA5+sx8
 XaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832954;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cOCkkpY1/6w/mGzzZZmxagwohDu2O0n7RpZ/Apo/tc=;
 b=b74uOsMhDiFq44l253P8k2ZB58cP61OmkW+0Ki0zXBP597CzvnRj/TNe2AhYY8mEbQ
 KbV48iKBlRGVmqIAfiTcgxHknuscwxeuW+QOadvLLj/O+joO2wUeFhhw+r83r+HnzSSK
 TT/KQ338g7CHEHpoGOYkGNvO21OByocqXP+y67In0lQygfFvBouUBqTf+CiYG4mXBZpU
 zIcRWIU4RNukM4FOU6CIFsnfEhrXnfmeBIeGySNP26kwELC55Heq3N9+uFVi+r+8Vxgn
 dD/cewg6jV5Wd88Jzllajwxcis4ZYFTr8kzrgN3UfO8NOOImDMp6eU6RaEFZ5lBhv223
 iOzQ==
X-Gm-Message-State: AO0yUKWW1AZoC4r2FjZF0dV2TQmM9vEL1wstkWHO3cEm4iyRlwtw4lul
 j/SJDHZGBgSnQSni4mYjrW7lSgq+Kf+PGQ9d
X-Google-Smtp-Source: AK7set8KOlWhCXZlDKIc733KoWMKa5mDRMKEVQTrOwe/lJf1xUN0kuPtZn7Ye7T34/RG5SOVGR+u7g==
X-Received: by 2002:a05:6a20:4c92:b0:cd:42cf:6e03 with SMTP id
 fq18-20020a056a204c9200b000cd42cf6e03mr1304085pzb.26.1677832954255; 
 Fri, 03 Mar 2023 00:42:34 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 p22-20020aa78616000000b005d55225fc07sm1036211pfn.73.2023.03.03.00.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:33 -0800 (PST)
Subject: [PULL 58/59] target/riscv/vector_helper.c: create
 vext_set_tail_elems_1s()
Date: Fri,  3 Mar 2023 00:37:39 -0800
Message-Id: <20230303083740.12817-59-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:38 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
load / store instructions") added code to set the tail elements to 1 in
the end of vext_ldst_stride(), vext_ldst_us(), vext_ldst_index() and
vext_ldff(). Aside from a env->vl versus an evl value being used in the
first loop, the code is being repeated 4 times.

Create a helper to avoid code repetition in all those functions.
Arguments that are used in the callers (nf, esz and max_elems) are
passed as arguments. All other values are being derived inside the
helper.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230226170514.588071-2-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/vector_helper.c | 86 +++++++++++++-----------------------
 1 file changed, 30 insertions(+), 56 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3073c54871..7e476ea8c3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -267,6 +267,28 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
 GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
 GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
 
+static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
+                                   void *vd, uint32_t desc, uint32_t nf,
+                                   uint32_t esz, uint32_t max_elems)
+{
+    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
+    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint32_t vta = vext_vta(desc);
+    uint32_t registers_used;
+    int k;
+
+    for (k = 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+
+    if (nf * max_elems % total_elems != 0) {
+        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
+}
+
 /*
  *** stride: access vector element from strided memory
  */
@@ -281,8 +303,6 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
     uint32_t vma = vext_vma(desc);
 
     for (i = env->vstart; i < env->vl; i++, env->vstart++) {
@@ -301,18 +321,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -359,8 +369,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
 
     /* load bytes from guest memory */
     for (i = env->vstart; i < evl; i++, env->vstart++) {
@@ -372,18 +380,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
 }
 
 /*
@@ -484,8 +482,6 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
     uint32_t vma = vext_vma(desc);
 
     /* load bytes from guest memory */
@@ -505,18 +501,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -585,8 +571,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vta = vext_vta(desc);
     uint32_t vma = vext_vma(desc);
     target_ulong addr, offset, remain;
 
@@ -647,18 +631,8 @@ ProbeSuccess:
         }
     }
     env->vstart = 0;
-    /* set tail elements to 1s */
-    for (k = 0; k < nf; ++k) {
-        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
-                          (k * max_elems + max_elems) * esz);
-    }
-    if (nf * max_elems % total_elems != 0) {
-        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
-        uint32_t registers_used =
-            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
-        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
-                          registers_used * vlenb);
-    }
+
+    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
 }
 
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
-- 
2.39.2


