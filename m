Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7aqa-0005sf-JG
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqZ-0005qh-Rd
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:27 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqX-0004qf-Vn
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id mt12so7482264pjb.4
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QP1ruXw5l6C+lj6ysQ0KAHvQ+wLxEkpUq7+eUbeJMsI=;
 b=cYMBm1XF+8oCl+njAO0gF0KaA+BSWosAE8XskcjMcs02bek9ld2dz/0TXT2oYJHG/K
 Y7tcA4ny057/Us391mIXWfdDddgHNRYP6OW7WWAS46/Q6yXgtQ2YsDoVtipzzsMZ4pG4
 yQEa+ZBsYq5uAjxWx+7iLOQkyLJyDUO+zNpPWq1hsO+uqkesqczb1feKmGnoG6iLi7sf
 QUzG6q/3g9+a6788xh5g82nGN8A8C7YERLrpSPMwFhSnrT4Gn3qlZPV7asZ1tobJmyzf
 tUlPnh4h3p18MtSrDyQhUDxIC/Km5h3wRsTf3vCuD/iQKVksjr9FKde6k58XRaQYWQwu
 dn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QP1ruXw5l6C+lj6ysQ0KAHvQ+wLxEkpUq7+eUbeJMsI=;
 b=CjsDqnC8wCOR6eRoVK0Pa/UsdKrLn/WsVnOimVJfSdNpPZKccjyr/GZuPum3vET9yF
 L7mudkEe2hco31qdZecNf1pzmRElKcZUG2mMz/n0ZeOWOJMkyY9RRpF6pruHurn5SGfH
 Yj69X1qu8j8v455kDUCDC9zulIhMgN0skh2Nn+pfnv4rYOesWBPlP/iSry+Ig1VPc3n1
 lDA+mALkBtzIQH/uNP/GMiLQPn8lpf9m1jOsal5lg4yJ4btTsf5MjSt620HeD3GXNoI+
 K6gQzkHWXEhPCqbRs8pNNcZz9YXvwta67/KjtuFY1q07ZF1WtlTfdv7XNbo8ykrqr3Li
 cFmg==
X-Gm-Message-State: AOAM5300el68vYgU4Uy91ywIWhEIcFYLrmpOStQjluq2JOLaHapURxiT
 QACQ6Q+cg19a1l9TD2KJOrA3uTWTu+qufw==
X-Google-Smtp-Source: ABdhPJxTq+/bbwaF8pjFfuPLn3gWJvCyxpwy0bTRTjzIB/sAqyGU8OLeDM7e0iRn3n8HFe6HZjsBXQ==
X-Received: by 2002:a17:902:d346:: with SMTP id
 l6mr9778783plk.77.1597654224698; 
 Mon, 17 Aug 2020 01:50:24 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:50:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 07/70] target/riscv: rvv-1.0: remove rvv related codes from
 fcsr registers
Date: Mon, 17 Aug 2020 16:48:52 +0800
Message-Id: <20200817084955.28793-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:50:28 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove VXRM and VXSAT fields from FCSR register as they are only
  presented in VCSR register.
* Remove RVV loose check in fs() predicate function.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7f937e5b9c8..005839390a1 100644
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
         return -1;
     }
@@ -166,10 +162,6 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 #endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >= 0) {
-        *val |= (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return 0;
 }
 
@@ -180,13 +172,8 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
         return -1;
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


