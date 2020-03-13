Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpCH-0001ky-RW
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55207)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpCF-0001fe-9e
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpCE-0005JP-B1
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:38:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49437
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpCE-0005Ie-7k
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jc8uJI+fsWVnbFhna2J0NMxSMRDSs2zyN/X211eVidg=;
 b=VJMFgh8wePuhNQlXobRZINQbC7TRe3W7lo54xw1kZogeKfYTqOBj0DJZi/+L4n9FEGoFdc
 t4liTHmtGzaFFQJKmTmpQJxzLQ192LJd8pQHq+vXHrcWy8x68tp5ZjNo7LOP9RE1Y+4h2t
 mbjhJtQKkp8utn9qSzGjfiqUcLIOosg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-5ZmgKlOkMCir8LblkdIi7A-1; Fri, 13 Mar 2020 14:38:08 -0400
X-MC-Unique: 5ZmgKlOkMCir8LblkdIi7A-1
Received: by mail-wm1-f72.google.com with SMTP id n25so3298322wmi.5
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oL9lM1TjQ9zbVx8kM0/Y3ow0t+KGUtP0TdO5NgiCTHI=;
 b=NpW6A6cTU0Vggw8Nd5iGhsSORAnwShTI12i4GQhd3MJqbEPrffsiQL9KGmrE5LbGiA
 jDS0AX/N7dqHm+Y9pzOHKCCMQ5lXY6+6BqN90uruqMUuA7qg/rHnvq9fal2ehG4USS/q
 QMJYuGNZIYjeJ7sZ2OboiC6sSS2latML+BkHs/iUlCzj7xFN94huSsFQ6MbCiY0pH+Cl
 ZWbM5WgBcJHsuuoWI0bqSwH9iTsaw1CD1EvDGmNGyU5zO6hNIz/w/GPj/jagFKwFxj8x
 kBx746VN4q1BG6xy+ENgFNC5wktpFQKqRoR13YJG8UCiAuxpl9UTyt6JxHdTion6rgW6
 MkBQ==
X-Gm-Message-State: ANhLgQ08rqS/wDFvjEAM8gtd6obnvn1yDoqu7MqrU92VvXDTl+76/9zw
 BKyuWxiXF5DngB5+ShHQINgsSaKmeRCH4JTyNoBUjtve9hE3OSffpRg6IPGop19XJO77wHr1ZgV
 6TdrQfAzInhW5Y6w=
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr12481667wmg.41.1584124686793; 
 Fri, 13 Mar 2020 11:38:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvkUiNDT12hS5ZR4JFRBhywm9lydrk/287pcgsHZIDKqKgIi1sD3FdgAsAeou1Hy1iXt4HYMQ==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr12481624wmg.41.1584124686545; 
 Fri, 13 Mar 2020 11:38:06 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id f17sm59325628wrm.3.2020.03.13.11.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:38:06 -0700 (PDT)
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
Subject: [PATCH 14/14] hw/core: Restrict CpuClass::get_crash_info() to
 system-mode
Date: Fri, 13 Mar 2020 19:36:52 +0100
Message-Id: <20200313183652.10258-15-philmd@redhat.com>
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
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 13 Mar 2020 18:38:12 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/core/cpu.h | 7 ++++++-
 hw/core/cpu.c         | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 73e9a869a4..48ab5ec3ed 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -492,6 +492,8 @@ bool cpu_paging_enabled(const CPUState *cpu);
 void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp);
=20
+#if !defined(CONFIG_USER_ONLY)
+
 /**
  * cpu_write_elf64_note:
  * @f: pointer to a function that writes memory to a file
@@ -541,6 +543,8 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, C=
PUState *cpu,
  */
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
=20
+#endif /* !CONFIG_USER_ONLY */
+
 /**
  * CPUDumpFlags:
  * @CPU_DUMP_CODE:
@@ -634,7 +638,8 @@ static inline int cpu_asidx_from_attrs(CPUState *cpu, M=
emTxAttrs attrs)
     }
     return ret;
 }
-#endif
+
+#endif /* CONFIG_USER_ONLY */
=20
 /**
  * cpu_list_add:
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index fe65ca62ac..debdd7e670 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -209,6 +209,7 @@ static bool cpu_common_exec_interrupt(CPUState *cpu, in=
t int_req)
     return false;
 }
=20
+#if !defined(CONFIG_USER_ONLY)
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
     CPUClass *cc =3D CPU_GET_CLASS(cpu);
@@ -219,6 +220,7 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu=
)
     }
     return res;
 }
+#endif
=20
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
--=20
2.21.1


