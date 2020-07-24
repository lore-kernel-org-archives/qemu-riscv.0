Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jylZW-0000RM-TD
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 20:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZT-0000J0-M6
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:19 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZS-0008Fo-42
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:19 -0400
Received: by mail-pg1-x544.google.com with SMTP id m22so4189471pgv.9
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 17:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47EQx+PBbhx6NH5LPqB93rYv/z3gdVWS3BnfZRGSId8=;
 b=jQ8XhIEFA1hpQtBf3QL6Fj9jVCKQFtXKBtmd3yDdhdpo0eZdO3ehCjYQ5Y2N2ha16c
 mYgvhfjZXkl0j+9TglvnuRhTIbx+O44rTpE9p3GpgzD2VQ2gvrVjTlAxXt86SNZ2rZr2
 8YkQ3WwWOaXhXJp+geNvk53/tqTUpRdGYqRHfm41MdIw/dubiYsCILx2iOeWXzPGvo+A
 9PLm9uwdhZBdGrguFIWdSE2LhFlnvSOayuJDZujtQW6LQM9T6zMP24opIhseEjsnB9ef
 s4iI15eMiMZZtVqN3QDbPib/401Ac3HA2w/JeXSeYK2YT2NLIPXCnBEEIKY22I/9e6or
 IAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47EQx+PBbhx6NH5LPqB93rYv/z3gdVWS3BnfZRGSId8=;
 b=s1aMLYlmSM6D2xSp9l6bzMMhqL3AT5Opjt8AICGpllDNZjoWkaYilWXCTJZeX6H+IE
 BbYlr8aFvxu4sAW76HyoAE4ijQ38dy1+1G9Sf6+CXaYJiQCjO8bBp9FoHkgM6klrx/g2
 0Zj67BpR+DXdI+6S6LoQ3Rtjw9fv6X9szCkPyWGgL0Xpl1OOyh2hwMpdfQ6uPQJRNTDW
 9NM3X06Ip931zcLyGO6pc1h4kxjQMGIgpUgoWNLg9K4NjcvsEIHHlQT99IAkJwH4GbZm
 8CbE+KBWixgSxnLHaCps1oKx2KTWx7pO4e+EpomkQ8TWTpXiVhueLeTpNFf0wpmiGDXb
 zWWQ==
X-Gm-Message-State: AOAM5300igUf6sXJjpQnoZvNltgTK4vWmDL0Zey3gKonou4P7D4kdRs3
 +mcGaVQmMPlhM+OuPGyfzDqNUw==
X-Google-Smtp-Source: ABdhPJyiUJ1O5lAytZTGnfBF6Ez5cNLIA8nUT0xPa2ZJIRKqfWX4UU2AziPFBPkIilCMKGDCAhkmRg==
X-Received: by 2002:a62:2b96:: with SMTP id r144mr6447012pfr.272.1595550496829; 
 Thu, 23 Jul 2020 17:28:16 -0700 (PDT)
Received: from localhost.localdomain (216-160-65-90.tukw.qwest.net.
 [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id q20sm4224635pfn.111.2020.07.23.17.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 17:28:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 6/7] target/riscv: Clean up fmv.w.x
Date: Thu, 23 Jul 2020 17:28:06 -0700
Message-Id: <20200724002807.441147-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724002807.441147-1-richard.henderson@linaro.org>
References: <20200724002807.441147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
X-List-Received-Date: Fri, 24 Jul 2020 00:28:20 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Use tcg_gen_extu_tl_i64 to avoid the ifdef.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-Id: <20200626205917.4545-7-zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvf.inc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index f9a9e0643a..0d04677a02 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -406,11 +406,7 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
 
-#if defined(TARGET_RISCV64)
-    tcg_gen_mov_i64(cpu_fpr[a->rd], t0);
-#else
-    tcg_gen_extu_i32_i64(cpu_fpr[a->rd], t0);
-#endif
+    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
     gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
 
     mark_fs_dirty(ctx);
-- 
2.25.1


