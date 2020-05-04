Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd3A-0005Df-9H
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd35-00057u-32
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:28 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37128
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd30-0004BU-V9
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9+8reP7GTE78L5B1VZBQQawvTQY6zlLXYckga6u98s=;
 b=epzFyAO6rnjqG5LN9bbxPPMenDfmqsA6l3FRmRovW3BBGLPuuNGxInXYR/tr7jy33yOUVB
 XbLb+U8XP7vCIXXF8bcmP7Px66sXydnPZJk1F6GZuSmXhujFJ27tUfmYkSayqVBKOsqYRJ
 BVg1eKtBOJjafwQ1ap5A4b8N4jkVaH0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-ZFIk5cdAPbmju-xF5fW2SQ-1; Mon, 04 May 2020 11:30:20 -0400
X-MC-Unique: ZFIk5cdAPbmju-xF5fW2SQ-1
Received: by mail-wr1-f72.google.com with SMTP id y4so5915034wrt.4
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ixj4deVVyRuMLRIFisfgQ9WKiYbhKMCAbBHOhTT1TTc=;
 b=FZnfGYuAWXlFZ7vRIBeWyiIlU0N3+MkovwpxbU1t51sjJDvDYGFc+VWKe8ojAQu+gG
 AndZjiBJKJ6zJT1L/O1XmPNVTjO+/pJIdHu91DYA/Mfs/RmULvnFEJFjz8rMnhsru5oV
 gUkF8igrkWfItnWrEM2B/SZZB6pMeAaa272pKlmxuW7w7Za0X9BcU3WJN7gAjkTUcSiW
 86z+CWNxwjVYnc+7D0tZ+3Kg7Qdsko5kHGjAvBjfvSigTa9/tew3EbIhH6+caotyAFGs
 yKJR6AGjdoCCe1mueVWReKuTyAM8Zt2GmP2xYF9Es/QfsWWg2HsTTSzg3cU8zi8yDU/X
 z/yA==
X-Gm-Message-State: AGi0Pubr9ZaxdQqRQYf9vAkPWjiadSkKv/H6MXgMUpfaTUNFdjIH03xD
 sWe+bM05lgIytQMvdEYflKCMvd5uVa97vqU4yuVcPjCsLnFg1HkH6C5NIw6l0EZCFZ7XEYcgrYR
 2ItJ5g8eeSU4iSTc=
X-Received: by 2002:adf:ecc5:: with SMTP id s5mr18314260wro.261.1588606218410; 
 Mon, 04 May 2020 08:30:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJwx30iPwgvBiLbJZBtHnXIYgfy9/mTXK9iJRYZVNTAVVbjQcxhCJrJ+JdH4KjLpXk8VWAT6A==
X-Received: by 2002:adf:ecc5:: with SMTP id s5mr18314229wro.261.1588606218190; 
 Mon, 04 May 2020 08:30:18 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id a9sm13422818wmm.38.2020.05.04.08.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:30:17 -0700 (PDT)
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
Subject: [PATCH v3 11/12] target/s390x: Restrict CpuClass::get_crash_info() to
 system-mode
Date: Mon,  4 May 2020 17:29:21 +0200
Message-Id: <20200504152922.21365-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
 target/s390x/cpu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index f2ccf0a06a..afb82206c7 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -247,6 +247,7 @@ out:
     error_propagate(errp, err);
 }
=20
+#if !defined(CONFIG_USER_ONLY)
 static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
 {
     GuestPanicInformation *panic_info;
@@ -256,11 +257,7 @@ static GuestPanicInformation *s390_cpu_get_crash_info(=
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
@@ -286,6 +283,7 @@ static void s390_cpu_get_crash_info_qom(Object *obj, Vi=
sitor *v,
                                      errp);
     qapi_free_GuestPanicInformation(panic_info);
 }
+#endif
=20
 static void s390_cpu_initfn(Object *obj)
 {
@@ -295,16 +293,16 @@ static void s390_cpu_initfn(Object *obj)
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
@@ -488,13 +486,13 @@ static void s390_cpu_class_init(ObjectClass *oc, void=
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
2.21.3


