Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013DDE77166
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 23:16:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIc6c-0001Kt-IC; Tue, 03 Dec 2024 18:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6Z-0001IO-Dl
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:56 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6X-0001Ju-PV
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:55 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-215b45a40d8so16394555ad.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 15:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733267692; x=1733872492;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LMnKYE8WPdvKl7s3HVfAdc/3hWY0P2i17ofoTw5jOGw=;
 b=N6nvTfJm4dkJQHfcWF2jlj6wT/l7YnNWXbx+02kjm42lVIjR9Bde2oywvuYu58z+om
 P1+ks3K2v3gyI0rtvhY1gb1OftrEbTIOHDnE0c/FxJFeJLkwbRMfFJSi3si4Q7aM7EzX
 YIFoxycE/1aDlhMBN8GvDatJ7JMS4iTlz3HtykekVMrylslO1Rzz7BF+Kfwk0rSkR9nm
 B7Io24uteT52ovXvWTqtRM3pm2Krf9h0uCdtDJW1ES2MWm8Bgumhu0WCu6oEKy1i26hZ
 tPHM1H/2JTYLpDZXOqT9wUDInZ7sVv8fRLymCbHH621K1k2yHSNU6Qz1BR9v3VSjoWIV
 Pukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733267692; x=1733872492;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMnKYE8WPdvKl7s3HVfAdc/3hWY0P2i17ofoTw5jOGw=;
 b=j/lPZ3x+R4RwF9vnkVywvM2rZoL79c6QzmyNAT7XJ0WzRLXdh4HOaEfCS/GB8ptdkT
 Z+fvhL+nBHCsLRxS0S9+pJmFj79bwHQObaTYBK0UlGYPyBRflmlnomfdvf51yH7I3QMi
 WHw0LjH3FIh5KmV7guw08rZIbxb4mtHctYIS3tYxfujGbqZKmk1po8I6gcueP63i+c27
 +nCaUWveYFBFHBPmXieDzWB0Q/p3Eocbg4xY6mXF+12QxfgM3ee1ZGrVljW9rBJrwnta
 xhbz0zqQ+tyGhUVCQ5n3x5VkIr1HSKVRgAAVeJiX3wVmcAj3dpQcOAL9FdlWgAssTQvz
 AFPg==
X-Gm-Message-State: AOJu0YyLg3iVqMXkl2qodtDDR/xVVQThIkV3sJ5lHfU5XDsskK2zImqC
 nF3xjz2W/Q4egWJYwWV6reFX0XY4xB+sLCxY0Tn2lifPkKGCm+xKgtT0bsJlhxE=
X-Gm-Gg: ASbGncudCNicm+JKi/VReQaUlItY5Q8OVKfqOvtGvRoAZYW3guMBvuwWf8X4AxjYYo/
 dHxSZ0PxL3y+CuRFt+efDVXC1KdW7coFI9CZjvQ9/l3KDqxedEYdIsPOwA1jluqo0w41/ydzkRf
 AsURHrxeTGiWTYDEXXqfVtI+TsX0QcGbDd1UuLOdn04J1kdiEeTU2Yhu7wcfEIVDiS7et4UdZgy
 2Vsr51VfY8SSTX65bYD3rG3jd4rzkXxka/Ht7gW7RssLwfd+JXrkXgbMgXScgU=
X-Google-Smtp-Source: AGHT+IFTgjURCicqPJ47SCN5f1t5Kdxv4N9lllPghpOB6pd05/fucO0zpFKBOtq9qx0M2KK7LA/tYQ==
X-Received: by 2002:a17:903:32ce:b0:215:7742:73d6 with SMTP id
 d9443c01a7336-215bd0c4b00mr48972105ad.20.1733267692201; 
 Tue, 03 Dec 2024 15:14:52 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254180f78asm11032133b3a.133.2024.12.03.15.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 15:14:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 03 Dec 2024 15:14:44 -0800
Subject: [PATCH v4 06/11] target/riscv: Add counter delegation definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-counter_delegation-v4-6-c12a89baed86@rivosinc.com>
References: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
In-Reply-To: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds definitions for counter delegation, including the new
scountinhibit register and the mstateen.CD bit.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h      | 1 +
 target/riscv/cpu_bits.h | 8 +++++++-
 target/riscv/machine.c  | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 284b11282197..903268626374 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -385,6 +385,7 @@ struct CPUArchState {
     uint32_t scounteren;
     uint32_t mcounteren;
 
+    uint32_t scountinhibit;
     uint32_t mcountinhibit;
 
     /* PMU cycle & instret privilege mode filtering */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index e13c5420a251..4ac065ac5e5a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -210,6 +210,9 @@
 #define CSR_SSTATEEN2       0x10E
 #define CSR_SSTATEEN3       0x10F
 
+/* Supervisor Counter Delegation */
+#define CSR_SCOUNTINHIBIT   0x120
+
 /* Supervisor Trap Handling */
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
@@ -791,6 +794,7 @@ typedef enum RISCVException {
 #define MENVCFG_CBIE                       (3UL << 4)
 #define MENVCFG_CBCFE                      BIT(6)
 #define MENVCFG_CBZE                       BIT(7)
+#define MENVCFG_CDE                        (1ULL << 60)
 #define MENVCFG_ADUE                       (1ULL << 61)
 #define MENVCFG_PBMTE                      (1ULL << 62)
 #define MENVCFG_STCE                       (1ULL << 63)
@@ -886,7 +890,9 @@ typedef enum RISCVException {
 #define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
 #define ISELECT_MASK_AIA                   0x1ff
 
-/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
+/* [M|S|VS]SELCT value for Indirect CSR Access Extension */
+#define ISELECT_CD_FIRST                   0x40
+#define ISELECT_CD_LAST                    0x5f
 #define ISELECT_MASK_SXCSRIND              0xfff
 
 /* Dummy [M|S|VS]ISELECT value for emulating [M|S|VS]TOPEI CSRs */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 99f0af507717..e1bdc31c7c53 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -434,6 +434,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINT32(env.scounteren, RISCVCPU),
         VMSTATE_UINT32(env.mcounteren, RISCVCPU),
+        VMSTATE_UINT32(env.scountinhibit, RISCVCPU),
         VMSTATE_UINT32(env.mcountinhibit, RISCVCPU),
         VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS, 0,
                              vmstate_pmu_ctr_state, PMUCTRState),

-- 
2.34.1


