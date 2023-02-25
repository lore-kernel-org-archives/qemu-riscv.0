Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqg0-00017R-US
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqf7-0007Kp-TY
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:16:15 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqf3-0002Kd-Vg
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:16:12 -0500
Received: by mail-pl1-x642.google.com with SMTP id c1so1894208plg.4
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
 b=w9fmbjnT02Pe+LWPAiKvbxEBzktOIvwjpwBI2PiHz1Cov9xUEX0YgVmqf3h/eIyY+S
 X8qUlr6/hPR9L4xRYOj1QywKqV10crwGNIzhHssYPazACO0DWqRSGd3DCf9cdPPqV2Jf
 5nl9Zh2bWrtV2AewDGeGPm6piYbz4De+3FoaDgY/OQ915Q9ByLLdAaC5zE1DBmyLSUFD
 8ywYDZHGSPbkoLRWANjVGV8tcHFPYhJ2AQwvKNlDd9nHx4SLkVe0eu4iH5qLd+1qcKNP
 Bzm5IovJUCvM+FSHa2zcB+rewMY1jgpceTG4kntSWUGG6pYS9tYD1yyHt/v+c5usEs+7
 1i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUvgLx5xhTwjb7hREopkObqZZiBh0MpycGbgHAh1Sr8=;
 b=ymeyAJBDH+XOiHm3iDyoTUxWlGHWVyx9TOZ//MocykIeUHErHJyzDQAEE6UafhPoO9
 xmR4sCorXtmhP4IOqXg5UojerRRRwazsJSTLyF4OpOW4Kusx/K0vGbdvl6yX20bIUlAx
 2OfDDagIthJT7dkrcV+1hsIg8fh/o+5ndutuxXFWjiSEornBYhB1rHKIl8PbdGIGy1R4
 vYpGF2GfFi3XIg3O12TNz7AL6FjYoLXe5RWdgXBm+rd9XPdpcBNYiy8vLaRRWVAiKKWa
 amhOkYUV2UoFd125pu7Kpjuq4gY+kjTOnSHLgLlCx+w3lr+Z2UPPdPH01imYe7f3NnQ1
 UGuw==
X-Gm-Message-State: AO0yUKU/Il4bL9MPTNl80RsHBLYiSmpI16j5k6wOaTpeW9QnaScN2a6X
 G8J+/8jpyhLth2DH0tL6m/lUFw==
X-Google-Smtp-Source: AK7set+xi/QxjUDnOkhfOhHZGlvMMqKp9qVP1QxuYmRi09Cm332zB+C2F/bQHmd9J4qeZhfI3ocejA==
X-Received: by 2002:a17:903:2291:b0:196:7906:b4e with SMTP id
 b17-20020a170903229100b0019679060b4emr24357335plh.19.1677316567803; 
 Sat, 25 Feb 2023 01:16:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:16:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 37/76] target/mips: Drop tcg_temp_free from
 micromips_translate.c.inc
Date: Fri, 24 Feb 2023 23:13:48 -1000
Message-Id: <20230225091427.1817156-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:16:17 -0000

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


