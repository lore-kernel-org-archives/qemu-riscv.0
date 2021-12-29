Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2OnU-0004Vg-1E
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnS-0004QZ-TF
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:34 -0500
Received: from [2607:f8b0:4864:20::1032] (port=36417
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnQ-0004fe-V6
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:34 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 c9-20020a17090a1d0900b001b2b54bd6c5so1619005pjd.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F575T9dO+4ZW9fmdR/aCWDdFX/Ryz6qGcvsU7gxpyus=;
 b=J2S4ZVKJg/H4zv9rtkD7q4vT9e7Ra/F2E2PUclIMif1RsFMkbDSU/oiVWWH/KLrRIe
 Wnjxs3PPjVB1maDbZqI0hyghwJ2NUtUzhpSl207G0kYF3ABvKSONQA8g67QeUxGg7ANg
 BtaEm9eI3xt9VJn6lwew1x3TTk+0P9XVm8uxPVj2GiQtzcTeK5ppLi7rSA0B4VG9t6t5
 7KGOPl27WNE15LcbaG1nfIcNAsqdx3IvC+UeySca9xO4bDQ+LXSEK9x2oKcG7EdEk0vm
 h/62bPMlJ48VWFN1sz3aFlr9zYShV4X3KwEDcU48T70MsyCk4+E/TWNzjHfmGRPGN0WR
 Q7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F575T9dO+4ZW9fmdR/aCWDdFX/Ryz6qGcvsU7gxpyus=;
 b=cfdz1Y42Jp1IYzu8vAdznhvvsME0W5Rg9fIKOe84ykjLjjfZGwR/ld4AhiQZmMQA2O
 isMBXEOkmuLR7vkJNXA0M0+A6ivuSkjAfRi0pPWke/yNNfwOCQBmH2PPfcIBV9LdCnSx
 fZBYtdBB8jxJUwz9U5npaJmJqmhMEQoTRFpkOFbOVKC+Hj2JXEVE/Te3XDpFTAOibSoj
 3LWREGELUmUAccVBEPozuz7uVUau7RIfTOjgMMc6RGnFwDhd6D/d7fbjBOX5K3rBN480
 33aPNLLXLPhiehWXHdGhwAjO/KeuFv8UxAWbfy4dsZb5ZJDsWTnYnyIgR50rnfcC1DQ7
 uA4Q==
X-Gm-Message-State: AOAM530q2pPLrGCfUmJLCFyeON8mqw8f9SbzAiL8FjqKvviY+oHu9BsQ
 f5fEkTtiNuWTBV4xqKZDn1reYQ==
X-Google-Smtp-Source: ABdhPJwe/9+R01wjhZE3CF62kE6WGLHTCtYkFft7v8Hs61+impyo75hg20M6hEA+abh43F5HGC/crA==
X-Received: by 2002:a17:90a:5b:: with SMTP id
 27mr29465918pjb.148.1640745271823; 
 Tue, 28 Dec 2021 18:34:31 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:31 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 12/17] target/riscv: rvv-1.0: Add Zve32f support for
 configuration insns
Date: Wed, 29 Dec 2021 10:33:39 +0800
Message-Id: <20211229023348.12606-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:35 -0000

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support the vector configuration instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 230c475d6c..c6280c7b0b 100644
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


