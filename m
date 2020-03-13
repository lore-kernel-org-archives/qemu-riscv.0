Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpCG-0001hJ-LC
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpCB-0001aI-OM
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpC9-0005CZ-IL
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:38:07 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34492
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpC9-0005B9-5q
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MOJ97Mg3uK0x1VWiafJ67lfSZFLwR4mry93M3PzeTE=;
 b=XIYSYisvM95Af3fWw7nYZzTplHxmjkStADU3uyEILCsJyyExYyqMRsbSzvf/VGJBXNtkW8
 2/rRdAsC+DKYRDptOH92jKggvnC4jJxrrI4IDqlpCIFeivkUT2Bm+a4St/A5h8XsoUWSo8
 9J26HPLTeUS3W1pmwiYBM7h4aLjZsLE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-0KqIvnGYMt-sF-PMDYP1TA-1; Fri, 13 Mar 2020 14:38:02 -0400
X-MC-Unique: 0KqIvnGYMt-sF-PMDYP1TA-1
Received: by mail-wr1-f72.google.com with SMTP id t4so1772595wrv.9
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bmLIgnK8nZe09V5xRPW03+txWxMqC+nMqZrcX0UoUn8=;
 b=FqkVmgY7gkuVWysZu3W3Tbz1E8NTIrRpqPsvM1OOuJeJUc+n4YZPO3RVsvCr2sXdYW
 vuxGhQWTPUf7SxzR8z7VpfGOq0iH7qhwGOZX8cO5Jpaj5Ngym2B6S746JLgW3A6N9TZ6
 3ChNrhjbjq1qFwTIhfRjWnEdHV1h6MjJi6ulzyYXHkqLq80dMAUVumm6r1kImQ6pDxsR
 bcSFZ8tf6MyaiZCiwjPUl9C49/QudaqGcdyHgbcmR9SWO9bguag8NkJV3kn6ofy01Vl/
 hPHbAE51h1DI0X0L8F7FpZ4cDghXTV+jm0t2QmFcuq7gbtAH4ClY0Lea3Ddb/KWkOcps
 jMdQ==
X-Gm-Message-State: ANhLgQ1C2aXP4u0kvthK9iIg7CjUa+zYTcQADdl1O+5JTeLoY7IOd7SX
 YTM9BFxTbDHUhVMzy+a2FBtmDpL2QYx4PYp2sH1ZEZyrDKQVNDYKh08htDa8hv5B8FcMahywbn3
 NmdwrkjAAaM0WjRU=
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr12077986wme.30.1584124681697; 
 Fri, 13 Mar 2020 11:38:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtclmKmGWDITHGPwMFiNasidZXEOeI/Khix6i2umLsjJPJ2oehdsOA5I9WH66oYsI9Bk4vE/A==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr12077972wme.30.1584124681479; 
 Fri, 13 Mar 2020 11:38:01 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id q4sm36337983wro.56.2020.03.13.11.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:38:01 -0700 (PDT)
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
Subject: [PATCH 13/14] target/s390x: Restrict CpuClass::get_crash_info() to
 system-mode
Date: Fri, 13 Mar 2020 19:36:51 +0100
Message-Id: <20200313183652.10258-14-philmd@redhat.com>
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
X-List-Received-Date: Fri, 13 Mar 2020 18:38:09 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/s390x/cpu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 3dd396e870..3b1377c20a 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -237,6 +237,7 @@ out:
     error_propagate(errp, err);
 }
=20
+#if !defined(CONFIG_USER_ONLY)
 static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
 {
     GuestPanicInformation *panic_info;
@@ -246,11 +247,7 @@ static GuestPanicInformation *s390_cpu_get_crash_info(=
CPUState *cs)
     panic_info =3D g_malloc0(sizeof(GuestPanicInformation));
=20
     panic_info->type =3D GUEST_PANIC_INFORMATION_TYPE_S390;
-#if !defined(CONFIG_USER_ONLY)
     panic_info->u.s390.core =3D cpu->env.core_id;
-#else
-    panic_info->u.s390.core =3D 0; /* sane default for non system emulatio=
n */
-#endif
     panic_info->u.s390.psw_mask =3D cpu->env.psw.mask;
     panic_info->u.s390.psw_addr =3D cpu->env.psw.addr;
     panic_info->u.s390.reason =3D cpu->env.crash_reason;
@@ -276,6 +273,7 @@ static void s390_cpu_get_crash_info_qom(Object *obj, Vi=
sitor *v,
                                      errp);
     qapi_free_GuestPanicInformation(panic_info);
 }
+#endif
=20
 static void s390_cpu_initfn(Object *obj)
 {
@@ -285,16 +283,16 @@ static void s390_cpu_initfn(Object *obj)
     cpu_set_cpustate_pointers(cpu);
     cs->halted =3D 1;
     cs->exception_index =3D EXCP_HLT;
+#if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "crash-information", "GuestPanicInformation",
                         s390_cpu_get_crash_info_qom, NULL, NULL, NULL, NUL=
L);
-    s390_cpu_model_register_props(obj);
-#if !defined(CONFIG_USER_ONLY)
     cpu->env.tod_timer =3D
         timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
     cpu->env.cpu_timer =3D
         timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
 #endif
+    s390_cpu_model_register_props(obj);
 }
=20
 static void s390_cpu_finalize(Object *obj)
@@ -477,13 +475,13 @@ static void s390_cpu_class_init(ObjectClass *oc, void=
 *data)
     cc->do_interrupt =3D s390_cpu_do_interrupt;
 #endif
     cc->dump_state =3D s390_cpu_dump_state;
-    cc->get_crash_info =3D s390_cpu_get_crash_info;
     cc->set_pc =3D s390_cpu_set_pc;
     cc->gdb_read_register =3D s390_cpu_gdb_read_register;
     cc->gdb_write_register =3D s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug =3D s390_cpu_get_phys_page_debug;
     cc->vmsd =3D &vmstate_s390_cpu;
+    cc->get_crash_info =3D s390_cpu_get_crash_info;
     cc->write_elf64_note =3D s390_cpu_write_elf64_note;
 #ifdef CONFIG_TCG
     cc->cpu_exec_interrupt =3D s390_cpu_exec_interrupt;
--=20
2.21.1


