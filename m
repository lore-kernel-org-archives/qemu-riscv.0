Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1j-0007ZE-D4
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1K-00075p-Fp
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:54 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1F-0007TG-WD
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:54 -0500
Received: by mail-pl1-x630.google.com with SMTP id c1so5542050plg.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdAJOX1FcZjtnyq2ALvPntQgs+t2YDMFFecOsF1aMGk=;
 b=vGdk98fpRaawt/TmCEPwqbh5DAKUjpvs2PZeMjhry4+3V9vh7GRWptaqgSyPHN0DRx
 AoqUgGfxXgLM1xdG9so6fCaqkk8NNWXBIRj9uGe47uT2HYJZMPXt4VsoHly03fK55iz0
 W5jPSV6KSu7H7Su2W59WvV05eMCHymBJQCU/6zW48rV4RsFbo1WGifB2u9zWTPktVmcX
 kMnok78x6RaMVVV/osUxtoSl04P4s8qvQboyr4PMbq9E4S0GDyhLYlCC7W7+p8ZMOpNI
 fkSL3d/JBwHb/cxVdsHwag9KrEWROVkUpbakHGAKQSRQSk/fYzttBXrFFIN/lQSmdxCV
 oGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TdAJOX1FcZjtnyq2ALvPntQgs+t2YDMFFecOsF1aMGk=;
 b=CQ4dz3BliQznCVqKPSkAtkfN0oqU9OO5VEz04cgaV6G/7HRAImeDF6lxIQOz3GJf8V
 7zZLMuTuueksLUCKf1auNefVffDtvWITZuS2uAAKf1n8f9Ux6221OpUDlUE1K+eVlicA
 OMi9ucoL7aMJ0cYnWg5QB0/nEpkO3q0HxWK2Yn+zTPicxa3rzxXOgvWO2GupGtPffHxK
 0qLtLLn1nOQPaMQ4uz9Psqx9tZJh37ReJjNzyQE3DRC5gp2L11YrS1G8yzL46kibwODb
 oERet9RGIoEIE2qGQpFPqmD9VtxEfmqrJgcHULFX/xMAvnT/obbOg91gUa0DFgE0H//T
 wq2g==
X-Gm-Message-State: AO0yUKU0Q4oI8tkyKSzXxiBvkFx+7HyH426Y2kBj6IRRmhVMFLx65vsV
 FytJKtk0bGdtoWX4DlxFbo1H+Q==
X-Google-Smtp-Source: AK7set/QmzLSTTKhAhKGeBkiNX1utJ0tq7Gr3ZDvNt8FJjbg6p1tRwPb40r/LM3AqtQkip6tX+rC2g==
X-Received: by 2002:a17:902:8b85:b0:19a:b74a:7f7e with SMTP id
 ay5-20020a1709028b8500b0019ab74a7f7emr20204625plb.28.1677475548497; 
 Sun, 26 Feb 2023 21:25:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 14/76] target/arm: Drop tcg_temp_free from translator-sme.c
Date: Sun, 26 Feb 2023 19:24:03 -1000
Message-Id: <20230227052505.352889-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:25:54 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sme.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 7b87a9df63..e3adba314e 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -97,7 +97,6 @@ static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
     /* Add the byte offset to env to produce the final pointer. */
     addr = tcg_temp_new_ptr();
     tcg_gen_ext_i32_ptr(addr, tmp);
-    tcg_temp_free_i32(tmp);
     tcg_gen_add_ptr(addr, addr, cpu_env);
 
     return addr;
@@ -166,11 +165,6 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
             h_fns[a->esz](t_za, t_zr, t_za, t_pg, t_desc);
         }
     }
-
-    tcg_temp_free_ptr(t_za);
-    tcg_temp_free_ptr(t_zr);
-    tcg_temp_free_ptr(t_pg);
-
     return true;
 }
 
@@ -237,10 +231,6 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
 
     fns[a->esz][be][a->v][mte][a->st](cpu_env, t_za, t_pg, addr,
                                       tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(t_za);
-    tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i64(addr);
     return true;
 }
 
@@ -260,8 +250,6 @@ static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
     base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
 
     fn(s, base, 0, svl, a->rn, imm * svl);
-
-    tcg_temp_free_ptr(base);
     return true;
 }
 
@@ -286,11 +274,6 @@ static bool do_adda(DisasContext *s, arg_adda *a, MemOp esz,
     pm = pred_full_reg_ptr(s, a->pm);
 
     fn(za, zn, pn, pm, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(za);
-    tcg_temp_free_ptr(zn);
-    tcg_temp_free_ptr(pn);
-    tcg_temp_free_ptr(pm);
     return true;
 }
 
@@ -318,11 +301,6 @@ static bool do_outprod(DisasContext *s, arg_op *a, MemOp esz,
     pm = pred_full_reg_ptr(s, a->pm);
 
     fn(za, zn, zm, pn, pm, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(za);
-    tcg_temp_free_ptr(zn);
-    tcg_temp_free_ptr(pn);
-    tcg_temp_free_ptr(pm);
     return true;
 }
 
@@ -346,12 +324,6 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     fpst = fpstatus_ptr(FPST_FPCR);
 
     fn(za, zn, zm, pn, pm, fpst, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(za);
-    tcg_temp_free_ptr(zn);
-    tcg_temp_free_ptr(pn);
-    tcg_temp_free_ptr(pm);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
-- 
2.34.1


