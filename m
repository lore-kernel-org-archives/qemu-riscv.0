Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2gd-0004Hz-Az
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gZ-0004F1-Sh
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:47:52 -0500
Received: from [2a00:1450:4864:20::42d] (port=37619
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gX-0003o4-Pj
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:47:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w11so12737480wra.4
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b0QDjjAPYD0UQvR3q14Aw0JJT1qatb8xExZJqX/BR7A=;
 b=YqKgYeEKrw/QiQz7aRgZInCequLcATlQ6oSUtxmTTXh7gRAxT4JacpgSRQTV0qJbsY
 Ove2RwDFjsSNUKWwDcEzMwXFR040EcRqOmf+bhhJ3KkssY7Gqv4+wvT5dMhaaZPY5Ags
 lkIFaX0xk8uyK41kJhUGUbQ3DvOkO/Kk3vIs8uifKF/yGqIrbGP2f2JjghhulekkYC+X
 Nl5NtgbrNa9FtMSnHCSd9pNfyx6NCkLbA281WGtdpqUiHeB0xgrUf5KiJjeSTKpCnzzS
 HCw+9sCH/rjWcEhhMu6Sie4RhnYVHhbox9lwvTL3hXKJT+AfLYPXrZFJAIzbWhMTiuY0
 kxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b0QDjjAPYD0UQvR3q14Aw0JJT1qatb8xExZJqX/BR7A=;
 b=xQIyEWeRY2rTp1TqlSfABXAkDbgp0XlPkeXF1Gg+qN6TNu7LaGQsnzzGDRrl+wyJEO
 D8uhAqgHYor7GY7MZKZIH8K9wPr/wC+dOx32lyZrNAKVPkKTYqNig4g9BT7QJAS3q2Mq
 UV8ikWx84xeqFPI9m4f7Ja/eiKndF0Mgs8D4e1S7h6+cZ5SE9iEuz9r5r2IWHt4NXjMw
 HRsOy5whZtzf/3lUXyLTp2xOwToj6EPEHQfmy/bL89jnqaay57BMAGgTlZwSNpOpi6Oy
 RVAsNG0xqxuOtvoBANda5OqmMOKnGP1dN2qr75iVXRazyDmLdAsan+6LBYN1BEgkpT2J
 COsw==
X-Gm-Message-State: AOAM531Iz00U+r6hJH2zNW1DuGYJ3jdNL40590Q9nzcsOfBcvTtzYUsL
 5MGWpom9/Wz6kExZD8nZEZn6mQ==
X-Google-Smtp-Source: ABdhPJwcAj7PCM+Z4qiP1X8GmkojS2bL48/mQjyqAINV8kcq2MZrcrSC8uXOmHdc7D7ZvIRAqBq5QA==
X-Received: by 2002:adf:e307:: with SMTP id b7mr3464171wrj.339.1643996868404; 
 Fri, 04 Feb 2022 09:47:48 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:47:47 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 07/23] target/riscv: Add defines for AIA CSRs
Date: Fri,  4 Feb 2022 23:16:43 +0530
Message-Id: <20220204174700.534953-8-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42d;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Fri, 04 Feb 2022 17:47:53 -0000

From: Anup Patel <anup.patel@wdc.com>

The RISC-V AIA specification extends RISC-V local interrupts and
introduces new CSRs. This patch adds defines for the new AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h | 119 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a541705760..068c4d8034 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -168,6 +168,31 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
+/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_MISELECT        0x350
+#define CSR_MIREG           0x351
+
+/* Machine-Level Interrupts (AIA) */
+#define CSR_MTOPI           0xfb0
+
+/* Machine-Level IMSIC Interface (AIA) */
+#define CSR_MSETEIPNUM      0x358
+#define CSR_MCLREIPNUM      0x359
+#define CSR_MSETEIENUM      0x35a
+#define CSR_MCLREIENUM      0x35b
+#define CSR_MTOPEI          0x35c
+
+/* Virtual Interrupts for Supervisor Level (AIA) */
+#define CSR_MVIEN           0x308
+#define CSR_MVIP            0x309
+
+/* Machine-Level High-Half CSRs (AIA) */
+#define CSR_MIDELEGH        0x313
+#define CSR_MIEH            0x314
+#define CSR_MVIENH          0x318
+#define CSR_MVIPH           0x319
+#define CSR_MIPH            0x354
+
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
 #define CSR_SEDELEG         0x102
@@ -187,6 +212,24 @@
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
 
+/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_SISELECT        0x150
+#define CSR_SIREG           0x151
+
+/* Supervisor-Level Interrupts (AIA) */
+#define CSR_STOPI           0xdb0
+
+/* Supervisor-Level IMSIC Interface (AIA) */
+#define CSR_SSETEIPNUM      0x158
+#define CSR_SCLREIPNUM      0x159
+#define CSR_SSETEIENUM      0x15a
+#define CSR_SCLREIENUM      0x15b
+#define CSR_STOPEI          0x15c
+
+/* Supervisor-Level High-Half CSRs (AIA) */
+#define CSR_SIEH            0x114
+#define CSR_SIPH            0x154
+
 /* Hpervisor CSRs */
 #define CSR_HSTATUS         0x600
 #define CSR_HEDELEG         0x602
@@ -217,6 +260,35 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+#define CSR_HVIEN           0x608
+#define CSR_HVICTL          0x609
+#define CSR_HVIPRIO1        0x646
+#define CSR_HVIPRIO2        0x647
+
+/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+#define CSR_VSISELECT       0x250
+#define CSR_VSIREG          0x251
+
+/* VS-Level Interrupts (H-extension with AIA) */
+#define CSR_VSTOPI          0xeb0
+
+/* VS-Level IMSIC Interface (H-extension with AIA) */
+#define CSR_VSSETEIPNUM     0x258
+#define CSR_VSCLREIPNUM     0x259
+#define CSR_VSSETEIENUM     0x25a
+#define CSR_VSCLREIENUM     0x25b
+#define CSR_VSTOPEI         0x25c
+
+/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+#define CSR_HIDELEGH        0x613
+#define CSR_HVIENH          0x618
+#define CSR_HVIPH           0x655
+#define CSR_HVIPRIO1H       0x656
+#define CSR_HVIPRIO2H       0x657
+#define CSR_VSIEH           0x214
+#define CSR_VSIPH           0x254
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
@@ -635,4 +707,51 @@ typedef enum RISCVException {
 #define UMTE_U_PM_INSN      U_PM_INSN
 #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
 
+/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
+#define ISELECT_IPRIO0                     0x30
+#define ISELECT_IPRIO15                    0x3f
+#define ISELECT_IMSIC_EIDELIVERY           0x70
+#define ISELECT_IMSIC_EITHRESHOLD          0x72
+#define ISELECT_IMSIC_EIP0                 0x80
+#define ISELECT_IMSIC_EIP63                0xbf
+#define ISELECT_IMSIC_EIE0                 0xc0
+#define ISELECT_IMSIC_EIE63                0xff
+#define ISELECT_IMSIC_FIRST                ISELECT_IMSIC_EIDELIVERY
+#define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
+#define ISELECT_MASK                       0x1ff
+
+/* Dummy [M|S|VS]ISELECT value for emulating [M|S|VS]TOPEI CSRs */
+#define ISELECT_IMSIC_TOPEI                (ISELECT_MASK + 1)
+
+/* IMSIC bits (AIA) */
+#define IMSIC_TOPEI_IID_SHIFT              16
+#define IMSIC_TOPEI_IID_MASK               0x7ff
+#define IMSIC_TOPEI_IPRIO_MASK             0x7ff
+#define IMSIC_EIPx_BITS                    32
+#define IMSIC_EIEx_BITS                    32
+
+/* MTOPI and STOPI bits (AIA) */
+#define TOPI_IID_SHIFT                     16
+#define TOPI_IID_MASK                      0xfff
+#define TOPI_IPRIO_MASK                    0xff
+
+/* Interrupt priority bits (AIA) */
+#define IPRIO_IRQ_BITS                     8
+#define IPRIO_MMAXIPRIO                    255
+#define IPRIO_DEFAULT_UPPER                4
+#define IPRIO_DEFAULT_MIDDLE               (IPRIO_DEFAULT_UPPER + 24)
+#define IPRIO_DEFAULT_M                    IPRIO_DEFAULT_MIDDLE
+#define IPRIO_DEFAULT_S                    (IPRIO_DEFAULT_M + 3)
+#define IPRIO_DEFAULT_SGEXT                (IPRIO_DEFAULT_S + 3)
+#define IPRIO_DEFAULT_VS                   (IPRIO_DEFAULT_SGEXT + 1)
+#define IPRIO_DEFAULT_LOWER                (IPRIO_DEFAULT_VS + 3)
+
+/* HVICTL bits (AIA) */
+#define HVICTL_VTI                         0x40000000
+#define HVICTL_IID                         0x0fff0000
+#define HVICTL_IPRIOM                      0x00000100
+#define HVICTL_IPRIO                       0x000000ff
+#define HVICTL_VALID_MASK                  \
+    (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
+
 #endif
-- 
2.25.1


