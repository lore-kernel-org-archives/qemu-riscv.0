Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0555BC7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 11:45:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1QS9-0003tS-Iv; Tue, 23 May 2023 07:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1QRu-0003qW-EA
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 07:45:07 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1QRr-0001n7-3z
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 07:45:06 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6af7d6f6f41so822877a34.1
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684842301; x=1687434301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8tC9xHsp7YitbY3D29NZKggJ0khrtm4YaHoMYnX/PA=;
 b=aSb3zFNJwj/dZX83KePPa3UvuFmSozUeSTD9tWtMpX5vSAdiciGhzdAKznV9saAJHp
 Z9rtwzVHv7pgZC8pNidFqvEAWd7dtjwpMSyQEvaEm2aXQ9Uh3Bsrb6ersZC21RJbt3xt
 Kmk41fA5jMvzviD7vuSF/moLqgDVMaQ6i0dQtheYNLkFC9oV0nfSFzahTbr+jcCiI9eS
 ni5hzgO4oc76l/deznyG1o25h5cGDAWq651RigLYfFqDfGppCgd4Wlf32Y+GK6r4sfec
 GHLEnGGzjKRkynlE0vhdZqmpBvtySpkvoDrvBlHGDcl8/AM1vK+4Xar7LoDt8EIYZC0c
 t00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684842301; x=1687434301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y8tC9xHsp7YitbY3D29NZKggJ0khrtm4YaHoMYnX/PA=;
 b=La1DWdmR9uI25Ef9O+9pZsjnNN0YG9bEz8PrBI/AW0qzIlcAB8ovU4DrkxRwQcnKgf
 DGCQKh8pwdCvMFd3AjrKrtcTu+g0Kgx7gXWp17cxkw6YKfqnlfTU8WAFJtzhtDLXPI1V
 w/YvYNY/yH+5n6Irg0Y064GDYOHehSzgciabnrDP6+afUUMSNFzb3wXifYNLS19sSWLC
 kWGjMLTD7A1F0l0reI0Le6H4aMuBx4hJG9P08aRlfW/so4EBK/gIpfptpn0bzukfqZrj
 Gc0MXUrO88XklWaWdgY69iejNuJZSOvJsMQP4A0rNBW8QnfoR3AnG1+bq9GxkuyoiQG1
 SJCw==
X-Gm-Message-State: AC+VfDx1RbsaLPbTANzATorae+2JI9OOu0KGqoXiLgFVpBLTYUh5ejlO
 NFkvPtK2Niou51BF4r8Y5+wBIQ==
X-Google-Smtp-Source: ACHHUZ6826BhCXA4vNOE8Xuwwg9Gh5yj0TlzvOpDCK1599c30smyt2l1mHK59CfjkxWYtA8qm66rtw==
X-Received: by 2002:a05:6808:b0b:b0:398:1849:ea55 with SMTP id
 s11-20020a0568080b0b00b003981849ea55mr2182645oij.50.1684842300743; 
 Tue, 23 May 2023 04:45:00 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 e3-20020acab503000000b003924c15cf58sm3799772oif.20.2023.05.23.04.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 04:45:00 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, alistair.francis@wdc.com, apatel@ventanamicro.com,
 palmer@rivosinc.com, dbarboza@ventanamicro.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH 1/2] target/riscv: Add a function to refresh the dynamic CSRs
 xml.
Date: Tue, 23 May 2023 04:44:53 -0700
Message-Id: <20230523114454.717708-2-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230523114454.717708-1-tommy.wu@sifive.com>
References: <20230523114454.717708-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=tommy.wu@sifive.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

When we change the cpu extension state after the cpu is
realized, we cannot print the value of some CSRs in the remote
gdb debugger. The root cause is that the dynamic CSR xml is
generated when the cpu is realized.

This patch add a function to refresh the dynamic CSR xml after
the cpu is realized.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h     |  2 ++
 target/riscv/gdbstub.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de7e43126a..dc8e592275 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -494,6 +494,7 @@ struct ArchCPU {
     CPUNegativeOffsetState neg;
     CPURISCVState env;
 
+    int dyn_csr_base_reg;
     char *dyn_csr_xml;
     char *dyn_vreg_xml;
 
@@ -781,6 +782,7 @@ void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
+void riscv_refresh_dynamic_csr_xml(CPUState *cs);
 
 uint8_t satp_mode_max_from_map(uint32_t map);
 const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 524bede865..9e97ee2c35 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -230,6 +230,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
         bitsize = 64;
     }
 
+    cpu->dyn_csr_base_reg = base_reg;
+
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
@@ -349,3 +351,13 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  "riscv-csr.xml", 0);
     }
 }
+
+void riscv_refresh_dynamic_csr_xml(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    if (!cpu->dyn_csr_xml) {
+        g_assert_not_reached();
+    }
+    g_free(cpu->dyn_csr_xml);
+    riscv_gen_dynamic_csr_xml(cs, cpu->dyn_csr_base_reg);
+}
-- 
2.38.1


