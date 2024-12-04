Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA6AE7717D
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIoxD-00088c-5K; Wed, 04 Dec 2024 07:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tIown-0007zO-4N
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:57:41 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tIowl-0007vy-Ag
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:57:40 -0500
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-385d6e36de7so5751694f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 04:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733317057; x=1733921857;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dKK0HxgyWErZpULPkOBeN+5cbb09ulxZHM3ugRtmLQo=;
 b=HC7MrqIzZbuAo1Ez+JgSLRdRu+RQJwwUWsf6Fxf4CeXHK2935SloRwUuym36f4diHR
 /akd0eZ434YIUp39UW6s49fe6x7ICpnVCtf4YUCtF62P+MkIOhiOP+RKptKvfEtN7bcF
 14ENDrj6gweRA0nLaYeuTwQNKL3Rv9jcb0EUbyL1E6k7aMwYD1ri+VtAWuk5Z54ofs49
 TQ0NCagP+phNnhTFtV4BOW8yh87RHDcV5bmnlwEqDYaV9v9Qm2cDBMyhyBll/6bj465i
 ySJ4YL9ve0tuAWxOxLXIOlesqHHi0TgsaWrK2kfBZw8X5bsxTlvr6T53INaRiWLya2en
 0E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733317057; x=1733921857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dKK0HxgyWErZpULPkOBeN+5cbb09ulxZHM3ugRtmLQo=;
 b=lm1zEf6kSKb8xHzdUWU5QuZ4wlzHKvCW3RSFtRUq2FLo0snGEZ5g00SJhrKYMaYkGu
 /iYseouBoPf+vXByHz00vl2rZqHMPH1O52Ace1iaW0WaG7G05Tj0pIld+Whkuwq/qo/h
 Ay2YfMhplpPWOGI4EY2Zg6pz/fmqSsiDi8ZPw7wHhYFStNkapxAFebphVE1e0o4jdufh
 VaPlb8Uz0Cnq8tXrQoWVTOzUHXdtnej5Gzrb396VpMByBaM1aBK6EQS0JQ0eJrAl5/uW
 wuSbHD/db4OT6OYwOtAo3IsdwztmroAb6bmogTG9lpGfS5Xs8HTOsm9KXHYbbsypeV8c
 TIEQ==
X-Gm-Message-State: AOJu0YxgkDB10joDp7nhg89rJO6aDGR/tIv2IKAKBt3mz4bDnc1dwVoM
 sCRkoHAKxdQKk8MBzJXU6RxyMRZNTu0efaa1AFz+N9mfJXHXimVHEahOwkBMQ4yCrpput9hhvwo
 4MYmUtA==
X-Gm-Gg: ASbGncuZCeQhiIC7pjvSaku6dEQI4//C/mifML/7BiYZBrxvc1UFJIa3r+RTLZ4tnE0
 CVUOenVvPPrNuJpUIv9cF2OQwf3BT/mCtNZOdTElqTuc1mXWIk0A1FqYlle3cq5L6bPjmapSEeM
 XZQF3snQ4VItzzzyZUu4pDPnyOo602feOIKZ3B4NRXrSRebSaOd4Wvq91l7a7VHOLHrPAVBVu4F
 2dj+G/96Tx/lwN1v2AOmEkP6u3VksnAcqJ+hkY6M4wnA0FWbpns7FFKn181EjBCIfN0kLVpXA57
 yz8dyg==
X-Google-Smtp-Source: AGHT+IFUHXj7aFuWfolDkK33VgorI5QZ3Xut0WWHc0WQ/V7UWP3JtoLZVMo1xKnTFCJWPfmC43xvqQ==
X-Received: by 2002:a05:6000:2c6:b0:385:ebaf:3824 with SMTP id
 ffacd0b85a97d-385fd3f2d22mr6762977f8f.27.1733317057126; 
 Wed, 04 Dec 2024 04:57:37 -0800 (PST)
Received: from rkanwal-XPS-15-9520.ba.rivosinc.com ([137.59.223.84])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385deeb6acdsm15826428f8f.81.2024.12.04.04.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 04:57:36 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, beeman@rivosinc.com,
 tech-control-transfer-records@lists.riscv.org, jason.chien@sifive.com,
 frank.chang@sifive.com, richard.henderson@linaro.org
Subject: [PATCH v4 2/7] target/riscv: Add Control Transfer Records CSR
 definitions.
Date: Wed,  4 Dec 2024 17:56:40 +0500
Message-Id: <20241204-b4-ctr_upstream_v3-v4-2-d3ce6bef9432@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204-b4-ctr_upstream_v3-v4-0-d3ce6bef9432@rivosinc.com>
References: <20241204-b4-ctr_upstream_v3-v4-0-d3ce6bef9432@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

The Control Transfer Records (CTR) extension provides a method to
record a limited branch history in register-accessible internal chip
storage.

This extension is similar to Arch LBR in x86 and BRBE in ARM.
The Extension has been stable and the latest release can be found here
https://github.com/riscv/riscv-control-transfer-records/releases/tag/v1.0_rc5

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 94 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4ac065ac5e5a688d5ec9bbb8288c3deb82f05314..0cf6ef133ce9565f4a19e99f3cfd1d73da77f47a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -247,6 +247,17 @@
 #define CSR_SIEH            0x114
 #define CSR_SIPH            0x154
 
+/* Machine-Level Control transfer records CSRs */
+#define CSR_MCTRCTL         0x34e
+
+/* Supervisor-Level Control transfer records CSRs */
+#define CSR_SCTRCTL         0x14e
+#define CSR_SCTRSTATUS      0x14f
+#define CSR_SCTRDEPTH       0x15f
+
+/* VS-Level Control transfer records CSRs */
+#define CSR_VSCTRCTL        0x24e
+
 /* Hpervisor CSRs */
 #define CSR_HSTATUS         0x600
 #define CSR_HEDELEG         0x602
@@ -344,6 +355,7 @@
 #define SMSTATEEN0_CS       (1ULL << 0)
 #define SMSTATEEN0_FCSR     (1ULL << 1)
 #define SMSTATEEN0_JVT      (1ULL << 2)
+#define SMSTATEEN0_CTR      (1ULL << 54)
 #define SMSTATEEN0_P1P13    (1ULL << 56)
 #define SMSTATEEN0_HSCONTXT (1ULL << 57)
 #define SMSTATEEN0_IMSIC    (1ULL << 58)
@@ -877,6 +889,88 @@ typedef enum RISCVException {
 #define UMTE_U_PM_INSN      U_PM_INSN
 #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
 
+/* CTR control register commom fields */
+#define XCTRCTL_U              BIT_ULL(0)
+#define XCTRCTL_S              BIT_ULL(1)
+#define XCTRCTL_RASEMU         BIT_ULL(7)
+#define XCTRCTL_STE            BIT_ULL(8)
+#define XCTRCTL_BPFRZ          BIT_ULL(11)
+#define XCTRCTL_LCOFIFRZ       BIT_ULL(12)
+#define XCTRCTL_EXCINH         BIT_ULL(33)
+#define XCTRCTL_INTRINH        BIT_ULL(34)
+#define XCTRCTL_TRETINH        BIT_ULL(35)
+#define XCTRCTL_NTBREN         BIT_ULL(36)
+#define XCTRCTL_TKBRINH        BIT_ULL(37)
+#define XCTRCTL_INDCALLINH     BIT_ULL(40)
+#define XCTRCTL_DIRCALLINH     BIT_ULL(41)
+#define XCTRCTL_INDJMPINH      BIT_ULL(42)
+#define XCTRCTL_DIRJMPINH      BIT_ULL(43)
+#define XCTRCTL_CORSWAPINH     BIT_ULL(44)
+#define XCTRCTL_RETINH         BIT_ULL(45)
+#define XCTRCTL_INDLJMPINH     BIT_ULL(46)
+#define XCTRCTL_DIRLJMPINH     BIT_ULL(47)
+
+#define XCTRCTL_MASK (XCTRCTL_U | XCTRCTL_S | XCTRCTL_RASEMU |                \
+                      XCTRCTL_STE | XCTRCTL_BPFRZ | XCTRCTL_LCOFIFRZ |        \
+                      XCTRCTL_EXCINH | XCTRCTL_INTRINH | XCTRCTL_TRETINH |    \
+                      XCTRCTL_NTBREN | XCTRCTL_TKBRINH | XCTRCTL_INDCALLINH | \
+                      XCTRCTL_DIRCALLINH | XCTRCTL_INDJMPINH |                \
+                      XCTRCTL_DIRJMPINH | XCTRCTL_CORSWAPINH |                \
+                      XCTRCTL_RETINH | XCTRCTL_INDLJMPINH | XCTRCTL_DIRLJMPINH)
+
+#define XCTRCTL_INH_START         32U
+
+/* CTR mctrctl bits */
+#define MCTRCTL_M                 BIT_ULL(2)
+#define MCTRCTL_MTE               BIT_ULL(9)
+
+#define MCTRCTL_MASK              (XCTRCTL_MASK | MCTRCTL_M | MCTRCTL_MTE)
+#define SCTRCTL_MASK              XCTRCTL_MASK
+#define VSCTRCTL_MASK             XCTRCTL_MASK
+
+/* sctrstatus CSR bits. */
+#define SCTRSTATUS_WRPTR_MASK       0xFF
+#define SCTRSTATUS_FROZEN           BIT(31)
+#define SCTRSTATUS_MASK             (SCTRSTATUS_WRPTR_MASK | SCTRSTATUS_FROZEN)
+
+/* sctrdepth CSR bits. */
+#define SCTRDEPTH_MASK              0x7
+#define SCTRDEPTH_MIN               0U  /* 16 Entries. */
+#define SCTRDEPTH_MAX               4U  /* 256 Entries. */
+
+#define CTR_ENTRIES_FIRST           0x200
+#define CTR_ENTRIES_LAST            0x2ff
+
+#define CTRSOURCE_VALID             BIT(0)
+#define CTRTARGET_MISP              BIT(0)
+
+#define CTRDATA_TYPE_MASK           0xF
+#define CTRDATA_CCV                 BIT(15)
+#define CTRDATA_CCM_MASK            0xFFF0000
+#define CTRDATA_CCE_MASK            0xF0000000
+
+#define CTRDATA_MASK            (CTRDATA_TYPE_MASK | CTRDATA_CCV |  \
+                                 CTRDATA_CCM_MASK | CTRDATA_CCE_MASK)
+
+typedef enum CTRType {
+    CTRDATA_TYPE_NONE                   = 0,
+    CTRDATA_TYPE_EXCEPTION              = 1,
+    CTRDATA_TYPE_INTERRUPT              = 2,
+    CTRDATA_TYPE_EXCEP_INT_RET          = 3,
+    CTRDATA_TYPE_NONTAKEN_BRANCH        = 4,
+    CTRDATA_TYPE_TAKEN_BRANCH           = 5,
+    CTRDATA_TYPE_RESERVED_0             = 6,
+    CTRDATA_TYPE_RESERVED_1             = 7,
+    CTRDATA_TYPE_INDIRECT_CALL          = 8,
+    CTRDATA_TYPE_DIRECT_CALL            = 9,
+    CTRDATA_TYPE_INDIRECT_JUMP          = 10,
+    CTRDATA_TYPE_DIRECT_JUMP            = 11,
+    CTRDATA_TYPE_CO_ROUTINE_SWAP        = 12,
+    CTRDATA_TYPE_RETURN                 = 13,
+    CTRDATA_TYPE_OTHER_INDIRECT_JUMP    = 14,
+    CTRDATA_TYPE_OTHER_DIRECT_JUMP      = 15,
+} CTRType;
+
 /* MISELECT, SISELECT, and VSISELECT bits (AIA) */
 #define ISELECT_IPRIO0                     0x30
 #define ISELECT_IPRIO15                    0x3f

-- 
2.34.1


