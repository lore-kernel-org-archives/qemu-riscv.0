Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dS1-0002wf-Ra
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRw-0002nE-Hk
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:40 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRu-0007tA-R2
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:40 -0400
Received: by mail-pj1-x1036.google.com with SMTP id e4so6461863pjd.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/+Uoz57/yQ1shiop2emHez+ZQ7k7R0VmwMF9ieBA3Ss=;
 b=OcbIF41qFvLIng+ms2/qvi+wCtt5NUMFZeq1ptHMEKETpk08ZxMCod7xaJeeZIa38w
 bYTlaqCrvcjCr5Fl19PAH8hK0QuoJ0/VddxF39Wmq8zMKctC5VaagXlg1evqbdiTGWCt
 ze6z4nMdVTwPAb6urOurfJcaBE+28CuNRClTp/YlWVr0+spkPq05i7lZV5kgSW8G63+H
 ugy0S3VJFHLTzHqW0HRmHBAecXfvHrOCZeiDzMb8eGzEwqO7spB0xf1TEUjmkU7yvwDy
 Ji6TsgJSkd2Klf7XpQH8iiPlwywCQyRKXhdxYd3YflKFoEM2spwzpiTcOf9nbjUgAl4S
 v8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/+Uoz57/yQ1shiop2emHez+ZQ7k7R0VmwMF9ieBA3Ss=;
 b=GuUZpCa+oAe7edZZGdj3vB733kGCMhoUTNaUnf4+J4L6xkdSQ0nlsDqNXrPyiuAIvc
 ScvOE/4a6etQu5PWvhNrnjsGYhxMXiW2uCwLfTvyFs1C4StPF1GQEvCpbWGx7cAavk0+
 k45UX/X5f9DkO79uFjmxVDFzTQjzp3wjpzMpxoty2gO/0t74+YJFEwBt6uL3jc0gTezJ
 SU+AggJqvTVRWfyKR/fKEkbRsDXVtG9lDKswT0REFtCOa6xbqga4M97BtKGAyaHGrUnD
 p6YFPGFpNBwkt3pUXcmaQ8BFzWBFmZx8J04d8Hlh0Tnn5JISP+Mv8+w/Bb9x4zSX5Gyf
 jqcw==
X-Gm-Message-State: AOAM531kwRxejHqPe6EIDt5Xan7YUOfdj6QJw+kPx8ACvkj0Ym2Zktjx
 Jj/G1LAkR47F2FechL0r1QsIu/G00Po=
X-Google-Smtp-Source: ABdhPJyD5Zvq6A97ysZBWkRAkjf8GsW/W2FmXQF8aqUXhLh7fw8zcUxRKiDpXiNLX19T4QACzMIaWQ==
X-Received: by 2002:a17:90a:d482:: with SMTP id
 s2mr7685246pju.140.1596710917653; 
 Thu, 06 Aug 2020 03:48:37 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 31/71] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
Date: Thu,  6 Aug 2020 18:46:28 +0800
Message-Id: <20200806104709.13235-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:41 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 4 ++--
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0a1179370b1..a5d58010134 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1068,7 +1068,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3d2d43ebd8a..d72120cfd85 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -592,7 +592,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
-vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index e6ec5d24012..3b781252df0 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2918,7 +2918,7 @@ static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 }
 
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2937,7 +2937,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(a->rd, dst);
 
         tcg_temp_free_ptr(mask);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a18c02eb124..52902b680d7 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4484,9 +4484,9 @@ target_ulong HELPER(vpopc_m)(void *v0, void *vs2, CPURISCVState *env,
     return cnt;
 }
 
-/* vmfirst find-first-set mask bit*/
-target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
-                               uint32_t desc)
+/* vfirst find-first-set mask bit*/
+target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
+                              uint32_t desc)
 {
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
-- 
2.17.1


