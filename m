Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z3-0007me-1l
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yw-0007HL-EZ
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:38 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yu-0007qD-La
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:38 -0500
Received: by mail-pl1-x62e.google.com with SMTP id z2so1941748plf.12
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832895;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1tBlsx7SnOxqiVplnbiuLiMigZbJDtgl1hLXrOTps5Q=;
 b=5GMOYEMJrPHNsg5BTtQj4VIyp1NPdGKTViUjTz/2NikgBMsWzZPMhdkHXj+sTQMmwQ
 /GSzc6PFJsIxkIgMO48mXiTlptHKK66tS3lbLjS/t2otwnqGua70dBSl/Wqkkrwcmpva
 yaIBY03iRbkNIlrLsHAnyQEXFaB6ECFCOjuIG0n9LYZlQqsgc2/+4eXmUWZUh3axeD2z
 y32HUmbmw0mSOc7bTQ7vMPoEs80Fbt4lHtDwZFH78VSBGmN5RV8TmOn4ZXFzyN9iPgib
 D9YqtjEKHEaPey8BcjacRTh2qXV1w+BNQ0upHv6Ms9b5oD/PXfz/qI/JcRzFnjkLye7N
 8cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832895;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1tBlsx7SnOxqiVplnbiuLiMigZbJDtgl1hLXrOTps5Q=;
 b=kFg71nO+HdBPAnewAiwsGBJDdlHStNbcxl0CY3+Kju334+TbNw6PYciTjH8LuVOKhH
 cvQMoQzdqfJ9qKidlS0b3rDl83HqUe4QG5wzOPmVj+erVJ34z9ZS/SWRTOQe19h2NHdR
 xr/4vS8JboHrsmNSH88Iwviwd11xjEIQZbJT5naVSqGqg63eRdtiOYe71FHeEbEv3cC3
 gcr+HijqNdYxibG4l3+WqRAWNubbCp3yDETOHgq+6lkGAJCvj5VU/p8b5lD36uta6XdD
 mSilaCnB0JVmf808fQSiHzOoXgwItRQMRmMMLba7llPwxg62cxGMAWo5Ywq266ZyU3zZ
 iDpw==
X-Gm-Message-State: AO0yUKWLdzI3TvvIm7Qo7+HlG6w3Sm1FfsZUFDoNH8xk5GSTp6IFZONs
 G+1IHaJDKEUVnS4zs5S1MuG+t9MgyxMNzowX
X-Google-Smtp-Source: AK7set+N9FUx5fvIb8Yj3bZZIRRD6af1TWZIWHSJQFNv3UdsBtwJw70LGTrpCSHGSC3aA7T1MA2A+A==
X-Received: by 2002:a17:903:2344:b0:19e:6e29:2a8c with SMTP id
 c4-20020a170903234400b0019e6e292a8cmr1529054plh.5.1677832894945; 
 Fri, 03 Mar 2023 00:41:34 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 x8-20020a1709027c0800b0019a7c890c5asm949271pll.263.2023.03.03.00.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:34 -0800 (PST)
Subject: [PULL 11/59] target/riscv: Fix the relationship between Zfhmin and Zfh
Date: Fri,  3 Mar 2023 00:36:52 -0800
Message-Id: <20230303083740.12817-12-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:38 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Zfhmin is part of Zfh, so Zfhmin will be enabled when Zfh is enabled.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-2-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 93b52b826c..a717f5d995 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -729,7 +729,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zfh) {
+        cpu->cfg.ext_zfhmin = true;
+    }
+
+    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
         error_setg(errp, "Zfh/Zfhmin extensions require F extension");
         return;
     }
-- 
2.39.2


