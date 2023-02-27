Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW7M-00010y-2W
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6D-0004BV-Rf
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:58 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6A-0000R3-N0
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:57 -0500
Received: by mail-pj1-x1030.google.com with SMTP id oj5so897531pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNtcbq+YaAISCksJEqrwoDBG8G3LKrhNUHooAhzADaw=;
 b=cy2KakmRcc05GU65DCiEeJW37y203tp8VGEbrX1u31ms0cAz8dNItwz00KNwUCzT71
 2wJUdC7Vx8DuMVXeFJMNrAcJh9vwM4CC39CzFtEkEyku9wJI04KkLcjAEHLSdsFJq9I5
 EK9WlkU5TwlbvaCXq4He55BnmKi1ApIHFvzMhDvV6tEP/NPCJhbb4WSA4rVULhSs/9uM
 VAHq2UkAykOzNZE7Mqg0VKxtTNg1po23tocQrdr0ubQvtgxcQVVxgUqPamTRWizPZePC
 bme0SdakNf00E8Gut/u/jSeqw0TO9ORthgyk2oVvk3vjh75ivSt6dFZC8Yr/zsLFVakv
 dSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dNtcbq+YaAISCksJEqrwoDBG8G3LKrhNUHooAhzADaw=;
 b=crjZIvaV8cBeUMbhpMbWolcTLDAvPUsYMrkWciyDgAFjZC/lbDIHF/Mawy0iS6oa+N
 SRP6euEPHbKnM7MGSJsGeglkc07yvqiSU1XEmNUIV3qaRMyP7EuY6eiDWfSygyTv6nsA
 oVb9ZR8AM9vFFG2y9IhmTRqEBkCaSf2U1Ue/5pTf+IMuIwFbw7qSLhgVevuBABYkiw00
 eoS3Ugs0vVoIQ9tVHw7esUTWgqYMRyG8UFvFRpcjDR/NTxdyk6z4yOTwuZPp+9EhlXmq
 e37mAudTHRC6ILE+i09iswqL/ztfNXR9pxmvL9VpSq36yYaMjqF58Jg2hxE+Hbnu0Lpg
 ku0Q==
X-Gm-Message-State: AO0yUKWVGV8sIRCwShmi3PKn7VdqeM4fHByYBhOeNBukIlbsqTU2ossh
 3DC0j84B5+uQ6J3R3sXvf8UA7Q==
X-Google-Smtp-Source: AK7set8r+oQvD92rznjjrN35ryr7UtVwiQelL/Nmqn3dnxt43nC1C4M9vdcQ2d8m2fVMjirv6B0icw==
X-Received: by 2002:a17:90b:3b87:b0:233:fdfd:7122 with SMTP id
 pc7-20020a17090b3b8700b00233fdfd7122mr24742464pjb.37.1677475853836; 
 Sun, 26 Feb 2023 21:30:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 58/76] target/s390x: Use tcg_constant_* in
 translate_vx.c.inc
Date: Sun, 26 Feb 2023 19:24:47 -1000
Message-Id: <20230227052505.352889-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2023 05:30:58 -0000

In most cases, this is a simple local allocate and free
replaced by tcg_constant_*.  In three cases, a variable
temp was initialized with a constant value -- reorg to
localize the constant.  In gen_acc, this fixes a leak.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate_vx.c.inc | 45 +++++++++++++----------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index d39ee81cd6..3fadc82e5c 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -319,12 +319,10 @@ static void gen_gvec128_4_i64(gen_gvec128_4_i64_fn fn, uint8_t d, uint8_t a,
 static void gen_addi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
                           uint64_t b)
 {
-    TCGv_i64 bl = tcg_const_i64(b);
-    TCGv_i64 bh = tcg_const_i64(0);
+    TCGv_i64 bl = tcg_constant_i64(b);
+    TCGv_i64 bh = tcg_constant_i64(0);
 
     tcg_gen_add2_i64(dl, dh, al, ah, bl, bh);
-    tcg_temp_free_i64(bl);
-    tcg_temp_free_i64(bh);
 }
 
 static DisasJumpType op_vbperm(DisasContext *s, DisasOps *o)
@@ -609,9 +607,8 @@ static DisasJumpType op_vlei(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    tmp = tcg_const_i64((int16_t)get_field(s, i2));
+    tmp = tcg_constant_i64((int16_t)get_field(s, i2));
     write_vec_element_i64(tmp, get_field(s, v1), enr, es);
-    tcg_temp_free_i64(tmp);
     return DISAS_NEXT;
 }
 
@@ -1107,11 +1104,13 @@ static DisasJumpType op_vseg(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 tmp = tcg_const_i64(16);
+    TCGv_i64 tmp;
 
     /* Probe write access before actually modifying memory */
-    gen_helper_probe_write_access(cpu_env, o->addr1, tmp);
+    gen_helper_probe_write_access(cpu_env, o->addr1,
+                                  tcg_constant_i64(16));
 
+    tmp = tcg_temp_new_i64();
     read_vec_element_i64(tmp,  get_field(s, v1), 0, ES_64);
     tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEUQ);
     gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
@@ -1270,9 +1269,10 @@ static DisasJumpType op_vstm(DisasContext *s, DisasOps *o)
     }
 
     /* Probe write access before actually modifying memory */
-    tmp = tcg_const_i64((v3 - v1 + 1) * 16);
-    gen_helper_probe_write_access(cpu_env, o->addr1, tmp);
+    gen_helper_probe_write_access(cpu_env, o->addr1,
+                                  tcg_constant_i64((v3 - v1 + 1) * 16));
 
+    tmp = tcg_temp_new_i64();
     for (;; v1++) {
         read_vec_element_i64(tmp, v1, 0, ES_64);
         tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TEUQ);
@@ -1359,7 +1359,7 @@ static DisasJumpType op_va(DisasContext *s, DisasOps *o)
 static void gen_acc(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, uint8_t es)
 {
     const uint8_t msb_bit_nr = NUM_VEC_ELEMENT_BITS(es) - 1;
-    TCGv_i64 msb_mask = tcg_const_i64(dup_const(es, 1ull << msb_bit_nr));
+    TCGv_i64 msb_mask = tcg_constant_i64(dup_const(es, 1ull << msb_bit_nr));
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
     TCGv_i64 t3 = tcg_temp_new_i64();
@@ -1416,7 +1416,7 @@ static void gen_acc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
 {
     TCGv_i64 th = tcg_temp_new_i64();
     TCGv_i64 tl = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     tcg_gen_add2_i64(tl, th, al, zero, bl, zero);
     tcg_gen_add2_i64(tl, th, th, zero, ah, zero);
@@ -1425,7 +1425,6 @@ static void gen_acc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
 
     tcg_temp_free_i64(th);
     tcg_temp_free_i64(tl);
-    tcg_temp_free_i64(zero);
 }
 
 static DisasJumpType op_vacc(DisasContext *s, DisasOps *o)
@@ -1455,15 +1454,14 @@ static void gen_ac2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
                         TCGv_i64 bl, TCGv_i64 bh, TCGv_i64 cl, TCGv_i64 ch)
 {
     TCGv_i64 tl = tcg_temp_new_i64();
-    TCGv_i64 th = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     /* extract the carry only */
     tcg_gen_extract_i64(tl, cl, 0, 1);
     tcg_gen_add2_i64(dl, dh, al, ah, bl, bh);
-    tcg_gen_add2_i64(dl, dh, dl, dh, tl, th);
+    tcg_gen_add2_i64(dl, dh, dl, dh, tl, zero);
 
     tcg_temp_free_i64(tl);
-    tcg_temp_free_i64(th);
 }
 
 static DisasJumpType op_vac(DisasContext *s, DisasOps *o)
@@ -1484,7 +1482,7 @@ static void gen_accc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
 {
     TCGv_i64 tl = tcg_temp_new_i64();
     TCGv_i64 th = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     tcg_gen_andi_i64(tl, cl, 1);
     tcg_gen_add2_i64(tl, th, tl, zero, al, zero);
@@ -1495,7 +1493,6 @@ static void gen_accc2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 ah,
 
     tcg_temp_free_i64(tl);
     tcg_temp_free_i64(th);
-    tcg_temp_free_i64(zero);
 }
 
 static DisasJumpType op_vaccc(DisasContext *s, DisasOps *o)
@@ -1597,14 +1594,13 @@ static void gen_avgl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 static void gen_avgl_i64(TCGv_i64 dl, TCGv_i64 al, TCGv_i64 bl)
 {
     TCGv_i64 dh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     tcg_gen_add2_i64(dl, dh, al, zero, bl, zero);
     gen_addi2_i64(dl, dh, dl, dh, 1);
     tcg_gen_extract2_i64(dl, dl, dh, 1);
 
     tcg_temp_free_i64(dh);
-    tcg_temp_free_i64(zero);
 }
 
 static DisasJumpType op_vavgl(DisasContext *s, DisasOps *o)
@@ -2440,7 +2436,7 @@ static void gen_scbi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
 {
     TCGv_i64 th = tcg_temp_new_i64();
     TCGv_i64 tl = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
+    TCGv_i64 zero = tcg_constant_i64(0);
 
     tcg_gen_sub2_i64(tl, th, al, zero, bl, zero);
     tcg_gen_andi_i64(th, th, 1);
@@ -2452,7 +2448,6 @@ static void gen_scbi2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al,
 
     tcg_temp_free_i64(th);
     tcg_temp_free_i64(tl);
-    tcg_temp_free_i64(zero);
 }
 
 static DisasJumpType op_vscbi(DisasContext *s, DisasOps *o)
@@ -2572,11 +2567,12 @@ static DisasJumpType op_vsumq(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    sumh = tcg_const_i64(0);
+    sumh = tcg_temp_new_i64();
     suml = tcg_temp_new_i64();
-    zero = tcg_const_i64(0);
+    zero = tcg_constant_i64(0);
     tmpl = tcg_temp_new_i64();
 
+    tcg_gen_mov_i64(sumh, zero);
     read_vec_element_i64(suml, get_field(s, v3), max_idx, es);
     for (idx = 0; idx <= max_idx; idx++) {
         read_vec_element_i64(tmpl, get_field(s, v2), idx, es);
@@ -2587,7 +2583,6 @@ static DisasJumpType op_vsumq(DisasContext *s, DisasOps *o)
 
     tcg_temp_free_i64(sumh);
     tcg_temp_free_i64(suml);
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i64(tmpl);
     return DISAS_NEXT;
 }
-- 
2.34.1


