Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBR1-00069w-Rf
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQz-000688-JW
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58065
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQy-0002DJ-3B
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A/65hCauFJWnN1aX2rplyb0BxyGjWV4gUFeVpgMNSns=;
 b=KYfUZ28mcwGtVsvsxqV6rMzAnkVDM6ZkwipFXF3XevrLDvEYEaCTeCbluiXQ2b9U6Fasbn
 iG1sjhQ9RGt5VgLab0ndu5zoXqge8L4Zvr08cm/3KYcVVBGa+wtE0sSLZWhMVuccv7+L9M
 iSxDKc5Opr9bXWFEp5921Xwv3yjiMtg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-H1P8aYJuMV-aVIZrIMOYhg-1; Fri, 22 May 2020 13:26:07 -0400
X-MC-Unique: H1P8aYJuMV-aVIZrIMOYhg-1
Received: by mail-wr1-f69.google.com with SMTP id x8so4651724wrl.16
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A/65hCauFJWnN1aX2rplyb0BxyGjWV4gUFeVpgMNSns=;
 b=Nzk1lFF/XbNj3pax8mMEPeHv6OB1dXaAubCiiDLHIFa7pz5g0VHVsSQQkuciB9M4RK
 BpGgOWWWLVWugZpCjVhy/dNHOc015AWNveNm6dPXKfeSreWUpQEC26T19rfJmVaxV+SX
 XEuWKVoONohC1MEcl4K7i/d8GZxN7LZIbbIq0qUgOOqgBaTqwQMJS1cvbYibxXOax9MT
 y6Hwrmy+36U/yux0PovVMOutOnHEUx8ewywdPpEuJW+la4DNptlQM3wzXopi2D9DdSXu
 tBpS2MeqHZpvF+anEPP+XHb683YrkFMM7HV+Nc33n1h6fLIqjAnor98omhkkbrpBHUey
 Gy8w==
X-Gm-Message-State: AOAM5333xsogYcfKU6pbYMUJ+7r1DzETqCHESHOHAU2zmEAJteCg0M3Y
 yrHB+Onvl8C28bHQogWyqf3C+vdVqznwLbrmy5aWXiHiCtVV3ZpxNwXjATYDlS+bOHQfRvkC2fl
 i1l2EX5wne0FQ8Bw=
X-Received: by 2002:a1c:3286:: with SMTP id
 y128mr14098676wmy.119.1590168366481; 
 Fri, 22 May 2020 10:26:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ2jn4vcc1lpzn1Jd/+BJJz7hF/aOi8fySzYENyWUQr32lYyvFDfORNkUcXHU0iv645P4A2w==
X-Received: by 2002:a1c:3286:: with SMTP id
 y128mr14098664wmy.119.1590168366319; 
 Fri, 22 May 2020 10:26:06 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id t82sm10579255wmf.10.2020.05.22.10.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:26:05 -0700 (PDT)
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
Subject: [PATCH v4 11/13] target/s390x: Restrict CpuClass::get_crash_info() to
 system-mode
Date: Fri, 22 May 2020 19:25:08 +0200
Message-Id: <20200522172510.25784-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 11:12:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 22 May 2020 17:26:14 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/s390x/cpu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index ca50b70451..08eb674d22 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -247,6 +247,7 @@ out:
     error_propagate(errp, err);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
 {
     GuestPanicInformation *panic_info;
@@ -256,11 +257,7 @@ static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
     panic_info = g_malloc0(sizeof(GuestPanicInformation));
 
     panic_info->type = GUEST_PANIC_INFORMATION_TYPE_S390;
-#if !defined(CONFIG_USER_ONLY)
     panic_info->u.s390.core = cpu->env.core_id;
-#else
-    panic_info->u.s390.core = 0; /* sane default for non system emulation */
-#endif
     panic_info->u.s390.psw_mask = cpu->env.psw.mask;
     panic_info->u.s390.psw_addr = cpu->env.psw.addr;
     panic_info->u.s390.reason = cpu->env.crash_reason;
@@ -286,6 +283,7 @@ static void s390_cpu_get_crash_info_qom(Object *obj, Visitor *v,
                                      errp);
     qapi_free_GuestPanicInformation(panic_info);
 }
+#endif
 
 static void s390_cpu_initfn(Object *obj)
 {
@@ -295,16 +293,16 @@ static void s390_cpu_initfn(Object *obj)
     cpu_set_cpustate_pointers(cpu);
     cs->halted = 1;
     cs->exception_index = EXCP_HLT;
+#if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "crash-information", "GuestPanicInformation",
                         s390_cpu_get_crash_info_qom, NULL, NULL, NULL);
-    s390_cpu_model_register_props(obj);
-#if !defined(CONFIG_USER_ONLY)
     cpu->env.tod_timer =
         timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
     cpu->env.cpu_timer =
         timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
 #endif
+    s390_cpu_model_register_props(obj);
 }
 
 static void s390_cpu_finalize(Object *obj)
@@ -488,13 +486,13 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->do_interrupt = s390_cpu_do_interrupt;
 #endif
     cc->dump_state = s390_cpu_dump_state;
-    cc->get_crash_info = s390_cpu_get_crash_info;
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_s390_cpu;
+    cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
 #ifdef CONFIG_TCG
     cc->cpu_exec_interrupt = s390_cpu_exec_interrupt;
-- 
2.21.3


