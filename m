Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pX0J3-0001Qq-V2
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 08:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Il-00013L-EV; Tue, 28 Feb 2023 08:45:55 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Ij-00033w-4y; Tue, 28 Feb 2023 08:45:54 -0500
Received: by mail-pl1-x633.google.com with SMTP id z2so10432876plf.12;
 Tue, 28 Feb 2023 05:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXpahm61NdsjIRSTpCN3GHFbnIivzdv2HgYB2NsPiRg=;
 b=OsNbmKLFCXctTvgAg1n1W+FpXZDqTn7F2cNHetBUK1Tnpc7UVCmCgOBn3ef8oheS1h
 kU0eWlQdFc3mgFTpvTH8G71GaNavbfj2Mlj/vIL3md/v6fEhVv7LOUMeL467YzWh9p6Y
 rOxsmIZW0MrdxamVsfPiedrQdlSbCLM5nR7GD+ht4dMi8F7SxYAz8c311R5QQKObbZm3
 /oT7yV1/H+qq+Oqz4teYZrByOsErRKhHcmMcK/qBk6TTS7nYS7Au69kP8kG2pgyyVj12
 +0ul9kGRuB3xEsqH7VwzDUCpLy8KxlwbKD+yvRGdmV1nbdqCy9tjCQv6l8CS+NKMRbm6
 J+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NXpahm61NdsjIRSTpCN3GHFbnIivzdv2HgYB2NsPiRg=;
 b=xQ0lOF1Bxn+vmKhrI7JY/EMSqmNFBu7dQnYBvNORyxYjKI83MTBHaiehd7ck7IMDfx
 7IJyCk06IZfBIdRpusELB5K42h2KPShH6PO3kihsURP/kS8fySpwpolZRE281onWvGQp
 7E9EeXz+VjOExriWOjvW6rv460inm6Ciy9l1URs8SyhJm/UbJYbA2VmjqQXV+OgXWTF8
 jfRkdaQImTONhjpqojlW2exWodPAUT4UFtlth1dU1SrAwgWkys/KJWWtmuJyGVVk0sAV
 +EcWQhRF/fkN2knjA3upopIOcDDfJhSg15Ona0s2qjGFVSjs5iQMCUJjyPqGUyH0hi8w
 cA9A==
X-Gm-Message-State: AO0yUKVZOeoHsjDRDh3juWBsKtwwGlu3n1wEIdEUlNVkrJWocRr4Lyq8
 iFO6aI/OnfavlYycaRACEu8IbohffGs=
X-Google-Smtp-Source: AK7set9Cmcyl5eTode/MaO321bQg0h6cyny506paWWac6xGjJH3bcmPlQyPnOmMQovHfIMEOxrAbeQ==
X-Received: by 2002:a17:903:32d0:b0:199:4a00:9788 with SMTP id
 i16-20020a17090332d000b001994a009788mr3311717plr.19.1677591951280; 
 Tue, 28 Feb 2023 05:45:51 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b0019b06263bcasm1556896pll.247.2023.02.28.05.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 05:45:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 15/18] target/riscv: Allow debugger to access {h,
 s}stateen CSRs
Date: Tue, 28 Feb 2023 21:45:32 +0800
Message-Id: <20230228104035.1879882-16-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-13-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 28 Feb 2023 13:45:59 -0000

From: Bin Meng <bmeng@tinylab.org>

At present {h,s}stateen CSRs are not reported in the CSR XML
hence gdb cannot access them.

Fix it by adjusting their predicate() routine logic so that the
static config check comes before the run-time check, as well as
adding a debugger check.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---

(no changes since v1)

 target/riscv/csr.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 15b23b9b5a..a0e70f5ba0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -337,13 +337,22 @@ static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    RISCVException ret = hmode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv < PRV_M) {
         if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEEN)) {
             return RISCV_EXCP_ILLEGAL_INST;
         }
     }
 
-    return hmode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 static RISCVException hstateen(CPURISCVState *env, int csrno)
@@ -366,6 +375,15 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    RISCVException ret = smode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv < PRV_M) {
         if (!(env->mstateen[index] & SMSTATEEN_STATEEN)) {
             return RISCV_EXCP_ILLEGAL_INST;
@@ -378,7 +396,7 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
         }
     }
 
-    return smode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 /* Checks if PointerMasking registers could be accessed */
-- 
2.25.1


