Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWxa-0000Q5-TQ
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxW-0000Mh-EK
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:03 -0500
Received: from [2607:f8b0:4864:20::1035] (port=45852
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxU-0008L1-0V
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:02 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so12809207pjb.4
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3TlB4v4OvGuye+bayybDFINi789G9gn0hTUvZHgOfM=;
 b=gYIRTwRi/kUo+KGKro9STEp7ItJ/7Q1nyfIxEjTgEH4CL78M0D3hKrtTMrrZ74SdUP
 C0p/pz4xU7Nk4JPgut+ceLAjJCLF7DsfsVmeVtVrcKQleLw/MbbqGJet1aWukZVCXMIS
 2mNWL+vv5b4yskx41OfOmHPvmKKDNTI+thLc8RzYRnn88/Pf8fAcJHDJQ3HjtOnQjgHd
 45RQYn2Vddt2FNxMw/UEhmt6mmaYCBKgKlfxwiwC4zbsU7LpH1nnULsroTkTaHjCTE30
 33ZHz+QRk9295LbhGtwwmOj5MVNIN4zYjsAvWl5ZieW1bJR6A6eIQS7vP+pd3H+qN6pv
 KGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3TlB4v4OvGuye+bayybDFINi789G9gn0hTUvZHgOfM=;
 b=06HB9jTShDkBLqVC26az9PIopqtdBu9ebhTMupM6p86jMqhPp4oBj95GX3gW+ldrTk
 viC4z84sBd2czuMZLklI1v59Dj2w7E3zmHPT333TpIWpCh2OnblflVAlRzJbZdf6w1Jm
 /0GbbN+f7QJdpPtLOQ7M/OqbQU/gfn6us+00LUMJh09Z9J6S8KP+iTcGmdDUAO8Ka7OS
 mcUWJfuHziIbnn6UspuImNr0Yzk5OyzpvVB6bQoB6POBcuIAty0TXoy/NRI7r6aU8guw
 z6l1ABInnL1VEXUTQ8jVVI1f6wwkZf73FjYFmO9VC3kcdnHIi3I67g3lTc1XPWKaAC1z
 ZIeQ==
X-Gm-Message-State: AOAM531u/yZ5qnsuPOU+18R5ePwjK6whdgJ5O0Wj//ZT3To0SwXT11WR
 aD/cm8uRMO7x92wRrF6xvq/RIQ==
X-Google-Smtp-Source: ABdhPJxLKEa2IeDTplhP+h7pPsFB+TLMt3fDwiI6nGCM3pbM6JKIxNP5Co9zVVud7AnYgrAqshfvZQ==
X-Received: by 2002:a17:90a:e7d1:: with SMTP id
 kb17mr35201555pjb.124.1638155038232; 
 Sun, 28 Nov 2021 19:03:58 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:03:57 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 02/77] target/riscv: Use FIELD_EX32() to extract wd field
Date: Mon, 29 Nov 2021 11:02:22 +0800
Message-Id: <20211129030340.429689-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:04:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12c31aa4b4d..70f589813ed 100644
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
2.25.1


