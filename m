Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAv0-0002Ph-2J
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuy-0002Lw-Nh
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:04 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuw-0005eV-OO
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:04 -0400
Received: by mail-pg1-x52c.google.com with SMTP id n5so873646pgf.7
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qWkWdbRvaKmlDK8A8U5xVo1uOux5/tmZZtRFjQDRRxo=;
 b=NrhUJ1q2N/FxXNf1HfBNPth0C0t/Jb4nNjTLgxMZRtni9j7cmG0xejVE2uKc+cYxmb
 Ml8CdfZoWqCN3QBQf6H5fHUfwBSGHa7TwGTbQ49vUYQMVWJdQZ0p7K42R6QUH0ag1pN8
 ZZ2/TNj+XdxuFCiB0WNNftSd+UY0+dQCuZQXqJHbtdkvh4PenmvhAnshBNjW/gdmL3+l
 wVpTCmlv49et6WJosJ8w/hvfHE5mjDyiJsgr11fL8AZeNDl54wWx7H6VdEwjJqpY03pA
 M9DRupWA6+eEvaa72cmgdWPcvZmaKXY1PQDRJW9ebwdfulnQDpX/vLOm/UVWf6N21G4y
 2RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qWkWdbRvaKmlDK8A8U5xVo1uOux5/tmZZtRFjQDRRxo=;
 b=cvIkHHsH08NwfyWAgGSZ6dl004+ACnBRvQUizR9oEFSWXIxkxk11VTDKF2F2AA58dx
 T49WsuZ1OeoE7Xud2+Y4JhazDimJCPef+9/28A4xPWLZiokilDTLPavhPo7gJsv//+xl
 ZulYDfgW0Yjdp5/f6490tJWhGWkDaKChcLwlQZNCLR3E279BgEUePEfvLZMcGAC50toH
 lFWE0Vovb80KC4cKxTSnUDtwoBu2SDYeaz6E++WFQmjEGMTu4EjDLurDPNaaKGoPgeeu
 fpu6ScIZWqgz9h49UrVYn882mHuUxVmm2NSiInUd2Qhn1nPnpXDdmQG+X+36TYIYerD0
 AjUA==
X-Gm-Message-State: AOAM533llnNkxzzBfwfjgQADJdFGb72r7uIpHJgt2r4l7WrMt9DV9lyJ
 BkJy+2vwwdEAsVWpGTyJOdS6ug==
X-Google-Smtp-Source: ABdhPJznYz6LHpKQZnTcMYuCC2I9vc75F5YA+SRQT/wTetyVJkMGcZc9+H5VkZEMy/8cBbcnZisz0w==
X-Received: by 2002:a63:e23:: with SMTP id d35mr25095412pgl.435.1595409601417; 
 Wed, 22 Jul 2020 02:20:01 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 33/76] target/riscv: rvv-0.9: find-first-set mask bit
 instruction
Date: Wed, 22 Jul 2020 17:15:56 +0800
Message-Id: <20200722091641.8834-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:20:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 4 ++--
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e9e1c4e2f5..1dea171599 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1050,7 +1050,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c9c9f30742..b5b59fe6dd 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -574,7 +574,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
-vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index cca06dd1d3..3ef106ddeb 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2968,7 +2968,7 @@ static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 }
 
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2988,7 +2988,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(a->rd, dst);
 
         tcg_temp_free_ptr(mask);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d3824304ec..5bda274e70 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4674,9 +4674,9 @@ target_ulong HELPER(vpopc_m)(void *v0, void *vs2, CPURISCVState *env,
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


