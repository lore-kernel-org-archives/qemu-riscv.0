Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlm-0004OD-Ru
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkN-0001JL-HL
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkM-0004FZ-93
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:19 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37559)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkM-0004Er-3y
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:18 -0500
Received: by mail-pl1-x635.google.com with SMTP id q4so511879pls.4
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ry1t5w/AUBs46P8m+luNQWRmOA9wsWcT30cF1fAoHS4=;
 b=qG7RwBtJ9ioBJ3C5pCZFfIMLr4AKaBIDSg0h9Cv+Y5X/F9ogdvgoOblHz0box3tLfU
 vKi9ivP9+sq1vmsp+YfWAB/ZN6LFMhETTSXbAWpjEzl1uF1WOMZ8RKkSB9Fxx8GixJyr
 V22FHr5QM51MAUJFmwfqbPycMgRAR9HwnO0iWKlloRi4/kGRocTuY5RWxsYO0Z3jFpaC
 i5qY+CzPHya8PGYWM/sn6iNalcKOSMR8FuwVyI0vhd/gD9QPsoJlAP2P0v6KcmTOblcZ
 MStGbms4Cp0DcBJzZz9/DDCLTMDi0NXv+L1FgguJwyPwYEQGqqEFdHAhN+vOQ4qb/fZN
 J2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ry1t5w/AUBs46P8m+luNQWRmOA9wsWcT30cF1fAoHS4=;
 b=nXHlIsWqOJ3u7JPp5N8LiRWdcDSTxRx0Q30H46fs2yFpdgtw7Hw2fZRgeokF7/zJWC
 sv4bRKShpWJ+TjYpLEIg8vHzmq10/4HVYjm/rhR6+6ezyNadSjxf+SN7hX8GwSR0t4Dl
 GokVQBbL/LeBgrywS4j5NUrYWb7ZbHwF4IY+ZPfwmSZfnds/GOB5+CCbCJKS6Xb6CTbt
 1itxECD6DOciEfQlLeIPrd0AoW7Mph9fKkKGonkgKcb8J1WoU6dvXaLN1BL1kJyrQrzf
 QF3CkpNulNmy+ga7/YnRkNz+LCkEqvB0a2jEn00up3ih0VXHApjj6aeU9OMlDMoByVy6
 P6hQ==
X-Gm-Message-State: ANhLgQ0bqD6aftntRUvSttytXVBiJV/MeatYFOHpm/DtkM0n7/ecB6HG
 MGip/0fio3+ADDk7SeW1C+T1gLs4e6K1Fg==
X-Google-Smtp-Source: ADFU+vupr1S5vsiD8LdWfFzdrVv1EI8aTQcTW+dtzbWkXLd8K2b9JSNp9CQgMzOWvqsVfhP1tnwlfA==
X-Received: by 2002:a17:90a:9303:: with SMTP id
 p3mr1185831pjo.35.1583196556762; 
 Mon, 02 Mar 2020 16:49:16 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id t15sm21932069pgr.60.2020.03.02.16.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:16 -0800 (PST)
Subject: [PULL 12/38] target/riscv: Add Hypervisor virtual CSRs accesses
Date: Mon,  2 Mar 2020 16:48:22 -0800
Message-Id: <20200303004848.136788-13-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::635
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:21 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/csr.c | 116 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bee639e92e..3fa8d2cfda 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -273,6 +273,7 @@ static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
+static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
 #if defined(TARGET_RISCV32)
 static const char valid_vm_1_09[16] = {
@@ -878,6 +879,111 @@ static int write_hgatp(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+/* Virtual CSR Registers */
+static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vsstatus;
+    return 0;
+}
+
+static int write_vsstatus(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vsstatus = val;
+    return 0;
+}
+
+static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                    target_ulong new_value, target_ulong write_mask)
+{
+    int ret = rmw_mip(env, 0, ret_value, new_value,
+                      write_mask & env->mideleg & vsip_writable_mask);
+    return ret;
+}
+
+static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mie & env->mideleg & VS_MODE_INTERRUPTS;
+    return 0;
+}
+
+static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
+{
+    target_ulong newval = (env->mie & ~env->mideleg) | (val & env->mideleg & MIP_VSSIP);
+    return write_mie(env, CSR_MIE, newval);
+}
+
+static int read_vstvec(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vstvec;
+    return 0;
+}
+
+static int write_vstvec(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vstvec = val;
+    return 0;
+}
+
+static int read_vsscratch(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vsscratch;
+    return 0;
+}
+
+static int write_vsscratch(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vsscratch = val;
+    return 0;
+}
+
+static int read_vsepc(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vsepc;
+    return 0;
+}
+
+static int write_vsepc(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vsepc = val;
+    return 0;
+}
+
+static int read_vscause(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vscause;
+    return 0;
+}
+
+static int write_vscause(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vscause = val;
+    return 0;
+}
+
+static int read_vstval(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vstval;
+    return 0;
+}
+
+static int write_vstval(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vstval = val;
+    return 0;
+}
+
+static int read_vsatp(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vsatp;
+    return 0;
+}
+
+static int write_vsatp(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vsatp = val;
+    return 0;
+}
+
 /* Physical Memory Protection */
 static int read_pmpcfg(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1091,6 +1197,16 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HTINST] =              { hmode,   read_htinst,      write_htinst     },
     [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
 
+    [CSR_VSSTATUS] =            { hmode,   read_vsstatus,    write_vsstatus   },
+    [CSR_VSIP] =                { hmode,   NULL,     NULL,     rmw_vsip       },
+    [CSR_VSIE] =                { hmode,   read_vsie,        write_vsie       },
+    [CSR_VSTVEC] =              { hmode,   read_vstvec,      write_vstvec     },
+    [CSR_VSSCRATCH] =           { hmode,   read_vsscratch,   write_vsscratch  },
+    [CSR_VSEPC] =               { hmode,   read_vsepc,       write_vsepc      },
+    [CSR_VSCAUSE] =             { hmode,   read_vscause,     write_vscause    },
+    [CSR_VSTVAL] =              { hmode,   read_vstval,      write_vstval     },
+    [CSR_VSATP] =               { hmode,   read_vsatp,       write_vsatp      },
+
     /* Physical Memory Protection */
     [CSR_PMPCFG0  ... CSR_PMPADDR9] =  { pmp,   read_pmpcfg,  write_pmpcfg   },
     [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
-- 
2.25.0.265.gbab2e86ba0-goog


