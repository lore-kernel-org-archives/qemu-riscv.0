Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHyM-00028L-DR
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyG-00023i-3X
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:40 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyE-0004GS-O1
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:39 -0400
Received: by mail-pg1-x531.google.com with SMTP id q5so7856946pgr.7
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IbOT6UAXmaIWeVwBueWIFU4apxP/NnP2cVNkTu6NHvc=;
 b=jvOEGc+JMkxNz64BlpUvL14bI71C1KZyKOap2dNbCvZs3byAFrKMeIC8/8AGSGclIu
 BGkKsnJLzJjgwt0Otw8sV0a53qqU5aIo4rGu7k0JSLSvoABKc08CYWDiIIhh4eGy0t3v
 eMshwbP570fsQdUr4SWxoH4c0LRpe9HWenCt7p6/roCYeiZ4nPwB0eKmHrY2yjYCHOiX
 UBXJVgmF/2kDa+L6ukGkGwIk2o2imdnSN7YOeErU0spGZFSRCjMoXgGtWWeppggBnxCo
 pQLA4ClW9NY4PhwmBdaZQcqubeVPrgYL4cDCoixTdKyAUQPFHraaK370MaCj2eH/MvcA
 zJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IbOT6UAXmaIWeVwBueWIFU4apxP/NnP2cVNkTu6NHvc=;
 b=V0Mr3Z95Q8hYLBDzm1+N4JCWOJcEpAmdcsJT8ZcMHuuenMfEe/bg3C6GkEGttAEK+J
 iGkHM+xO6q/4Kfp50GdQuzJY+kRxxMz56FdPK7m+SbWqmwOefYFskNhRVT+pEP4yVzNn
 e3MeL4jMKvq386x/2set+Bckwh1zZBT7bCW6Jp0xxGA+OU5e78P9pRi5EHXk0M2XdaN1
 WL4yXw4dKOXGvx2Pz3meFU98qF2XpquEbJA79orWGBcbfFgGiZFY82Gmx7cJlFvrqn97
 NxiP7r3/0U01s06gcjEmw9OGkyk+PHI078a6VlXjDU0tuSHKFQe2n62ahQZHnkgMJu2G
 GFnw==
X-Gm-Message-State: AOAM531ZPbXoWJSck5SXoZa5ZuqeI0PPqFpHaBOKJai4iI1c0LhsUocO
 EQgyEqeq96Nd9PFyYIimxLkEMw==
X-Google-Smtp-Source: ABdhPJzGdfqYvqD0CsMai04bQ+5OnkAbicfqi8j/HYECIi/PimH1Ry0oK9BSpKcyOXPhdHLTOzwrYQ==
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id
 i22-20020aa78b56000000b0044c010a4ee9mr10429469pfd.46.1634284177525; 
 Fri, 15 Oct 2021 00:49:37 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 46/78] target/riscv: rvv-1.0: single-width saturating add
 and subtract instructions
Date: Fri, 15 Oct 2021 15:45:54 +0800
Message-Id: <20211015074627.3957162-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:42 -0000

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 65c58fc591f..575d42b68ab 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1998,7 +1998,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.25.1


