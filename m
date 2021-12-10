Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapS-0000NT-1C
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapQ-0000IR-58
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:28 -0500
Received: from [2607:f8b0:4864:20::42c] (port=40631
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapM-0007DG-Bh
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:27 -0500
Received: by mail-pf1-x42c.google.com with SMTP id z6so7761386pfe.7
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aR4E6sTAKMe2eQWVPVkm5yxpQcJVGp0f+Sm0F3uH3A4=;
 b=J6PNvXqwC5s0ZNNmENZ7NbdDJ3o/iUC5J0s90+X9EUNRzEC6gSrISclfMRt617xCZ+
 FJxrsQerMvDJS7RCuyxH9ZN0eMUTsbka8JUK6nldBUB2GLxMA4JlBlehgLMYzztfwvgi
 6HCP34uVComsPdaTTiu6NJLBs/m87j7trMGzrq83w9AWY+6jDj0SxEfk3Ic/E+z+R6h7
 jk0upkRuq/rhIZjKmkjJzihEqvrzf+DvYvXLhtOq79pasKG7u1OGu6VaVNHy+F6pqqHX
 ++O2Uj9qUAN51B+71+MOartbL6BhOu8w2OJBehUcV99MXnnwRJxvfDzhditcC4WcQJ9y
 ICXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aR4E6sTAKMe2eQWVPVkm5yxpQcJVGp0f+Sm0F3uH3A4=;
 b=APKhPKrPcVvQwZRis/tJuBwXAZIpthh9Xvm475qKPnDyDtgCH4p9O7sYWu6WnbAcmN
 7X37x5Rxt0G0Re578TLCftMsBc5dX8YX7NtD7CH5nod6lWB39bSaWichyEwNnHl65CAS
 b5c/ktxQcNXkmRevcAjdQLxxT9I/X79OjYo1OT9rZ97yDQ5ksNxxiXcf8KRpXPaRD1Y6
 31AL8LS+1lbQxUkDwlY/kfVtynIp+QGexuOrxh2RJZ7Nw5Bck49ybWv0NLJAnoIXSKCQ
 MP6bLH8jt0sdd7X+NxmX0qkr9VTyCZMSnsUfUH8Tw2jZuc1MRSC2PydTsH80mVaYsHcy
 YLlg==
X-Gm-Message-State: AOAM533sSD15qk+wcWtDDoZ3JluOd6UUHeszALpyRmuiEet7I7J3UOht
 Vxz24NNM9/7gjTSC/FFa8yl1ZQ==
X-Google-Smtp-Source: ABdhPJxqryANS6u0poW8hJRMckKZjuOHFYxff2xxjdd0kIFxFz1l3/XL3jvNNal4i+SSdxE8cxzywA==
X-Received: by 2002:a63:c154:: with SMTP id p20mr37697011pgi.132.1639123223127; 
 Fri, 10 Dec 2021 00:00:23 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 65/77] target/riscv: rvv-1.0: relax RV_VLEN_MAX to
 1024-bits
Date: Fri, 10 Dec 2021 15:56:51 +0800
Message-Id: <20211210075704.23951-66-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:28 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 11a0f41b27..5d93ccdfa7 100644
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
index 42e9449118..be3f9f1327 100644
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
index a78f36b4b3..e61c873142 100644
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
2.31.1


