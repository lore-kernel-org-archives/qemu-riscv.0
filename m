Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKyI-00066Y-J9
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyG-00062h-Kr
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:28 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyE-0002Fb-F5
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:28 -0400
Received: by mail-pf1-x442.google.com with SMTP id q123so5546270pfb.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Dgz3FhfTw8GOnd9OxFv1aL29mGED9JHvOecPRJ6gvME=;
 b=aIAn8Bs/4Degxc3EHaBnXUq46BuVx3iXfLvFjuaYq06GBh2DqPtvOfsgefM1wF+GO+
 TqNCMd6fOy+jrPVstbhKVKWs61MiUqkG2vZlMIAnYo6gFCcBSjTq0copOcrwtzs+E5cq
 DkOllvvu+YIJvCr2QQ8mO8OWze29cLCxtbpfGsaVapGqajJPtsxy/KDXjeRKrTxBxmRa
 gdkZZyDdPaHGMcDHYwhfz3A343DKdnNg7+29zKNhJg2W++p4SF2X+I9kzGIklXuodpDX
 f4XFoRbcIc7UdWmvt1+PRc2sBgjXmUp499aNXEpWKXUV/LGomn2jMDwr+29AwiIBSpdA
 V93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Dgz3FhfTw8GOnd9OxFv1aL29mGED9JHvOecPRJ6gvME=;
 b=ihurUrpkHml16FgYLygNvexCeQmmCAk9tttcTi2+o6tBYS9xUsgw4SwLvRdyvM4lcK
 IbhGBHuDgYYA7I8sEqDoZ2lQXL11bN1OmFIBViAo7DvXhkuixEKpbEyypRudACXguI7Z
 xJ4NkZiVKicjPBghKOUM86nUUL9j/Pe5qK4z9zRAeCzW2ei2Ig7Z/XS1ZzOnmMUBzi4/
 4j4QKzfAjOQpKXkrcK8q9/XxZLZDAA1jAG8wL245zCcSsg+EOu5juY8Lu6Rrkb31mY5A
 TOWtxKmWyPmE7Hn67t/w465IpxpKM6m8MHu76ko5OFhDgc/pd1ggmDjhiqa3SMD42UKz
 PHTA==
X-Gm-Message-State: AOAM5326eR/ZCRt8gbu9zz8hnG0w3qnGWJ8E9zNMA2Qw113lC5Ub0cGX
 gGu7tqiHRtkjA+nC8g+3A2w1Q1POEwBQBw==
X-Google-Smtp-Source: ABdhPJxGvecUEPYFcrHc/enVIT9nQfq/MMuufs4aJoJit6x5cbotQjkKjai1ZEqEnNJ3I2kP4wA16g==
X-Received: by 2002:a63:df42:: with SMTP id h2mr4575594pgj.239.1601406445351; 
 Tue, 29 Sep 2020 12:07:25 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:07:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 36/68] target/riscv: rvv-1.0: floating-point move instruction
Date: Wed, 30 Sep 2020 03:04:11 +0800
Message-Id: <20200929190448.31116-37-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x442.google.com
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
X-List-Received-Date: Tue, 29 Sep 2020 19:07:29 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 46317ae490..254cface60 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2709,9 +2709,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        TCGv_i64 t1;
+
         if (s->vl_eq_vlmax) {
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
-                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+                                 MAXSZ(s), MAXSZ(s), t1);
             mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
@@ -2725,16 +2731,22 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             TCGLabel *over = gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             dest = tcg_temp_new_ptr();
             desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            fns[s->sew - 1](dest, t1, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
             tcg_temp_free_i32(desc);
             mark_vs_dirty(s);
             gen_set_label(over);
         }
+        tcg_temp_free_i64(t1);
         return true;
     }
     return false;
-- 
2.17.1


