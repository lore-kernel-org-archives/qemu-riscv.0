Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7aqp-0006aE-Fy
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqm-0006Q8-Dn
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:40 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqh-0004v5-34
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:40 -0400
Received: by mail-pl1-x62e.google.com with SMTP id f5so7156354plr.9
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AQZx9YbV8nCQY8I5II6BVIu2nX25I8qFRmz3CCFuRpo=;
 b=XTtfh/wxroJgHOBZDSUokB50RLPSUpwR6ywS1/GJ3DYiEoNnBwUIUOqiItqCrLVYKP
 OOyL/8n0aGIIuQj0aq9M/wAJ7yRmKXrUSra1BMCo8YU6ucu8QAUS64pTlR3kHFdJtHoQ
 zjNMUA3wxCVK2+8Tl9XmJamV8xNO4ZES5mH+JUtYWTmSUp78+uH0WfV5kerp/xPTB7Ru
 iZ89wAfJfFv1cG20ymmtfdk0jZepnoTVtJDi/AbiWQLbd9GI9sghu2bSKpJd6sdfB2pl
 cr4P/zzOXtxp7h3aiL0s0FMcvvmUsNHMK0NVCd2QfLWZjfdVnGXs+XlUtc8y7wzEaYkQ
 Nxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AQZx9YbV8nCQY8I5II6BVIu2nX25I8qFRmz3CCFuRpo=;
 b=MTCQk2RiIBLXltRagwrNdqXw5zbizNBh91fj8rz1Zxz3LmcRAYVpnMLkFWEYoSwm0J
 r3niuTmmc6sACkfHOS8APq2ujKD4o9TJsucidgb/Xv6womkgttWkfynaENHFMKffXGze
 IS6HiBijux9zQKN0uGXcaEdvxtLB7WaO4l4p0C8Vz739k91uogkaIl1FpL/S9m0daQrj
 h935SrYDSjTYStE2mhqOszptJpJvK/UFMMFWQFZvOgd1RXk9uMNYGHyTB27a6ft8JIfT
 RY3ARcohohPQ4/8q5xqinXYAEBSpkdNtHEQw8K/4Fr5+d8mFbtJLQXppqhnsJZx+DOAX
 dzgw==
X-Gm-Message-State: AOAM530UgjOAh5HIJt41tE2ibCiJS0Pc/5a0zGB8alk+yrDBKSEnT5Sy
 i6IuQwq6wG5Ni6fpy8Q4XhRTzCOWUhGZmQ==
X-Google-Smtp-Source: ABdhPJw4mkAGUeVFxTATUV+fXhN4e0n+dj1wSFDNzoV5MrJwyB83+Xgoes4YgsvWcZT0JSqGh2DAFQ==
X-Received: by 2002:a17:90a:1f8c:: with SMTP id
 x12mr11834765pja.186.1597654233777; 
 Mon, 17 Aug 2020 01:50:33 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:50:33 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 10/70] target/riscv: rvv-1.0: check MSTATUS_VS when accessing
 vector csr registers
Date: Mon, 17 Aug 2020 16:48:55 +0800
Message-Id: <20200817084955.28793-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:50:40 -0000

From: Frank Chang <frank.chang@sifive.com>

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6379718e1b6..ed8f6e175f4 100644
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


