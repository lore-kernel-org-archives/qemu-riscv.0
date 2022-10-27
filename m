Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oo63U-00082u-Sp
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 12:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63J-00073P-Fn
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:28 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63D-0002PG-6N
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so1972911pjl.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Oct 2022 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qs0X8zxgyj3M+ThrhWzA5l1+0EjQf/1I4S4JsajyPOI=;
 b=eo9KncHjTiK2grvCzyv91erlxKz6R6qsV6kaBo61xPvTCVrWiGsjofvwYEG6wKDJcN
 +4Pac3UQwRgAR8Jp+/cd9s/cPErJ9oiCBm9HsirYNUIZqhXiEsw4zfmtVyH91P7w3DFO
 foWkJvQhShlX7/S5XAirshiwdK+xojewLu50czyPlFsePFls7uN1bipMxsAn1W58ibgh
 e1fS8pG3Vq45cjrjZcmPguHLCWwxXlU0yhaAFhPKtOyxmkFt0xeT+O9BrS6GZmSHFQT8
 m7HkXUGblYKeIOYCN1xxA/0u7AdesGhfTwoeRjdOnCf0KCBM9ctirnvgHmvKjnKnZWi0
 vROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qs0X8zxgyj3M+ThrhWzA5l1+0EjQf/1I4S4JsajyPOI=;
 b=7/xGA6HGvTchS/ER/8pny6WRGMcozf5WWONcwZh5h2S/Wrii5iXF1NSRJtrt1NlsLW
 5ssEb44vr4bCV7qs797vzpF1hnEqTe+x5RFRZLAvsRhE8xtPr5chit+YbJLuc5h5NwN9
 D9/OUVF8CdD8FlWhNOq+TXDDRb99OO1pDso/o55FYvRV0p/NpAmG+4im2OyZD1jyj5zO
 LrWSpE9bNpRMeV6rqlSHd/GUzZ+t94GbrewWSkGcOFvMaoMGZ/6AX3bmIaH5XDYMi7E5
 PoHOkWVSl85yiERgDpvJj7WOKYm1x9tqfbWeCSKlKzPjjqRlfHJh8dQydJIQcDBSLTie
 YxvA==
X-Gm-Message-State: ACrzQf0W38mjJi3UccA/sH+UCqfE6Rh41vVMo4Wm+M+XB22BEhOSkshN
 LmmED6yU0DA40sDXzezuMSk2uw==
X-Google-Smtp-Source: AMsMyM5dJKqlpdcGnrgJIQSxX/PUXVsyhVfg8IguBgqgDTNQCEOT0tOLdLN0ZsWrMh3iI3wDWxNuNA==
X-Received: by 2002:a17:90b:4d0d:b0:20d:6fc0:51 with SMTP id
 mw13-20020a17090b4d0d00b0020d6fc00051mr11000066pjb.10.1666889291345; 
 Thu, 27 Oct 2022 09:48:11 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a9bc800b00212e5fe09d7sm1212543pjw.10.2022.10.27.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 09:48:10 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/5] target/riscv: Update VS timer whenever htimedelta changes
Date: Thu, 27 Oct 2022 22:17:40 +0530
Message-Id: <20221027164743.194265-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027164743.194265-1-apatel@ventanamicro.com>
References: <20221027164743.194265-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 27 Oct 2022 16:48:28 -0000

The htimedelta[h] CSR has impact on the VS timer comparison so we
should call riscv_timer_write_timecmp() whenever htimedelta changes.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/csr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 716f9d960e..4b1a608260 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2722,6 +2722,8 @@ static RISCVException read_htimedelta(CPURISCVState *env, int csrno,
 static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -2731,6 +2733,12 @@ static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
     } else {
         env->htimedelta = val;
     }
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -2748,11 +2756,19 @@ static RISCVException read_htimedeltah(CPURISCVState *env, int csrno,
 static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
                                         target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
-- 
2.34.1


