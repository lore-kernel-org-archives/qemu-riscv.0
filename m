Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zk-0000K3-G9
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zW-0008Ni-Bt
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:14 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zU-000815-Dp
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:13 -0500
Received: by mail-pl1-x635.google.com with SMTP id h8so1955644plf.10
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832931;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6fyKisPdjjsilTntlaBwsWAkLGaTDh+b2bnlD1SK5I=;
 b=2c/B/xXbeDjVkEFRtJUhMazvt2HWeMfzrAuYb9BGrjAwNeQQRTPQ6yhf9UuhiaZgm1
 ywQ4OsQx/hBgQsM0ij1hWaYFzlNxEvKsnBUVaxsD58ljAV6ZyQscuUc9UN3RIamHLK2i
 v5XfiHwLiOqUvJAk2kaBWPlPxHSpW685G/WidwJsh4W4sXexL3Sh7a8O0J0EprFNa4zJ
 eobGitIrhZspi94kL0RvUAnMqilAyq3mPbZcmboFhTq5522ynB0YCSAjMrVAnHoRhAVK
 jYvWGK6kiNI+KdDU42IEsNo5Ey39TuuyOwPb54GVqPRW0d0t4pRbm8E0Xa/ShRRz//R6
 54Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832931;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6fyKisPdjjsilTntlaBwsWAkLGaTDh+b2bnlD1SK5I=;
 b=Ic/LShT2QaWRRLJO52jZVKyj+tqOAEdfNL/UQGP6unpg/PY+xJ6wceJLKWmpFSyU7A
 OzuO3tLMQHKQnNCbYqmK+aZrJBGB4khoSoIzgF1ufsDfSil8pPWOFJbIfNNa0czqqriF
 /s1bDH01n2GuDpmZYwXnWcavtUxGMCVjRGDkYChcgOnL+2+WGhWGTwk3A9xVmrOuMQt2
 hwbbLMfeMobF72kHroFRpdr5eq60o8PaMIPAhiiadTeR5Kumm+JwXqw1Cw8jvQeOfrvi
 LGs4JlPMr+D7IGgG0AC5AI7bgzJRIBMBTYcCBw8E6E4lWrWGuEHiVG9dxE2CBX78Pa2P
 Olng==
X-Gm-Message-State: AO0yUKWr7bUooGOY3NZwVMsldawMzvTH4kWrETwEIxzeLveBH1S57hOQ
 XWAqApkEScA9ZsYUjo8R+U4viwi32bOdo32e
X-Google-Smtp-Source: AK7set+Tk4Fz9yLdiHMWciN4CxZbTktjDwfcyN1W1+inW8EeuBaJJO623cTOk+eouH5nwLroOkg80w==
X-Received: by 2002:a05:6a20:394b:b0:b8:c6ec:a269 with SMTP id
 r11-20020a056a20394b00b000b8c6eca269mr1696566pzg.16.1677832931244; 
 Fri, 03 Mar 2023 00:42:11 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 s26-20020a63215a000000b005034a57b963sm957276pgm.58.2023.03.03.00.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:10 -0800 (PST)
Subject: [PULL 40/59] target/riscv: Allow debugger to access sstc CSRs
Date: Fri,  3 Mar 2023 00:37:21 -0800
Message-Id: <20230303083740.12817-41-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:14 -0000

From: Bin Meng <bmeng@tinylab.org>

At present with a debugger attached sstc CSRs can only be accssed
when CPU is in M-mode, or configured correctly.

Fix it by adjusting their predicate() routine logic so that the
static config check comes before the run-time check, as well as
adding a debugger check.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230228104035.1879882-17-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a0e70f5ba0..020c3f524f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -952,6 +952,19 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
+        hmode_check = true;
+    }
+
+    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv == PRV_M) {
         return RISCV_EXCP_NONE;
     }
@@ -972,11 +985,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         }
     }
 
-    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
-        hmode_check = true;
-    }
-
-    return hmode_check ? hmode(env, csrno) : smode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 static RISCVException sstc_32(CPURISCVState *env, int csrno)
-- 
2.39.2


