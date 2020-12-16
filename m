Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbS8-0005uX-KK
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbS5-0005pe-2b; Wed, 16 Dec 2020 13:23:05 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbS3-0000NE-9u; Wed, 16 Dec 2020 13:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608143464; x=1639679464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AbpDifj6fxXpSycLYw3+oac50PZ8804aASGpsTDADlk=;
 b=pK//1/AksSPWSpqneKH2svK7JvPV7yS4k29moCeXy4JqghEv+Brj1WFB
 TOnj6VksuOWTUnl/9dwQ6tT3BwJEDoqyzjpm+zzd5JB1pTVaRbPsw+1UQ
 4+U+QWuvIiHxkO6n8yakqFaFlaIfL38gomq+srACWO4DIaEaGPvy/7o8w
 dkyiOhyNuwwlnpAHN6okTmwEGluBOP5Bust4pohhQVCkov2AI93PzoMm3
 R/aZzOuL5lVtq5t1s9ccGN3wbbTA6m+wah9tcw8KPIjawxwsYlFcyR38R
 nunl/V2mbLl1MLVVmrhIaunAaUqFXl9GSpfZy8eE8PIbc9GHRr9Hhirh1 g==;
IronPort-SDR: ffFTm8G7LZs5MNEhfBzV8NvRM6i7f9TR8eIYoxqmqjtEpYpZ38ms97+yHszS0u7C0mMlhSuiwS
 XrjA2K2zGKykaB2DAm6ORL9Mw5btmthyjgK90pk0PRUDPPXLc8vTyCsfsSmisdsFDCpsPDR7JN
 ww+ERub0mWOToRcApOYRB4UtMv4FfXfPN00RM5per60Eg79isVcyxTVq3dQP2jV4kDZ/W40AZj
 yVgbSWIbw2m2igEX1xp8seNasBDw/hdIy0HWjLdW5uZF4vJ2WHccI1zRkAqQ5dvEtrwdiCu9JA
 wnI=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="259080377"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:30:59 +0800
IronPort-SDR: E93mPdlIZOQqJEvskkIgRHyedaEk+nxil3AieaeVwHJSMzq+7SfDS1wLW532cHGH9tes8xJ+EG
 vEzLDYc6DQkVGNdEhoyUbMylC2pVvq1cT6Vg+8yRMylQNrV6FbDWGnGCfY4J7UJzKcbTzb4n3n
 Qang9kPrekVFrQ7SgpRDGLokUQ5ELx4pvbCBVjQPbBlYE3LdnY+gmER9BH4QFVoOL3RJqdkPMq
 djimz0Yc80lffaFYIhJ61attI3/Uv8ReLa52JvxRLFb8SLMFLT/vk4muxRgNbxgAPCvSgS6dZU
 7a73TGEl9sEma28Ca5RqqUWO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:08:17 -0800
IronPort-SDR: M3/zHRzEJhFYZoMZIlSecToRXgj36oBEXxrkNGtJGwm8QN7INWGhTTnDAE9aWuRN7/EOzt1bVs
 AMNNLQgbGsKBendRBr73czk52IgI9gcpervSE4nq8DsFCwhzheiwFNIyVV2yRcx15iZm2XNxDl
 VHAjh35eXFbiuCJVI4PVPSc1RGrd9phHBOmBJq3u+jNLqDdbcnR28bvF7ifKLBjPLOW9sRf46l
 A551ccks/uHLTMP5ra7U5CDkeBtl1I+aHT5lRtxQGL13jh8MLuo+rY+UKq7kMIuYMqA6lQ7L3x
 T6c=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:23:00 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 13/16] target/riscv: cpu_helper: Remove compile time XLEN
 checks
Date: Wed, 16 Dec 2020 10:22:59 -0800
Message-Id: <872d2dfcd1c7c3914655d677e911b9432eb8f340.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 16 Dec 2020 18:23:06 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a2787b1d48..1fc9273cea 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -446,11 +446,13 @@ restart:
             return TRANSLATE_PMP_FAIL;
         }
 
-#if defined(TARGET_RISCV32)
-        target_ulong pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
-#elif defined(TARGET_RISCV64)
-        target_ulong pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
-#endif
+        target_ulong pte;
+        if (riscv_cpu_is_32bit(env)) {
+            pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
+        } else {
+            pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
+        }
+
         if (res != MEMTX_OK) {
             return TRANSLATE_FAIL;
         }
-- 
2.29.2


