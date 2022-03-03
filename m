Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPvHc-0003Zb-TN
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 18:54:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHa-0003WB-VS
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:54:54 -0500
Received: from [2607:f8b0:4864:20::f33] (port=34381
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHY-0003ZS-1Z
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:54:54 -0500
Received: by mail-qv1-xf33.google.com with SMTP id b12so5437486qvk.1
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 15:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1toQOcv5BHmD4r+VvjpIWgYmNIwASSzch5+mDs6Tmco=;
 b=QTQ+67FBfQ6oomAwo+gTFwsFgKJRx3QwHRftrwWoGbIqdvmaKm1Znimih9btzsRsdM
 JZNy3iMmadrUjU4BU6NcUzPJ0Kfhx05SXKcEeQxh9ZLNmivAxMXYVdkwA6fj0O31c8Th
 u8pVdqNQrc2o/FNHPzJM1JLnuL+t0+OtRbgz7XfEAhiPLJD4ihL5ce3fBrmxb98vM9PM
 jbcwP0icdWOZt0d7LYNuualaJzABFISOrgnwioZ7OQ0z870y3CgVjEHdMNNWR53IsITu
 U8xWiBOhdA8WlmUdr+2v+An4YYbmKClTG9LHQfsEfm9dRQwAxYUNg7nYAlzn5BUjgQPP
 x3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1toQOcv5BHmD4r+VvjpIWgYmNIwASSzch5+mDs6Tmco=;
 b=wmi0zqbaTHj1RuWRzK9izK9XEehXxguHjhcCHmKLoYlaDCs9pTVZciRBE/uaMe9G2I
 sIgbvXKlMjUrTTOVsZ93jlAvv5CCfKHuaxiYo14AIWOTEkME9+A0nOViKQzBOUEAHB17
 eEMBvtEjIDlnqWQMfXXTLRl310Nf+gijeqmIaQOExpyQ+6dl6RaX0CT/3tFuMvBpaTQ/
 6Cjk/moKOXiA+Xq0BpGlS+bcFel6AU5wiN1am/SGtz5oJq8dQ5efmpyQ1AVxKZgsCH5n
 ANL9KiASrhsiwf/BBiyg+7DMlnrdEo8CWuxB13jyEveGcS4gXgYVrc9YCnqsJT0sU8iD
 e/qA==
X-Gm-Message-State: AOAM531Cob+/n8OS32QosWbco4aGiBbfoKVul7letCErZ+i5kix9Uxvu
 UaMcDmat4YTTWGIsZUOVnJEnFQ==
X-Google-Smtp-Source: ABdhPJxOEA4vcNvLMfL8GTSMMa0bMCz3uNxpUJP6tVynfzpfphESaskbcLvfvdp+vtzzq0uIOEdKAA==
X-Received: by 2002:a05:6214:212e:b0:42c:4226:282e with SMTP id
 r14-20020a056214212e00b0042c4226282emr26311331qvc.111.1646351689529; 
 Thu, 03 Mar 2022 15:54:49 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1768390qkc.117.2022.03.03.15.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:54:49 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v6 02/12] target/riscv: Implement PMU CSR predicate function
 for S-mode
Date: Thu,  3 Mar 2022 15:54:30 -0800
Message-Id: <20220303235440.638790-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303235440.638790-1-atishp@rivosinc.com>
References: <20220303235440.638790-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=atishp@rivosinc.com; helo=mail-qv1-xf33.google.com
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
X-List-Received-Date: Thu, 03 Mar 2022 23:54:55 -0000

From: Atish Patra <atish.patra@wdc.com>

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. It also does not check mcounteren bits before
before cycle/minstret/hpmcounterx access.

Support supervisor mode access in the predicate function as well.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6102d5e7e24f..cb4366b30095 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -76,6 +76,57 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv == PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_is_32bit(env)) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-- 
2.30.2


