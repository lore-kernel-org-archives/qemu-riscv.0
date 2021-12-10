Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaqE-000180-2N
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:01:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapv-0000uJ-AK
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:59 -0500
Received: from [2607:f8b0:4864:20::52e] (port=44849
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapo-0000D1-6i
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:57 -0500
Received: by mail-pg1-x52e.google.com with SMTP id m15so7364566pgu.11
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vv9Rv453m5gaU1xoj4ncTA0Q2fRFY8++ApLoC5C4QXk=;
 b=jvHQIBlYpOBKTw1KLZVvVtg/VHqJ27BD95ueoKM4yxjiGANe4dbXyEc+ZkS7WdNi63
 KJuFBa2z36c28F+Cx0XZnNNtIXrKVo9x9KGN05XzG8FSLxwZ/D0Q7pfIdVAyP2l53kV5
 8COdy5e/w9X7MZFnsIetEV5yCcrtIJeS4eh4aZtCn80y13h+ohd/FbZnMMrVddfy8Uq9
 deSfFzIVSUkGt0YQtxgomC1RSv6D1JTwaTJWLdFN7w6ulKpNcuLL3VUViwHYPkTaLAm4
 +jWpMNgAtt5OFf3b4Nur5MXON4O2T884yXmwwkzxKV8oxqStHA58ZKmBB4xWuQtiZWTL
 HROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vv9Rv453m5gaU1xoj4ncTA0Q2fRFY8++ApLoC5C4QXk=;
 b=x7bI7L1yXhSp8WgCiU+S591b6VAZb+BX7AxncE0wqpsnzJXvrHI5NQb/QalAodyQ0M
 8bUrhS9aIv2wju7ShN8GLMmuLrMFSMoThlAN3HdQPEFI7d5KoNs3l8bxqi2fFcPF+MpV
 Oe9FyaHTGVe4nKkr2leMVE8TRq9au4lslCHwhT55Bt8lEr1vxRKV46qAM4ILgUEdc6Eb
 qql8jkFR5z46N6W0Jrd2IOCNOroXeEB8+bbQxpiAsrEKIdypo88GaXoY6o1y1+njch96
 y3jegXLWzvM6Dc45IuKRQD5Rt2QmEf6LojQkE7TmWkX7itCQviE2Wp1Sxkrf8ugtsxXk
 LvWw==
X-Gm-Message-State: AOAM530Z1QKwgumEG2sY0JFXc6C2pJwhMqd5297T9rCbo377RKlC3l7Z
 N6fA7h6fqXCmW+8ZiH0Nczgynw==
X-Google-Smtp-Source: ABdhPJxrYc48J80Abco0vz/fc0tcr6CyD8+hwUsVorFaPAkda0SD1aPBuPbwFdUOkJ7yJNic/x7Sow==
X-Received: by 2002:a63:5c0a:: with SMTP id q10mr37738128pgb.213.1639123250823; 
 Fri, 10 Dec 2021 00:00:50 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:50 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 76/77] target/riscv: rvv-1.0: update opivv_vadc_check()
 comment
Date: Fri, 10 Dec 2021 15:57:02 +0800
Message-Id: <20211210075704.23951-77-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 08:01:00 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions is
moved to Section 11.4 in RVV v1.0 spec. Update the comment, no
functional changes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 33ef7926e6..47eb3119cb 100644
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
2.31.1


