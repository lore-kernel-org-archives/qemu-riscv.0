Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7rU-0006b5-0K
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rS-0006Ys-Ke
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:54 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rR-00034U-4O
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:54 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 a4-20020a056830008400b0069432af1380so8727142oto.13
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qe/ggxZ5kkULljr/heGGR8TpE8MwTlFD99D/rf5EvYk=;
 b=WRW+IBUdpVhYLfkhGdb7q2UfNv0CampnYzPO+YhEonW4zfvBbrDJcmQrLzzfZSP76P
 WMJt9FkM8dvbAF1jl0KDjii6j6revy3EE02cRyhF6Xg4qTjrK/31oaWNPXizPEcxo0Gn
 fH3qdXstdLkbcw43Z92p/nEH1EJtLos5ezV0TqSU3QQUahsseUKRYArH1bclUK9Qostt
 UOEpkvQLOYpZnfViFhqNDZgBzKWvmAJDiBW6cV8PrORl1RHiJJtxT05w/fsO89kWYPQP
 TP6nEexvHQczE7FKvDUHaToGK2osNc7KaOxhxd7LPFs81YRufqZ45eZDPngUmTsGAU1r
 4StQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qe/ggxZ5kkULljr/heGGR8TpE8MwTlFD99D/rf5EvYk=;
 b=1DL0xlRewV6E7aEOmLapVIILjrDIYKDwvDH2+CYTnJ9/BUIbrl+C5QUaf8EN2/77QA
 BDEdHCQgtGDWcmEiLeatHxFc0KexfF/mm9PXpn5Tl4uXtJ+vxXiLQqftkk02pSCALHD9
 vEbfDcWjgFmjZrS5HUEW9bkJs7Iv+cX728HPxaECzHhYwRN6fYH7I8+MtT2+hhhCIRah
 hKz7tjLsKfmd1WJqSWRkPVRPotC/qtBusANCCZBTd5Pxk+Icioxp+f0T+Xt8gYAjmW59
 LT5XUSmviI9/QmLkY6TT3rw8S1Ckyb3tO+jyJbdAr1MMATu2MhSYG0o2v6qfc9c5SbPf
 Lhiw==
X-Gm-Message-State: AO0yUKV9lwHMeBjacTlL23Bgw6RgnlHbW91N2udBB4DjPEJOdpCkE6aC
 uWvNd5MgJPe1wPZrA/aSUoctSQ==
X-Google-Smtp-Source: AK7set/CP6Ry0b+6ZRysif+X8NYWPRIXJnEBrylv3SKUq+CJ+CTVUi1CKxAQ/TLSw2bVzrnxw7K7bA==
X-Received: by 2002:a05:6830:565:b0:694:88f5:f5ed with SMTP id
 f5-20020a056830056500b0069488f5f5edmr11705008otc.24.1678812652148; 
 Tue, 14 Mar 2023 09:50:52 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 19/26] target/riscv/cpu:c add misa_ext V-> D & F
 dependency
Date: Tue, 14 Mar 2023 13:49:41 -0300
Message-Id: <20230314164948.539135-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:54 -0000

We have a chained dependency in riscv_cpu_validate_set_extensions()
related to RVV. If RVV is set, we enable other extensions such as
Zve64d, Zve64f and Zve32f, and these depends on misa bits RVD and RVF.
Thus, we're making RVV depend on RVD and RVF.

Let's add this dependency in riscv_cpu_validate_misa_ext() to fail
earlier.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83b1b874ee..fa1954a850 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1060,6 +1060,20 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
         error_setg(errp, "D extension requires F extension");
         return;
     }
+
+    if (cpu->cfg.ext_v) {
+        /*
+         * V depends on Zve64d, which requires D. It also
+         * depends on Zve64f, which depends on Zve32f,
+         * which requires F.
+         *
+         * This means that V depends on both D and F.
+         */
+        if (!(cpu->cfg.ext_d && cpu->cfg.ext_f)) {
+            error_setg(errp, "V extension requires D and F extensions");
+            return;
+        }
+    }
 }
 
 static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
-- 
2.39.2


