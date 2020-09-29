Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKz6-00072S-Sp
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyx-0006zT-7w
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyv-0002Nl-Gh
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:10 -0400
Received: by mail-pg1-x530.google.com with SMTP id t14so4621261pgl.10
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E9RTi514wB1x4upiCcYJC88mFJzj05fsXS9Z3A/1lI8=;
 b=dKoz1VCMzZnan+149PXvC6hq6r1kfbFmDv4mPNtv4cGbxcg5fSQMzRsn8zgb3mq67W
 gW/mKYMxSrcM0oQQGg1ZvQOttZ/L0NV0qoNvHUuHQziZtTTi9TNSJS2QtozRbUQZsGda
 FukxLG2lx09iSWz2L77pOk6hFyax+HWslnfcLeQh70RScMy+qBuMEvs8x71EYGdgGUIM
 9iKdfeoE12Nis9EyuUZxxyuef7eOb2OGa1+hiDzNNi+ru9EcGI9d8yicnu6ZjZgqxy8A
 wLFy4/loyhDxB7FunulBFVbKvFMExy3lL8HXfWRwt3UqIusfl6HB0aAiGJGzbpmttK1Q
 YigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E9RTi514wB1x4upiCcYJC88mFJzj05fsXS9Z3A/1lI8=;
 b=bgnErh+MXbieBDK3dAitKE1rOv6Qe/MC9TXdnLHe9V03yy/iQIZJ4zAXHu7uO//0xM
 9OdVe3040/IOWVHzbOwJJJqeWRVt1khMp5Dd7SZp330OdrP0d0J5/kJ72MhnRdYOw1iG
 s8PyKYEuBz2i/q01OqWBBSXnQH9mFuCidJJ1aQKPsDBjZRGBbzIScETMf0k4fZSdOzfX
 qSVjn4OlBC7/5UC11PPdk6KEzoQhJohLWJf0zLuY0/I6Xr9g7y1ohKzwwV1NWTiFVDW3
 SeFX5N4vFZKnwTvHlEo21shhnndEghwLj6rumHVT9xAPAtzZ3vkTmw80D3iZku889ssB
 p8zQ==
X-Gm-Message-State: AOAM532ZMkyUv8Ko16StMWA/aW+DTeDhAdtnf16OJDY0u7CSlBGemyUu
 Fe4uycqE1y1/V3MhMsWwgmvTTA==
X-Google-Smtp-Source: ABdhPJxwnRz3i7Z+QZT0XR7PymbYRKlN4RErBiDgSHLx9QDaFsI4kdEJQmToA/F0Q7pdOhVLN/Yr/w==
X-Received: by 2002:a17:902:fe81:b029:d2:abce:b4a8 with SMTP id
 x1-20020a170902fe81b02900d2abceb4a8mr3722153plm.38.1601406488151; 
 Tue, 29 Sep 2020 12:08:08 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:08:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 48/68] target/riscv: rvv-1.0: mask-register logical
 instructions
Date: Wed, 30 Sep 2020 03:04:23 +0800
Message-Id: <20200929190448.31116-49-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 target/riscv/vector_helper.c            | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b1f0fa76b2..5726fd7133 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2899,7 +2899,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
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
index 93ed6f54e9..a2ef6b708c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4440,7 +4440,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4450,9 +4449,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
-    }                                                     \
 }
 
 #define DO_NAND(N, M)  (!(N & M))
-- 
2.17.1


