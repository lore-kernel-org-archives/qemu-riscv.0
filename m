Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7aqL-0005Kk-7F
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqK-0005J2-03
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:12 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqI-0004h3-Eu
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:11 -0400
Received: by mail-pl1-x641.google.com with SMTP id q19so7176498pll.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=drhHEFRj8g8xHCSfNMMcorRHdIOXXyDjguE7cUlbARg=;
 b=iecMGP07zaiJXyWaAklHyylpOdh/NAWnQ9Voskn9E9pRHJ6bBuCvHq+bv66sNPtUbs
 bcpG3PEmBVGw/hrF+bQH1BkqWHk0QCOczLxdkyjygpqit8hss3Qqv7AfLpM2ZXyMUubS
 pso8cTkdEMOViNQQs9s7KUeA62LQyWc7WDLR57FXH+RTyfrHhUTp4Q0YgS7pnB4nXCSX
 BnWtrFS21n4zycMeXUh35RuxIQQevFBBMCwVoqXTaZoix36GxI2E+/Ra/1oSt7walysn
 u48eEJZaPPp/3DlvpqUcjZMb8Rc+5G0JqxDk6ME83FUzfHiS1AzqcjsutStoGNGZvrVC
 8uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=drhHEFRj8g8xHCSfNMMcorRHdIOXXyDjguE7cUlbARg=;
 b=EhAi4rUfa9+m2+enZeZXR3A02uU4CL9LyrrXQgguGuum5uMnBOkYzeV7xJpoNCrazN
 Lxj/o1VH6NyNtGiOkg8BfEKrQC4pYPHfF9Gf2i0tepijSEj0l0L0iVuIO/SzNeeWBRbZ
 IQT23ypkYB+azY7QyjzSb4oT3fWXw5ZR3CfeR4kxxHq7K8NWC3zy15pTFtpr6Kl4CA7S
 fmkcts4TIzcPV1tyJRhYs/cKGCrOHwA91LH3LPvDztsmkEuP9N54i8QJcQiGKUDrO45W
 ZfaI5XWQHMCEB/CN0Sw/jVivNfWKrq8PAcm4s5a+mRXY6I+pLbbp/8rE/IzdTsX9jE4T
 WIAA==
X-Gm-Message-State: AOAM533qjaMidEPv16JsT0PxJ+yYyaoCn34ON+OMnJ4cJjDZ9G1IXXBQ
 906xM2xkSOvxNLDOkCh1z8EUGw==
X-Google-Smtp-Source: ABdhPJxljN4QMQU6VVGiBc2pDbxQxnaDLGOzChs5AUvWnMfAGFX08NISh2Cl0128bOvqOZd8Fsuflg==
X-Received: by 2002:a17:902:10f:: with SMTP id
 15mr10734656plb.232.1597654209214; 
 Mon, 17 Aug 2020 01:50:09 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:50:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 02/70] target/riscv: Use FIELD_EX32() to extract wd field
Date: Mon, 17 Aug 2020 16:48:47 +0800
Message-Id: <20200817084955.28793-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:50:12 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 793af990673..43ba272c09b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
 
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
 
 /*
-- 
2.17.1


