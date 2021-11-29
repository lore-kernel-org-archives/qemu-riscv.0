Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWxn-0000c1-Qw
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:04:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxe-0000Wt-6c
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:11 -0500
Received: from [2607:f8b0:4864:20::62f] (port=42872
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxb-0008NK-Ky
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:09 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u17so10976500plg.9
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=75FqHO76p3wvGuD/DvwG2bgRfjy9Isc5XCefh375Zng=;
 b=NmCBxCKGGPCiNJRa1OSrtBOs2OGCQQCcRhvtS2Wa6Qx95boG+ZAmwJAhDy2RlNKyhY
 Tkx/Mj+dl5ohEtT8FSGiPWnCznX83SOqJZKajz3EnwcMbwTFyfSzsEhi72RQl55uJD/Q
 a5QQ/pnIRgChdKYLMQTwDZd8xdR4S6h3zGzeEt85Sjf3oR7IVX+oYVDlT6O9xJk1DKVC
 Mv8gU4LVfLWQKgsM0olvs5ptDBIhtPhKJ8Vxlm0yAKrsCvGd62TGYeOcGyxMpdCTr576
 pQcM1gqIo6aktdI7IauoMKlzKdGLVvD3QFvB4z+9uE/GDQ9VwW4QjvT7eqGTw5v5c79f
 VuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75FqHO76p3wvGuD/DvwG2bgRfjy9Isc5XCefh375Zng=;
 b=1BjXI5IgCckD8EVqAAeVlbum2vRFdux2929o6TdD5JrmQbUOHaSw1znH9qgDIVf1v+
 KjgTPCTLcR74If8o33j4aLW4AnPa653UUENUAm2HqNb5cXsfKCQ/+ZtVCvrbsGyhs/eK
 fFiCe8wXKD5XAHe4mLihSU0aY6VZ1ZFjcXJguYvdFX81wRHWW5pI1n2fcnmb0G6qmtQd
 Uw/UdwPdZUfBRBTdM5CQST4SqwStrSNdzIQ86Mev0FV4H2w0pFjQKjwUQn7qU7aKPo+q
 ywMjFGXt6TAJ48nHza5VDgwh5gLUHu8xXA0m+9f9QMjeh6fDZ3LT38uHTdETvetJEMwo
 rbwg==
X-Gm-Message-State: AOAM531p6K8X82oVziUBVrjDtjOG14h/BEAlQTZg/Jft70eYR7kopZpU
 EcXOF+kCQ9Q6SmmGbu/Pio1h6Q==
X-Google-Smtp-Source: ABdhPJyqkdyfEdFD4cvJk+YfRbmdz/770PbEOSDlBk3YyQ3WG8gkwgIQkKets4kU/TFpobhu6gSgVQ==
X-Received: by 2002:a17:90b:4a05:: with SMTP id
 kk5mr35282478pjb.232.1638155046473; 
 Sun, 28 Nov 2021 19:04:06 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:06 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 04/77] target/riscv: rvv-1.0: set mstatus.SD bit if
 mstatus.VS is dirty
Date: Mon, 29 Nov 2021 11:02:24 +0800
Message-Id: <20211129030340.429689-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:04:11 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9b5bd5d7b49..bb500afdeb5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -502,6 +502,7 @@ static RISCVException read_mhartid(CPURISCVState *env, int csrno,
 static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
 {
     if ((status & MSTATUS_FS) == MSTATUS_FS ||
+        (status & MSTATUS_VS) == MSTATUS_VS ||
         (status & MSTATUS_XS) == MSTATUS_XS) {
         switch (xl) {
         case MXL_RV32:
-- 
2.25.1


