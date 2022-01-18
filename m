Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9dZf-0000lh-KS
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:46:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZb-0000V6-99
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:11 -0500
Received: from [2607:f8b0:4864:20::431] (port=46599
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZY-0007ZG-MA
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:10 -0500
Received: by mail-pf1-x431.google.com with SMTP id i129so11683814pfe.13
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TpvWmX/+OZ6m4HTw/QopOPjllyccvrx++a+Fyq9yx6o=;
 b=mvhXhLXY2CNRkhkENKhI0Vo8pUlP0iEL1qSt7E5NTmbtUOQExqk+2pxUMBMJ7SamcP
 H7Ae0OpnsB3Nl8+5vNEnVayDVkR6JMGpSl3qbJBB98KxpP1L8V6ah7D2Y4Yl99Zm5ZaP
 HoK6Eu8eGVbERTdJzhzWIeMUnMJmHHUcjNPeDecoFd5zdP6LNbSWEtXbaXGSmFhFmkPX
 WYhtt9TKj8oOpcFrJPg5kxc0dKG3QKaLRJngEZX6RpGGEU/NP0JUSil9f0RKcinmkGbb
 eb/4/JJaYgc31bgbybfgdM1nanVDrcbw/MJadlR9VITXgm7sduWnXePqFPQEuvmij/Ik
 CTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TpvWmX/+OZ6m4HTw/QopOPjllyccvrx++a+Fyq9yx6o=;
 b=LHSr8H1IwwSmxtgw76BLdS6a0hKJoMV7GmigB4guIyJof10i7SXt/ou+KLKnUXb/ri
 sdDPqffrWV+ZQCsZfYAnVytITeO3jnEBIG73hSmFh0pVNw6cnegW256Tmfi3KVTrxgZh
 Ty78jm1mLEU7L5m3cMFXkZ8OVKnOJS979L37OvUDIF1zgMTRKr3M7tudXzCDPpVTV05S
 RVD++MhYmLO6fkD89Rx6K2cLL5vWWxYfIydYWNEhLgWgLJYjHe47pclayKBwlS0XAUMq
 13b087s7+RxbEttaL9SrN61ThFhVTj2CTXuDv8XadCXmE0CWUjjhf9etzbviwJdpKtcR
 h+sQ==
X-Gm-Message-State: AOAM530PymqGEtPqPVhI6e/55sA7hsXlanXnE23uHmZJTej8OGB9Y52V
 w44cFbqCiWwrqq8wH5APnUQ1WA==
X-Google-Smtp-Source: ABdhPJyuO9nBhedk4HQsvrfTN+HydfgqGMyOCahmGxWllpQ0HcsnALEKmVJIsAPIRTHW7MnYNqwAnQ==
X-Received: by 2002:aa7:888e:0:b0:4c4:3ad:9eee with SMTP id
 z14-20020aa7888e000000b004c403ad9eeemr8747540pfe.13.1642470367488; 
 Mon, 17 Jan 2022 17:46:07 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:07 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 12/17] target/riscv: rvv-1.0: Add Zve32f support for
 configuration insns
Date: Tue, 18 Jan 2022 09:45:15 +0800
Message-Id: <20220118014522.13613-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Tue, 18 Jan 2022 01:46:11 -0000

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support the vector configuration instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9fa3862620..fd6e74c232 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -152,7 +152,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
     TCGv s1, dst;
 
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
         return false;
     }
 
@@ -188,7 +188,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
     TCGv dst;
 
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
         return false;
     }
 
-- 
2.31.1


