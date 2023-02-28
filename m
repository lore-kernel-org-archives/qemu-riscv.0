Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pX0Ip-0001Il-OU
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 08:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Ig-0000ud-0q; Tue, 28 Feb 2023 08:45:50 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Id-00031L-DP; Tue, 28 Feb 2023 08:45:48 -0500
Received: by mail-pl1-x629.google.com with SMTP id v11so6936894plz.8;
 Tue, 28 Feb 2023 05:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ev2CVyKGsCzMKHUvLG0iHRpibO1vkQP9ZxUX3Vfk3Ao=;
 b=POapXY1ccbaJRiv+Q98IlkPbzlu6mP+ecZDqBzD8XmQX1YwZxSLLoAXe2jaH1EHivI
 kd4gKCfC0IuzXwMxzkp7o6VjFj3S4fIRT1U7rAFwCqG+NAU+iV5sKLl8prxdsX8M+HiH
 ZYrp9uuqopa12BT8kDji2VvH/PIeM/pdhq/aOqBcfdhMyGMoCHnqK9ZwVEGiyuxpP6QX
 xGQI4lMXjz2KR9AqVCUvYSmVFo9yDSlEljSFAa21O49VHl6aXIuDgGixyXkzyMOSmDxS
 xSKnhNxNGY6OvC10QnaVwREPOG/Mi18yxCXcgZtcpJ2769fTSO/vLbSi/3YrMypv8JDy
 l+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ev2CVyKGsCzMKHUvLG0iHRpibO1vkQP9ZxUX3Vfk3Ao=;
 b=mWb3oi8eLh3NGmhFX3VJxcCoztCclhWN8hCNkWq9AX/3MBdlo3TVdqJNfNMJvZ/N1a
 0HxxynMVtiacq0WR3EnWWx2QKu3QL3/Iz6BSAl/MMIvDl4kBwu/smES6aFWdw5D5g8T6
 s74tPHV5w5B/NdVq9bbuFZv1C6CbLhx6/2gOiXm8vSmTMZbRM82Gnl+kRTkLMJxkK79o
 PVn3g+hxU7xxAkZw96ldK6jUg70VlvxE/p6qO0QehjcLCJcHFXdbKV9s7vQMFmBDXoGd
 l4p4D0MHxi7gOtjBs4meUaojYTJxZrsV8i7qOpmDZcknlIxPLAIlpsHWpZY0kNG6JvDi
 uCbw==
X-Gm-Message-State: AO0yUKWROWc4JFkYUVdWSKX/vMYItLyqMal5ovsN0e9vu/bOP5pP3tBG
 BtTNu9aKjMgzGFQtM1REPpks9CxJYuE=
X-Google-Smtp-Source: AK7set+H3N0ha7BWntU9uEHgBWaEUIUaPMj23WZfrL8DC2TiKRogo9Hn08/BT1fiwUFI0OnwB5qmPw==
X-Received: by 2002:a17:902:e54c:b0:19d:121a:6795 with SMTP id
 n12-20020a170902e54c00b0019d121a6795mr3547144plf.55.1677591941026; 
 Tue, 28 Feb 2023 05:45:41 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b0019b06263bcasm1556896pll.247.2023.02.28.05.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 05:45:40 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 12/18] target/riscv: gdbstub: Drop the vector CSRs in
 riscv-vector.xml
Date: Tue, 28 Feb 2023 21:45:29 +0800
Message-Id: <20230228104035.1879882-13-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Tue, 28 Feb 2023 13:45:52 -0000

From: Bin Meng <bmeng@tinylab.org>

It's worth noting that the vector CSR predicate() has a similar
run-time check logic to the FPU CSR. With the previous patch our
gdbstub can correctly report these vector CSRs via the CSR xml.

Commit 719d3561b269 ("target/riscv: gdb: support vector registers for rv64 & rv32")
inserted these vector CSRs in an ad-hoc, non-standard way in the
riscv-vector.xml. Now we can treat these CSRs no different from
other CSRs.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

(no changes since v1)

 target/riscv/gdbstub.c | 75 ------------------------------------------
 1 file changed, 75 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index ef52f41460..6048541606 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -127,40 +127,6 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-/*
- * Convert register index number passed by GDB to the correspond
- * vector CSR number. Vector CSRs are defined after vector registers
- * in dynamic generated riscv-vector.xml, thus the starting register index
- * of vector CSRs is 32.
- * Return 0 if register index number is out of range.
- */
-static int riscv_gdb_vector_csrno(int num_regs)
-{
-    /*
-     * The order of vector CSRs in the switch case
-     * should match with the order defined in csr_ops[].
-     */
-    switch (num_regs) {
-    case 32:
-        return CSR_VSTART;
-    case 33:
-        return CSR_VXSAT;
-    case 34:
-        return CSR_VXRM;
-    case 35:
-        return CSR_VCSR;
-    case 36:
-        return CSR_VL;
-    case 37:
-        return CSR_VTYPE;
-    case 38:
-        return CSR_VLENB;
-    default:
-        /* Unknown register. */
-        return 0;
-    }
-}
-
 static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
 {
     uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
@@ -174,19 +140,6 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
         return cnt;
     }
 
-    int csrno = riscv_gdb_vector_csrno(n);
-
-    if (!csrno) {
-        return 0;
-    }
-
-    target_ulong val = 0;
-    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
-
-    if (result == RISCV_EXCP_NONE) {
-        return gdb_get_regl(buf, val);
-    }
-
     return 0;
 }
 
@@ -201,19 +154,6 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
         return vlenb;
     }
 
-    int csrno = riscv_gdb_vector_csrno(n);
-
-    if (!csrno) {
-        return 0;
-    }
-
-    target_ulong val = ldtul_p(mem_buf);
-    int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
-
-    if (result == RISCV_EXCP_NONE) {
-        return sizeof(target_ulong);
-    }
-
     return 0;
 }
 
@@ -361,21 +301,6 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
         num_regs++;
     }
 
-    /* Define vector CSRs */
-    const char *vector_csrs[7] = {
-        "vstart", "vxsat", "vxrm", "vcsr",
-        "vl", "vtype", "vlenb"
-    };
-
-    for (i = 0; i < 7; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"%s\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"int\"/>",
-                               vector_csrs[i], TARGET_LONG_BITS, base_reg++);
-        num_regs++;
-    }
-
     g_string_append_printf(s, "</feature>");
 
     cpu->dyn_vreg_xml = g_string_free(s, false);
-- 
2.25.1


