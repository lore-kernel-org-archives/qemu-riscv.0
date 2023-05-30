Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618D4C77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 19:48:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45JS-0006nH-Ao; Tue, 30 May 2023 15:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JQ-0006lQ-L0
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:20 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JM-0004Kz-FT
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:20 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-19f62a4924eso1906227fac.1
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 12:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685476036; x=1688068036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=epKnUxMJfnjeboDrxMeafODKr32ZaDiCpV2zHkEuotc=;
 b=VJN/Hh9q14yxoxG4OGTtIkYSlc+3VXsIVqR5eX6T/q07V4XO0mPfAK0b1NzjBq5xCf
 +iEf04eFjAIihPfdInAyuSUSs3wCJKuAE7RTC0sb94W3jtF85a9nm2QZkyea8icgWTeb
 ddd0egsfvhJpP5w0N+kjbIzsMBWQN3gFAbMsdaMm4UlqnwLH+l+oVuNqJOl0lnhYS8o4
 xqWvvhC4yTrDUAROKbM89T2PExkH250Nt4JBH0KuoFqm/EOecILL/5Tkt/d8mG7kG5bC
 Hz8I5xfsC7Qjv0sw3pcKrnGysY8gwvpNxdrjFt721N+OoPFIscUl20YCWZM72x+jlFsY
 Skmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685476036; x=1688068036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epKnUxMJfnjeboDrxMeafODKr32ZaDiCpV2zHkEuotc=;
 b=I9if5Wh/ECCYTkuwNlcwkaGTbg/LH5IkHUnMx7NGPnX4ZsF8JJdPMAegVPUSz4F0S/
 oknekaRcmdVnmGMXbhWr+GjE0wlZ9+mnaR7L4f0oToRN1YUh8yx5lWxeVR2+vGRPf4QG
 9dR7oI8KuT/gOXDoyfAsbSabuH9EHN2rqusYMGq19/p2XKmIrcjbGMF3HhbTpiDyLIZj
 MDpuhgSn7cJ7v4xA4TXzYk9m/iyoDKP57/esmU5gszQFm+c6SF+LVSKqj7vA+206tb8s
 1ynwkOfKnzmXqJ4l48sOmmnNUmF9d8oM7Q9NthvDyN5evZrXYZxQmF0N5KGtzQ6OHQxz
 Aezg==
X-Gm-Message-State: AC+VfDydYljB32XlF5VnWtz/CZ+9o3EhHhbtexWW1Gq0b7Ha+SXoHtxU
 BBYnguJNLjfwH4lw96XTOnJYEMJqVNlkS4YVOS0=
X-Google-Smtp-Source: ACHHUZ7eGpAlmgmJQ0P9rQe10t5vM/aj6uYj3G3OmVfmL5H25zzINNMlG+k0v5uibkLcleTFK63/rw==
X-Received: by 2002:a05:6870:a2d5:b0:19a:48bc:cc9d with SMTP id
 w21-20020a056870a2d500b0019a48bccc9dmr1351868oak.41.1685476035871; 
 Tue, 30 May 2023 12:47:15 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (200-162-225-121.static-corp.ajato.com.br. [200.162.225.121])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056870a48300b0019fa8728b05sm342214oal.39.2023.05.30.12.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:47:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 14/16] target/riscv: adapt 'riscv_isa_string' for KVM
Date: Tue, 30 May 2023 16:46:21 -0300
Message-Id: <20230530194623.272652-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530194623.272652-1-dbarboza@ventanamicro.com>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

KVM is not using the same attributes as TCG, i.e. it doesn't use
isa_edata_arr[]. Add a new kvm_riscv_isa_string_ext() helper that does
basically the same thing, but using KVM internals instead.

The decision to add this helper target/riscv/kvm.c is to foster the
separation between KVM and TCG logic, while still using
riscv_isa_string_ext() from target/riscv/cpu.c to retrieve the string
to not overcomplicate things.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c       |  5 +++++
 target/riscv/kvm.c       | 19 +++++++++++++++++++
 target/riscv/kvm_riscv.h |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3c348049a3..ec1d0c621a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1956,6 +1956,11 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     char *new = *isa_str;
     int i;
 
+    if (riscv_running_KVM()) {
+        kvm_riscv_isa_string_ext(cpu, isa_str, max_str_len);
+        return;
+    }
+
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
         if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
             isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index b4193a10d8..675e18df3b 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -320,6 +320,25 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
     }
 }
 
+void kvm_riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
+                              int max_str_len)
+{
+    char *old = *isa_str;
+    char *new = *isa_str;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
+        RISCVCPUMultiExtConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
+        if (kvm_cpu_cfg_get(cpu, multi_ext_cfg)) {
+            new = g_strconcat(old, "_", multi_ext_cfg->name, NULL);
+            g_free(old);
+            old = new;
+        }
+    }
+
+    *isa_str = new;
+}
+
 static int kvm_riscv_get_regs_core(CPUState *cs)
 {
     int ret = 0;
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index e3ba935808..1a12efa8db 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -20,6 +20,8 @@
 #define QEMU_KVM_RISCV_H
 
 void kvm_riscv_init_user_properties(Object *cpu_obj);
+void kvm_riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
+                              int max_str_len);
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
 
-- 
2.40.1


