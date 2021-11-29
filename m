Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX1h-00026F-Cu
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:08:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1a-000216-Ep
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:08:16 -0500
Received: from [2607:f8b0:4864:20::434] (port=36451
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1Y-0000ja-C6
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:08:14 -0500
Received: by mail-pf1-x434.google.com with SMTP id n26so15330025pff.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iy4/ZG97pAI1fkdp/C0EbommRaCD38by4LIqf25MsPA=;
 b=IMG+G8+9gd+Jk+u+ebLB1gbrGaUWAVFw0DvBG4H2oRGDyn5p8nb04GwL6f8qhUG6NL
 rpcyn8dtMCZzo2W4LQ7nCHZbYz/Y9AIk8j1Hxap6y8e3m+lipEY2MR6mBYK0MHW73e6Q
 11ZFN3wOgopHOAYCT3bNiSwet3LhbOPm8/OFtUV9oMgDVBYEUuoDW+n/iRR50KDeQXbO
 GwnYwY+J1fvAz+WVbzorrgnLSOzi0mOIkJXx2bYoQ5Lm7HoC9eElOniIHxwgNA4M0/vG
 d1UIHlitvOnVA0Mj4zVeZa+M1cMBXlOAgWDGViXBndoe+/cSwulovkE2xBhdWdYU3tF3
 uf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iy4/ZG97pAI1fkdp/C0EbommRaCD38by4LIqf25MsPA=;
 b=fvv5OPbBDHIpR2K5pL1qbjpwnNsLxlrLJzqG5OGTwgmT5EDLzUoTiH1i5R5Z/DdRko
 CY85QIUgFORqzMEqkGCtsWvq0ZnrggGGfjfh0KD7MewcNU2pUFHa8LcgvcLKr8jZDfN2
 flUTconIKDr/Pc1g8312m+tiECS/86lfAIBsTohkRa6NUcJCPcEPkscboZ9csgQKzLeN
 E2bErt1BPeq5xRZJaoTN0lo4ec6qfa5a5icZMtGfr953U90/82FO6BDAFcbY7GbJloCa
 JZDb3+CQL7tmWEJWkSy+x5aU+kcz/cXfc2386Y9m34nE9txXcAJmtYcxVBeWnYYIKknw
 RYgw==
X-Gm-Message-State: AOAM532ZeyevAS6YvFbSnnIOXwKRnYeFCflZJ8I51MthEIQ488qJh25y
 A7ZMcwi0E6r9Dehmpcpcx5Nsr9sXBNfzspAP
X-Google-Smtp-Source: ABdhPJzwPKzINnjgbp4aVTJsPw9r9xiyHJ71Hdnum1frmn1C4x0kaSDAm0xQK75ptvxG/dSZDserJg==
X-Received: by 2002:a63:864a:: with SMTP id x71mr33113073pgd.129.1638155291157; 
 Sun, 28 Nov 2021 19:08:11 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:10 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 54/77] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Mon, 29 Nov 2021 11:03:14 +0800
Message-Id: <20211129030340.429689-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:08:17 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 998247d71d9..b43234ed3ff 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2648,7 +2648,14 @@ GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_widen_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8);
+}
+
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
 
 /*
  *** Vector Mask Operations
-- 
2.25.1


