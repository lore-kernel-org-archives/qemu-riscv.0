Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvamr-0003m3-8T
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvami-0003fl-Lh
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:43 -0500
Received: from [2607:f8b0:4864:20::633] (port=33345
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvame-0006Do-0U
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:37 -0500
Received: by mail-pl1-x633.google.com with SMTP id y7so5793381plp.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/9cuH2hqcPY9RgmVdSjdzNibNXVCU/AslBgUVqA0KiE=;
 b=KEKsuCF//Ff+lJtR83mn+SRTGLrEN6rubAvZ3V3EFk250DeqhgRaBnWLYMTZFUADmJ
 LNskWx5D+XH6E8nqleJmSLKaEMbUehyDqV5VFTRb/lG7nJb9cxokBJ73CW30ft6Q/sWH
 dtCUt8dvTrnDLPluSjzITlf7tIDEdFdl9dvfrwKM5h+rsCzINTP4MMYs2ET68cznvf7g
 CPF7CtfUzoEYXh1opdA8A1ubXp3JxotkU3l9TIDBKLdk+klbNIEBqMWCtyjnxbFqfOkb
 jrCuIIR2Xwa0RvjdN5ox3n2xlMjl5ZLc30zGX1OXoNqL3OvcqlqeNq2IFE/uISWyIuGJ
 Uv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/9cuH2hqcPY9RgmVdSjdzNibNXVCU/AslBgUVqA0KiE=;
 b=6Cg+ZTRx19BS2h7hxYyzunLIqGKf0mErzWbgSPeL9XkUST8gDXRdKUTvR5HtUkliXj
 qSlTD8hxm8W+tj/JBIth95dtw1RaCtjaPZ6a3uajpj2FjT78RjzK6pjBFeSX82/IXAMu
 GP14s7ThlWPcL0PcDBpZo0qAxBdVxAz9Hr5Rdh0xymu2HCyy5u2b0ImZNTfdrXK7QEJe
 LItIjPa98Jij0/GuOXg9xfZng1Oujt2vJI0DMqS2iFeX0CFJFsY4W6Zz64Rium3NSx5M
 gvoYhY0+BBVZt1nstiA00rVMOAM1U2KJFKUBe6CiX2sdgvQZIy5Sn4UuWvSR4CQO8Pp8
 vb3g==
X-Gm-Message-State: AOAM532ysVaNqoZ9GgwDDzyYSoB6TpDz4UeaPb+mWgx+L3D796S2XSYf
 C7wd3W5ABkJMXz0n8B/m8lRxwQ==
X-Google-Smtp-Source: ABdhPJzYtuPA8oSgmGlwG9S5bVIclZc3BkrtC+bldziXWaWEYKpHrTLyPavchZTselI9AtrrpXqOwA==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr22025237pjb.36.1639123054828; 
 Thu, 09 Dec 2021 23:57:34 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:34 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 04/77] target/riscv: rvv-1.0: set mstatus.SD bit if
 mstatus.VS is dirty
Date: Fri, 10 Dec 2021 15:55:50 +0800
Message-Id: <20211210075704.23951-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:57:43 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9b5bd5d7b4..bb500afdeb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -502,6 +502,7 @@ static RISCVException read_mhartid(CPURISCVState *env, int csrno,
 static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
 {
     if ((status & MSTATUS_FS) == MSTATUS_FS ||
+        (status & MSTATUS_VS) == MSTATUS_VS ||
         (status & MSTATUS_XS) == MSTATUS_XS) {
         switch (xl) {
         case MXL_RV32:
-- 
2.31.1


