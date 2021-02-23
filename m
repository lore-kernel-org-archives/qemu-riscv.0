Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lERfe-0000Sk-6m
	for mharc-qemu-riscv@gnu.org; Tue, 23 Feb 2021 01:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lERfc-0000SQ-O2
 for qemu-riscv@nongnu.org; Tue, 23 Feb 2021 01:59:44 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lERfa-0003bT-VT
 for qemu-riscv@nongnu.org; Tue, 23 Feb 2021 01:59:44 -0500
Received: by mail-pl1-x62f.google.com with SMTP id f8so9262175plg.5
 for <qemu-riscv@nongnu.org>; Mon, 22 Feb 2021 22:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=13vhUIocFQHQnO3QqjJ3UGcFtp1CW2yXBHweLGUr8I4=;
 b=miiP4kVnpTrjjFjScK8FRTEoOJ538XVP0PZyWZd4NZqc6fT+xn/TPvI2rXIyovFMSx
 6/gdzICYVb0qsFi/BtxPonFYQKIRte4R6rHa1/DH7fKc8gHzFINdwAhB3zCmQk0s1inW
 VINKZJ52z1+L+PUC3NQGNg+WJHoRobd0LqUo1t9ilnTEIZ06vvAGXrdU3qZvQAE3rd+d
 QL02xjqZhY7fJOIcFNvbMISSugIxZaK+EjPNfmD7NxldPiI2ofufw/HU7igAQTwUlqUi
 PC5htbPii01zv6SUQrKhpD20/Gt6v8JYdIiw1g+Goh/vNEq6h6AGN+EiYrcMKbRt6gTw
 3jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=13vhUIocFQHQnO3QqjJ3UGcFtp1CW2yXBHweLGUr8I4=;
 b=AxJ2fgTDPwzaxgqo63sEPZNXeqC4wddaQNQsPr3Gv8khaTmurxsh9l0KOQFNebyFNu
 SsOuiM66i8i/T1z0Lh1TUL4WrdR2yP/4SQRI6xw8NYWah9BIp1RCZsW8u/NkCF7WlLfq
 faBftSrM/Og/tM/okBYpC07rWCOGhij7srxJgpYvV4xIx0M11JfaQnpwLLnc+tSq3U/+
 bE/06qPVVPVRZNse96E9p8NNlwdPzh0JshyfbvHllW3CD89pA7K+FTjgi/78xwORxPs8
 teCS1i2ORSz6xKL2iuVe/+OIf/baO3XqVuw4vEL7C07uNYOt7+C+7fEX3uwwxDjgDCbs
 usIQ==
X-Gm-Message-State: AOAM531uTvfXdSRJLrJb5s4jXlmDne5Y4sGtTByCQYIAK3Oo2kDRAwIp
 rnPphqHuJvuOkAlFrdj/4/4bhg==
X-Google-Smtp-Source: ABdhPJyF6BixiB3P+7Qc1FWsSrdHwbMzSvFJ3a5+Jl6I5eOuHGeCzAoWZyVVBIgxiUcUbp7i0j9Exg==
X-Received: by 2002:a17:90a:4092:: with SMTP id
 l18mr27749782pjg.39.1614063580995; 
 Mon, 22 Feb 2021 22:59:40 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id s18sm20165714pfm.129.2021.02.22.22.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:59:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH] target/riscv: fix vs() to return proper error code
Date: Tue, 23 Feb 2021 14:59:32 +0800
Message-Id: <20210223065935.20208-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Tue, 23 Feb 2021 06:59:44 -0000

From: Frank Chang <frank.chang@sifive.com>

vs() should return -RISCV_EXCP_ILLEGAL_INST instead of -1 if rvv feature
is not enabled.

If -1 is returned, exception will be raised and cs->exception_index will
be set to the negative return value. The exception will then be treated
as an instruction access fault instead of illegal instruction fault.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd2e6363f39..d2ae73e4a08 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -54,7 +54,7 @@ static int vs(CPURISCVState *env, int csrno)
     if (env->misa & RVV) {
         return 0;
     }
-    return -1;
+    return -RISCV_EXCP_ILLEGAL_INST;
 }
 
 static int ctr(CPURISCVState *env, int csrno)
-- 
2.17.1


