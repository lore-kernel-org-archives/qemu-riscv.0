Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNjm-0004Tn-ML
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 04:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjk-0004PO-E3
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:44 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNji-0004UG-Rr
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:44 -0400
Received: by mail-pg1-x530.google.com with SMTP id r28so9373399pga.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwKbrfdySSX1Qwo2rwrcbG9wbfVzzSFa+d2xq7yqAcY=;
 b=b9XDa/CsS0G+OC5Z3dhaoT9k63jMErKBNkZ8cbbogoZ1bF1xnuK6+ME2VOwT3UGLM+
 eh/vx+pTNE4VbMSDpfKmjpHGeZm1H1L69hp3ZNL4LkCMBTGap61HwO+DjjWRFE5RLYTj
 yROfwBIPmNbmjS7ktIsxkNfNe6RCcWmE85ATD84ixmaF1pWPSyQooC/QelJdQ+lO/3Jk
 8abK1alEfjaSMt7lLrZl9Z6ux/g1wgC9DkP+PU7DT6ECUn0ll/ULU9kC+QiiFsnt6QVd
 PNiGHRanj8zGrlmYM17WaKKcdOBxDXEBXR7o0Yf8volsUlTIfM8Dvpg1DDDhLXSx/vr5
 kbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwKbrfdySSX1Qwo2rwrcbG9wbfVzzSFa+d2xq7yqAcY=;
 b=Lhgj20PQZfNFEEhm0sJCd2Fzn32e6iFvaMNMxTMq0TKQJPw6c0WDuf+tg7tX9BtnbW
 ePkoK2pRAEmAOc9dDH6G0uUzgb+IuLnyj1TuNtBOFW2/4B9sFy4Ddb+mAEU56tfS4nun
 N8kYdhdVzmUqpdefem4Aqm3RkT3NIXJDY9lzAR9xCJT5J+FjgTkViS45Yeu3KAZ7DKok
 4I1y2yEbi56XlEFpYmWUyagmyTzKFQcI+nWIke48nJjsNpLrPe+49a62BsTYPv0yydYS
 xsBzRCmpqbs9G43FUUjDVk8JG3rVYF8Y+0xePcviCe34Cr/kPrw9X+DIaeEGmsF97ReK
 JnDw==
X-Gm-Message-State: AOAM530lp/gB3oyPBOnRPHRVjegMbd1zYWu7eiwkzw5IzW3UGiBVBc9l
 UBM5PIZzMggt18/O0dT4pg6XOA==
X-Google-Smtp-Source: ABdhPJwdDSacNSE/6JNiwY8LemSsukSJBVoZiMWewjPRJLKNsMobT06P5MQVsnbv+xtO04MtUo8oJg==
X-Received: by 2002:a63:91ca:: with SMTP id l193mr7061278pge.213.1635497981603; 
 Fri, 29 Oct 2021 01:59:41 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 04/76] target/riscv: rvv-1.0: set mstatus.SD bit if
 mstatus.VS is dirty
Date: Fri, 29 Oct 2021 16:58:09 +0800
Message-Id: <20211029085922.255197-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
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
X-List-Received-Date: Fri, 29 Oct 2021 08:59:44 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
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


