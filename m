Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKwg-0002zZ-Gy
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwf-0002w8-1v
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:49 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwd-0001sW-BF
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:48 -0400
Received: by mail-pf1-x444.google.com with SMTP id x22so5503047pfo.12
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hp5DzLiX5CfPOqsg6g2o1fOOo3aptoJGc/1BKoFrOdg=;
 b=ipOKA+NNUMOanWkJqAntM1dalwjhSI1lbYcFKoyUTWOaXMhcnRfsWfZYjZKHi5gC9E
 8xpUd1191yjELvc1d8aIUK5d+BpKThrw+3x/G4jPgXIAwdydhojmz0o1DqyHCsV+f6KI
 MRc9FsLmGzSiKFWAdn+x44mekltQoW9K1SjBSwSEzyRTiMecjBj+Hm4X8UCUNf8YLOEa
 N2d+ZPkPhk3ByxB8i2at0ywDBLXG+0vu4rKAsI1ti7TqEihhfJFUlxbDf3o6jSREdmy1
 yDeodEplpYi8zl/Dpf9e5CTdVDYqgYDvos4sk2CpFOL9Ip3QsQygLtLA5WqzRkiPZoi1
 OIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hp5DzLiX5CfPOqsg6g2o1fOOo3aptoJGc/1BKoFrOdg=;
 b=sDzz3MHeWv6GGCDSKaRTUowWBbWV+C/xC2tiRjdWx73PSVTQCUZuwsUtHiCoW2AM3Q
 SVWVCiuaBeJFIbUqQE9Oe5r1dm1LxQsVY1QDYfwUGvwWDZqutf9gfjN2fUeYL4CLuOZ0
 HDMshiSy+GK7zvqKEXRmmx4/Ck7VEuHurVjZ03zrSkWt3EG/+NeyNMzbw9hNGYVkd/sV
 8+0DHenBxD5tehrA+r+vqgzoa9xlFMidCIJMrwo85Xyq6omvoEy9HVkSfnafWNw5t7+O
 WBH6u8kiXbjyv/HWdyyyzk0Jf+5bJfj7CUxx54Qa1z9zgbaiqoJNlR525cIinLyMh1vb
 XtzA==
X-Gm-Message-State: AOAM530dt+dxTeLLzUwhhrhFUNBI/eFb+/fs66vQrdJYGkrnrbmpvwrk
 t5IjDcnV3/zy3mUk8dkjRwe0kw==
X-Google-Smtp-Source: ABdhPJwlpXtEqdTlxz36TLSXvGU5G2gALqy4nfWzorlP3HkFCPY2GHb4j4GA2XlR2drJqWKWK5DkwA==
X-Received: by 2002:a63:c948:: with SMTP id y8mr4537817pgg.164.1601406346119; 
 Tue, 29 Sep 2020 12:05:46 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:05:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 10/68] target/riscv: rvv-1.0: check MSTATUS_VS when accessing
 vector csr registers
Date: Wed, 30 Sep 2020 03:03:45 +0800
Message-Id: <20200929190448.31116-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:05:49 -0000

From: Frank Chang <frank.chang@sifive.com>

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cf9718908e..21eeb4b791 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -56,6 +56,11 @@ static int fs(CPURISCVState *env, int csrno)
 static int vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return -1;
+        }
+#endif
         return 0;
     }
     return -1;
-- 
2.17.1


