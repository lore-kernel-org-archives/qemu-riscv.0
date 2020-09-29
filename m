Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKxr-0005Mq-Uo
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxq-0005J2-6V
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:02 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxo-00029a-A8
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:01 -0400
Received: by mail-pj1-x1036.google.com with SMTP id j19so2022769pjl.4
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WzxBxRlKBPGnAspw9ONBxfld0KRhZZAiffr1ZKpRxdA=;
 b=jW4go+t0StCCCkLotXC+F7TOfhRuftFLszMXO1BA6LcTdYUU8He8znzyexxIB7DPk/
 d74c7dhiU/3dpL60unRFAB1sUSlFWloqLTboFWlsZfq36OUg1s+b008e+T99IurE0gk6
 BGIdQ3ui2cIJyGlAu8Skl5m5mHJpmR5wLooBD9L6YuOFUhmlPtgIHeGQ4+n1TWReS1PN
 S7lM8H287aljbi1y9k/YDAJNua4HFUZFB8HydScDUrRGPeCNcib+de7XJD94ZxmnTV2d
 yG4YLDrGcdxafaog1J9oWZ83p9ZMgaUGzZxb3oVRfEpH/OVlknxwnSCyXSd5xnF/W27h
 uegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WzxBxRlKBPGnAspw9ONBxfld0KRhZZAiffr1ZKpRxdA=;
 b=emTlVl8aDtIFeZHcaYvBjeZasvpYJpYC8YA4wCi+mHVWTtQnakx+N47PGM7vQkbElg
 /2v2Z/fGujujVfjAa20e1kqklbSAJx3TOWnuaBezhtgiQ5CQIrRlMm6qYOaBeDFbu68u
 ykWdO/uOf4lrhQtC0ZAFp1Po7Lc8JeOl+BmOFCte+wbAMD7hr5R7tLu+2DKRqTUuKNOW
 9Dc38Ga/chrSdV9W1IOEC0QTbS7lWp8zXLRiKJX6g470LfZGdqVDHPhY2aFEB8p90oaY
 McjfTCfibdrd+4LxiOuQgXzzW9uC/4gVSnCPKH+Qrhu/2sfC7bALUiII/Z1jG3n91AE0
 7jWA==
X-Gm-Message-State: AOAM530orxQ5O9rWXD52lUFJ8xx4Yrk4S8MDli9cka7OO/Gs561czOpN
 1j2/vziKu2rYt3zmSz2+65tM4Sw9YwDqVw==
X-Google-Smtp-Source: ABdhPJyWQXfaAQaHce/rHuSz0yQC4PHIlkpdaw28Ff/Pr4dNzOnQ42ha2YEknn4WUXN5XMnCU4DSpw==
X-Received: by 2002:a17:90a:760f:: with SMTP id
 s15mr5130314pjk.214.1601406418867; 
 Tue, 29 Sep 2020 12:06:58 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:06:58 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 29/68] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
Date: Wed, 30 Sep 2020 03:04:04 +0800
Message-Id: <20200929190448.31116-30-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Tue, 29 Sep 2020 19:07:02 -0000

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
index e046591a42..8d40009871 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1072,7 +1072,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0cb76682a0..d7dac12883 100644
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
index f9d280b0c5..c34877140f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2945,7 +2945,7 @@ static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 }
 
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2964,7 +2964,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(a->rd, dst);
 
         tcg_temp_free_ptr(mask);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 517e7344b9..ecc9be7733 100644
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


