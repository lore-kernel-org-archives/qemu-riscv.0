Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAuv-0002DI-Gb
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuu-00029V-1c
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:00 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAus-0005dw-6s
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:59 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x72so866813pfc.6
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CQyiOAp6zSE2OTRbXxeepqY8bKy5Uz4AiqvMqjbMfOM=;
 b=c7H16sQNWt6UJE0pkVg5XGwDoixWPzVs/7Q7ofvPJGvfG5HVHntrQGeA797hLSLRjz
 R5oB/gT2/1PgiP2JjxGH0xKwMp6+CDSBSmEUNfZEe55WZrXwr7X1Ndou9sbNUYKEkO6x
 dRSkeZKeqwNil88QZQRs4ZFzXmS+djtmlQ97IyZjQ8TEgRNYlwecxXGji1T28wx5zQMn
 8CBFL0ZzxW/q3OEB0AKUqiYMZ65OYZJDt6swIBGq/QvXrz3WsfLbeSHpQHniThFOgpGC
 e08+jRDRDY6OK8IuV+zNfsEjBCqeYLzHDpyPTlXwobyL3wY8KUbNEPIEg1+gdDl4w2bp
 sxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CQyiOAp6zSE2OTRbXxeepqY8bKy5Uz4AiqvMqjbMfOM=;
 b=Zp75uAzBNUURhySmqdg3x1C2v0oWtGl+RqPXt1WnzMOOMlDF4uIzpaqgSKwY08rAQQ
 DHqEj/aRQW4V39wzr4H35JVSlN6bNzM6x5ij/v7zOiddK4DnmqU6Tx89tLNy4ZZqfHtr
 Eb/huCZUd4kDTrBVaF3vUw0EoJAIFe6TZ4CEU7TK5wIyyR0EmtdzO5CW9BVhZ/GfQCLS
 kFDPCqmCoEYpP//ob0JXgtmQX1fk23eGcEmVCC6v0ZUNklXCjZQFpFaj8rSy9OLt1W3B
 kr61uR6QqsUrpasg/75nrUBEM0ap3nGRr2bNAO9SI0+HRrBbKBgG+F1EJ+O/QvlrfBMU
 NOOQ==
X-Gm-Message-State: AOAM531mTBPwlXoS+ecGbju2gG2R+NCC4zOFVGGzzKKiChYB88owhfqw
 F2LgrB56x2iOu9vxYNG4ZJbYYw==
X-Google-Smtp-Source: ABdhPJyO03RQLudeckfTeqc1WvA1AWq0kSaubRbtv/C/kTqGbgpOBlyUaLiiceVuOVbBfpCbvL7N+w==
X-Received: by 2002:a65:640c:: with SMTP id a12mr25949125pgv.88.1595409597031; 
 Wed, 22 Jul 2020 02:19:57 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:19:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 32/76] target/riscv: rvv-0.9: mask population count
 instruction
Date: Wed, 22 Jul 2020 17:15:55 +0800
Message-Id: <20200722091641.8834-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:20:00 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 7 ++++---
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 8cf5c4c065..e9e1c4e2f5 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1048,7 +1048,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7ad936e605..c9c9f30742 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -573,7 +573,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
-vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
+vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 89209a5d18..cca06dd1d3 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2933,8 +2933,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector mask population count vpopc */
+static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2954,13 +2954,14 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vpopc_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(a->rd, dst);
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
         tcg_temp_free(dst);
         tcg_temp_free_i32(desc);
+
         return true;
     }
     return false;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 53867a6a2d..d3824304ec 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4655,9 +4655,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
 GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
-/* Vector mask population count vmpopc */
-target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
-                              uint32_t desc)
+/* Vector mask population count vpopc */
+target_ulong HELPER(vpopc_m)(void *v0, void *vs2, CPURISCVState *env,
+                             uint32_t desc)
 {
     target_ulong cnt = 0;
     uint32_t vm = vext_vm(desc);
-- 
2.17.1


