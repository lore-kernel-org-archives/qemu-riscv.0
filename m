Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX38-0004x6-V0
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:09:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX37-0004r0-Hg
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:49 -0500
Received: from [2607:f8b0:4864:20::102e] (port=38409
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX35-0000uK-JK
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:49 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so14341607pju.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FFYGwbWqtx4iDntT2+VzpDaI8tUJ9aNlAq1o3kReejU=;
 b=JQoTSBAOPxYtBLV7gTOh2CGuJ1n44HLLlA+K9ayZKGsqtUQyDpcMumFawysJTWteXE
 Gs7+mJlXkq31DcBzivoIjtVgqE1x3EJWMMY6DivTy+sARhiGRUxkvNCBjNsikiVK6F3V
 OOsPJeK3H2ay2Hsk+1t5d+gfOQsNUGPMSH+5J6M7MXuJIfFTWEzlbX60ryWwy6XUsRE3
 GCiRZQM9ytNtYKPde/AMJtGn3/OiufmoIijVG8bRJPhMF2uiegeOgO1WX/Ers+kYVvG3
 ujFRFHgUwG3gzw0rDJqRp7yMGbu5g3AVVBeUJwGE4/otSF0KsgTUZ7GPpHIB3byfQvcf
 sSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FFYGwbWqtx4iDntT2+VzpDaI8tUJ9aNlAq1o3kReejU=;
 b=b7dshjseJsrsb13myYjn6xvyHHH2cb0Rqj1PCtVjBAEHXpo+sathz9om7ItbIsLf6G
 dxQXbE4FF8HcQ9cTFRBgPcwtI9uYSsmqWI3AjA5TJ2CQBeMKGzW4J2npbtw0sCXLo1rd
 dqU8luPAAuIjn8k+4K762EgLH9Q89RHoU/MQgACObYu8VZPbDIA35hrRoDRGqh0F0cGb
 bthiDtDnYeOQ+TiXLJGUGuOvaw6gXAknuc3YeC0JVnDs6KT58KJ3VXAh7r8OHgTCyW0l
 e84oVWZG3WRydoxY+Fozob7UCZfxFRkGhLGiC+LkjmLUeXoPfNR8haI4BHzldxaTZFIO
 d1JQ==
X-Gm-Message-State: AOAM5334tH/0+5Fu5kUqhNIv1Ngmrr7lDw6x7y1RWCT+WXanKHLuhysb
 fm/wBqcQ4z0nOobl73Eg8yFvwA==
X-Google-Smtp-Source: ABdhPJxxPAChu2bqDKOjm1VZ89VzUQGPJp/zrNR/lMNGR3ol94h3d0lEWRJuPHPsiS8BdvLVbjkzCA==
X-Received: by 2002:a17:90a:df14:: with SMTP id
 gp20mr35283820pjb.186.1638155386423; 
 Sun, 28 Nov 2021 19:09:46 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:09:46 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 65/77] target/riscv: rvv-1.0: relax RV_VLEN_MAX to
 1024-bits
Date: Mon, 29 Nov 2021 11:03:25 +0800
Message-Id: <20211129030340.429689-66-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:09:49 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 11a0f41b27e..5d93ccdfa71 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -100,7 +100,7 @@ typedef struct CPURISCVState CPURISCVState;
 #include "pmp.h"
 #endif
 
-#define RV_VLEN_MAX 256
+#define RV_VLEN_MAX 1024
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 42e94491184..be3f9f13275 100644
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
index a78f36b4b3b..e61c8731425 100644
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


