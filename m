Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFg2v-00043B-7R
	for mharc-qemu-riscv@gnu.org; Fri, 26 Feb 2021 11:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg2r-0003xo-32; Fri, 26 Feb 2021 11:32:49 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg2o-0007Zm-Q3; Fri, 26 Feb 2021 11:32:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h98so9140259wrh.11;
 Fri, 26 Feb 2021 08:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
 b=hS9C85/oo+y2Yc3FC6Hq/wW/6MOhCok3wlDBQ4fIK52mjwH2SNfsJdL9E4jDk6uF1u
 myIEPX+MIlA7yhaqncVRUft7WD5a2sGTSy4m7qD9w+Ru1ghouBPLbXMUkgjLKP9A/JwC
 f2yyUJC0cJrgj18U/TsJnGx54V7jPmV8qThIGZrRPXwNgvJn5RNqtobZfdSV18lKrNUv
 xxlbIfgP8O4+byfH+OTqYKKyhCRQUa40K3PfApfYwWiCfxVkVJlkR4gv6Q7BqxNSpGS3
 bF0XQKAEs3JNuYdCPFU8mSNjtKCJd2Y3b9FtSnXhfVBQz9ANK1K8pWc8MUCUunQh2p7C
 BfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
 b=kfzyH0huvtDR/GKrRZpzK9ZMESTxA4FYYFEjKdr1ShYjqDdxK4LrZON3cT7SMQsm4S
 e6pMMIbg65FaqiIbkj5ioTiTh7bGBjACSVnE+TskthLKvxGmdcfUNo9VRSxKj/AiiYOj
 2LhRvlFmp/w9YAxnWlqOy0maQuMJQQ0DeM1nz+uYwv/0Y3mgLWj1HrqdGdPJnJe3Mk8x
 983mIJ5VECe2AS0BqUdPRchq66NVCxRG4uLSGkofnPuwjoXx8bNcfr6UhNoM1w/7/JMn
 2NiW5gFuC1uTQcHf/hr9nOIp5Ap8TlVLyBbsCILMVXrDTjc2Hb8aeacQX5K9QWbhkmzE
 m3Zg==
X-Gm-Message-State: AOAM530G3N9gwgLVQCvxk0mHmDGDQuscdjJQb3VcS2aWJPNBm9N7rVFe
 xf0yEln1GDRgTvtA/IzSj4ODqnpbOHI=
X-Google-Smtp-Source: ABdhPJzImIoHGIqzmSEscH67EA8q0vm8DYLiMAdRlkpSxbxE8lkYw/NVJptyGI7VkNaymQqhD75XBw==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr4034695wrm.221.1614357163853; 
 Fri, 26 Feb 2021 08:32:43 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b15sm14268366wmd.41.2021.02.26.08.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:32:43 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-ppc@nongnu.org,
 Marek Vasut <marex@denx.de>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Laurent Vivier <laurent@vivier.eu>, Anthony Green <green@moxielogic.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Greg Kurz <groug@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 02/16] cpu: Un-inline cpu_get_phys_page_debug and
 cpu_asidx_from_attrs
Date: Fri, 26 Feb 2021 17:32:13 +0100
Message-Id: <20210226163227.4097950-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Fri, 26 Feb 2021 16:32:52 -0000

To be able to later extract the cpu_get_phys_page_debug() and
cpu_asidx_from_attrs() handlers from CPUClass, un-inline them
from "hw/core/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 33 ++++-----------------------------
 hw/core/cpu.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d8..2d43f78819f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -578,18 +578,8 @@ void cpu_dump_statistics(CPUState *cpu, int flags);
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
@@ -601,12 +591,7 @@ static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
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
@@ -615,17 +600,7 @@ static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
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
2.26.2


