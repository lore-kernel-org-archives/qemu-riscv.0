Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nLDaC-0000Jd-RC
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 19:26:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDa9-0000Ap-Mp
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:37 -0500
Received: from [2607:f8b0:4864:20::22f] (port=40466
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZa-00074T-M2
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:37 -0500
Received: by mail-oi1-x22f.google.com with SMTP id j2so4850668oie.7
 for <qemu-riscv@nongnu.org>; Fri, 18 Feb 2022 16:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHtOSlW+q4ldIGhJQUojZOnmiCi7R1G58paQji8X2pA=;
 b=JdoHLMUTLY8GS5hK7OmCL46NOrH2EWPH44rBF/H+XmUH1rUwynyzZryS/jRandSVd7
 Bwc2/SXkAatc+Bk8t4mdWNqMU8ylnOJ62W8rkdfATZWF6Lh2547UNOyWphx+0/gAAQul
 Lcx0GZQuWwwqTPEWtwoG+3exvQmxJKL3Ms9yF5ruwwo1CBCeH++wUZiNfRoaNbzak4Q/
 vcyMduCWXMi2Pr1xYyeneQ8IwkO3Db55qdAv1/7TkIWBE0r4MeBVCuQxKPoCGOvojUQe
 XMcJ0dyaSi6ZK1VIOH2f+SudtrGfShMAwS7myX1vRVOgFVLECdRkCelVDYjc200FKMhc
 boyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHtOSlW+q4ldIGhJQUojZOnmiCi7R1G58paQji8X2pA=;
 b=wPbuP2R+e5nUW3CD8/pHRILMygQkVjPzpOZtoe0vLykMwPHeIVnuSQ4RYcLNc3k34+
 yMURfiPm+5q2vSeWlCd4df6Rh2yRnixdttvPt1DfwrHYrQuOBJQ2vohSBiWHYq6NVHEd
 0w7cuywtbYMhW4mGHT9aRQ06KD3OJhjN+BuU6nvtRGL4lJy5KKlf2W/GEFN16Vzap5bJ
 x9E2y79NVQvUfuCg7cktAaNu8eNNVGy7qJPDzEIHSul5lI/zX061pPWS2bJQj36dKvus
 azQ4Yp7gWvhk1SA7Jl5M4jOaSFhnwvKmvTSDzhAqnVPFSTeT9phIlGrCfgJF778nnbhy
 seFg==
X-Gm-Message-State: AOAM532AjVlIOSn9p/UY7cbXoH1quuJ2opkzKnIKbmyhZ1xWVPvJdAtY
 9MSe86CAAcWQ3xfd/v3boyUryw==
X-Google-Smtp-Source: ABdhPJwB5bDNAOL7dtiEjaujweHTDJaQb5BD3s5+Y40xn/Rs87eiKOhmSqBlwmqtLZJg+HcvHhfyQA==
X-Received: by 2002:a05:6808:2082:b0:2ce:9b15:acc6 with SMTP id
 s2-20020a056808208200b002ce9b15acc6mr4495823oiw.316.1645230350823; 
 Fri, 18 Feb 2022 16:25:50 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 12/12] target/riscv: Update the privilege field for
 sscofpmf CSRs
Date: Fri, 18 Feb 2022 16:25:18 -0800
Message-Id: <20220219002518.1936806-13-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 19 Feb 2022 00:26:38 -0000

The sscofpmf extension was ratified as a part of priv spec v1.12.
Mark the csr_ops accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 54966a770672..0407ff12b445 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3786,63 +3786,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -3932,7 +3961,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmcounterh },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
                                                        write_mhpmcounterh },
-    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
+    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.30.2


