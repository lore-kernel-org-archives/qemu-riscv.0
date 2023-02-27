Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW2Y-0001cW-Qe
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2J-0000U5-Qc
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:59 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2G-0007oE-8v
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:54 -0500
Received: by mail-pl1-x641.google.com with SMTP id ky4so5551715plb.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
 b=ufm0rY5t9OPCPFAHVMiiEBR7CFHrxv13TfsrWHaYNIuzAcSfRUPX6OkiCl7v0S/TRi
 4G6nczxCXULKrmBgauoMIuEOBNvYqmyobV2OA+57CPW/d24+1MtqISgCxnj3Sc0Gxm6g
 C7VFrN2BdYKxnMUhO2nIV0xcQSHTezC4/O5MtWIxubX7J4vDeKpEEP8gaSiIL2CMQr2L
 XmyDl8Hupa3CxL6aCzTcl4XmDeBRf/UoXHQmozE59hQxNcY7KYzJA+7WRzeXjIkisb1O
 vuscqx0Z2Zhm1TgTOTBhCIQOzE3FGNIRjuZUroU20K8Jnt03mKU4ekGjIXc7g4toxdjZ
 aNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
 b=FJqv53fvWgyP+CLO9ooei50qj1PCCPZH5n19eJQqXFU6ADPpaua9cnLPiXHobyNJt6
 +EHenFnhAbS1OJavXOGHGRQEubaw5vw6JGa/fqOd+et0mvuuXHe1O2PDBRH1PhqBXyVE
 OlywimeGPc7Qm6LSldT0iPb6PUgawIm1K8UM8C/K0LHifcYeiHkfRgjc7xpeE4CYob+P
 TfHVrXnOzxUI2HGy2sgH4x3gwm66JtGXRH7RcecTjLC/4x4i7lZU+bz0oZNl+sBWhUxs
 mbG2sWf/wkzcyNgILz9TtorAzyCC76BzHSYU1XkJWi7x1DGxWe1C1tW2fdu6GabIjcne
 nzmQ==
X-Gm-Message-State: AO0yUKXBaXnb8ZVDddLrHhw0kTnfbTuKfOu9IIMTEj3R5wND5OKBrvkV
 Hh1VqQy0SYaeQMY538I9mK6giQ==
X-Google-Smtp-Source: AK7set/1rGKakzDJ/P1PwHrd6qOvoD2tuf790EKO4f+4b0OqSPR0jRU5iA+37bKv9d0P6haA8+B+Jg==
X-Received: by 2002:a17:903:42cd:b0:19c:d452:b282 with SMTP id
 jy13-20020a17090342cd00b0019cd452b282mr9042209plb.12.1677475611555; 
 Sun, 26 Feb 2023 21:26:51 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 37/76] target/mips: Drop tcg_temp_free from
 micromips_translate.c.inc
Date: Sun, 26 Feb 2023 19:24:26 -1000
Message-Id: <20230227052505.352889-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:27:02 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/micromips_translate.c.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 632895cc9e..23f80d4315 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -724,9 +724,6 @@ static void gen_ldst_multiple(DisasContext *ctx, uint32_t opc, int reglist,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free_i32(t2);
 }
 
 
@@ -1018,8 +1015,6 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
@@ -1067,7 +1062,6 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
 
             gen_load_gpr(t0, rt);
             gen_mtc0(ctx, t0, rs, (ctx->opcode >> 11) & 0x7);
-            tcg_temp_free(t0);
         }
         break;
 #endif
@@ -1276,7 +1270,6 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
                  * mode.
                  */
                 ctx->base.is_jmp = DISAS_STOP;
-                tcg_temp_free(t0);
             }
             break;
         case EI:
@@ -1293,7 +1286,6 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
                  */
                 gen_save_pc(ctx->base.pc_next + 4);
                 ctx->base.is_jmp = DISAS_EXIT;
-                tcg_temp_free(t0);
             }
             break;
         default:
-- 
2.34.1


