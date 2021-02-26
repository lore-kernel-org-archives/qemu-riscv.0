Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFThg-0000QW-Gw
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTha-0000Mo-LA
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:03 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThY-0001b7-NJ
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:02 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w18so5319517pfu.9
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JB4xzi07iQbj6q1OY2oboiPtAHH8D6gOWaBLBtFm5Vc=;
 b=JHHIOFjilxsZLjyLeYr1HspjK0kwfAsvsE6mVzIFyNtxqFsqOKvq1vtuphM7MYBVMs
 OpDvJJKkJOsg+gkXXg/BmRh/wBUNOc2+03MLJMAJQlDZMu+Ox3YNmBv9UZw77dXBLtkE
 O7wjhxgqU9bejrgPVdydeqtKaqqf1lYkmfRkoxbgNSDJ8KhDMPtAVqz3jQ/23IBA5uNg
 aZT567KZTYvjucFYRpw8uEJOCe1ci60OlXfNDTz4Jg9h+6WtP5BqP67TSZ/Bn35GAIRr
 MVcF8ww7fgev3uwWIY8NeGzVwv8JLps4ggZY2T/dNnAwhRClriPQd2+YNqqinNfgZtR4
 jlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JB4xzi07iQbj6q1OY2oboiPtAHH8D6gOWaBLBtFm5Vc=;
 b=s0YVnxGa9wJrVuMxbNyIB8MfBh7Asqa7FUlTmTVAuCyli2Sb/C4+JQsfK10NFg3oUa
 9YW+iZweOV0D/tmY/Xi4eFg9PRVF9DTul9vCNcWBAfO6k+QA6Wcfyu7b5g/izq1wisrc
 5tgOx1lRB9CuuMNzlkLdlD3pjPuis2DHPVMne9rGQotPetIyzM2+a1z7mPU9a+fkzUXS
 PPuxjrefbaszRzYI/Fn/UEhAZdvebMdHHIBjZDLW+7bkFFOrQir7D5UUPomeibdwXXNn
 1jHJ8bbzuI1rWI6BQFYI3Bo+ra1JB4xoF1TGHccYPBnhLnrTbvOYaZGepoLWDSSCW8R8
 +rfQ==
X-Gm-Message-State: AOAM531ao9DuWGeQal7aZtkqGgIYrBQSfZeZ9GTxqIaa/Ev7fJPGGzfX
 0QCvTAYjYaDtGQEyBi8e/VGQSA==
X-Google-Smtp-Source: ABdhPJwfFHDDHw3E9HH377LWgIsf5jz0R9MFyVWGK6qaW3C2HR2uo2xlaHT401wp4pKWei8lNQ8kiA==
X-Received: by 2002:aa7:808d:0:b029:1ed:993c:3922 with SMTP id
 v13-20020aa7808d0000b02901ed993c3922mr930711pff.75.1614309719451; 
 Thu, 25 Feb 2021 19:21:59 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:21:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 29/75] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
Date: Fri, 26 Feb 2021 11:18:13 +0800
Message-Id: <20210226031902.23656-30-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:22:04 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9d1601510f7..abf08dbc710 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1063,7 +1063,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0f111c885c3..0b53ce432c1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -603,7 +603,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
-vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f658f8566da..97ad16f2b21 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2927,7 +2927,7 @@ static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 }
 
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2946,7 +2946,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(a->rd, dst);
 
         tcg_temp_free_ptr(mask);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 517e7344b96..ecc9be77335 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4439,9 +4439,9 @@ target_ulong HELPER(vpopc_m)(void *v0, void *vs2, CPURISCVState *env,
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


