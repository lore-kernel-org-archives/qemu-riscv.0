Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd3A-0005D6-0m
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd35-000582-CP
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32757
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd31-0004BX-0P
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lHPd6DRGT3/QfAQv+8lMnqMpzhHq6WqmC6OekczJuuE=;
 b=K4mdq5N+/1NbdUvtIgGoh66lxUvyV58uuoWJ4JbSisEjyUM4+sVzdI/LykC4ilXdk2NsPC
 RYnVCwwrm578EU3H0x4opqShQ2s6uobJmDkOsxtkzVdJvyUupf7d5btMGviOBkNkcP+gWS
 rvwaC4+A7lA8EutzvyKLd7euIwQErBA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-VXpcItpSPL6ChgUbWMjAXg-1; Mon, 04 May 2020 11:30:14 -0400
X-MC-Unique: VXpcItpSPL6ChgUbWMjAXg-1
Received: by mail-wm1-f72.google.com with SMTP id b203so3694804wmd.6
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6+xvd3mxJRnG7uL+iwXoaJtRFRM8ce9ioU3VRg64KY=;
 b=I3+hr7gZQvVlGU4ZbY+uOtclDjt/C+nur9HY4FnINnW88L/bHMRC/NrblwUoXuChs/
 u7eXC5UH2iASs6tVzcM9TOZuRxmMQgF/1GaT14wP9GUOR5bhRls8Yw02Iynu8q5f+NNJ
 LyHpiMRJCZTQ32o2V1t/i3WXvLLxklrijQldJZI5gJCM8Zq5a8WwEHPxKrHVO2xld2Gu
 UOtiarWtunms+o/5UEtRGKS7lnAcn8dsSBAnckBzS4vyZkt+qLoYCyKyByOQvHJZk2Q4
 4rzqfnY+D8UyLY082jYR9OpGz3HussTk/1EZMMSF6vgbQFgSSxGUX25Q6IEJrEgYSnMg
 rwWw==
X-Gm-Message-State: AGi0Pua0X/ZMVtNNGD8NDtceY2//gH1lDfUntcut1uciw6VHJqRKFnLe
 +VcxYgYEtbqgziNiIfNvh5lQvwhutg0g+NzEbUfr9s4rTZUzSa+SlSVCOK1QPUuO03BF2cHUzmr
 UtlkDdbBGEbrsP6I=
X-Received: by 2002:a1c:9a81:: with SMTP id
 c123mr14483177wme.115.1588606213754; 
 Mon, 04 May 2020 08:30:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypKKhIo4R9drORflRphaERuyEWB3jMraFT2J2xJgoK941gxMvAR6QyLJQsGX+UXNYqtQ/lF/nw==
X-Received: by 2002:a1c:9a81:: with SMTP id
 c123mr14483150wme.115.1588606213381; 
 Mon, 04 May 2020 08:30:13 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id s24sm14363792wmj.28.2020.05.04.08.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:30:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Cornelia Huck <cohuck@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 10/12] target/i386: Restrict CpuClass::get_crash_info() to
 system-mode
Date: Mon,  4 May 2020 17:29:20 +0200
Message-Id: <20200504152922.21365-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:24:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 04 May 2020 15:30:29 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/i386/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9c256ab159..eec1ac7cea 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6848,6 +6848,7 @@ static void x86_cpu_register_feature_bit_props(X86CPU=
 *cpu,
     x86_cpu_register_bit_prop(cpu, name, w, bitnr);
 }
=20
+#if !defined(CONFIG_USER_ONLY)
 static GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
 {
     X86CPU *cpu =3D X86_CPU(cs);
@@ -6891,6 +6892,7 @@ static void x86_cpu_get_crash_info_qom(Object *obj, V=
isitor *v,
                                      errp);
     qapi_free_GuestPanicInformation(panic_info);
 }
+#endif /* !CONFIG_USER_ONLY */
=20
 static void x86_cpu_initfn(Object *obj)
 {
@@ -6937,8 +6939,10 @@ static void x86_cpu_initfn(Object *obj)
                         x86_cpu_get_unavailable_features,
                         NULL, NULL, NULL, &error_abort);
=20
+#if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "crash-information", "GuestPanicInformation",
                         x86_cpu_get_crash_info_qom, NULL, NULL, NULL, NULL=
);
+#endif
=20
     for (w =3D 0; w < FEATURE_WORDS; w++) {
         int bitnr;
@@ -7251,7 +7255,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc=
, void *data)
     cc->cpu_exec_interrupt =3D x86_cpu_exec_interrupt;
 #endif
     cc->dump_state =3D x86_cpu_dump_state;
-    cc->get_crash_info =3D x86_cpu_get_crash_info;
     cc->set_pc =3D x86_cpu_set_pc;
     cc->synchronize_from_tb =3D x86_cpu_synchronize_from_tb;
     cc->gdb_read_register =3D x86_cpu_gdb_read_register;
@@ -7262,6 +7265,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc=
, void *data)
     cc->asidx_from_attrs =3D x86_asidx_from_attrs;
     cc->get_memory_mapping =3D x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug =3D x86_cpu_get_phys_page_attrs_debug;
+    cc->get_crash_info =3D x86_cpu_get_crash_info;
     cc->write_elf64_note =3D x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote =3D x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note =3D x86_cpu_write_elf32_note;
--=20
2.21.3


