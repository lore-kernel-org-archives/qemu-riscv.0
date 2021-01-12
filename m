Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGBg-0004Me-IX
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBf-0004JF-Ab
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:03 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBd-0007i9-In
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:03 -0500
Received: by mail-pl1-x62c.google.com with SMTP id t6so1126134plq.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JB4xzi07iQbj6q1OY2oboiPtAHH8D6gOWaBLBtFm5Vc=;
 b=J5TlNX9f7ikffToRDNOIDUmK94td8gZjn4o5a+COfon/os9rHHiyeKdEjSp7nAtBFS
 tMvc5YLqv9JyWPwHDTnm+doEcnT8KxoPVW2+/GDLx3akF08xmqH+42JJwRTRuZerJAef
 zOyQeauUJbec5GwcQMLVlcJR74+P4hUe//9mIqHo5g0WhAaLTG+OgKV0nY936uuqyMie
 olggY1kgrmAO4h/LSqDpNXGuPXswMZ4ya3PavH//fDbMV+f5LGnoattP8YC4QjSWj5Xr
 08wRZrbyKBxJBGBKFRZm/Eioph9PX3cbgarNyXNE3EBlddjdDLGJklLPXVqluUfB2QQb
 iWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JB4xzi07iQbj6q1OY2oboiPtAHH8D6gOWaBLBtFm5Vc=;
 b=RSZ/SI7El14jox6RsddWDA9vNsL4ks7SRwcsGGTsJ54SWAl4+SuRRV4PVdEg+wEj6g
 GcIkM57f27w84Adb1b5xAdHK0fO78RPaiOE7NVQKjAmOkIf2GbAvRFKTsSu3JcKqzP+/
 1FIA80HnZo4+yd1ePb2V0y9aEFIQ/+1pOeKqjekwpIy3aJHPbZS5uC313PSFNgZEltHD
 mI9WG4chKwMfwz4L4ghENPpsD1oyu9ZFevnY/t4I+CYWI/Rphws4GgupP4hSiciXQJai
 EA6dN03FY9LVbnr+AaTIyTkeqXGsNGWAKmkaTgmck6M34hnmtvNGWoYCq6h5DL20ZA8U
 iAmQ==
X-Gm-Message-State: AOAM531RwTGEOo9XLGjUSb0v1EEyiSY1AvDK5VE3RZjBASl7GB+DPx9l
 mmEWFUZBs6aqnbo6XEoyRpagFQ==
X-Google-Smtp-Source: ABdhPJxTfBIINZhcV2dUP+7BclOaVd9xLLLV824/MXbfOtslpZgN5aJXc6zVgs1LZL7luM1rjKXcbA==
X-Received: by 2002:a17:90a:528b:: with SMTP id
 w11mr3654104pjh.73.1610444520375; 
 Tue, 12 Jan 2021 01:42:00 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 29/72] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
Date: Tue, 12 Jan 2021 17:39:03 +0800
Message-Id: <20210112093950.17530-30-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:42:03 -0000

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


