Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zZ-0008Os-LX
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zU-0008Kl-8e
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:12 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zS-0007qA-Ng
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:12 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u5so1974089plq.7
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832929;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aE/CF2t05zhOlTcgA6pdglWjLf3mWNbikxW4FBHcrTU=;
 b=gERCMg1jtI6Uns9QUZaIb+5c8QyHueede6Sv9kRyve/gUf63rc/vHhkk7Yoi+jwVhB
 ZXtORWW/FZdSuwh+RLjQsYWRKpWNilqL8oUFWDpj0XaEfP6xZPNEcyzT7uQZKtXeR+H9
 WSXVkP7RxNphoQUEoSv0KlbnvyPyS/T71T6G3Z7HlAJqa+6W169bJUFHtt/KNcveK9yI
 tAmGcBqewQfnUY71gM4MrspoE+4emklhFOtBKlDHbLwhO0/kD7pNg9UD6DrHUJdaoe7v
 YMwAm+oJwDHQvkASb4H++Mz9TRrPr1afzYQwGTQOOBQr+JU7fds3PY85n+GH/tvYAemH
 PQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832929;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aE/CF2t05zhOlTcgA6pdglWjLf3mWNbikxW4FBHcrTU=;
 b=cFGYki0eM8i2W27N6r6jQ6t/Dj7lcUR34qgnn9uYV7XHkzDKh+1dzipIFO1ajqBD1v
 jvs8lBi5LVCv3NsaBnBr2ZqQaHOx2fc+xpqo591+6F7GTeKRiTbJdDB8ZI24ZwV6xMwc
 VU5/Y+RYkLdZ+ol9X14Me+dBr8pMUCR5qxyTmpS2sd72/C3RN+oczu1Z5eImJR0flcL2
 KaRrbtC6ZZ2j5/Q9EergGcLHhKwrQthd1g3WWTmr38SFZM9Ll4WamB9h37aW1HsRxWEH
 qnO80Oc1BIGScaF9v8z96nbh4r2558eqgZZQLoG1yfU7iRbUzoeo7J3dGQX1NwWj14jN
 TOHA==
X-Gm-Message-State: AO0yUKVWvSPCL/O3NqpsxCyRzjuQ3+xHiNcLPrucoPQqyE8GtB1K14L/
 niPLs+IFeqLAtO/+HPUvUc4QlsKPSRREnIEY
X-Google-Smtp-Source: AK7set8s3EUVXFdmEyaqAd9enpocrY6KYbEfO78PxU1Nm9tCmhPtwK4CJDlfD/o5K5Iyyvth8waqtQ==
X-Received: by 2002:a17:902:db0f:b0:19e:7a2d:19f2 with SMTP id
 m15-20020a170902db0f00b0019e7a2d19f2mr1747928plx.19.1677832929621; 
 Fri, 03 Mar 2023 00:42:09 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kb8-20020a170903338800b00194d14d8e54sm978032plb.96.2023.03.03.00.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:09 -0800 (PST)
Subject: [PULL 39/59] target/riscv: Allow debugger to access {h, s}stateen CSRs
Date: Fri,  3 Mar 2023 00:37:20 -0800
Message-Id: <20230303083740.12817-40-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:12 -0000

From: Bin Meng <bmeng@tinylab.org>

At present {h,s}stateen CSRs are not reported in the CSR XML
hence gdb cannot access them.

Fix it by adjusting their predicate() routine logic so that the
static config check comes before the run-time check, as well as
adding a debugger check.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230228104035.1879882-16-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 15b23b9b5a..a0e70f5ba0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -337,13 +337,22 @@ static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    RISCVException ret = hmode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv < PRV_M) {
         if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEEN)) {
             return RISCV_EXCP_ILLEGAL_INST;
         }
     }
 
-    return hmode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 static RISCVException hstateen(CPURISCVState *env, int csrno)
@@ -366,6 +375,15 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    RISCVException ret = smode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv < PRV_M) {
         if (!(env->mstateen[index] & SMSTATEEN_STATEEN)) {
             return RISCV_EXCP_ILLEGAL_INST;
@@ -378,7 +396,7 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
         }
     }
 
-    return smode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 /* Checks if PointerMasking registers could be accessed */
-- 
2.39.2


