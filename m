Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG34-0006pU-H3
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG30-0006aP-MC
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:54 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2q-0003Bf-JW
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:54 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y190so16335999pfg.7
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WVOEEziwaA11+l/Bdh2nU5ExXt0sCnB+f2iQ2wYW5GA=;
 b=noPYm+DcRJHwfDvf72IWWkXUoQ0B08S+h7O7K4pMuNu0rxGjTmhMi6HBTYK8wL7OO4
 Q4KJXrqcSlXm9kjSKrAby3Te+GA7jjORRUMX+MiLUMNxrr/pR6flgCwazP8V033u+Kzm
 M66kjfu2dwjLKljHBmhUjWD+kcizbvLcrFyxmrGxkFf6q1vt5sY9ENlcetYNnmhXni2Z
 Jw4aCXCiM3VVXjj1jvPQGMEqw5yKTSMxmWz8fOjHf35i0SFqClvVhkNh1dCIqBFYrYoK
 okBqOTTItgdBOsrf4CWHZXwlqWgRQRJwHaN2nIyAvx0pFlsj3CAljqDFdWDR5i3xrrPz
 liSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WVOEEziwaA11+l/Bdh2nU5ExXt0sCnB+f2iQ2wYW5GA=;
 b=nAD9Wre5lra8en4vTz1hwo8tdauQVklqfLe7L3QeA3DU9EjJmFyCi4AiD5QP7pm7F1
 gYcKkps1UpqJlguqNEbyw+/Igi/7Efd6zwMxlMNMr7OCkLeVZcltphst4dQQMEgEulAu
 S+a0jD3fei1ovvG1r8/pYMJY26HOxiQoV3Z3O3qUUalrvYfQUwU40rUqHX7aph2g/oCB
 MfqcHpW2oklIr4RH7Gl5Q9iQHg2g9nJ4yvI4WrXN06HR9XJ7l8zb/cR/2hQoIt7he/0f
 Y17u/L+4TwWcO2t5jjJSeQsyP/e4CieO1Fie2l2zbnDs0q0OpOgTIlAjkWiJsdGc/5jU
 FxLA==
X-Gm-Message-State: AOAM5305BbwF5PDvORmmajQv2nhPWLAE62jtD/6kQaeKtWQzuSTKpvEp
 iWtulUstfcw0N7XAt65u/jTxyg==
X-Google-Smtp-Source: ABdhPJw/sNXbarxAlbSq3Yj4DgjjRBWewHGysUpqLDDuq2if4hNf3E56PwX4cqcvCYOckzfoUKPdfQ==
X-Received: by 2002:a62:778e:0:b0:3ea:e8fe:d0c7 with SMTP id
 s136-20020a62778e000000b003eae8fed0c7mr19944657pfc.21.1629748543121; 
 Mon, 23 Aug 2021 12:55:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v5 17/24] target/riscv: Fix hgeie, hgeip
Date: Mon, 23 Aug 2021 12:55:22 -0700
Message-Id: <20210823195529.560295-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:55 -0000

We failed to write into *val for these read functions;
replace them with read_zero.  Only warn about unsupported
non-zero value when writing a non-zero value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d900f96dc1..905860dbb2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1124,17 +1124,12 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException read_hgeie(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
-{
-    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
-    return RISCV_EXCP_NONE;
-}
-
 static RISCVException write_hgeie(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+    if (val) {
+        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+    }
     return RISCV_EXCP_NONE;
 }
 
@@ -1165,17 +1160,12 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException read_hgeip(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
-{
-    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
-    return RISCV_EXCP_NONE;
-}
-
 static RISCVException write_hgeip(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+    if (val) {
+        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+    }
     return RISCV_EXCP_NONE;
 }
 
@@ -1599,10 +1589,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
     [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
     [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
-    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
+    [CSR_HGEIE]       = { "hgeie",       hmode,   read_zero,        write_hgeie       },
     [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
     [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
-    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,       write_hgeip       },
+    [CSR_HGEIP]       = { "hgeip",       hmode,   read_zero,        write_hgeip       },
     [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
     [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
     [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
-- 
2.25.1


