Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNn3-00082q-IB
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmx-0007v2-61
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:03 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmv-0006YA-Gy
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:02 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 187so8644629pfc.10
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iy4/ZG97pAI1fkdp/C0EbommRaCD38by4LIqf25MsPA=;
 b=Zo4hgXgaDKAIrY2HWfV2ch+HQTvhc/z6SKrDc4YT54TTOSAJQympoQZXdb1FQzmjV4
 TzonrXZaueTjLAz8o8aDFnPhSI+UBNJqUCLqYu6pzzJwzyGoL0V3Gj7WBDDTq2Z84Grv
 1sHTWDktfzS4LNleOsx7G8APUQx2WhyF0Lbi5EBgHJf5Tn5O9RznOhMYSU8T5cNKGpzW
 Lsq2DEXLKXFHgIbIEDBryWhIj9c/qSExtHhNJ3vAUom2LMD2mJPI9Ek/rOmLys20MfJu
 0Gw0YK/u2hV4/fNKtsIPvMNmbjZQDIPOHAmsPnD2zkPGdIsUuV6kYe+o4MqJ5pe5N6Jx
 Qjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iy4/ZG97pAI1fkdp/C0EbommRaCD38by4LIqf25MsPA=;
 b=3j5eQSZGAFoX+yMMlNVaJ6aJ6lrbf/OFsGj/HUgS7P6TN5VdNgIDODoE7uDS+NDtsI
 hINBCci9GEOyP6SC8riSDjfcbtR/920ZRZosLBctPlnUcv3amxEocC91+huNWex9l8Gj
 r+ENJiqtiVEpVu1D/ePssYExYnKvohTBs1I2egmeSjth+/psLhZ8JFUJaAZtZS8Sr9ZU
 eiUjN6H2O29vyqnnMjWFZP13eccbPb9tVpC9hH7bMyoiuNSl1guXfWdS04puJwOtnZZ6
 9vCdiqELxzqMv7fqlbDOIbXEOzmo0FpjTUBpFvPDmQjZgtCnyCvOT3wBhlTUx14zgFS1
 RYjw==
X-Gm-Message-State: AOAM533vpHtH+B9anU8+4W/VGWW3dhwNCxd63YibHLpExZX6w8Hs0u/3
 XL4BWsHKFnS9qb3EmReFjrS8pA==
X-Google-Smtp-Source: ABdhPJwlMwvdqHQNBUj82Eb6tY8KqSzddCoa15LUTd7yDKYtMfUr7/7Rdb7oQ6WJ2wIwt1MBQ6BKhQ==
X-Received: by 2002:a63:6c49:: with SMTP id h70mr7265897pgc.368.1635498180245; 
 Fri, 29 Oct 2021 02:03:00 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:03:00 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 54/76] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Fri, 29 Oct 2021 16:58:59 +0800
Message-Id: <20211029085922.255197-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:03:03 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 998247d71d9..b43234ed3ff 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2648,7 +2648,14 @@ GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_widen_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8);
+}
+
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
 
 /*
  *** Vector Mask Operations
-- 
2.25.1


