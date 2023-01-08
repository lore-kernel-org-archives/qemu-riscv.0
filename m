Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELaA-00064m-RF
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELa6-0005qa-Uu
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:42 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZH-0004Y0-EH
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:41 -0500
Received: by mail-pj1-x1029.google.com with SMTP id v23so5382095pju.3
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzDpq4p4TZ0OiGc3bd/AjIVDg1qF6XupmGP3awuLITw=;
 b=XOErZP0uyB76ZPYUCJeaFgU8ddkWddUTq1jXF4aC6Xsq3md/pb6qGu7cpMgfM3O/Bt
 BnrMpJ3nQ4JbWfIunKtiQ21Agi5reiprnWmOQ6uIVtmn7ZXVKLf9YRvRbqRUWwhnjXWn
 63GtHhGcZb1EsASn+IXYkj7OLAHjbgnMRmQl5C0uv4v75tWWcgd++qNm4vT+eBiBZaJl
 1C9tyaRk/i4/sr+T0dVjjlSAkogLJe8nGlKbuviO//QGxqv6K3u/SzmlM3v/0Dpw9mdN
 4iYXtMSLDKAcZyxSbvC4lCoXgg/lPuUdQcbHPjnfdHz8MRVXEobCQglYW9V9h1Spp7DL
 z6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzDpq4p4TZ0OiGc3bd/AjIVDg1qF6XupmGP3awuLITw=;
 b=ncSyhqfTRu6ipZURPHHCxi5mCEk+8PPijL9xnbWKu00GnwnGMtaw3yAa2CqhGi9XEV
 QED1egUEwgUAV6S8UeLLYtc2vhiu2oD2TJXVAIXQj4XIFyVfsVbdVkNSMOYof/zdUIWA
 Br8/H6iU/O8M9/9/P678VOLyH8aYB0YS+Exnz3gnFEzDdyBhAVtd2MvnN56dc3vS7WLJ
 8BKrbv223R9cc8XRTbUeDshPe0VWSU271H2IwsfV7zjOCKlF3DxCnWo8CTS6qUctr1Ut
 d577QkreZ47DdbMQCQHjg2uXMKlyyi+rwO8nBRkEY0MLhWgef9TmB3WQCFF7NJPdMmhs
 BZsA==
X-Gm-Message-State: AFqh2kpFXfrigafvzJQDLBGp4WkrA4t8B+AJu+IKdsWPnzUqjOUjDFAA
 WVQLi0BwrYnfMsRK5Dki0XE0dg==
X-Google-Smtp-Source: AMrXdXv2bPp8JLXWBRTXN4obWm247ROdMhCjTJQCS6+UgG5oE5CBMQ/tWi09nPCL/64j+m+kg+Xr7g==
X-Received: by 2002:a05:6a20:a584:b0:ad:a5fd:b664 with SMTP id
 bc4-20020a056a20a58400b000ada5fdb664mr68552759pzb.37.1673145469580; 
 Sat, 07 Jan 2023 18:37:49 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 26/36] target/s390x: Use Int128 for return from CLST
Date: Sat,  7 Jan 2023 18:37:09 -0800
Message-Id: <20230108023719.2466341-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:43 -0000

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         |  2 +-
 target/s390x/tcg/mem_helper.c | 11 ++++-------
 target/s390x/tcg/translate.c  |  8 ++++++--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 593f3c8bee..25c2dd0b3c 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -16,7 +16,7 @@ DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, i128, env, s64, s64)
 DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i128, env, i64, i64, i64)
 DEF_HELPER_3(srst, void, env, i32, i32)
 DEF_HELPER_3(srstu, void, env, i32, i32)
-DEF_HELPER_4(clst, i64, env, i64, i64, i64)
+DEF_HELPER_4(clst, i128, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mvn, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvo, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, i32, env, i64, i32, i32)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index cb82cd1c1d..9be42851d8 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -886,7 +886,7 @@ void HELPER(srstu)(CPUS390XState *env, uint32_t r1, uint32_t r2)
 }
 
 /* unsigned string compare (c is string terminator) */
-uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
+Int128 HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
 {
     uintptr_t ra = GETPC();
     uint32_t len;
@@ -904,23 +904,20 @@ uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
             if (v1 == c) {
                 /* Equal.  CC=0, and don't advance the registers.  */
                 env->cc_op = 0;
-                env->retxl = s2;
-                return s1;
+                return int128_make128(s2, s1);
             }
         } else {
             /* Unequal.  CC={1,2}, and advance the registers.  Note that
                the terminator need not be zero, but the string that contains
                the terminator is by definition "low".  */
             env->cc_op = (v1 == c ? 1 : v2 == c ? 2 : v1 < v2 ? 1 : 2);
-            env->retxl = s2 + len;
-            return s1 + len;
+            return int128_make128(s2 + len, s1 + len);
         }
     }
 
     /* CPU-determined bytes equal; advance the registers.  */
     env->cc_op = 3;
-    env->retxl = s2 + len;
-    return s1 + len;
+    return int128_make128(s2 + len, s1 + len);
 }
 
 /* move page */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 6953b81de7..8397fe2bd8 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2164,9 +2164,13 @@ static DisasJumpType op_clm(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_clst(DisasContext *s, DisasOps *o)
 {
-    gen_helper_clst(o->in1, cpu_env, regs[0], o->in1, o->in2);
+    TCGv_i128 pair = tcg_temp_new_i128();
+
+    gen_helper_clst(pair, cpu_env, regs[0], o->in1, o->in2);
+    tcg_gen_extr_i128_i64(o->in2, o->in1, pair);
+    tcg_temp_free_i128(pair);
+
     set_cc_static(s);
-    return_low128(o->in2);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


