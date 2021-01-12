Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGAI-00030W-Hi
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAE-0002q2-TL
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:34 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAC-00072p-Bk
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:34 -0500
Received: by mail-pj1-x1034.google.com with SMTP id y12so1258502pji.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=61QjiXctXo3yAQHEh2TCH6xcwkb0TI5rB/BMZKpqTiw=;
 b=j6bjerPReAcZga2zlDbIeOBxL/vr/kMaQVr7Z6XI7TRCLvJks3ogW2h0pQSRh9M9Jq
 zJLURRvn9Tmt8M6pSDWIwJA2VTE1Az7tSKt/DPnTlhdusjw32fW3TFFbqp7zq9TljReb
 VlX1dUE81fY95JaCZupOsGHrT6P0slUVhOtGEcNdjOysIdfCDUzAShRGccPiUFh6iyXn
 s+t+acVlx24zQzoZ02Bo8elCo5wZED2uOGszRH/NCXsidtwVCsABraJeaya9xXptQBk2
 PCWPkD+rBXXB/goaEJLuq322nz2+P3gWDOGgFK682DfBYl0cJklyfOw1JJXBgXmbZH+b
 Xqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=61QjiXctXo3yAQHEh2TCH6xcwkb0TI5rB/BMZKpqTiw=;
 b=fHaMnk8nneXhBFrcTmcMT8YFpMfoAOltJBs/QGRYhN+jtrkCDDD94yUn0bu7NkVD2W
 CcgWLe1Vmb4L397D0GZUAmDeHV/LDnXvxdN66KBKpYfcTLTuAJewp2/PjBe6frVDW6Ni
 NZHBS/PyyoBrXGwS/bVySD/r823u6U6r+pIv/iERh1mwr9j5j7r6F/TVYDCrMMotiaKH
 DtQ0JwXYXKChRTxX+tAuJShaeCUjT00Z0x9inOjnh60fWCyyKxU3rchg1FniyLkl0Or5
 cnMv6q+DqTqZ8wopNn5byEnOlnse4CZhEJmd0vm28hCl1E0sm6DAfTaAE7MuJLDueOep
 dWAQ==
X-Gm-Message-State: AOAM530Cgrwwj8vJv9LvbeP4boeInqcYpiYzkgiaNl877TqDhDjM6av8
 H81g+gIDkbt6UxdO1Val3HzIgw==
X-Google-Smtp-Source: ABdhPJxNpazOK/YJxDXXZP5nJj3qeLQ5bEBmBP1zAAy9YpV3msSPUM4X/rizuBtn5f/T4sSFklaLrg==
X-Received: by 2002:a17:902:ff0a:b029:de:1d1f:8558 with SMTP id
 f10-20020a170902ff0ab02900de1d1f8558mr1769672plj.85.1610444425969; 
 Tue, 12 Jan 2021 01:40:25 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 07/72] target/riscv: rvv-1.0: remove rvv related codes from
 fcsr registers
Date: Tue, 12 Jan 2021 17:38:41 +0800
Message-Id: <20210112093950.17530-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:40:35 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove VXRM and VXSAT fields from FCSR register as they are only
  presented in VCSR register.
* Remove RVV loose check in fs() predicate function.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c8b1e4954ec..6eda5bacb7c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -46,10 +46,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static int fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    /* loose check condition for fcsr in vector extension */
-    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
-        return 0;
-    }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
@@ -254,10 +250,6 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 #endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >= 0) {
-        *val |= (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return 0;
 }
 
@@ -268,13 +260,8 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
     env->mstatus |= MSTATUS_FS;
-    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-    if (vs(env, csrno) >= 0) {
-        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
-        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
-    }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return 0;
 }
-- 
2.17.1


