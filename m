Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zP-0008DL-S3
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zL-00089U-DH
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:03 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zK-0007qp-1L
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:03 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso1566552pjs.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832921;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeC9UIsIrP9BmX3HUZg1DweVzMp1+h1saYBBS3xuZqw=;
 b=lQ2tp3kILmlPTHMwahAWnpfWpRafKzlpw1Rj2YOEEe83L9AESfb885bq54Rwj9quYj
 N/G8JptlUkqA0yZEl+kRm1hjlzy+7A5drlkYEUYKHQUXpei1RwnzbKrelNcW6nvo2jQ+
 AkWsde3xTn7v6U5BsLsffKY9PtN5QCzrWm+YFcQBSn98dLqMfZ2/Qr+v98SDg1g6DB6M
 u6DSgxnMYgk61afv0lfPGtpGPmrAHY3f7S5GMpOFu3r7NUxYC3pPZle1ZHH51gkAjaH4
 7FuaRXsvrmboGfxtq/OsOH/8DkobsfTABA+7a2iDJSH5GQ5DocfKRXA87SUEweAn3XY0
 w1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832921;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JeC9UIsIrP9BmX3HUZg1DweVzMp1+h1saYBBS3xuZqw=;
 b=UsKQIbA4YqlmJDL7qygO1G0T1kixdCXQlqhYCd+cMpmArf9MriJI46G+b5kGX96wqn
 7gqf/PpZoNXu4MTbgSxKQIAJYEVpKhV+rpBw/mzH0FtXhshjvtzzPBnbxm6J4td0T3cZ
 WX0freaa0Y93qbO00HKV5xi3xYtt+TFIbrzzfwsEna57U/lSy4xWeIGLB24mAcJRy2v6
 qVhXvd88IqcIz3viXF5d638vkZNt+RnhpCZD0QjTEeQQfYovmE3eoLYfeI0aFGJn0/9v
 ANjyQqKBdt/p+AIej5UUTR+PouumTeaXLAWqmZd1fsr6kgEr8V5X/l5pVKzCGmVubnob
 29cA==
X-Gm-Message-State: AO0yUKUNSxFR4xKSpDn+3H5rSYVuBCCxT2U4gK4IKzEgsAJzxrEuVvVz
 VEv0WbWFs9DRtGFWqQfDNARGaIxVYjRF3uix
X-Google-Smtp-Source: AK7set9qeJL5QOyz08Yxf06+pz88LeowsMEQXlwC5pyCjtacf/ud6VUCdKJUgQHqB5Wf94C1cqk3tw==
X-Received: by 2002:a17:90a:e7c3:b0:236:6dea:8795 with SMTP id
 kb3-20020a17090ae7c300b002366dea8795mr919973pjb.14.1677832920976; 
 Fri, 03 Mar 2023 00:42:00 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 z9-20020a63e109000000b004fbd91d9716sm990809pgh.15.2023.03.03.00.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:00 -0800 (PST)
Subject: [PULL 32/59] target/riscv: Simplify {read,
 write}_pmpcfg() a little bit
Date: Fri,  3 Mar 2023 00:37:13 -0800
Message-Id: <20230303083740.12817-33-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:04 -0000

From: Bin Meng <bmeng@tinylab.org>

Use the register index that has already been calculated in the
pmpcfg_csr_{read,write} call.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-9-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9264db6110..a3e0e5755c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3360,7 +3360,7 @@ static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
     if (!check_pmp_reg_index(env, reg_index)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    *val = pmpcfg_csr_read(env, csrno - CSR_PMPCFG0);
+    *val = pmpcfg_csr_read(env, reg_index);
     return RISCV_EXCP_NONE;
 }
 
@@ -3372,7 +3372,7 @@ static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
     if (!check_pmp_reg_index(env, reg_index)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    pmpcfg_csr_write(env, csrno - CSR_PMPCFG0, val);
+    pmpcfg_csr_write(env, reg_index, val);
     return RISCV_EXCP_NONE;
 }
 
-- 
2.39.2


