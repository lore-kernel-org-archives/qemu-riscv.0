Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNmH-0006sO-QG
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmB-0006l9-BV
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:15 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNm9-00069M-TS
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:15 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 187so8643017pfc.10
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=msn2vYfPMSfmjcvhvCuoNT+Xnj+wzoOeb8IO8wdHfk4=;
 b=Jcsl7eJcfzUzHWO+WyYJmNzsXSDEygjCWi9eoEzfoLvwOUhmd6EK9i2q4jPD6rqujV
 +fhlA9Me1UWSDZXwDW5Cr7zsA6/jasg1KQUgD+Flpnd2oJyi52ZBaICO2Bpsr2BNnkUW
 K5YqQHv3PLXYPlcByCqDrOyTZaO4l66GkQDYjGGNUBxi2uHVlDcmftjmRFYHR53dUzAE
 luIBx/wCz723XNjWhRK3jYh6joNqSSmw5aSMQ0wjtMq7u1BOppkkMFIYnaUs5qFAahM5
 0jomVIKKRINnf/r1XhMTKhIfb2tudGSIRJ0hP44jk+74TU2QJKKu3OnfOMmD61W+kPUx
 MUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msn2vYfPMSfmjcvhvCuoNT+Xnj+wzoOeb8IO8wdHfk4=;
 b=gtO2BxGUw4yDj0ECUl1oaU0YxNOx6qd3ZQSjnpbMjUfCoioNinvSOI8ew9WtLczRMq
 wKBZJBqKgLti/8evROkGcVkQh7c+FGkRVVd873xdLgMFGgQUfLEt9MQSKPaxJrOq50N2
 jSx+GZvZTgTgr0pWzEQc00KrQVNFK9Hqjs3znR9K6KmoGhpVxaAbNwetEwCLtUBmeOgo
 3gVil0Lw8PwNEsYCzDw8QnxlpO5T0eGchqo1a4PxRVS5tbRQKp+GLtQobXcnl4Qzh9Gc
 DN1Llz4jqv8Ryrb6w44kyU312dLZQO50kHtWdrpVQs8DMVEzqB+iLB70ZxpGbvj9tjso
 SE5Q==
X-Gm-Message-State: AOAM533F6DkE5nNdvS1LSf/EPO//19rYslEIFjtFuFQoxv1RvBUqQLnr
 o3/pSVQpWnVu/gJUWk0MRVZclg==
X-Google-Smtp-Source: ABdhPJz1mC2T7k9gsws6A+2UDvUDBSTH4wCSHI/zqRTijUUcBcE9aVJTAf2N3ARUL7SVSu+Sc8X02w==
X-Received: by 2002:a63:6f0e:: with SMTP id k14mr7387782pgc.351.1635498132676; 
 Fri, 29 Oct 2021 02:02:12 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:12 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 42/76] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Fri, 29 Oct 2021 16:58:47 +0800
Message-Id: <20211029085922.255197-43-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:02:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0076ce5a0a9..48942129135 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1685,9 +1685,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.25.1


