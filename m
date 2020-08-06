Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSy-0004Jc-Je
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSw-0004EH-I4
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:42 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSu-00083M-O4
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:42 -0400
Received: by mail-pg1-x52f.google.com with SMTP id o13so26508217pgf.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CESX6q26+3ZHamBv09KqrV0Utgcx/nTm3sAptnzacM0=;
 b=a6COSk7jQF9HKxB2XBSpkHCVaR8C6uvRIgYiuh+klFXaQ7YhMSzsBEDmNT0cmuwBXI
 yIc2oDrnQZmUa18+CdN8Uo1vE/U6cWT/edXZa7mqx1aBrqhQzamgPJUtbMoSXCWoB/4E
 +VHUI01WNTvuodtqECmTS2gJs770GNY+L0DSUqHFmsJo/CUs4zr66/v/FtTH2zQq48NP
 gShuBfAdRlbQT1rV0PA6DL52yfVU2wOvpivk+J8cV1mfW/z21YqpLMOY74KHE2BlzHwB
 qrLgAYYlTiOGOjt4M2SJ0NooUDiplFZFWzeFe3tCLXbc5PClNC+h3OUgri1Jz99K+sUv
 fd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CESX6q26+3ZHamBv09KqrV0Utgcx/nTm3sAptnzacM0=;
 b=RYUzrH94fxzvb/3HqszrjpYhr9LfhGEON7SA+aWxDoT49dzjzE/xQ4m6JOUHuReLcb
 oQcl7ZsOUJru2U5bDi1yXk58Xiybs4X/RkuCXZPaJVajTOSAmGOX3O7C+1VxyCT27sM0
 qLcdW41RDwT9RHgjVmGlCOyoqGP46XYP3GdtSBJhSdFV3YEy6xR0XFVmRIMnujoC0FC/
 GnOfPkDSfk82Uo/eZb8X46ZwzYKs8yrUkVlQgJ17t1PtfSyIZfwLSMmxxvUgSVb5940Y
 1pMDoGwzGtj3/kCSI6O6cCBPP8viVuoOieELuF2AWDPeBPZm9m8pG89ETcgCLYgRxTuN
 Gfsw==
X-Gm-Message-State: AOAM5309b+8ejwojD3kCqEI8N6qFIgOPhHVJMMhmZlDufhQEA/zVIQPE
 9Ob1iaDpr3/CTUDRNVpwe4vEzQ==
X-Google-Smtp-Source: ABdhPJyr/yFALEQKfcTj6wonnAmiXtqE3Km7IZKJzJhhMcWWw5TeoWHaOtep+9ReP8lPu32ztdUjlg==
X-Received: by 2002:a63:c34e:: with SMTP id e14mr6529502pgd.55.1596710979528; 
 Thu, 06 Aug 2020 03:49:39 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:39 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 57/71] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Thu,  6 Aug 2020 18:46:54 +0800
Message-Id: <20200806104709.13235-58-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:43 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a3679f79d0a..543d94ba6a8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4450,14 +4450,14 @@ GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
 GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
 
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum_noprop)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum_noprop)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum_noprop)
 
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum_noprop)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum_noprop)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum_noprop)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 /* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
-- 
2.17.1


