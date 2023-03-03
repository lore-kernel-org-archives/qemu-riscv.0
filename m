Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zU-0008LF-ED
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zP-0008B0-6h
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:07 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zN-00081P-KP
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:06 -0500
Received: by mail-pl1-x629.google.com with SMTP id h8so1955405plf.10
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832923;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVge5eYF4AHTDYM9NZKBwRnMkT36zpgg9PzKCyvzH58=;
 b=Ov3EgEHhU0h+WUBa1ESpFar3LeckmZHpndVV4bHbCJTzl8OlB6TcMimsq3U61RCZTx
 FkxvvwIypblqRLTO2ewkE5Q9EafgHXjkuHL0z1WTcaX21vj4WXpsmZfqPM9EZlVhbqZA
 4fhrzXQOcMW9jgFbCzzlpItJGFODUkMF1qKqniwXwPXa5GLjTdeEa63aa1FqjizYzqzA
 HwSFKokUmBKToic5j/LoV9hKaV8dWCmb1Ppsuz92UyBS45zxm4UvcUx4aMtMyEFzdYW+
 2+zgkGrEoGuRmgVWOZjU+W2XWIv3ySzR8wFj1tGRXLRm+lxlWpr8F/x6RRU2j2JoJrFi
 sQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832923;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xVge5eYF4AHTDYM9NZKBwRnMkT36zpgg9PzKCyvzH58=;
 b=VQbsWacWJE0eg19gVQuSB49UnnGLsA0f099r18Pg/ptPtg3JYJbPswCyLgSy1v618+
 8BUO+GsMtwFFC91OccDMns5ui7idlkZLBYBZc2M6f7R3yuaeROxZ7RZP61POFD04KQnA
 aqJFXozROIuJR9kysAxbVjjpNshN+MAxTye/vMeOM9U8X8b1utZd64bmwL0QbDvfsqF4
 mhJUvhc4BMxtPGbeHUOJO/A9VhVu/9BD62vfgj3pQHFe8UwgScP/YZT6+yUG0bTl3TIT
 wYxzdPuZMrTZDSdVGHdVdQW2wY3Ad3Mhz5xpN4F+Aa8iJ1j01c35P+F/MhuuT/g9afaZ
 5fhw==
X-Gm-Message-State: AO0yUKU3H1dVcIco3U92wnIVwXqeK7JeZH8GmIKzV30XRL4KupDHFPUx
 8xtd4uzsXaqgaHCHNoakBT9YKcYf2rV+ZyvM
X-Google-Smtp-Source: AK7set+Vq87ze9oHP7avO2IN8NCAvTCj1zx2H0ZBTateULcwANLS7DvdgJx+wUdARFNExFiDecTZIA==
X-Received: by 2002:a05:6a20:1e5a:b0:be:bc70:6810 with SMTP id
 cy26-20020a056a201e5a00b000bebc706810mr1198489pzb.5.1677832923444; 
 Fri, 03 Mar 2023 00:42:03 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 5-20020aa79205000000b00593ce7ebbaasm1018494pfo.184.2023.03.03.00.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:03 -0800 (PST)
Subject: [PULL 34/59] target/riscv: Avoid reporting odd-numbered pmpcfgX in
 the CSR XML for RV64
Date: Fri,  3 Mar 2023 00:37:15 -0800
Message-Id: <20230303083740.12817-35-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:07 -0000

From: Bin Meng <bmeng@tinylab.org>

At present the odd-numbered PMP configuration registers for RV64 are
reported in the CSR XML by QEMU gdbstub. However these registers do
not exist on RV64 so trying to access them from gdb results in 'E14'.

Move the pmpcfgX index check from the actual read/write routine to
the PMP CSR predicate() routine, so that non-existent pmpcfgX won't
be reported in the CSR XML for RV64.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-11-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8e827362cc..7284fd8a0d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -412,6 +412,15 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_cfg(env)->pmp) {
+        if (csrno <= CSR_PMPCFG3) {
+            uint32_t reg_index = csrno - CSR_PMPCFG0;
+
+            /* TODO: RV128 restriction check */
+            if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+        }
+
         return RISCV_EXCP_NONE;
     }
 
@@ -3331,23 +3340,11 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
-{
-    /* TODO: RV128 restriction check */
-    if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
-        return false;
-    }
-    return true;
-}
-
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
     uint32_t reg_index = csrno - CSR_PMPCFG0;
 
-    if (!check_pmp_reg_index(env, reg_index)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     *val = pmpcfg_csr_read(env, reg_index);
     return RISCV_EXCP_NONE;
 }
@@ -3357,9 +3354,6 @@ static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
 {
     uint32_t reg_index = csrno - CSR_PMPCFG0;
 
-    if (!check_pmp_reg_index(env, reg_index)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     pmpcfg_csr_write(env, reg_index, val);
     return RISCV_EXCP_NONE;
 }
-- 
2.39.2


