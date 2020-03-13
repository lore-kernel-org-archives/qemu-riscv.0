Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpBi-0000Ra-PM
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpBg-0000Ls-An
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpBf-0003lV-A9
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25482
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpBf-0003kB-6J
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pry6+pV8fUl3y5exktsH4W1Uxi8wrIUzy2x3T/v2sI4=;
 b=U2LcK+Xe0lU0b01hiU0XiDnek95jBHtgGECKvBa8iyAsNtGnaHdlotcHAgujmD+cHYIAzF
 SkipzGTiAHCf20CsRO0y1V+/ItqoPDn0fCFtEm1BS/wCLAjs0lcBgFxUYG6UF7UBv6PY3Y
 jg1dRzvvKNRh3RKXqPSRbaGO4BMYCsM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-mIN-fV92NCuvd1vl7ontow-1; Fri, 13 Mar 2020 14:37:33 -0400
X-MC-Unique: mIN-fV92NCuvd1vl7ontow-1
Received: by mail-wm1-f70.google.com with SMTP id f207so3779152wme.6
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzR0VTVvQsF/hlsamkIvnRsrC8/9iy2Vlr1dz/V+KBw=;
 b=AAQsq8ZNW/gMZuQgQtzd+tdbmzytJuGsFqU2/Gc83TSmmjk23wxNAP8A+Fq4lklPmU
 kr8sdVo3v3LoE9nTuFDtaLOvl5uV1RqMTmMOkK/nDQiuGITvCkoGQn3z9LcgKN28ww0t
 Po2OYNufcpiymdYvz8d2ORNN4Y9Y1ehwWE3pgkfWaHAhxxhkGT+1dDmCy9HJH1RTPkuj
 dFrjIpOAEnwaHhuNb4kWbttU0BuA4FwK3WC2mqVWvK4m1AINen3hVV+NX0dbll68ynmh
 wwQmyfdMnJf6bk1qOZAGsM+FrdC7yFDc3z/7lI9bkxm/SveteMB1dFx57M2u+XvkvKxJ
 Iliw==
X-Gm-Message-State: ANhLgQ1PHrvcIsy62S5ZXia9uKPAifq8cYa5AIPU0pnelnmFIXNhAYS+
 vYY6Fpst1qBpH7RtG/0bhvn+MawxxP/kA+OP31P/UisyWsRw1LNNaJxB5vwBFud38TvywxP2io0
 ELOMgvRJlwJoXp/c=
X-Received: by 2002:a5d:660d:: with SMTP id n13mr18234103wru.383.1584124651686; 
 Fri, 13 Mar 2020 11:37:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsXUbMgZopATF5ABmIQGcTP5jpwz9bFq/9SdX9Ao7M7bfLF6/N69ygmaZANBNBGhiIuInwKsA==
X-Received: by 2002:a5d:660d:: with SMTP id n13mr18234084wru.383.1584124651541; 
 Fri, 13 Mar 2020 11:37:31 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id p10sm16966938wru.4.2020.03.13.11.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:31 -0700 (PDT)
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
Subject: [PATCH 07/14] target/riscv/cpu: Restrict CPU migration to system-mode
Date: Fri, 13 Mar 2020 19:36:45 +0100
Message-Id: <20200313183652.10258-8-philmd@redhat.com>
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:37 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/riscv/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c0b7023100..b59e09209e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -475,10 +475,12 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 }
=20
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
     .unmigratable =3D 1,
 };
+#endif
=20
 static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
@@ -534,13 +536,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)
     cc->do_transaction_failed =3D riscv_cpu_do_transaction_failed;
     cc->do_unaligned_access =3D riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug =3D riscv_cpu_get_phys_page_debug;
+    /* For now, mark unmigratable: */
+    cc->vmsd =3D &vmstate_riscv_cpu;
 #endif
 #ifdef CONFIG_TCG
     cc->tcg_initialize =3D riscv_translate_init;
     cc->tlb_fill =3D riscv_cpu_tlb_fill;
 #endif
-    /* For now, mark unmigratable: */
-    cc->vmsd =3D &vmstate_riscv_cpu;
     device_class_set_props(dc, riscv_cpu_properties);
 }
=20
--=20
2.21.1


