Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNkE-0004wl-BK
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkB-0004pv-7k
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:00:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:47088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNk8-0004ag-QY
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:00:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id p18so3106554plf.13
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbSDlUb46Zy7F0MfwTJOq6CpMFSbzyMialZNGzKfRZA=;
 b=Qdm75kGzIMkLKpMQjrBMp2pS7weArQc3v4fXSBjtnR68VwDb1l0XoUh1De/z/XfFt1
 33s1nJVHg8g6Mfdhi3dMkGX7a0zVx02a+f0O1LEVUKZvesbCYHEPrADsBXUXfUIlCr/5
 9oithM42Hx40t2GBiFKDIGBjcJ+e6kPL9324+CGTaxfZxKcQfLTFZPano2I/8df702mk
 MjTe/GGNWgJ/GxA4ZF+qTNmLP1wLNzzbUHlZ68y7tZ5yTcV+Q/MLtTy6mrmrEy5/xpIX
 gsi/vdc8uQSCAFcdEJqL0cEEnTHRCG24HsyWy9WG12AF2j+DmdImmCAyN1Qs0R+0TFpU
 H/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbSDlUb46Zy7F0MfwTJOq6CpMFSbzyMialZNGzKfRZA=;
 b=osEFXnUn0TJxwx7yJQGpJTe7094SaBD9Tp8DbRRam6sgM6LmIjNvkce5wbSJt5zoYg
 gzuzwqMM/axNnTSZrJVcd57w83zJItQZlkVQg5dutwPI0VFCsD1cTYoVAAn4vNVJ6tGa
 fowFC7SQTVDR9DWA5ywbpt9Rix2vtKmSoSAVGA9s9DLFtPYHuo35zxRBcyU2LmBc6y6Z
 nO+d2B9AemhB7/OTkUbWpWv3wSwhLU2hqHahQMOHCF9ndQ6oUqU8NTCwb8TuTL/1jajW
 MXnQCG7akEqCuBh6D0nbztQZn3aJSBSNdJ25fqPRnxGjXZYbhAerIcmy6E+E+Y/1bo6V
 TjaQ==
X-Gm-Message-State: AOAM532xDz137WUHWoc+A8y6x4wsdC/x9Kv/UrzFuh55TRzXarLys558
 HiwXPtz/azPHDRucGKT+kHWKhg==
X-Google-Smtp-Source: ABdhPJzFcXOU8/pHE5w3GQ44AbjQ/LJxmPx9vuM2Euqip89KJsgh3FyzZ5OjmcKvyKQDrFhQ/U0MUQ==
X-Received: by 2002:a17:90b:2246:: with SMTP id
 hk6mr18757624pjb.116.1635498005462; 
 Fri, 29 Oct 2021 02:00:05 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:00:05 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 10/76] target/riscv: rvv-1.0: add vlenb register
Date: Fri, 29 Oct 2021 16:58:15 +0800
Message-Id: <20211029085922.255197-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:00:12 -0000

From: Greentime Hu <greentime.hu@sifive.com>

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8dc6aa62c64..1e31f4d35f5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -63,6 +63,7 @@
 #define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
+#define CSR_VLENB           0xc22
 
 /* VCSR fields */
 #define VCSR_VXSAT_SHIFT    0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 832ccdcf331..5d1eec1ea05 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -285,6 +285,12 @@ static RISCVException read_vl(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env_archcpu(env)->cfg.vlen >> 3;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_vxrm(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -1835,6 +1841,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
+    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
     /* User Timers and Counters */
     [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
-- 
2.25.1


