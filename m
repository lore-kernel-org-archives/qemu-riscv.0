Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3Qda-0001JE-3Z
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 19:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3QdF-00019U-08
 for qemu-riscv@nongnu.org; Mon, 20 Jun 2022 19:16:33 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd9-0006Rv-8S
 for qemu-riscv@nongnu.org; Mon, 20 Jun 2022 19:16:32 -0400
Received: by mail-pg1-x530.google.com with SMTP id g186so11511876pgc.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jun 2022 16:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Coe10arcSNSh6v0ONW+CYuFlpx0u3Gd+oWxcQc8xZzA=;
 b=Np3kcL6cV7EUNuNx+WThV96BPKe4f/D4ySKVwYgH2zXBWmzGHY8QeD9eYtar3cgDqu
 36zpnWR3Ke0q9+ARlR7swVAbBYtk0FPkpB210lp7A3/tOxo0FXNXPcK5DjayX+DwmoyC
 KWN9uazz60qvfyzuxpyrujUFo1YW0ERUiN1SSmD5ji95VJQZlllxT+4oIqplALsok95i
 iwXfdZJtG8lzfalkTrJmqMtUI/d8q+8oavnCIR9y62seNVTE316QjvbraNBoDOXJpvOx
 Xo8Tpe/U1M6DNNCE3V2MtbefhWD1+eAb5eReTUciuOqQMmmBnK7vvEku3zhvoCBny3Yy
 5jUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Coe10arcSNSh6v0ONW+CYuFlpx0u3Gd+oWxcQc8xZzA=;
 b=SP2XgXlZCF7P1qIGG1uXW+5ntxegZIY8ZED9gk96AI8ZRRT3gJ+nnatjd93TyjEesh
 +30M38PO489M+lcUUJspMSNlUy75j9m8KWjBUNwMHaliDKqxSPW1KdAYOuvQBHr4ngiC
 KFDWETJBhX5EoRCbOXwICFXteayxrizqMOlBUnhXIS2z8qJnjGRtWqdF4rUp2SOVPbZQ
 KDed7Fw1sZfK0hq+YRS4mxW28hMXUOYmpgAoMs7emr5b1vP5costsC79vHB/Cj/KeK7J
 8iMmHJL9RjwEDHpJpht3JSk13wlzoQAKhxIZsMCQqWEdeW+KpvJ+P+G9EFz2qGRE4ChW
 bgPA==
X-Gm-Message-State: AJIora+uSIeKOZDodXI6qKON750NXB5mWG6aTeUidcOkPUswiV2Km7A5
 +Ojb4GvmQx3uNEyJxbUCY7BeKw==
X-Google-Smtp-Source: AGRyM1sjzp9E0pH3bSWZTQnAbb5WZ7oDm17q0aO5Wb0LKQKe+Z8uJYqSooQaSXy9mic/6zWgTsdFtg==
X-Received: by 2002:a63:7741:0:b0:40c:c3cb:d9bd with SMTP id
 s62-20020a637741000000b0040cc3cbd9bdmr5833339pgc.581.1655766986532; 
 Mon, 20 Jun 2022 16:16:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902a40200b0015e8d4eb285sm9191008plq.207.2022.06.20.16.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 16:16:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
Subject: [PATCH v10 12/12] target/riscv: Update the privilege field for
 sscofpmf CSRs
Date: Mon, 20 Jun 2022 16:16:02 -0700
Message-Id: <20220620231603.2547260-13-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620231603.2547260-1-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 20 Jun 2022 23:16:33 -0000

The sscofpmf extension was ratified as a part of priv spec v1.12.
Mark the csr_ops accordingly.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9367e2af9b90..dabd531e0355 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -4002,63 +4002,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmevent },
 
     [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
     [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
@@ -4148,7 +4177,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmcounterh },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
                                                        write_mhpmcounterh },
-    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
+    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.25.1


