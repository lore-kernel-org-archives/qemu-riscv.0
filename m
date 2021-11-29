Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWyw-0002Ub-3R
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:05:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyt-0002OO-WE
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:28 -0500
Received: from [2607:f8b0:4864:20::429] (port=36424
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyr-0000IR-8U
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:27 -0500
Received: by mail-pf1-x429.google.com with SMTP id n26so15321738pff.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cn/fxJxDqtzMg2Nd2Dj4Np4DlvU0muGWQbxObyTGqag=;
 b=l1xJy0zdhGW3/DVwGppfK6u+qqqS+eX5z6FlqkDnSw0kDAswuU/W6NRsa8ii+DU7Jb
 FTcKKt/8BR9nhWcsRtBII0ViUYmW/c30hbIYzk9UE961i0+RFpce3GxnK11WpioYLJmJ
 QGtjc0huViAEDk6pqAOKVt/ZU7azjvN2ttT5czaCzOiAaA3gohvstcEsYLYHhS1mxLX2
 KToFc8RV7cFTFUKjCx/qXzZwcv/AcGJq4zxNSF/1G7b65bAlZqlBc39cUxhQl4vEKShr
 CU39KFsqAKRq10b6qumbaFQ8eQSnrLMdi+iBbaC30AYoXCENtZ94NAuDLfNSbaR9mqO5
 ksxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cn/fxJxDqtzMg2Nd2Dj4Np4DlvU0muGWQbxObyTGqag=;
 b=Jnd278+GleDgYFzlcibdS9bUmv+97gxZH4PQJs8GR93oZQcxXIL7Rhle4pQtgMBx1N
 zJ/F/2c01fz13ZDEC6H/oOpXpq6f8C8JaovCAr/dUaqk3aZTrgotZ7gFhKvaaBp1kguf
 0PvwiS0tSygxeTXl01E20JMoU85RoJK/E7o9ayyy3/ELxr/50a5mZ9GPBGMUUToK6hVF
 78jb6KMfFEAuGo7yABvuOj8DXWZ9da8LjOwTZhp3UVllmJGCvMmmbCdkVShA8lCpwptv
 f38QrNGAYFceQWH7OktHo3UEbbgK7FLjr0DgjLaugiN3+S/EWysX+t7W0k3fZGuSVPLJ
 58IQ==
X-Gm-Message-State: AOAM531gbhWB7t7H3E+rIUasQZKgXJl16ONsnJ7Rj0fc8qgW8fuvCmle
 NdzoEfhH5X0YxS6aoyuFXMeQSw==
X-Google-Smtp-Source: ABdhPJxU/KpJcdYnHhRXza6kWcF1ReeQWnRhcwtC6XFpiT/S5XNQG6kq/RoOcfCGiaJfGqxW19SutA==
X-Received: by 2002:a63:91ca:: with SMTP id
 l193mr19565138pge.488.1638155124025; 
 Sun, 28 Nov 2021 19:05:24 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:05:23 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 22/77] target/riscv: rvv-1.0: fix address index overflow
 bug of indexed load/store insns
Date: Mon, 29 Nov 2021 11:02:42 +0800
Message-Id: <20211129030340.429689-23-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:05:28 -0000

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


