Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAwM-0005Wf-IF
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwK-0005SM-Uf
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:28 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwI-00062u-VV
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:28 -0400
Received: by mail-pg1-x529.google.com with SMTP id e8so873357pgc.5
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lSGavHjP8DkZgSzTSXFcl5cCaE8i//N9BsXmCdZs8Ww=;
 b=KnWT1lixgFk93ruSwizppy66iVSTs4uQDmPJVDG6azKUhMF/vrkNPXwIqe4J1B1ntZ
 OPTmxCdZ0u2Shkdu9MEQ5vfTqJMfzb4t12BbYXG4Faksy0KZ+oYNRpApi2m0wa03vL/G
 BY57bbbGelfBJKSbQNTakkkNWRjShXExUazmLr4XgN6OMTwV4LG3BJ0xshL9mnUPkWNW
 IeISZaLH4URxadfcpMJa271M+VM7TMdxE74z+laNI2Kp+mQ2s7o5pnu1spYmxrOV7Mly
 wRwjKRhIQ1CN2lHl/YayZj+ta/mQI2C7gnfmFpWJgfzqHvKJA4DfTWuu3IBIaYpW5hc2
 Xifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lSGavHjP8DkZgSzTSXFcl5cCaE8i//N9BsXmCdZs8Ww=;
 b=BBztc1k6ibSPrkOsujeGgYsZ56vuKu1TJn4DT94C+mInRxcKsa5IVrSIvUWSg4dlNH
 hDozal4IvFeRyxDVeMiZYUVI29mrZ3DeKxxrW9WkWG0+LYS+Itxi2svcfSB7HeM1qYd7
 X7kxU/QXBPKICIq3aWzH9McxUpurwqPOa0xhMLZ1H+UPASDtLPnHzf/wXbLT08PuSc0N
 NPBGMj5HdlRawXCQR20kCck/zP424LE1eg0lslK59f8BQ0Qx92aE7UvMibJeJra8XPVh
 VYcAhg4quT6YMwZdcleAcs6dqUdVG1qpN4EzpvoZXpvXUaX06oDi/CbUxLPBFXv2iN/s
 /kDw==
X-Gm-Message-State: AOAM533WbPzcsv60Mxd6bpO3cU0sJiC66hlGsmQaFeb8LGdJxho0lL8K
 yNI7I/HpODYGJFy+twOxWm/eUXdVmVg=
X-Google-Smtp-Source: ABdhPJw4B0xCrzhHOPZfBkQkihjMR9DtE3963cnKY79n15QckVEZ8ytX+dJHhJvZeDQh9TTxrc2o3Q==
X-Received: by 2002:a62:a20d:: with SMTP id m13mr6294215pff.201.1595409685603; 
 Wed, 22 Jul 2020 02:21:25 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:25 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 54/76] target/riscv: rvv-0.9: floating-point compare
 instructions
Date: Wed, 22 Jul 2020 17:16:17 +0800
Message-Id: <20200722091641.8834-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2020 09:21:29 -0000

From: Frank Chang <frank.chang@sifive.com>

Clear tail elements only if VTA is agnostic.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 52 ++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 95cce063d0..8dccec4e04 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4174,27 +4174,30 @@ GEN_VEXT_VF(vfsgnjx_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfsgnjx_vf_d, 8, 8, clearq)
 
 /* Vector Floating-Point Compare Instructions */
-#define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)            \
-void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
-                  CPURISCVState *env, uint32_t desc)          \
-{                                                             \
-    uint32_t vm = vext_vm(desc);                              \
-    uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
-    uint32_t i;                                               \
-                                                              \
-    for (i = 0; i < vl; i++) {                                \
-        ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
-        ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        if (!vm && !vext_elem_mask(v0, i)) {                  \
-            continue;                                         \
-        }                                                     \
-        vext_set_elem_mask(vd, i,                             \
-                           DO_OP(s2, s1, &env->fp_status));   \
-    }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
+#define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)               \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,      \
+                  CPURISCVState *env, uint32_t desc)             \
+{                                                                \
+    uint32_t vm = vext_vm(desc);                                 \
+    uint32_t vl = env->vl;                                       \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false); \
+    uint32_t vta = vext_vta(desc);                               \
+    uint32_t i;                                                  \
+                                                                 \
+    for (i = 0; i < vl; i++) {                                   \
+        ETYPE s1 = *((ETYPE *)vs1 + H(i));                       \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
+        if (!vm && !vext_elem_mask(v0, i)) {                     \
+            continue;                                            \
+        }                                                        \
+        vext_set_elem_mask(vd, i,                                \
+                           DO_OP(s2, s1, &env->fp_status));      \
+    }                                                            \
+    if (vta == 1) {                                              \
+        for (; i < vlmax; i++) {                                 \
+            vext_set_elem_mask(vd, i, 1);                        \
+        }                                                        \
+    }                                                            \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -4208,6 +4211,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
     uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);    \
+    uint32_t vta = vext_vta(desc);                                  \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -4218,8 +4222,10 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
+    if (vta == 1) {                                                 \
+        for (; i < vlmax; i++) {                                    \
+            vext_set_elem_mask(vd, i, 1);                           \
+        }                                                           \
     }                                                               \
 }
 
-- 
2.17.1


