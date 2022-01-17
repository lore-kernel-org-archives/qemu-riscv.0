Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9SCB-0005le-E6
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:37:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SC9-0005fs-S9
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:37:13 -0500
Received: from [2607:f8b0:4864:20::22a] (port=40586
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SC8-0002Jk-DC
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:37:13 -0500
Received: by mail-oi1-x22a.google.com with SMTP id bx18so5006025oib.7
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VNASKJ00wlA5t2Q/k7jW+YzfMzGznROhiBSULHbWdaE=;
 b=SCzwUkuknW+XEzkQ1zQDs0aITub43r8AvcPW50VFojaBGQE4hq7TXxyZaMItwNRTK0
 adwDMcSJeSA4vxtVtNAbmLmezGimiKv3Bf4meER7a7Wsjj3l2ma2YVYwlcnYyBh9ofXl
 Uh30JqPaNWgizRKApUV24uJyEY0LGokRcQ1lxV1IAC1CPPXXtYC5AVrd6gy+yUnLnCqK
 teV4vschNMbIKZmzqTruEBadsdWJXpKAIL9Ocfdo5EmAqqvvxnbxNXht/r5/8fJJWe4t
 xm879iDekoSl3YY3f7K5yVMFYYRO/SdURQTDLeMfOwq8vD99aaSOYRUBQ/EjAN+ufrdu
 QFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VNASKJ00wlA5t2Q/k7jW+YzfMzGznROhiBSULHbWdaE=;
 b=djOmSRBcxj4B9mvHF93YGVDlCmjv5dBKPhyLNoZliW7KGEpUVla3N6aTO/0i7VnjXn
 ArqkEFWGXPb4u96qwl7ei1lEb7yaWHpL7Gj6tEwGr4b3q6+1b6m6YRSDlg2JOUV8EcrK
 DeNTm2kPoEu1Rnb4cPQVJzKNgF1Z2QoDs6jmexcTNGUDXRNrvup1AGvF2Hmy9pIfqoEP
 0GFYC7nZ3lp8tZW2oUUBfJ08C3XRiQXkLHBu3kPMbOHxOkNjb+Z0Obys/uuX0dllUAIq
 bEosgs0jtBlybUXg/09NYHwUu+y5R0r/cHmF7fqWh+VXX+vGuS12jVZCAuNtE8VXVACB
 0WsA==
X-Gm-Message-State: AOAM531WJqFRgpB6mRwp1099VSn6vGIkPpXuciedoFypbCX5JsHKUYXa
 R8XeCuCPBFcdJAvnxc9TS367DsieZykttg==
X-Google-Smtp-Source: ABdhPJz3pb82h61aj+IHXfBOJ4F39AELr/F25NjLCDG0q3990rBngRRMHQt6oGY4/TS4BF+DBOt44Q==
X-Received: by 2002:a17:90b:4f84:: with SMTP id
 qe4mr24829671pjb.211.1642426157792; 
 Mon, 17 Jan 2022 05:29:17 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:16 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 01/23] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Mon, 17 Jan 2022 18:58:04 +0530
Message-Id: <20220117132826.426418-2-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::22a;
 envelope-from=anup@brainfault.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 13:37:14 -0000

From: Anup Patel <anup.patel@wdc.com>

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index adb3d4381d..bee42b6073 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -182,7 +182,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-- 
2.25.1


