Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqg3-0001Qc-7H
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqfB-0007S7-4z
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:16:17 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqf9-0002MT-DH
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:16:16 -0500
Received: by mail-pl1-x62c.google.com with SMTP id e5so1871016plg.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
 b=QYcpPdrPQAAs9wBXSoHkh6+IF2k5musAxnintgSEFCXdvG1mxv9rJ3Io3Afg7TNEXp
 um/uQylCJjPMTL4qZB61jn+tFfYnPATsNSB1EcpYyVjo8dDlsDVSBDLu2veS6uTjJggw
 wk48DnXyDWECm7n6D81UDvbZ+Teht7qrA3COaFp7Y9QDNGOXbTeuJ+7bJphb8xdI6Dfs
 kx5dPsc8xlon2agzyv+YgUiPXnoNJecdjEoOOAkwfb77UWU2D+qVKEGjgKfifVI6Ssub
 tdk77mde46LwZQNuYRQok+N0TEuqnSzXtpioCVfpW4/rbm6lBVa9LzyeNLFexOH8hrgf
 PD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
 b=hLAAuO2vtuUjjknhXunND0eJifuRTfYLFEduntXLoQ5yw9ID2/s04TFwMQUD49L9KZ
 ba1gIa2wujxMlgDG0CGjUdqqkLb32PoMu1zt/Z04VlN1Rh2NdllTzNAqJgwV2ChLvUKH
 AYEz55cvQ7IKXPQZyoHLeQog2xEks+uSCeKGblry+XFKDElEeZcM104qvbeDB1yNYTAA
 IeDdcBM1WKRcQj3DVc4E6UbPFjUTL0mx40N0kW/ScCPy9m8eMJiL1mAL/7sB8sYAwJiv
 mfzD0dbdLnxQy5umR7RgUn/KdBFZlVArMXeOrdf4drjBFK2yogTw9LbhQOKGVyV9qkxl
 3lww==
X-Gm-Message-State: AO0yUKUFual8Xu/jmnoIyQHOX21I/JL30GY2peZ3/nZuBpTBR9TppYk0
 bL4TKi0gUkyTOgK0QGxHQMncGg==
X-Google-Smtp-Source: AK7set+rd0BXQuiX4p94V0fHul663KxLZRVtvnp9py93SOU2PfUIOYJkvjBugigC0I74eVqVlk2bvw==
X-Received: by 2002:a17:902:e851:b0:19a:a267:f16c with SMTP id
 t17-20020a170902e85100b0019aa267f16cmr23099355plg.31.1677316572913; 
 Sat, 25 Feb 2023 01:16:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:16:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 39/76] target/mips: Drop tcg_temp_free from msa_translate.c
Date: Fri, 24 Feb 2023 23:13:50 -1000
Message-Id: <20230225091427.1817156-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:16:19 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/msa_translate.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 1bcdbb1121..220cd3b048 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -217,8 +217,6 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
     /* if some bit is non-zero then some element is zero */
     tcg_gen_setcondi_i64(cond, t0, t0, 0);
     tcg_gen_trunc_i64_tl(tresult, t0);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int sa, TCGCond cond)
@@ -237,7 +235,6 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int sa, TCGCond cond)
     tcg_gen_or_i64(t0, msa_wr_d[wt << 1], msa_wr_d[(wt << 1) + 1]);
     tcg_gen_setcondi_i64(cond, t0, t0, 0);
     tcg_gen_trunc_i64_tl(bcond, t0);
-    tcg_temp_free_i64(t0);
 
     ctx->btarget = ctx->base.pc_next + (sa << 2) + 4;
 
@@ -545,8 +542,6 @@ static bool trans_CTCMSA(DisasContext *ctx, arg_msa_elm *a)
     gen_load_gpr(telm, a->ws);
     gen_helper_msa_ctcmsa(cpu_env, telm, tcg_constant_i32(a->wd));
 
-    tcg_temp_free(telm);
-
     return true;
 }
 
@@ -563,8 +558,6 @@ static bool trans_CFCMSA(DisasContext *ctx, arg_msa_elm *a)
     gen_helper_msa_cfcmsa(telm, cpu_env, tcg_constant_i32(a->ws));
     gen_store_gpr(telm, a->wd);
 
-    tcg_temp_free(telm);
-
     return true;
 }
 
@@ -782,8 +775,6 @@ static bool trans_msa_ldst(DisasContext *ctx, arg_msa_i *a,
     gen_base_offset_addr(ctx, taddr, a->ws, a->sa << a->df);
     gen_msa_ldst(cpu_env, tcg_constant_i32(a->wd), taddr);
 
-    tcg_temp_free(taddr);
-
     return true;
 }
 
-- 
2.34.1


