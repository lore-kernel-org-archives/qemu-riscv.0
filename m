Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9wk-0001bx-NE
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wj-0001Zw-E5; Sun, 17 Oct 2021 13:27:41 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wh-0003Bs-62; Sun, 17 Oct 2021 13:27:41 -0400
Received: by mail-ed1-x52a.google.com with SMTP id a25so61169324edx.8;
 Sun, 17 Oct 2021 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nh0iqXUy8y/Ubp2h94AICbKWAgloggmfwv7+BDo9syA=;
 b=gyUGVFHUUrOdosuNbc6umAEE4oUUC0c8dcjp2s1boCEMTJ9/aOkYeL1e8vlhrU7nXW
 OaSmtNCflJIMNz6Xa/7H7bHJgPWtZos0jr426tHAISomsP7LYZQFFJveoqQHw0NjPtw7
 yMenv7OJghWGtcn/hLMBPKmcqpAQPws/MURbsh2Q/ruVDEa3jE7vBgBU/fn88eLyGnVi
 cMNQ/rgV+7N5W2d/+gIHWrYVzOPX8z5+kVgyXZ4G0kYsjVRc1i1RCyBY3Mjh4z9iaiNs
 6+wJMoX6bdeE6Vejz52o+GrxjUrUf9A/ygnkJfaO8lXt6yz+GgSQsJv/ySRO11aWGz5t
 IhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nh0iqXUy8y/Ubp2h94AICbKWAgloggmfwv7+BDo9syA=;
 b=vEL4+VPiCpgNhv6Mcb68mdnZ7cvpmRnI9NMJDtr5IQbUNoB+PCWVamkZ3HZCplxcp+
 TZQIo/P7J1JbUEKyg5UhgNEQz5WioSZGFuYBohhvQNOaUeDKkODiQQlg6C0iyMyUAjOr
 VLVI5799iEZw1VlhTCkjiI5C3U44dgpPvfoJY3RDtyOhjge8FrJWBqAud2Dwl5Y9W29u
 zGLlptcm9sNPtEWmneoOwrnjRIISnFnGCszqKleJGGOLZmLvfKIcCjUC3/nvqCP6kznc
 XuwqZU5HD/j9FhVRgQuDX+asNGurjR4GoMztyyJJQk9LCKGbCVvTk04Qnwd4EvzvSPu8
 Q7Pw==
X-Gm-Message-State: AOAM532H/vIq0Y97VQiMT0U1RrhiKkv8P7XSfYOGdacWYvs1zL8fw8+u
 srtZa281Y86Rf1xLQ5dv6zo=
X-Google-Smtp-Source: ABdhPJyZwMk63YY5Hexc1SkFA1Fx8B9W1TSCshAcZeem+2foNSFBUJal7uzSaLOvtDdcc3MogjeiRA==
X-Received: by 2002:a17:906:f8d0:: with SMTP id
 lh16mr22416967ejb.367.1634491656794; 
 Sun, 17 Oct 2021 10:27:36 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id v19sm7989814ejx.26.2021.10.17.10.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 10:27:36 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v14 2/8] [RISCV_PM] Add CSR defines for RISC-V PM extension
Date: Sun, 17 Oct 2021 20:27:22 +0300
Message-Id: <20211017172728.759687-3-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 17 Oct 2021 17:27:41 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 96 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 999187a9ee..1a3767804a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -334,6 +334,38 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
 
+/*
+ * User PointerMasking registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_UMTE            0x4c0
+#define CSR_UPMMASK         0x4c1
+#define CSR_UPMBASE         0x4c2
+
+/*
+ * Machine PointerMasking registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_MMTE            0x3c0
+#define CSR_MPMMASK         0x3c1
+#define CSR_MPMBASE         0x3c2
+
+/*
+ * Supervisor PointerMaster registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_SMTE            0x1c0
+#define CSR_SPMMASK         0x1c1
+#define CSR_SPMBASE         0x1c2
+
+/*
+ * Hypervisor PointerMaster registers
+ * NB: actual CSR numbers might be changed in future
+ */
+#define CSR_VSMTE           0x2c0
+#define CSR_VSPMMASK        0x2c1
+#define CSR_VSPMBASE        0x2c2
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -531,4 +563,68 @@ typedef enum RISCVException {
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* General PointerMasking CSR bits*/
+#define PM_ENABLE       0x00000001ULL
+#define PM_CURRENT      0x00000002ULL
+#define PM_INSN         0x00000004ULL
+#define PM_XS_MASK      0x00000003ULL
+
+/* PointerMasking XS bits values */
+#define PM_EXT_DISABLE  0x00000000ULL
+#define PM_EXT_INITIAL  0x00000001ULL
+#define PM_EXT_CLEAN    0x00000002ULL
+#define PM_EXT_DIRTY    0x00000003ULL
+
+/* Offsets for every pair of control bits per each priv level */
+#define XS_OFFSET    0ULL
+#define U_OFFSET     2ULL
+#define S_OFFSET     5ULL
+#define M_OFFSET     8ULL
+
+#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
+#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
+#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
+#define U_PM_INSN    (PM_INSN    << U_OFFSET)
+#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
+#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
+#define S_PM_INSN    (PM_INSN    << S_OFFSET)
+#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
+#define M_PM_CURRENT (PM_CURRENT << M_OFFSET)
+#define M_PM_INSN    (PM_INSN    << M_OFFSET)
+
+/* mmte CSR bits */
+#define MMTE_PM_XS_BITS     PM_XS_BITS
+#define MMTE_U_PM_ENABLE    U_PM_ENABLE
+#define MMTE_U_PM_CURRENT   U_PM_CURRENT
+#define MMTE_U_PM_INSN      U_PM_INSN
+#define MMTE_S_PM_ENABLE    S_PM_ENABLE
+#define MMTE_S_PM_CURRENT   S_PM_CURRENT
+#define MMTE_S_PM_INSN      S_PM_INSN
+#define MMTE_M_PM_ENABLE    M_PM_ENABLE
+#define MMTE_M_PM_CURRENT   M_PM_CURRENT
+#define MMTE_M_PM_INSN      M_PM_INSN
+#define MMTE_MASK    (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | MMTE_U_PM_INSN | \
+                      MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | MMTE_S_PM_INSN | \
+                      MMTE_M_PM_ENABLE | MMTE_M_PM_CURRENT | MMTE_M_PM_INSN | \
+                      MMTE_PM_XS_BITS)
+
+/* (v)smte CSR bits */
+#define SMTE_PM_XS_BITS     PM_XS_BITS
+#define SMTE_U_PM_ENABLE    U_PM_ENABLE
+#define SMTE_U_PM_CURRENT   U_PM_CURRENT
+#define SMTE_U_PM_INSN      U_PM_INSN
+#define SMTE_S_PM_ENABLE    S_PM_ENABLE
+#define SMTE_S_PM_CURRENT   S_PM_CURRENT
+#define SMTE_S_PM_INSN      S_PM_INSN
+#define SMTE_MASK    (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT | SMTE_U_PM_INSN | \
+                      SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | SMTE_S_PM_INSN | \
+                      SMTE_PM_XS_BITS)
+
+/* umte CSR bits */
+#define UMTE_U_PM_ENABLE    U_PM_ENABLE
+#define UMTE_U_PM_CURRENT   U_PM_CURRENT
+#define UMTE_U_PM_INSN      U_PM_INSN
+#define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
+
 #endif
-- 
2.30.2


