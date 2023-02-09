Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ0Lx-0000tq-TM
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 01:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Lv-0000sR-Ic
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:15 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Lt-0007w8-2q
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:15 -0500
Received: by mail-pf1-x42b.google.com with SMTP id n2so687098pfo.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 22:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qlPh49wlbxVVcOm0Ok3pVswLtoV2NRPuPBXAw/YmxdU=;
 b=soLrCqWLZow/sp1tWvVcJV8qtGoTHNC/x+PuDY0LOt1Y8+NE8ekfQKLWz35beos5tx
 /f5SrGKzoTQ4kUoJ7p7Ne2xmEpFBeWdWEZR8hFx3iR89UIfyascsqqdvMOyvZdqokd+G
 xCYyhHmX4ZJQtxlWOg+5z6ACjRlFPKKmB9uB5Pt7tbm3MW3UW3RBg6Ui5Gu3yDNPRaoz
 y7Jj6RKXHEWF49sQCQBj6ssOGtbfsNuVqVsoQB/kuj60/kgjOESKHFgN8+um7XadKlaK
 CDKUkcgWhsQgkr2NEeA0Ava+k3FfSN1pGIU8ULtvWgPJx5HXSJdZejazU7wyccrZd2dv
 281g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qlPh49wlbxVVcOm0Ok3pVswLtoV2NRPuPBXAw/YmxdU=;
 b=fJegkE6JlFA6CrT2GtAWLB4setiZPatQRieccXSgwYTDszEiTIDachB9JWsDVxVn4o
 Cbp1DVDWBQ07RvN4UXtGon67vKn/c3BPh3UW0bOzwcnOLftVLnvYLxFg/9gON3k1hFvB
 mq14YI4ldMNv1sv8vackpUrsTed80IrRtoSGQo/4nKbh3kDc8clZWopmf4NOTIdtokuD
 ylne3M1v1yJClMiKHRXYmL6jcN+zQ5c/kOEc1avJQUNH8pnzCRlVet5ckPp4/p0YgpXj
 Mut4WOUf4tf1mBQllfuZlh6mjjdtYxQB6QhEUYVeF39VleI4k4dVFOzjGyGtqMvCAeCl
 G2iQ==
X-Gm-Message-State: AO0yUKWwd7XeFv45EmBYGtwvhmcqNJzJUoDnakY9MSXB5dRBUHMUfPaw
 Lo47I3G+WcqjYv24xOlO1fXpSg==
X-Google-Smtp-Source: AK7set8kNRYpwuG9p2IpokvYGz5GF6McvSaho78kGz/ueIsJp5bSeWX9pKnKE8gVPsrWZXBKa7UZJw==
X-Received: by 2002:a62:520a:0:b0:5a8:44b1:7396 with SMTP id
 g10-20020a62520a000000b005a844b17396mr4400777pfb.15.1675923851727; 
 Wed, 08 Feb 2023 22:24:11 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b00571cdbd0771sm521919pfi.102.2023.02.08.22.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:24:11 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 2/9] target/riscv: zisslpcfi CSR,
 bit positions and other definitions
Date: Wed,  8 Feb 2023 22:23:57 -0800
Message-Id: <20230209062404.3582018-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062404.3582018-1-debug@rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 06:24:15 -0000

`zisslpcfi` extension adds two new CSRs. CSR_SSP and CSR_LPLR.
- CSR_SSP: This CSR holds shadow stack pointer for current privilege mode
           CSR_SSP is accessible in all modes. Each mode must establish
           it's own CSR_SSP.

- CSR_LPLR: This CSR holds label value set at the callsite by compiler.
            On call target label check instructions are emitted by
            compiler which check label value against value present in
            CSR_LPRL.

Enabling of `zisslpcfi` is controlled via menvcfg (for S/HS/VS/U/VU) and
henvcfg (for VS/VU) at bit position 60.

Each mode has enable/disable bits for forward cfi. Backward cfi doesn't
have separate enable/disable bits for S and M mode. User forward cfi and
user backward cfi enable/disable bits are in mstatus/sstatus CSR.
Supervisor forward cfi enable/disable bit are in menvcfg and henvcfg CSR.
Machine mode forward cfi enable/disable bit is in mseccfg CSR.

If forward cfi enabled, all indirect branches must land on a landing pad
instruction (`lpcll`, introduced in later commits). CPU/hart tracks this
internally using a landing pad tracker called `elp` short for `expecting
landing pad`. An interrupt can occur between an indirect branch and
target. If such an event occurs `elp` is saved away in mstatus/sstatus
CSR

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu.h      |  5 +++++
 target/riscv/cpu_bits.h | 25 +++++++++++++++++++++++++
 target/riscv/pmp.h      |  3 ++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9a923760b2..18db61a06a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -181,6 +181,11 @@ struct CPUArchState {
 
     uint32_t features;
 
+    /* CFI Extension user mode registers and state */
+    uint32_t     lplr;
+    target_ulong ssp;
+    cfi_elp      elp;
+
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8b0d7e20ea..1663ba5775 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -39,6 +39,10 @@
 
 /* Control and Status Registers */
 
+/* CFI CSRs */
+#define CSR_LPLR            0x006
+#define CSR_SSP             0x020
+
 /* User Trap Setup */
 #define CSR_USTATUS         0x000
 #define CSR_UIE             0x004
@@ -542,6 +546,10 @@
 #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
 #define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
 #define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
+#define MSTATUS_UFCFIEN     0x00800000 /* Zisslpcfi-0.1 */
+#define MSTATUS_UBCFIEN     0x01000000 /* Zisslpcfi-0.1 */
+#define MSTATUS_SPELP       0x02000000 /* Zisslpcfi-0.1 */
+#define MSTATUS_MPELP       0x04000000 /* Zisslpcfi-0.1 */
 #define MSTATUS_GVA         0x4000000000ULL
 #define MSTATUS_MPV         0x8000000000ULL
 
@@ -572,12 +580,21 @@ typedef enum {
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
 #define SSTATUS_MXR         0x00080000
+#define SSTATUS_UFCFIEN     MSTATUS_UFCFIEN /* Zisslpcfi-0.1 */
+#define SSTATUS_UBCFIEN     MSTATUS_UBCFIEN /* Zisslpcfi-0.1 */
+#define SSTATUS_SPELP       MSTATUS_SPELP   /* Zisslpcfi-0.1 */
 
 #define SSTATUS64_UXL       0x0000000300000000ULL
 
 #define SSTATUS32_SD        0x80000000
 #define SSTATUS64_SD        0x8000000000000000ULL
 
+#define CFISTATUS_M_MASK    (MSTATUS_UFCFIEN | MSTATUS_UBCFIEN | \
+                             MSTATUS_MPELP | MSTATUS_SPELP)
+
+#define CFISTATUS_S_MASK    (SSTATUS_UFCFIEN | SSTATUS_UBCFIEN | \
+                             SSTATUS_SPELP)
+
 /* hstatus CSR bits */
 #define HSTATUS_VSBE         0x00000020
 #define HSTATUS_GVA          0x00000040
@@ -747,10 +764,14 @@ typedef enum RISCVException {
 #define MENVCFG_CBIE                       (3UL << 4)
 #define MENVCFG_CBCFE                      BIT(6)
 #define MENVCFG_CBZE                       BIT(7)
+#define MENVCFG_SFCFIEN                    BIT(59)
+#define MENVCFG_CFI                        BIT(60)
 #define MENVCFG_PBMTE                      (1ULL << 62)
 #define MENVCFG_STCE                       (1ULL << 63)
 
 /* For RV32 */
+#define MENVCFGH_SFCFIEN                   BIT(27)
+#define MENVCFGH_CFI                       BIT(28)
 #define MENVCFGH_PBMTE                     BIT(30)
 #define MENVCFGH_STCE                      BIT(31)
 
@@ -763,10 +784,14 @@ typedef enum RISCVException {
 #define HENVCFG_CBIE                       MENVCFG_CBIE
 #define HENVCFG_CBCFE                      MENVCFG_CBCFE
 #define HENVCFG_CBZE                       MENVCFG_CBZE
+#define HENVCFG_SFCFIEN                    MENVCFG_SFCFIEN
+#define HENVCFG_CFI                        MENVCFG_CFI
 #define HENVCFG_PBMTE                      MENVCFG_PBMTE
 #define HENVCFG_STCE                       MENVCFG_STCE
 
 /* For RV32 */
+#define HENVCFGH_SFCFIEN                    MENVCFGH_SFCFIEN
+#define HENVCFGH_CFI                        MENVCFGH_CFI
 #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
 #define HENVCFGH_STCE                       MENVCFGH_STCE
 
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index da32c61c85..f5bfc4955b 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -43,7 +43,8 @@ typedef enum {
     MSECCFG_MMWP  = 1 << 1,
     MSECCFG_RLB   = 1 << 2,
     MSECCFG_USEED = 1 << 8,
-    MSECCFG_SSEED = 1 << 9
+    MSECCFG_SSEED = 1 << 9,
+    MSECCFG_MFCFIEN =  1 << 10
 } mseccfg_field_t;
 
 typedef struct {
-- 
2.25.1


