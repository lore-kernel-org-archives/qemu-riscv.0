Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHx0-0007l8-6K
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHws-0007cQ-NY
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:14 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwr-000328-5F
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:14 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r2so7843550pgl.10
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cn/fxJxDqtzMg2Nd2Dj4Np4DlvU0muGWQbxObyTGqag=;
 b=bT0KF9Q9rUfZ3vmfrfJ+Ceb2CQRRxNJt52LLE/HnxqCap8dDKTE6yWKHx7nhNDWuQa
 1EB5ejn/EGcmQ4cvCDm9mkZ/HqZLLGDmaspqQ5vsA+oExI/aQtN41+2oVqtwLvFV4wrZ
 elNk4lpWG9JBU3KUvneqPI3nRTZdEHQgBE/YePRqVhjI3QNeuEpKEJ3CSVNueqyCgt9N
 SRcZf2AaTwuT3lqCqVGmZOqtzJdrUoAnQLjuBGwA5vjM0niEdOdCjKBOGgYHCxCRXJf1
 p9sE/D5+NlMi+SOK+6VkoEmnHrQgOci+2Z0nJc87PuFs7bu0E3NttZiHaD8s3KKxaaTJ
 SQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cn/fxJxDqtzMg2Nd2Dj4Np4DlvU0muGWQbxObyTGqag=;
 b=L5ivvFQ97k498GimIm/hUIFuN3fQUolk3vsSBfvfCaedKAuP/m74qGgKZeps9bH+tx
 hdkTi4oE9+2GCbojUI8J3M7TlQnFJEn0TqDpQqE6+IaF9XOXQmSfu1aMX3vEyU97e+9g
 KGs5SyArBijw4NII6a8nbIj87hIGBDscjBTZr6p/hAMgMjf1M0LpNDbL0AFA3V2wq5kc
 xyXmGVj7S7IsI7wUqfNXYclnlP4Mgfaa+7Wm52a1UPX+Xy790woKC5wiS+GKIe/ZNxiJ
 8JM5DWiZSYdN9Gw63YG2mz/+BcQdgRSAltyLWaRaVZDQiHfU7OIfZz8KCvNXdYGNZJGJ
 OXhA==
X-Gm-Message-State: AOAM533fR5wpPRmPzt5mE/Cm4x5D9o0WLboKUaBkIdz+UqhAN/oD1K8/
 4WoTUs7/LfifgWADxHI+s6VXcw==
X-Google-Smtp-Source: ABdhPJySt70KkR1Mm7NmGcf7YHGfPUrEI2nZA9+O2VbchXkyvAMPK5fcYBKgqBL26nvs1oGSt3Z8AQ==
X-Received: by 2002:a62:17d3:0:b0:44c:6022:9428 with SMTP id
 202-20020a6217d3000000b0044c60229428mr10211672pfx.65.1634284091620; 
 Fri, 15 Oct 2021 00:48:11 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 22/78] target/riscv: rvv-1.0: fix address index overflow
 bug of indexed load/store insns
Date: Fri, 15 Oct 2021 15:45:28 +0800
Message-Id: <20211015074627.3957162-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:48:15 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index df45c1620c1..3da4f3b1e62 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -374,10 +374,10 @@ static target_ulong NAME(target_ulong base,            \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
 
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
-- 
2.25.1


