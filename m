Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpC9-0001Wg-KO
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpC5-0001PY-TZ
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:38:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpC4-00051w-PO
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:38:01 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24195
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpC4-00050P-LU
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMDYkzt1lBUpYc+oo4cCc5AD+w7GESjUgDgAA86mAF8=;
 b=aduHS4nk2CHl9mdgr5REBiEntNPGKcgOKOuZftgBgJCILfspbdG/mbVZFScpR+TBN0YQ48
 a0AUpvg8xQoyqp+LC0TigknhgeHCGUtnhlf/AI5t9ozfhc5C8qeHd6na+SYjn5XOiuPDQg
 DNAtyuHNDl9sHqkEhOXrihaq7oru7R4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-mLVvVeTBPxWWeWc1-JiPlw-1; Fri, 13 Mar 2020 14:37:58 -0400
X-MC-Unique: mLVvVeTBPxWWeWc1-JiPlw-1
Received: by mail-wr1-f70.google.com with SMTP id w11so4708060wrp.20
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IUJwu5mIghgObyHS7qfpHw05F+W1fo3IIale5ma1lsg=;
 b=a9hDNOq0MTTGWFOE6vd0WVlQwjv/J9vqPQpVODNoPGZO/clycDF5bkbCiI0uksdarS
 Q6WjAKiiObdpTiMz3HuD1vin4xqIO/pwpTLT7ZS2zRXEF986OztUnXH/eawWJXh0h+Bv
 c8zfLJtbm7RiKFojPPxaR8TZHgOQUu/OtDWX6n10pdda9mgcqhcrRIMF4smD6nRXR7IV
 tP2jUwuMFN7Ss7UxT/AXIkTJYufrQJSIWC5JoWlqRSlxfHBWl5tbWfCxTAnWZCIrB+QQ
 3YrfOcFhf8WUBeWsvP5RPyhv4P9S5MTp9beR+OkVoNjrbrGKzisBiki7fh2PFeIBimJp
 AbUg==
X-Gm-Message-State: ANhLgQ0X+oMj88EqBKeawJo4nNknj8Ca9NS76pnWk8o5ygaGMOfthpi3
 yyZ4E5B7Hdpt9ecDP6ICXZC6bHt1CdWF92qoI8+kq6+3EOmjW/YMOJoIMXPBuwEYDprgbcheViz
 5pn3UnwOS0dxd/pA=
X-Received: by 2002:a05:6000:12d2:: with SMTP id
 l18mr18412640wrx.240.1584124676640; 
 Fri, 13 Mar 2020 11:37:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuQgtDba68GKbgL+OtxixjWPY6YDPO3kDmuQFbZyGRp3cq7WJ2+l5hb5NCjjxv5ygLu7MTvmw==
X-Received: by 2002:a05:6000:12d2:: with SMTP id
 l18mr18412615wrx.240.1584124676447; 
 Fri, 13 Mar 2020 11:37:56 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id l18sm10978168wrr.17.2020.03.13.11.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 12/14] target/i386: Restrict CpuClass::get_crash_info() to
 system-mode
Date: Fri, 13 Mar 2020 19:36:50 +0100
Message-Id: <20200313183652.10258-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 13 Mar 2020 18:38:04 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/i386/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 92fafa2659..a84553e50c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6778,6 +6778,7 @@ static void x86_cpu_register_feature_bit_props(X86CPU=
 *cpu,
     x86_cpu_register_bit_prop(cpu, name, w, bitnr);
 }
=20
+#if !defined(CONFIG_USER_ONLY)
 static GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
 {
     X86CPU *cpu =3D X86_CPU(cs);
@@ -6821,6 +6822,7 @@ static void x86_cpu_get_crash_info_qom(Object *obj, V=
isitor *v,
                                      errp);
     qapi_free_GuestPanicInformation(panic_info);
 }
+#endif /* !CONFIG_USER_ONLY */
=20
 static void x86_cpu_initfn(Object *obj)
 {
@@ -6866,8 +6868,10 @@ static void x86_cpu_initfn(Object *obj)
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
@@ -7180,7 +7184,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc=
, void *data)
     cc->cpu_exec_interrupt =3D x86_cpu_exec_interrupt;
 #endif
     cc->dump_state =3D x86_cpu_dump_state;
-    cc->get_crash_info =3D x86_cpu_get_crash_info;
     cc->set_pc =3D x86_cpu_set_pc;
     cc->synchronize_from_tb =3D x86_cpu_synchronize_from_tb;
     cc->gdb_read_register =3D x86_cpu_gdb_read_register;
@@ -7191,6 +7194,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc=
, void *data)
     cc->asidx_from_attrs =3D x86_asidx_from_attrs;
     cc->get_memory_mapping =3D x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug =3D x86_cpu_get_phys_page_attrs_debug;
+    cc->get_crash_info =3D x86_cpu_get_crash_info;
     cc->write_elf64_note =3D x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote =3D x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note =3D x86_cpu_write_elf32_note;
--=20
2.21.1


