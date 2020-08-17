Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7aqU-0005fB-Pa
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqT-0005aq-1Y
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:21 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqR-0004lC-5E
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:20 -0400
Received: by mail-pj1-x1041.google.com with SMTP id e4so7494128pjd.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jwaQ01os+v7ccKsWD7AIi9EmHRf1oR9Hg4U1s1xtcn0=;
 b=UYix6MGy9wXyF4AKmCa7MrHXJ62hgyqYlorwJVRFnfsXvu300GRrqndsBfE4y0xEwo
 fPGk1ysAWysp2iTVElgBJBaufIy4pzz+LP/YuMTDx2oT0ODH8ixBD4DneGJ4HLfici4U
 amhp9hCxw3/tjDLik7mdGP/lVfAz4tjmGeH+V3pZeLNh8FGtbHyqE9IhddxHXOl4lDqO
 +BypsrDVZuHYdQ0tANAZBM+J2t2jd7pf1tdb6c8RzWHIprDeF3l1lbwPtfZ8NmQvDxjv
 fEmrzBvqJ7MsTtIcu+dlOpfKaF2xmoimZP+MHPQXzS9GKpqxQBOQJiK/EeQpIW/nQL5O
 Olfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jwaQ01os+v7ccKsWD7AIi9EmHRf1oR9Hg4U1s1xtcn0=;
 b=DHij6ApL7aatbN+KFqpV9WcBRjPwGbNO//d2HIpEmdQmESXulwiM/y+dkMdVZkAI1Q
 +mjcypu5CC1MFjxGv6IUWsrJX9qh/sKJaLSPBfk35WUCmVwZ651KRSSEc5BETCWAXps9
 yaaqglCTUukhnr3CrU+Qbcliyup6iN+eNKsvZ8DOnT7gChr4wfuYnt6GDxQWQZIiCiQY
 /p1mwcW8xcnTYj1sENEtZVhdEx0fJqH6stBIjlEQzeP+NS+SlTmc0kS3KTxgZ9hxxF1G
 uIcQwablzHsDBHVd7pep/vjTVYR1UEYnLkSQI1XhKcy7w5ng8O2LfDPr2Zh6zTCBcd+7
 1Pzg==
X-Gm-Message-State: AOAM530AUMvDyhqZ5Q6HN1jP3SKGakB4qMj/h8nCbMbCqjPnKZ8xv+bV
 elkruZllwWPqtYN0Ir0MScKxYA==
X-Google-Smtp-Source: ABdhPJzxZ+ItaBd3hSu9Drs4vJmJ+J8SVL5xwyBZY3Ntszm5n7Dj8krSCtTPEgeJuG/bgXV6qwczMQ==
X-Received: by 2002:a17:90a:ff07:: with SMTP id
 ce7mr11692290pjb.192.1597654217728; 
 Mon, 17 Aug 2020 01:50:17 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:50:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 05/70] target/riscv: rvv-1.0: introduce writable misa.v field
Date: Mon, 17 Aug 2020 16:48:50 +0800
Message-Id: <20200817084955.28793-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:50:21 -0000

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 46c35266cb5..7f937e5b9c8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -494,7 +494,7 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
     val &= env->misa_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.17.1


