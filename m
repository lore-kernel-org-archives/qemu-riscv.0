Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcqz7-0005TD-8t
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 11:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqz3-0005Gb-Qx
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:57 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyu-0007ay-SK
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:57 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so113677pjb.5
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=LHWFzxp4yLzmUteDIi1yQFWLmsDtrasHrtgw8oFYMeJMoNUCWK7waiWhe+MvD37lqr
 v0Dir3kqP5qK97qB1x6QJkeeZLzBVWZkLaoDP6G5aGCObs7IsenuDhIGXrCSx5GLIctk
 dFx82qN9K5Q8u7vKpz53rV2lPPD4pbiILqmxt27JkFIqV2TS98AjSj6FIJcaTfz2INE+
 lvazd3roLgqm9fJqkwG1t5zSllK5pZVSIwXKCorCkFfiivF2BMJO2XrPUCRIHAUElfRZ
 plIT/SjzOYjod7HEthqy0Yx9igSLlwSVN3/kQbgFIxluosxAFiX/l2BRaUqN/4N+jBng
 T8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=z5mEDsjpKbFKX9/Nj8UPFamCoijKJu0bNCb7CwW4s7IGIk7yYGXaFXvwDJ8v55B/Sn
 GQRX7HFMSwhsCSonWG260mLyDTjHozAPuzL8oXYucYZYAHo7NM0Cyv81uLmmczMp9Dh1
 NbNRq2qP0OJZ+mSEKYPHzG1ECvDpE0iYjTvZRb0UXcpJsGgV3o+xmM9eaObrpnb5g6l5
 MNfzsUPrW5W9RnGMJxai+rCgeGxUPbtlXcagaGYTGB3cBScgCA3nrn/6Gub5anCq+SLd
 2hBMFwmAN17ND/R6K0FcDHkg+aDgXbzxeyPPw/j4/s9ymJU3OXdmPDt63wzBJgm4f05I
 fucw==
X-Gm-Message-State: AOAM531zYBWr8BiqvbvNGB2FICbc5kAt5s2vNA0HybPqO+v68gTHiPy6
 hv+tDrmdFKCgq7J4e4oZJH5q3yHtZOM=
X-Google-Smtp-Source: ABdhPJxz43zg3xX5dqyhHxR18n4MxiavfkcVF7KpWbo34EeFeXgXN0w+MLzQ86FJNbZkQTVFaKUqIQ==
X-Received: by 2002:a17:90a:7e90:: with SMTP id
 j16mr448683pjl.139.1634657087519; 
 Tue, 19 Oct 2021 08:24:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v5 11/16] target/riscv: Adjust trans_rev8_32 for riscv64
Date: Tue, 19 Oct 2021 08:24:33 -0700
Message-Id: <20211019152438.269077-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 15:24:58 -0000

When target_long is 64-bit, we still want a 32-bit bswap for rev8.
Since this opcode is specific to RV32, we need not conditionalize.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 66dd51de49..c62eea433a 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -232,11 +232,16 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
 
+static void gen_rev8_32(TCGv ret, TCGv src1)
+{
+    tcg_gen_bswap32_tl(ret, src1, TCG_BSWAP_OS);
+}
+
 static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
     REQUIRE_32BIT(ctx);
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
+    return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
 }
 
 static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
-- 
2.25.1


