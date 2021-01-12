Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGBX-0003wS-4r
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGB4-0003ld-Q9
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:28 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAz-0007Vy-8S
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:26 -0500
Received: by mail-pl1-x631.google.com with SMTP id b8so621575plh.12
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9thnu29aSy99YUg/so9eSCfEpK9kCKrFxV7BaONEJHU=;
 b=joiCAkoxb2/1vWc7PF3k7r9i15OiDUU2axmvnU/X+78ouRTRgL+V+LkmErfGA5rs9x
 SoFz0i6SHWR7rCTb4bJWFBNga4oW5+gvjRXy5mu9F4OYbF7wbXS17kE4Iao/FO6hJDa5
 PkTR2SrIkBGUPnOeyHvJmF9CR8If4gOp9b7ch/vlQOV5ERUJqVhjnsgeBMl77hnorE4y
 2GNPV/KkL4JLdBjMpsnPxzeZmoSZmF3AIZXv98ft/gx5ONqEbV4VCKvI9jCHX1e57O5w
 h5Lr9dslqho9/lHFaDStfwUmroWvzww8nPf1A35wwhw0vpJQXxZZZCtHz1Wn9dPeH6jj
 UYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9thnu29aSy99YUg/so9eSCfEpK9kCKrFxV7BaONEJHU=;
 b=sTSXHHvdVlJfNxUrwRhf08jZ2OgCoH+Ox9HvfxLd4R6NXFlr6TU70239Im2mbblFO+
 6vSHj7HrHBcqtWTXmu8tdCdY9yz0fHknz6LIxm3fG+Cj7xpm9pq0Pul7aduSGtCKoPXI
 cDZ0T1FvCXeTafMc/EJfxwuU5qMNX3ZerCnNkUxkiSPJWEvkLup+DXjsfPyRGWuqoUhz
 gTKmcju/7d+WgTFv48ajSkXANEGOS2eRCvmOGmgnZd7aj+yFrljfSzCGSHK2l8kf9n1t
 6HS4/Ib/jdzoXf9kGPHUoyUA+kI9gXad0WSTOVlEicaO7Bgs6DMdTE4vusX4fEoJFcfj
 HN/w==
X-Gm-Message-State: AOAM5322dGhT2MzQNGdUmovTPiKHebIt39CcKlREe4NgvvVMKdkLnlTF
 mrr+fG0qJlDAhPg+pGOVjDlohQ==
X-Google-Smtp-Source: ABdhPJwYztYXPmBg9u5u8yd4nfNiHrc+a7hFNa7yZfwN8XLu3/ErDPQwRSYF+y0vnErwtPjiHYNykQ==
X-Received: by 2002:a17:90b:352:: with SMTP id
 fh18mr3681742pjb.170.1610444479368; 
 Tue, 12 Jan 2021 01:41:19 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:18 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 20/72] target/riscv: rvv-1.0: fix address index overflow
 bug of indexed load/store insns
Date: Tue, 12 Jan 2021 17:38:54 +0800
Message-Id: <20210112093950.17530-21-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:41:28 -0000
X-List-Received-Date: Tue, 12 Jan 2021 09:41:28 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 368259f75a0..9349a36b41b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -361,10 +361,10 @@ static target_ulong NAME(target_ulong base,            \
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
2.17.1


