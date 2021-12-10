Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaoz-0007cO-FK
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaox-0007Y7-TZ
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:59 -0500
Received: from [2607:f8b0:4864:20::430] (port=33490
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaow-00074l-40
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:59 -0500
Received: by mail-pf1-x430.google.com with SMTP id x5so7851662pfr.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v+sEuxg9eYRt1/Vx8zfdr1vqFD8qCJSCIkB6Tl6EbFs=;
 b=KyGd23vY3t9CA5R7NQJvyRkdrYtzRDClYSfJCrAJ3zHI7gYav2CgxTF1vj+VK6EIOU
 vbuithq/A+XsNtRNVeAyr4Mkbc5kYDmVcsJxOAafHqx+WjFcsZ+iwneqJM7ZgO5DQMoO
 DtPWO+Efc5CzmZyhIlvLLUc0NzpdgxYRkDII4VqqpIoHOcH4e3r5/PK9yQlUQA+H3TdV
 qdYvrHC7LAvQxy2ShyC0cDLCMBr0/q9DtLrcHmCdwk7AlqFTCEPvl02qK4fjmtfLd3G2
 XuNeH0wVOCwx6r+kI4r/0QugPUGspCh1v+wVWQx9ZCUwDIBJt3q7d0qBzkm8HxULUYHp
 wZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+sEuxg9eYRt1/Vx8zfdr1vqFD8qCJSCIkB6Tl6EbFs=;
 b=K/GtTXruN7SNsoPveX2piGXlmZcdUaJ2/nR4cA2N+ydhe4ll+M+SWvlxDndHK4YCZV
 j7eVHHppgd5LGp+YPjaDbWBBqPO83fgIoOJAaTHTmhCsLbS+qs3c+80wA1qqSXXsjNav
 QeCzefMmnPaGjm0C1q9tI2Orj2tY6bWVA2o6I8SWalJ1JlKvP6WCeplbe1vXj6yZ5eJF
 q9Kt9yRLV3FHdM5n3GU9x25xb7EUhDkCfKuG8CzQebNz99VKufbZ/hTD46OIvdF71RXs
 IKGzjtFegXmY4TuRHNoNc6lGGSR0HcoOCZD6zGwT8G0TgmPX9pZ4gJAlrucN/gXJ/3oY
 ++pw==
X-Gm-Message-State: AOAM533Ei95ZI09hX0KFeSSBNby6ccfIJM/jiKkzs5/bw0Gmry9PQG/G
 G6F9qcVUtVSjDHnlOoGKgwLMLg==
X-Google-Smtp-Source: ABdhPJzlu6vDyymMrULPxHUyLXh2JMABNkX7cY42MPKzywTafG9l4Nk0g1ccN58ldpPFzEk+iLGMMQ==
X-Received: by 2002:a63:f654:: with SMTP id u20mr38284331pgj.187.1639123196939; 
 Thu, 09 Dec 2021 23:59:56 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:56 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 55/77] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Fri, 10 Dec 2021 15:56:41 +0800
Message-Id: <20211210075704.23951-56-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:00 -0000

From: Frank Chang <frank.chang@sifive.com>

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b43234ed3f..03716ad706 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2030,8 +2030,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.31.1


