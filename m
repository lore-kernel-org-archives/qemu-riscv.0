Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTfv-0006jh-QU
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfu-0006hK-GL
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:18 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfp-0000ls-WD
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:17 -0500
Received: by mail-pg1-x52c.google.com with SMTP id b21so5397660pgk.7
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qE9r5ZjX6mwcZyVZNsOAbjPFyZpzWntWWeWkewrFtBY=;
 b=aVHGvImYMtJQDpTNiClZlg50dH4M/Y8iC5TxIHzzAGSb5dEj3LfMfINJhRzpJl7Q0B
 pe4TJKvWLwlOf4l8IlQAUul7oNiz+VZ+ZADorBpLXfLICnLKmmdABi431VnrwNBKjQ7w
 PVbtbCtK2yOQapZuMEW7IW9jwJy5YniESGuKeT5VUYKgOpYaIhrhPFfBzmZfWySq9UaK
 +JSrYFKfA73XG44FrylV2HDJ/izsZRfBPiJT4JwuXEn2/T2ICnGigFq2qmnsCe83MSlF
 9ku/v+eisgsYAOUNjTMNTxKEie4/EjIgElxJuWgGD3AjCn6APvUxPdpZxIBLW/mboQLo
 0oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qE9r5ZjX6mwcZyVZNsOAbjPFyZpzWntWWeWkewrFtBY=;
 b=GW2mLkhD4XaGJo+PIUDGXcAjfaIO/GgBh4z3k1223ulg23J4vz/x3hQl5Y4FoQRlRe
 sG427gtMO1bUOpdsBx+MLZac+4NKZYS1A+PkVWjuhApR9PbirhAOmI4PdK/F07fat7od
 hl0wvS93sVAOCDQeEw7ubwExdCiKKvBNgipuAOQlIL4XBchA68ix8dvWmBC6LoVtvw6p
 vt4m8o03SdUUzHWKEHf1yfHB8pqYh6ytmthsU0eKTDSd7PkM3TgIlRj10ntJ9u+LM4PB
 hgMRxlRrmtB0IzRPTkBMZ2KHLY+pDip9kjC1ppwJLdEVEzGa8Ge/DETOfk+ba6R8FFI3
 smmg==
X-Gm-Message-State: AOAM5304f362THhNc93B4n0A9moYwyNwfqqbzn46Bvp6hJqE32NxwsiC
 ZFmNFdOA7MZxezpkDy8o4Au+Vg==
X-Google-Smtp-Source: ABdhPJy8kZlBjVtBEWJmZFx8t6z0PJdTG25UE4oxiIiBZeifE38hWsUPiSexjk2ltznwiftmFysSyA==
X-Received: by 2002:a63:8c0b:: with SMTP id m11mr1007532pgd.306.1614309611361; 
 Thu, 25 Feb 2021 19:20:11 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:20:11 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 10/75] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Fri, 26 Feb 2021 11:17:54 +0800
Message-Id: <20210226031902.23656-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 26 Feb 2021 03:20:19 -0000

From: Frank Chang <frank.chang@sifive.com>

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 92cf2eedd40..a6a535f7e33 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -48,6 +48,11 @@ static int fs(CPURISCVState *env, int csrno)
 static int vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return -RISCV_EXCP_ILLEGAL_INST;
+        }
+#endif
         return 0;
     }
     return -RISCV_EXCP_ILLEGAL_INST;
-- 
2.17.1


