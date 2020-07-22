Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAwW-0005wj-Ot
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwV-0005sr-7l
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:39 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwT-000658-Fe
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:38 -0400
Received: by mail-pj1-x102a.google.com with SMTP id k71so874353pje.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OUSvqk8N0OEsedcBlB/CQ0Og2x6aYFwr+QYiYEPQ0xY=;
 b=iNXdyGlz//tjnG6CqKIt5OYuZmyZMR4FAgsN/xp+MJTxb8vgUaYv4Bz6vCQcD2Iaux
 GUTtidbA0Zl2I6QhPtwy3JnhtHaKqOF517u3VyGFOw4XS9bTkFMtr2+i+noxelvezroG
 oLnvArjXYHpU+ZHKg4+1KiOjsWRLnEKAXwREh1/xamUi5ZPv+WQ3dpYn9CpVM/oQRLL6
 SWHcBXoBBlqiAk7RuLfbaJ4/OyGyXZVvl2Ti1wuzks/jvvIb2skI3oee//ItVMheP/IG
 6skWr2arJAVmQM5CkG/qCN+JiqsvYfiJFF1H30dGAaP0TtTKvgfZIoYnjlCdGR7NCLMe
 La/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OUSvqk8N0OEsedcBlB/CQ0Og2x6aYFwr+QYiYEPQ0xY=;
 b=KtKdvnRds0xIflhDCwJ8NhdrOS7maIDk7xg+gs/7qxrNtkNc4JSv5HFMWnRWXI5CW0
 eg2Y74Aou3bhGvEHqE96Wg4suycMUL9MnLx7aXGLqoXHeXhHs22ZNQklkZN2VU0BeulY
 BNKElLBIrcrtsADqJeO4D8Y029Rjg/nMTW2a11Xh1Ap5eqgRVZGxykKMQcz1POLy1UNm
 iN9aDudufylGqOn2ap5lArgSv4EpZgVMjDzv8IFYTZ2ZGz9RMCE7prOqN5lmWs/lmjnq
 r5gABj6fUlTQtitrgOE9vXD3Uimpwm4mFhxEHKPC9NXani1osJ5cnGsNyhFsl4ngLjVx
 ZYGA==
X-Gm-Message-State: AOAM5301WY6ZRO1pTJ0wPwB9aWeQ4Xgt/Eqj7PjhgpcqW4hGbpmju4FZ
 M0N+O2eB3Go4ThLna+NaWjoIcw==
X-Google-Smtp-Source: ABdhPJwIb5FJZuXoMY5P89e0fIHXnLwz85EXzjZ91/EJD7v9KyOLGjsUY/Dl9ZXi7KVISKlXvHQE9g==
X-Received: by 2002:a17:90a:d583:: with SMTP id
 v3mr8545970pju.33.1595409696166; 
 Wed, 22 Jul 2020 02:21:36 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 57/76] target/riscv: rvv-0.9: mask-register logical
 instructions
Date: Wed, 22 Jul 2020 17:16:20 +0800
Message-Id: <20200722091641.8834-58-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:21:39 -0000

From: Frank Chang <frank.chang@sifive.com>

Clear tail elements only if VTA is agnostic.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 3 ++-
 target/riscv/vector_helper.c            | 7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 378af8344d..5004707b87 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3023,7 +3023,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
 #define GEN_MM_TRANS(NAME)                                         \
 static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s)) {                                   \
         uint32_t data = 0;                                         \
         gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fa2459d941..bb426e224c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4738,6 +4738,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
+    uint32_t vta = vext_vta(desc);                        \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4747,8 +4748,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
+    if (vta == 1) {                                       \
+        for (; i < vlmax; i++) {                          \
+            vext_set_elem_mask(vd, i, 1);                 \
+        }                                                 \
     }                                                     \
 }
 
-- 
2.17.1


