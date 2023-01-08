Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELaD-0006EE-7p
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaB-00067q-PA
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:47 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZJ-0004kW-5c
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:47 -0500
Received: by mail-pl1-x636.google.com with SMTP id jl4so5864177plb.8
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=Cabsn7PefcqmPGGmkreUHmuZqTbdJT501NMjsX90Okc5g3KqmMzGE95eDzNKFphZ49
 EtqsmzjmXCkbiQPPWfvHOcHAkNmm5pQrnNVoCUiSh5XPONfR3jwSJCaeZYWS7jfknop0
 2m0h8l2goW7YQyMwq6I2tFHoXe1EmV2CJ2D3r1YVYaryu7ppXZl9ZpbT4P2i5/syC9/o
 RJm92msy/NrziUaHc0FoIfKl3CESE9VTgKpo5ZhAYySfyrBmF0R7XpYLlwO6kmdRDECm
 MpYqkG92xxDyjALHr0sTaDqlM5RmUocQeQ2rQjv4xzYXo2O5BBf7npN8+3XsBfcgG5mS
 3rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/HSkpGEvHbItuZnMKBTZy7j63PzLUxQ950pxrJaTtQ=;
 b=jumizvZkh+obMjLtTqv2iutXmzHg0P6juKqQGjN5dtq3x5Ld+XS68PXH+SVW2TZt01
 nfPJfHQUdUMq5D8tzdYspQVReL0IaUzgRb+3Llt2JA6gbQEalKFPDx06Soi+4/q1WibR
 +yTnu+WDiinA2vlmIwAHPFl2rtrHd/6fEv+puZRp+b0REfNWt7vrVKC+ducOychSwU77
 VewIY/jqFX/dKIeawyWbGL8Kl1w78d7skKEsHokXiPOmegTwp9eIho+moIpe0VU6BU3T
 m2tE3Q3NCHJ5UBiyGjewCmlKK7GaLvWDDn7lEObQM8AEaDB3l/9F3RQcIf03ud9RPfwH
 JRAg==
X-Gm-Message-State: AFqh2ko4Ow2ToTqYO0nzfk1uAyYoB0T/obCdHDGU+0vawlDAs8MU0PcC
 b1grxn/L4uBrrzY2bg1PRFjbLw==
X-Google-Smtp-Source: AMrXdXvIf7OOxb/PpscaAZCQPmbwZzR6roE+2SGtqXco7lTFIuD8c4seNc4FNzs7hcGPAnsqgOPW+Q==
X-Received: by 2002:a17:903:110d:b0:192:8b0e:98e1 with SMTP id
 n13-20020a170903110d00b001928b0e98e1mr53826505plh.54.1673145471955; 
 Sat, 07 Jan 2023 18:37:51 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 28/36] target/s390x: Use Int128 for return from TRE
Date: Sat,  7 Jan 2023 18:37:11 -0800
Message-Id: <20230108023719.2466341-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:48 -0000

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         | 2 +-
 target/s390x/tcg/mem_helper.c | 7 +++----
 target/s390x/tcg/translate.c  | 7 +++++--
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 03b29efa3e..b4170a4256 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -99,7 +99,7 @@ DEF_HELPER_FLAGS_4(unpka, TCG_CALL_NO_WG, i32, env, i64, i32, i64)
 DEF_HELPER_FLAGS_4(unpku, TCG_CALL_NO_WG, i32, env, i64, i32, i64)
 DEF_HELPER_FLAGS_3(tp, TCG_CALL_NO_WG, i32, env, i64, i32)
 DEF_HELPER_FLAGS_4(tr, TCG_CALL_NO_WG, void, env, i32, i64, i64)
-DEF_HELPER_4(tre, i64, env, i64, i64, i64)
+DEF_HELPER_4(tre, i128, env, i64, i64, i64)
 DEF_HELPER_4(trt, i32, env, i32, i64, i64)
 DEF_HELPER_4(trtr, i32, env, i32, i64, i64)
 DEF_HELPER_5(trXX, i32, env, i32, i32, i32, i32)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b0b403e23a..49969abda7 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1632,8 +1632,8 @@ void HELPER(tr)(CPUS390XState *env, uint32_t len, uint64_t array,
     do_helper_tr(env, len, array, trans, GETPC());
 }
 
-uint64_t HELPER(tre)(CPUS390XState *env, uint64_t array,
-                     uint64_t len, uint64_t trans)
+Int128 HELPER(tre)(CPUS390XState *env, uint64_t array,
+                   uint64_t len, uint64_t trans)
 {
     uintptr_t ra = GETPC();
     uint8_t end = env->regs[0] & 0xff;
@@ -1668,8 +1668,7 @@ uint64_t HELPER(tre)(CPUS390XState *env, uint64_t array,
     }
 
     env->cc_op = cc;
-    env->retxl = len - i;
-    return array + i;
+    return int128_make128(len - i, array + i);
 }
 
 static inline uint32_t do_helper_trt(CPUS390XState *env, int len,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1a7aa9e4ae..f3e4b70ed9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4905,8 +4905,11 @@ static DisasJumpType op_tr(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_tre(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tre(o->out, cpu_env, o->out, o->out2, o->in2);
-    return_low128(o->out2);
+    TCGv_i128 pair = tcg_temp_new_i128();
+
+    gen_helper_tre(pair, cpu_env, o->out, o->out2, o->in2);
+    tcg_gen_extr_i128_i64(o->out2, o->out, pair);
+    tcg_temp_free_i128(pair);
     set_cc_static(s);
     return DISAS_NEXT;
 }
-- 
2.34.1


