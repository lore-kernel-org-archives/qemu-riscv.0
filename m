Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQw-00062T-3T
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQt-0005y5-Bi
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27953
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQr-0002Au-Qs
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njMVcw9nzb67by0KnDJJ20QJffO3+OPEhMt5z5q8uy0=;
 b=NuCItxMIcAEpTineeNVzcOJzxvowhhQA+sSIBdcK29OtJ7fj9Vg+fDmV/qgXbmp5tRzIy4
 rcuYIxw8mWU9osnWp55dkqR6NwiZcFq3+EWKNGguLvWuOZFhiYCSel61X3OK5+pl9MDwFd
 DM9LkbsXu7QqdXKoBdRIk0wsGdSsOSY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-SysUUl3NNSKmAOhKDYG7IQ-1; Fri, 22 May 2020 13:26:03 -0400
X-MC-Unique: SysUUl3NNSKmAOhKDYG7IQ-1
Received: by mail-wm1-f71.google.com with SMTP id t82so2914696wmf.4
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=njMVcw9nzb67by0KnDJJ20QJffO3+OPEhMt5z5q8uy0=;
 b=NDeouuDJX7iA9zDi+DSXlPyTIBQWwGRr7MRwpVPeH+at0VBGwaTr+jwIop9gEp14WA
 pr95LMTClKTpHm89lzMeE3gy8l+zHJKFvE6m+7F4+uE1wwFbw1fDI0bftKxcBvsNdpGg
 GbkrOr5uP+p5STg+nQ2D+mR45OyCydXj0DA5KaeeYz3+YKF3MSE2HKbOCPqyuj1hlS8A
 z3rcIUdcWYFzQBoTylba18vvkt286EjqzMAbph5MekZi33lxV1nTYH9l2cJeqK7SXXPv
 +mgpHJOOrrBmnHx9cTlApUz5jz/QH76nxCzmG2ZQljMDgqb3t3Iw6r7ZUD2SVVgDQW4W
 i3IA==
X-Gm-Message-State: AOAM531g+NhGDQL4co/Ap350QASx3g2DmPyLHhWxkeVgGE02jIJQNQx+
 E/R7ev6YfBLS1AYOnN3zEsXSq9igtIlKGgoXvWMTJrww5mpkkdqE4MGD/7X4Duak8jBHulX8Ggn
 xee6cNnY47aB3Fno=
X-Received: by 2002:a05:6000:1187:: with SMTP id
 g7mr4295112wrx.54.1590168361854; 
 Fri, 22 May 2020 10:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTWSYeq5PO/H81uw1oH1eRVrb4JRSLJ7bWz8JXtUZLG7fdkypR0KgHWeUhNA/fdldKY/EEVQ==
X-Received: by 2002:a05:6000:1187:: with SMTP id
 g7mr4295098wrx.54.1590168361652; 
 Fri, 22 May 2020 10:26:01 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 81sm10811338wme.16.2020.05.22.10.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:26:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v4 10/13] target/i386: Restrict CpuClass::get_crash_info() to
 system-mode
Date: Fri, 22 May 2020 19:25:07 +0200
Message-Id: <20200522172510.25784-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 08:01:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 17:26:07 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 7a4a8e3847..dd31c1de5f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6843,6 +6843,7 @@ static void x86_cpu_register_feature_bit_props(X86CPU *cpu,
     x86_cpu_register_bit_prop(cpu, name, w, bitnr);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -6886,6 +6887,7 @@ static void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
                                      errp);
     qapi_free_GuestPanicInformation(panic_info);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void x86_cpu_initfn(Object *obj)
 {
@@ -6932,8 +6934,10 @@ static void x86_cpu_initfn(Object *obj)
                         x86_cpu_get_unavailable_features,
                         NULL, NULL, NULL);
 
+#if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "crash-information", "GuestPanicInformation",
                         x86_cpu_get_crash_info_qom, NULL, NULL, NULL);
+#endif
 
     for (w = 0; w < FEATURE_WORDS; w++) {
         int bitnr;
@@ -7245,7 +7249,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
 #endif
     cc->dump_state = x86_cpu_dump_state;
-    cc->get_crash_info = x86_cpu_get_crash_info;
     cc->set_pc = x86_cpu_set_pc;
     cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
@@ -7256,6 +7259,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
+    cc->get_crash_info = x86_cpu_get_crash_info;
     cc->write_elf64_note = x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
-- 
2.21.3


