Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D0FC05024
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 21:39:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qj4tQ-0004xw-QH; Wed, 20 Sep 2023 17:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qj4tQ-0004xa-5n
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 17:37:56 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qj4tO-0006UO-MQ
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 17:37:55 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3ac97a50ab1so146904b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 14:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695245873; x=1695850673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wuGegwgck8ZEFasbqFPHbzSlisDssAI2uj1gevUmTVY=;
 b=CJNTg+XIarrDxpOvJpzkF1L82ZlAPQcXd/ztUufOEMpPguc0lmsYWxLqiFTD2bSI56
 Jar6LV8XRntEw6olWxi2z5LsYBKmc4pl2btHBISB0JzC4QIObvYcC2aFmAb/U7rSM4si
 +f1LKmORmf5ezYj2YUBkHU7PWRfoFy8IXhdTzyaf+L/OPbeAVd9Ke5HfyxorY9/US2BU
 WQDVicM7Pq7YeGM0RdLTOwm3l2x2DhF8/ELWL2W3Ieuz4iT8eKKyGsIwNoYBbKeLXQ1G
 82UHEPEa4KybxJwvn2ILUXA5mU9mIOoIs/1VlkGWU1B9BNzgALLkLUnN9coxPY8KvkRf
 SMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695245873; x=1695850673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wuGegwgck8ZEFasbqFPHbzSlisDssAI2uj1gevUmTVY=;
 b=dNAELhxX5lfdkVc5oWt9XbO262Y0LzIRQHg98qoehOxxQf+xGUstfAraBWMjOgBFnu
 ByldGQMkFViTtq1eD3N1IC4FrWuAfmSGByaCpECYfWB1QdRsQPGh19SEYhi5+qDf5DHQ
 +vpRk98Svgiy9OrXrVH95IoJz6Z3PyK71GDD+v7zzmGhS7wP3isiY5VyILIp2ovzfCj+
 iAwwA+DzBntP67O9lmbYRwVBtlI7kcSULWt1Xkbc0W/T/xMlbpIGt9Q/Rf+fzY8xcVXb
 9+1K9PkPfYBuIHW8D8c49KiQSlHCTLLS3pYFRvCGyCeYlF+s4QSsszUNHRNVjZd7/y7s
 eGdg==
X-Gm-Message-State: AOJu0YxiUVQucAO+m5C/Qf+5njFIQRKE/7dZ6kiJHkfxeylmv3JI77Ic
 ZZBO6OtuY8tg97LQ5Fzz6L10Mg==
X-Google-Smtp-Source: AGHT+IE0FQIXsImOFGvdL0B26UMsqCNheb/XWcMEh7MnJ0IcUpMYaEqRIDBvuLIdFjNOE6P/XcgBLg==
X-Received: by 2002:a05:6808:1a16:b0:3aa:1306:96e8 with SMTP id
 bk22-20020a0568081a1600b003aa130696e8mr4620035oib.1.1695245873364; 
 Wed, 20 Sep 2023 14:37:53 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 e1-20020a9d7301000000b006b83a36c08bsm64415otk.53.2023.09.20.14.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 14:37:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/8] target/riscv: add riscv_cpu_get_name()
Date: Wed, 20 Sep 2023 18:37:36 -0300
Message-ID: <20230920213743.716265-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920213743.716265-1-dbarboza@ventanamicro.com>
References: <20230920213743.716265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We'll introduce generic errors that will output a CPU type name via its
RISCVCPU pointer. Create a helper for that.

Use the helper in tcg_cpu_realizefn() instead of hardcoding the 'host'
CPU name.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 11 +++++++++++
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c |  4 +++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index eeeb08a35a..521bb88538 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -643,6 +643,17 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+char *riscv_cpu_get_name(RISCVCPU *cpu)
+{
+    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
+    const char *typename = object_class_get_name(OBJECT_CLASS(rcc));
+
+    g_assert(g_str_has_suffix(typename, RISCV_CPU_TYPE_SUFFIX));
+
+    return g_strndup(typename,
+                     strlen(typename) - strlen(RISCV_CPU_TYPE_SUFFIX));
+}
+
 static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 219fe2e9b5..3f11e69223 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -730,6 +730,7 @@ typedef struct isa_ext_data {
     int ext_enable_offset;
 } RISCVIsaExtData;
 extern const RISCVIsaExtData isa_edata_arr[];
+char *riscv_cpu_get_name(RISCVCPU *cpu);
 
 void riscv_add_satp_mode_properties(Object *obj);
 
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8c052d6fcd..f31aa9bcc4 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -563,7 +563,9 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
     Error *local_err = NULL;
 
     if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
-        error_setg(errp, "'host' CPU is not compatible with TCG acceleration");
+        g_autofree char *name = riscv_cpu_get_name(cpu);
+        error_setg(errp, "'%s' CPU is not compatible with TCG acceleration",
+                   name);
         return false;
     }
 
-- 
2.41.0


