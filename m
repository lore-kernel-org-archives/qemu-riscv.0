Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKzw-0008Ij-7E
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzu-0008EW-BG
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:09:10 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzs-0002Wn-H1
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:09:09 -0400
Received: by mail-pf1-x442.google.com with SMTP id l126so5542696pfd.5
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=W1RnwHdcfPqUNeQK0zvGYuf3hB9xeHXDqfa7SIUjDuo=;
 b=KwEYdBgtpMNJOx/cj77iAtoIb5CneK1nbmpzGIGRJPYffVLScnX6zvs9OYm0i9JZQK
 WWl7pEZDavHD48GDDzZn9ppUX6K7Ngewa1DJZ4WCKmaKyubJ2gBH5L0q0YHLIYs9dG7P
 zGzBHTgvALrm2b7S5c2gnVA5CiT0LxppPTTlM+vVFT3Kdgu4BjgH8DQpO4z10iDg4RwI
 GYkCxybTy/b9wj4Y92gF9NLm5v48z5kVl69xBvewaSmgO/ZyiQ6OJ2ygXnZ75rmFQKsS
 bM7CoGrgv9Je9wwAzMArxHqXaF5iDhGVH1b0qD3jhMH2noBgoIYBUIOev1JZtEsH4Os1
 obgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=W1RnwHdcfPqUNeQK0zvGYuf3hB9xeHXDqfa7SIUjDuo=;
 b=p8OEB4gIqp4h3TZk6rqegZACY8WkNG6jxfvMoK31NWLvK+uPZHcF8vcoKgddzOuWmr
 zoAObfbl8ueeBYrA1x1Tvmhgu1OJbEvL0ntKmHhpzytUCNhibOCifB/QsqrUb+dtkxYX
 pdouB/oX8A4/FO+chLdxfyAzW4TjSSsXeUUzxpqYNi3655Kh81ws9ahE9H4rLopgml4w
 XalBbVdYc94ahY/tTtlvg7kokYGS+VjAPDICQNPtZwxY48gbMYozxpC9VxD8W+jiEos3
 Ag4SpAv5wn2Hb0f0XS/dhWxHU89SaBm6Wkb2u73EcWjN1yID+neL9E6wwWOCHszHFEQN
 HF/g==
X-Gm-Message-State: AOAM5329yNhMGZeHEjDwYlKLS4Ye2MhJS52t81nmVnEYlWadMA7jg5yC
 Wp/cVdjsaU2W4RQQCWFjtiOGyQ==
X-Google-Smtp-Source: ABdhPJyPcD0QtMAPSqvqWHHV41sujCrP5LwrHoX1s/vQJkhd6rI/XUIEHQHDmE53ypjRcSGsVouD8Q==
X-Received: by 2002:a63:1b44:: with SMTP id b4mr4264053pgm.175.1601406547270; 
 Tue, 29 Sep 2020 12:09:07 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:09:06 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 64/68] target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
Date: Wed, 30 Sep 2020 03:04:39 +0800
Message-Id: <20200929190448.31116-65-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:09:10 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>

--

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h                      | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 930607de24..ca78b7f352 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -92,7 +92,7 @@ typedef struct CPURISCVState CPURISCVState;
 
 #include "pmp.h"
 
-#define RV_VLEN_MAX 256
+#define RV_VLEN_MAX 1024
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index db6c3d9bdf..576d20c6eb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -631,8 +631,8 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     base = tcg_temp_new();
 
     /*
-     * As simd_desc supports at most 256 bytes, and in this implementation,
-     * the max vector group length is 2048 bytes. So split it into two parts.
+     * As simd_desc supports at most 2048 bytes, and in this implementation,
+     * the max vector group length is 4096 bytes. So split it into two parts.
      *
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8d389af4b7..16331939b6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -129,7 +129,7 @@ static uint32_t vext_wd(uint32_t desc)
 static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
 {
     /*
-     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * As simd_desc support at most 2048 bytes, the max vlen is 1024 bits.
      * so vlen in bytes (vlenb) is encoded as maxsz.
      */
     uint32_t vlenb = simd_maxsz(desc);
-- 
2.17.1


