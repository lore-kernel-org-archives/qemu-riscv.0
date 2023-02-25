Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqit-00061y-62
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiM-000408-MH
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:35 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiL-0002tO-3E
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:34 -0500
Received: by mail-pj1-x102a.google.com with SMTP id kb15so1446482pjb.1
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
 b=SA6xZ6xDY7LrrHiX6kAU6EHasmZaRrIDcRGZtmrrS0HuSZUFwGjw7p8rG1iPT0cmjY
 OhyaZA56ypL8NS8KIZXqGXDIjEvkMS2oGdis9w547LCoqaL0QR9gSWghitNFoK2SK8VO
 G0/fxYsKrNtFWqMdOf0bPJ5DkWKw4MhlvRR+ND5yZBZOZq9+RaTa/BwtHTuC/gIP6xVD
 7WIBkJiAYUEGjE9bAS2MNh4j8MqxD9xe08D119ICiiIUuoW4yA+hh9+WkHmZgHossjZv
 I57oKjsfHCegVnHMsvJnbom/quZq62Jbx2fEenzfmZAyrQx6CINa2I17lTPH3G5w2Agw
 UrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
 b=66KHUp1dt1dGRaP4mODFx6Hf0vCSQmOqgD/Zv60S24FsSwHV0ZMvjkVApbBOcVLnIO
 GliaJtkWKXMWgZ5zweToY7i8XffiHTtRRZn4k2jmsUtPiC5eLZgP8l0df8F4CTxQr7a5
 rxeA13mWG886sas0aL0+5EG9siNXzToXPlBhGtocTneU6HlSMPJb0D2htFhnC/bx54F0
 bC6ca/VtyTLoERT0iyijB/U2mM85jj71OtXGzPspOkFSW3ySK71RmUVodD1MKx8z1c4F
 1Gej1a68KgJ4ErHkF61hW+JmxhtLO/yk5Xf1pg7Us8SNEbkdTajUHl87bHym7XPvmLP+
 EIRA==
X-Gm-Message-State: AO0yUKVs4WPO3vdFa8rmLTHE2Z6jMd4EeIH2d3H3s5ESY9fQkzhqsRnZ
 PXVwpC/RDU7yTTIL/CxUO/p6aQ==
X-Google-Smtp-Source: AK7set+G7eQ4PXorij9lkNA6PkRx3vmGiA2DswJSkUnBlmIqdXxDvCSZOmnh8o5kuavwjSmPDU8A5w==
X-Received: by 2002:a05:6a20:4da4:b0:cb:6f9c:166d with SMTP id
 gj36-20020a056a204da400b000cb6f9c166dmr16262190pzb.43.1677316772369; 
 Sat, 25 Feb 2023 01:19:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 46/76] target/mips: Drop tcg_temp_free from vr54xx_translate.c
Date: Fri, 24 Feb 2023 23:13:57 -1000
Message-Id: <20230225091427.1817156-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:19:36 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index a7d241e4e7..804672f84c 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -49,10 +49,6 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     gen_helper_mult_acc(t0, cpu_env, t0, t1);
 
     gen_store_gpr(t0, a->rd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
-- 
2.34.1


