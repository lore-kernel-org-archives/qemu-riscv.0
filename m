Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbI09-0005w8-IC
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbI04-0005rr-7F
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:32 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbI02-0005u3-Nr
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:31 -0400
Received: by mail-pg1-x530.google.com with SMTP id 66so7855513pgc.9
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B589Lc8u+iFgd3azZrRezrhQo/6daZgVnkshkdfwJow=;
 b=XAiqkZNFwM4ZOV/OBZNGg7oDZtxgBGERa0t7jMwwhpazXlgGIXhb4NOcjzF1J6FI/e
 15NImMpEDgm4dU0s52f/ECiAU3TRMzQ/qm1jIy6Nx+fFfrrGjg3LlIowOtTqzsSW1sUY
 L6zmpT0cZtb1FZJYAwBUIhm1u/bRZX0f66sLwPGMIFDvfYI26quNxIEsWswaJckNrHXY
 0Wiqmo30rJnDieDZMeftawWA2AKo28BPLUOU9WMuG7yyeLRDLEU5zAqnFTkMScHsYoEa
 ASvvfApM7nhziliESqaQHP2BjW69axRz/YE1gl4Lgpk7nyylbyC64oN3apghxZhxg+eo
 +1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B589Lc8u+iFgd3azZrRezrhQo/6daZgVnkshkdfwJow=;
 b=gXgNsBiyUqjliCIPqJfIZigkKFm+D4PebmNcbFzBvB6cdm86lhCSeWVvSctUCg8Nqk
 1mUxVkqWKtUr9C0981JHzUFY1Imh5ap8pmZHbIW6ozXDRuDwM9bhpHC2evm63oITWtH3
 Tm3N03mviLsxiDHZyI9+XQ3r7riRToTFONP+j96ckcx2W3j1W6pgHm/s9J3SuF6Dikzo
 qLe8iTBjnNCuE6qEhmNxkFj15buAVHhrHzRwIgsew+gAmT2FjzP84wkbBSJfUn3XFqrm
 HM8WjIgL8B9TpYm1JiQZBQO/Ss9zzOmEdfUjIwE6RAUczOPliGBxHc6zjwH+vNnrEl7z
 ZuMA==
X-Gm-Message-State: AOAM533I9t3XAAzwF0tLfI3m+0IxsAj46QSGyvzCxsLZdqIaJ1cKPP2Y
 vnXPT479LLH9efvi6dKMdhpD1w==
X-Google-Smtp-Source: ABdhPJy8eTJkEJJ0KwrxXtMaWPc8Z7enN8iwKUontgn/TKNuRa/d7o2reZFcAkJy5XYhSJ7a0dQ0TA==
X-Received: by 2002:a63:79c1:: with SMTP id u184mr8082351pgc.19.1634284289124; 
 Fri, 15 Oct 2021 00:51:29 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 78/78] target/riscv: rvv-1.0: update opivv_vadc_check()
 comment
Date: Fri, 15 Oct 2021 15:46:26 +0800
Message-Id: <20211015074627.3957162-86-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:51:33 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions is
moved to Section 11.4 in RVV v1.0 spec. Update the comment, no
functional changes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b78c13f0be7..de2e2e506fe 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1613,7 +1613,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.4)
+ * destination vector register is v0 and LMUL > 1. (Section 11.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-- 
2.25.1


