Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zW-0008NV-A7
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zQ-0008EX-F9
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:08 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zO-0007pD-Dv
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:08 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so5422915pjb.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832925;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QrDNSJ01MNe4AZXUogDwvS66/gkFhC+s8KaVpjsj/Go=;
 b=cY+01czx0GDG0q30miN71rwDnbe+cNDymj71s7DGyMLnhhFtADQ4Mf/jE0uWX17GTP
 AJjyj4bgPIQI845o4k/5bBBRXwBUl6zuT1wNcj9koa4GMq4uXi3AVur4vHuL6dsBmd2h
 Z7xPP443EFN+aO6RR9R78ADwprefIvYwJ9yXEjlx57Cumr7M5rlKVWhiC22GT4fS/beR
 rgMn84uF7dxatN9rxAGQavUO6t9znPDYeqy0Rzf0KYpdrLhVmUjcC9oRnNVZpuejNZ8B
 X8VacJ9QL7+A32I1yGNFix6aF7dZem9itykOdz7gtwkiI/dKg5n0dBBD73nNVGFiHQdb
 0/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832925;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QrDNSJ01MNe4AZXUogDwvS66/gkFhC+s8KaVpjsj/Go=;
 b=Y2qN+5+d1/sLqhU/cvzN8DW+FqyZM/S26be5/PHjjnBXEvzvTlmkEuSkCbiY25ZU0D
 v51bxBBhbmDXPI1x+J90wt135INqsaqgU1OXCPCV/w62QS0Nbl99+6O/7jaYh/VSiNJO
 D5QokgLHPYjYEV5cFsQ7PhP6XNbcBSGe1zU9HGrCnsrr/QusAREugOxafuCPci71BtwS
 DmTha1FprbURJBRR0SXtZ0YYCx5LqKGlB0RgLT+TCr0JRepzA3etZeBlQ4VTEonD8Mf+
 ctuahUnTD46gCnN2xUWkfcaxxSNdYz4h5Nfqe5aq7zLw00kjv0qmUPYd6Tv4t5K1S0Tz
 bZBA==
X-Gm-Message-State: AO0yUKUJOMPyjOb+HIEgSgRpBbMwVQxVX2BwcuPxrAMq/qAsK/KDg2Dx
 aQ2RnUL5RoH2UcSkng8/RGau7Z9iWfF9U2Sg
X-Google-Smtp-Source: AK7set8U+HRbMNTXrUD5d4kntWKvfl0yzqKA2SWDZ27fnPtaFV3ZOHACszKb7zshwcj5AVIKjFH+tg==
X-Received: by 2002:a05:6a20:65a8:b0:cc:491f:420b with SMTP id
 p40-20020a056a2065a800b000cc491f420bmr1437459pzh.8.1677832924845; 
 Fri, 03 Mar 2023 00:42:04 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 b13-20020aa7870d000000b0058dbd7a5e0esm1028113pfo.89.2023.03.03.00.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:04 -0800 (PST)
Subject: [PULL 35/59] target/riscv: gdbstub: Turn on debugger mode before
 calling CSR predicate()
Date: Fri,  3 Mar 2023 00:37:16 -0800
Message-Id: <20230303083740.12817-36-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:08 -0000

From: Bin Meng <bmeng@tinylab.org>

Since commit 94452ac4cf26 ("target/riscv: remove fflags, frm, and fcsr from riscv-*-fpu.xml")
the 3 FPU CSRs are removed from the XML target decription. The
original intent of that commit was based on the assumption that
the 3 FPU CSRs will show up in the riscv-csr.xml so the ones in
riscv-*-fpu.xml are redundant. But unforuantely that is not true.
As the FPU CSR predicate() has a run-time check on MSTATUS.FS,
at the time when CSR XML is generated MSTATUS.FS is unset, hence
no FPU CSRs will be reported.

The FPU CSR predicate() already considered such a case of being
accessed by a debugger. All we need to do is to turn on debugger
mode before calling predicate().

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-12-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 294f0ceb1c..ef52f41460 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -280,6 +280,10 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     int bitsize = 16 << env->misa_mxl_max;
     int i;
 
+#if !defined(CONFIG_USER_ONLY)
+    env->debugger = true;
+#endif
+
     /* Until gdb knows about 128-bit registers */
     if (bitsize > 64) {
         bitsize = 64;
@@ -308,6 +312,11 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "</feature>");
 
     cpu->dyn_csr_xml = g_string_free(s, false);
+
+#if !defined(CONFIG_USER_ONLY)
+    env->debugger = false;
+#endif
+
     return CSR_TABLE_SIZE;
 }
 
-- 
2.39.2


