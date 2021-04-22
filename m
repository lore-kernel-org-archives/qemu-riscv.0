Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfAR-0001de-Ed
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAQ-0001aa-7t; Thu, 22 Apr 2021 15:39:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAO-00054f-LD; Thu, 22 Apr 2021 15:39:14 -0400
Received: by mail-wr1-x434.google.com with SMTP id j5so44972311wrn.4;
 Thu, 22 Apr 2021 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQ0OTstwzXipk72lX8fvK3spe8ZEv2YAFM7sdltFU54=;
 b=XsECYQeA0vYxkQKq3dzRp0V6pd8KYBOChMaWmud3e5WYTrowIfSlwCL8arCzXQrffX
 nJzorNLQxBGMWTnnOFYJ68t6oLMP0rpgwNwocTsqmQrEP5ga5/SPlGP1IKjaepAWb1L0
 87FFxSPeFYYAGGtK9Vy0FBFezSkbfTmV0DTFqR4R1UV3bjBiUHfABorbuRPB5ndusEZT
 eNYL0Rzq7wNEX2QKAzdBFjlSKwQ/TiNI1Qv3AFZAyTsvUNiiC/Oggjf8Xcq8X0y2YkTD
 wauDC4lIswKGkuwqtG4ahH0aczGqFdCwZCzhdFo9oM7Z2MbuRU2uHRcr79FraOx9d7xX
 NPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JQ0OTstwzXipk72lX8fvK3spe8ZEv2YAFM7sdltFU54=;
 b=OwHNbt9mwgB8yHmZ2d7kP1+NPS9lzUXWG9f33x4giU2yB9eaKm6ZHLd3VY1HjqD92w
 yelb2x/FaVUPKvrpaGwErqbXu5OPuI0ceI9dPz/ZMBx6dOJ0UPoBSb0NJqWFIBi5tQDQ
 rfQinTK4LRXSAyIBI1Ni/u4zJrO89lvQzImZUpXQILOfTL2nFC1zoSiFz2aB0Wu9f5ji
 i980dlNdtQsRLbo6hd/6IPIA+e4ryRNv4FDhECs8tGe79tfBJNxDyGiMfuyGjVw7lW1V
 oexupZ871r4Vf+3t6OKkEzXbAAi6GV6gMemfXGuBq+8d69orRu7DdO9Rrz5jCfkSlYnS
 Mb4g==
X-Gm-Message-State: AOAM531NINj2xmYBA83pZH0bwvnsMqt/1IxAdFZBz1xZ3C2MydDd/Zgr
 9N4HXIcrZ6jepD696UIDZnj/1RHsPy/8/g==
X-Google-Smtp-Source: ABdhPJxkIHTLlIrnfc0PfGxVKlmYsgsR1VXA0r88c172xrSDPBQBIB4uLohA0bTO4AXzsKO6bcBVLA==
X-Received: by 2002:adf:a1cd:: with SMTP id v13mr17583wrv.332.1619120349602;
 Thu, 22 Apr 2021 12:39:09 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l14sm4193994wmq.4.2021.04.22.12.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 01/18] cpu: Un-inline cpu_get_phys_page_debug and
 cpu_asidx_from_attrs
Date: Thu, 22 Apr 2021 21:38:45 +0200
Message-Id: <20210422193902.2644064-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 22 Apr 2021 19:39:14 -0000

To be able to later extract the cpu_get_phys_page_debug() and
cpu_asidx_from_attrs() handlers from CPUClass, un-inline them
from "hw/core/cpu.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 33 ++++-----------------------------
 hw/core/cpu.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c68bc3ba8af..9338e80aa4b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -580,18 +580,8 @@ void cpu_dump_statistics(CPUState *cpu, int flags);
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
-                                                   MemTxAttrs *attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->get_phys_page_attrs_debug) {
-        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
-    }
-    /* Fallback for CPUs which don't implement the _attrs_ hook */
-    *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->get_phys_page_debug(cpu, addr);
-}
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                     MemTxAttrs *attrs);
 
 /**
  * cpu_get_phys_page_debug:
@@ -603,12 +593,7 @@ static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
-{
-    MemTxAttrs attrs = {};
-
-    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
-}
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
 /** cpu_asidx_from_attrs:
  * @cpu: CPU
@@ -617,17 +602,7 @@ static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
  * Returns the address space index specifying the CPU AddressSpace
  * to use for a memory access with the given transaction attributes.
  */
-static inline int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    int ret = 0;
-
-    if (cc->asidx_from_attrs) {
-        ret = cc->asidx_from_attrs(cpu, attrs);
-        assert(ret < cpu->num_ases && ret >= 0);
-    }
-    return ret;
-}
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
 #endif /* CONFIG_USER_ONLY */
 
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07de..4dce35f832f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -94,6 +94,38 @@ static void cpu_common_get_memory_mapping(CPUState *cpu,
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                                   MemTxAttrs *attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_phys_page_attrs_debug) {
+        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
+    }
+    /* Fallback for CPUs which don't implement the _attrs_ hook */
+    *attrs = MEMTXATTRS_UNSPECIFIED;
+    return cc->get_phys_page_debug(cpu, addr);
+}
+
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
+{
+    MemTxAttrs attrs = {};
+
+    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
+}
+
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    int ret = 0;
+
+    if (cc->asidx_from_attrs) {
+        ret = cc->asidx_from_attrs(cpu, attrs);
+        assert(ret < cpu->num_ases && ret >= 0);
+    }
+    return ret;
+}
+
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
-- 
2.26.3


