Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHzP-0003vL-EG
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzL-0003mg-6B
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:50:47 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzI-0005G2-Ve
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:50:46 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w14so5893755pll.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eaW99mfw4LjC07h+87HWqiRICsEXxMMHaraUtMl+Ark=;
 b=YxSTvFTW/ncOCIpAAdglNc3wYlkczaQvERx4WZeX6Nlrg5+4Kq3dAVigCLqdzkHse3
 Ve6Lgd1LHcsDxN15+hYwbWx+uOIwIMg85kr9/UluKS2KMZEAZGV7WFj1V3v8vok+YGOm
 azPfOK5pB1ZEjBhfVugIH2UfootT8ut9d9cSWfnwrS5q7xRWXzG3FchqTLSoefqb/SEp
 zFg62/8FTwBjm1/Rgu0pNvGg96vBi8geThhfsvqeWa1jx2MU46SKsL88hKE1bvBfEwef
 Is4ziugfpq36MSQ2yK9eP04jOyeyXrC7JTlhM9mEiycB03OiW6opkJ0xPhpiQ/gXCWhK
 WPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eaW99mfw4LjC07h+87HWqiRICsEXxMMHaraUtMl+Ark=;
 b=2vPz6UTL5PdBGUI+vOnJmp/s1CC0fObKiiHKPlN3yI/Ztf9SKgxhctWaeEdE1QSt9B
 BCBOs11A28q6yGAGd1qFy0sBU24MTTpmO/yG2fdrouJGpvgiKGHv6t/h2Uj48ePDH53b
 P3ZokHNLu/wbW2PG8Rq+dRV33FX58H8fEBzG9iAoQvk0RsotZx/11akJy/6YaZzduANx
 GhCrJ/lbEZwXBYuFIV3s/ZV+9wM2dqITYhcMQQuIxbXVPDlw4JULKfR4D4pL4YrB37ZH
 uv69lD/ukchIGUkBpHK2suGntE2d5OJKX+8P1pDQK9VN6MtsOtz/bzXvFqX6IHSQ1hsU
 FwrQ==
X-Gm-Message-State: AOAM533hJJZnCPgyqKWIOLT7Q7Q5JjUUyhD5yKdpCgb4MWjpzV0E+3zt
 qWptFMrzoEwtO8RioOMOkQRUig==
X-Google-Smtp-Source: ABdhPJw0munV9x2/EwEEZDYjbT9Ux9XRwvnwntFMenPFlNFs9uGXlETFuPB8sPSch450G+jPGXJ5fQ==
X-Received: by 2002:a17:90b:4c4d:: with SMTP id
 np13mr26479959pjb.193.1634284243693; 
 Fri, 15 Oct 2021 00:50:43 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 65/78] target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
Date: Fri, 15 Oct 2021 15:46:13 +0800
Message-Id: <20211015074627.3957162-73-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:50:47 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>

--
---
 target/riscv/cpu.h                      | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9b2af4e4d0e..49eece111e2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -101,7 +101,7 @@ typedef struct CPURISCVState CPURISCVState;
 #include "pmp.h"
 #endif
 
-#define RV_VLEN_MAX 256
+#define RV_VLEN_MAX 1024
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 92a23b52e49..dcb96c954ec 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -567,8 +567,8 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     base = get_gpr(s, rs1, EXT_NONE);
 
     /*
-     * As simd_desc supports at most 256 bytes, and in this implementation,
-     * the max vector group length is 2048 bytes. So split it into two parts.
+     * As simd_desc supports at most 2048 bytes, and in this implementation,
+     * the max vector group length is 4096 bytes. So split it into two parts.
      *
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 37b2451bd05..70ddc55e16b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -124,7 +124,7 @@ static inline int32_t vext_lmul(uint32_t desc)
 static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
 {
     /*
-     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * As simd_desc support at most 2048 bytes, the max vlen is 1024 bits.
      * so vlen in bytes (vlenb) is encoded as maxsz.
      */
     uint32_t vlenb = simd_maxsz(desc);
-- 
2.25.1


