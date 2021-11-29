Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX15-0000Nq-94
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:07:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX12-0000FR-IT
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:07:41 -0500
Received: from [2607:f8b0:4864:20::1030] (port=41692
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX11-0000g6-4w
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:07:40 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso12873588pjb.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9kvvvHxXjQ2XDAckOwgHwYb7RgcvEtihb3X2Pk2Ob7E=;
 b=KtUjJ81PqQbQE54IzZYMEXHqjnnFyTfngncmoc3pEcPxVxpIYHutFp9Mg3SrxaZTXc
 q/rj9UvRgLiPDUTzR6TZkzQxi1nGDKT4IJ0tKQixWj7Q4vNN3c9b2nsnqzds2GuRGd5X
 vyNA9bir97ll58ZjJYu0CjqimsIYsOhV3ovSUi11hRaY6PFeXPjEw3qLPZ+LjlE0Fukm
 BGol9doUNXMK1mR+lNuZzhHsS8oGBteEj91X8nVqN6ZofPDgmK7d9uxRkIfaZBvupL/C
 /r7DWQ2/2vE32db2Y57ljwm4s40Q4mgN2GAfQK1dICUjLGMH2AFJ98XiJs4+fmf5mdJb
 /D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9kvvvHxXjQ2XDAckOwgHwYb7RgcvEtihb3X2Pk2Ob7E=;
 b=r101qG2HBFWy6ABYEtJRHj7dek0QPBxz8EaBnGEQD0H8ELFBwGvEfLhic/9mU5fpZG
 xRgeeqMinX+rJUMDOz61o4FkAzYqeRWHSyMVZt00I0d55t/eEK/J0oDx86ubUrCefFHs
 dDoPt5nDl75JQllOYhQefAaps8ze+K0nellGxzoOKCBgV5REgxz/dTZLwfbyDv3KOOOR
 /j80ez3q5PPQr/BcQQYQUDnOqAeBBGHOyoaFEVryG3Lhp1/P3IU7LrydpKhChygfQPP1
 yCd6hgW6FRo2MPmYmcexOAD5zYp5x/besJg7oywWzrREn/suA9N1uNFSQqTyR4tZyg6D
 TJlQ==
X-Gm-Message-State: AOAM530H8v3k0RIYb8tdMo3knjkHyleSoXlHV6aNOWPoCNE/tm/nY8uR
 /WyccEgtgmsXKXJxsc01zXiRTA==
X-Google-Smtp-Source: ABdhPJzx/i/L2ux5Dc/JOU9nPt1e8VpTz01jFTUIeDhb3guKcWqVju4g9FVjxredm5tjiVDJRQoKHg==
X-Received: by 2002:a17:90b:1e06:: with SMTP id
 pg6mr36279846pjb.137.1638155257946; 
 Sun, 28 Nov 2021 19:07:37 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:07:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 46/77] target/riscv: rvv-1.0: single-width saturating add
 and subtract instructions
Date: Mon, 29 Nov 2021 11:03:06 +0800
Message-Id: <20211129030340.429689-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:07:41 -0000

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f6202835ff4..ed4554b6a1d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1999,7 +1999,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.25.1


