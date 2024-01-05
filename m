Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EA1C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:49:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmNR-0008KN-Rx; Fri, 05 Jan 2024 10:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNQ-000870-L6
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:52 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNN-0003Mr-9e
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:51 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d3c4bfe45so14901575e9.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469486; x=1705074286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yaDY8QYkk1W3Mtkw1yjFTsfcx0RHMGOL7zHOvOfrIZM=;
 b=e0UxCDTe7uC6Btd804/EDt7+PG+Ds0D00DG/EVBQrzOpEe6+QkvJ0DdQ1yGT0xMxU0
 9AtLoRfcZSHlExD4IvNCcjuOIrD/DiOpy0Stbt2tLIaf7aQ4PolGj5kVd0skddfr4qpn
 TtBXQYvfHcNPNDCVH6RgBaWkhxMwbOdKuym0iN7dE73005aeQgZojXflBXNwmiFUlhg4
 KFIpm/iRGxopyZN21KKqOyt3rkPiQRfa7NFqw8uOmm6mb2saDC1sKiZQFQI97I+xWZdh
 Pa3l01zBGOt3podG0IFl4+5ZMxq56KJP+XERACQTScimEqejRxmXqOE7/EbpRCZhEhxk
 GCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469486; x=1705074286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yaDY8QYkk1W3Mtkw1yjFTsfcx0RHMGOL7zHOvOfrIZM=;
 b=hATq24O0ZZKQlclD69qUXNcqV6myqsJrc/uw1g7Lr2BAcEDK4uBMfKaXaMCSD5ibfz
 CuOInZ0kfk94QczfdXbLQKOV6h8IfCA4A3ZiwKoPfE38tQOTTHLc92EmklsjHaNBZ2kt
 Pw8FXZcrheMDcK+6KO2bkdGVefj4jnbg4dL/mqTsvoluPALZW5ybl5bXzYgDW5Lo5mnE
 qY5bzVTo5dvsL9CSBOGGTJFcLgSRAh7lrgovidXCVY01d2VSACWuH3DO4BfJGD4687RM
 LNNf0sXLjZBCfesAY2+rNhjJOPhEmcP6L0iGY1kn221jSSiSwns7NMkiHkqaupIiJr8a
 RZfA==
X-Gm-Message-State: AOJu0YxnWeeEBcnXRLiMdMU7mea4RNJeXOc0PJsOhPt4SFBOKSMtUvFj
 yeo1EpdMuWk+Bp3wkBY/ZhvMJEX96shSqZIhP+fhfgia1vM=
X-Google-Smtp-Source: AGHT+IHY0byHYmf47rQ0Ty7m/fu8y+dbBIzHFBSmQY01g5UcWP8GuA3ykeJeMDCIdpydsqIuGbE0Mg==
X-Received: by 2002:a05:600c:450d:b0:40d:938e:6b49 with SMTP id
 t13-20020a05600c450d00b0040d938e6b49mr697221wmo.131.1704469486736; 
 Fri, 05 Jan 2024 07:44:46 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b0040e375604ecsm1940574wmo.31.2024.01.05.07.44.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PULL 16/71] target/openrisc: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:09 +0100
Message-ID: <20240105154307.21385-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-or1k -cpu ?
Available CPUs:
  or1200
  any

After it's applied:

[gshan@gshan q]$ ./build/qemu-or1k -cpu ?
Available CPUs:
  any
  or1200

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-17-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/openrisc/cpu.h |  3 ---
 target/openrisc/cpu.c | 42 ------------------------------------------
 2 files changed, 45 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index dedeb89f8e..b454014ddd 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -299,15 +299,12 @@ struct ArchCPU {
     CPUOpenRISCState env;
 };
 
-void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void openrisc_translate_init(void);
 int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 
-#define cpu_list cpu_openrisc_list
-
 #ifndef CONFIG_USER_ONLY
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index f7d53c592a..381ebe00d3 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -253,48 +253,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops = &openrisc_tcg_ops;
 }
 
-/* Sort alphabetically by type name, except for "any". */
-static gint openrisc_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_OPENRISC_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_OPENRISC_CPU) == 0) {
-        return -1;
-    } else {
-        return strcmp(name_a, name_b);
-    }
-}
-
-static void openrisc_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename,
-                     strlen(typename) - strlen("-" TYPE_OPENRISC_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void cpu_openrisc_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_OPENRISC_CPU, false);
-    list = g_slist_sort(list, openrisc_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, openrisc_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_OPENRISC_CPU_TYPE(cpu_model, initfn) \
     {                                               \
         .parent = TYPE_OPENRISC_CPU,                \
-- 
2.41.0


