Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2j-0004oE-9K
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2i-0004mW-Ha
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38237
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2g-00041x-87
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJEUowLb7RvCQfJQiY10vUGrOBr7KqqEEqIh+hFxUmw=;
 b=cmU3t9AqtA26hy+4rPk9vvxbOgOTNOehkU6Fw2z9q1tzoGItAcZxcH+uWvx3bMccU9xBX4
 Ykk1H372ix6t6782h6up8Y1YYN4RtMgh2+8C8xEkmpJ8+b2LvavdkA5HBfj0UdC7ZbC+Km
 MXGBYrbs872vg2jdKdGcdpIp5D3VSj0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-iM4Yu0rfMa6zxeZH1tCbuw-1; Mon, 04 May 2020 11:29:59 -0400
X-MC-Unique: iM4Yu0rfMa6zxeZH1tCbuw-1
Received: by mail-wr1-f70.google.com with SMTP id v17so6138385wrq.8
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vOETN6PdLHy6NVEAy7zvorEiCPF47jtqFdmHbXoOmUs=;
 b=cHzRhG614idzybIwN1cat5Et2splkn6G0W3gfeOQ4f3SaOrRWBTeQMws5sh1gy05h6
 Dkjf+TVwyFVEb+hKAj4beUyyDhNMwq40vtcBOPK/MYb0/KnEW8dsVwqynkSi5ypDY++O
 TvpkWimGz3F+HX9QABt2Tq2m3317B2hAqjAxBgIW5AxMt98W4a82ScZHgL3rP4nJbegy
 UOd4glzOQf1kcvNHsmN96syIass2q0IpAiq1FDDBU7F+wTaNPkBjmyE9ThsIlBq3ELqi
 wOe+XjsYknSvLO6z3H1wW9iUz204kAJS7O3qxZ0+cKRt00RkUy6EJuEey7ToZe+8oKq0
 /vLA==
X-Gm-Message-State: AGi0PuZeGuYd3qF7ZDwmI+3+fW3vtNNGkD/lIl2+7UHhnUX2hc5I5Qki
 dyzHaQ5h3900GQdStJeOGvF4q7lI3QyRaoFTFbFOBKdJbovBbSGfl09AFE/Zhs4mIZgsURCSMaC
 QsDQ71C+vxTB/jjA=
X-Received: by 2002:a05:600c:2f88:: with SMTP id
 t8mr14763536wmn.46.1588606198543; 
 Mon, 04 May 2020 08:29:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJpmk7YsxPrFWLliPrb8nTsxnanKnLEiwl5Wj5AHzpYnXRew0sOBcZ9G57iAgM8zv2R1wCVEg==
X-Received: by 2002:a05:600c:2f88:: with SMTP id
 t8mr14763507wmn.46.1588606198355; 
 Mon, 04 May 2020 08:29:58 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id t4sm13373338wri.54.2020.05.04.08.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:29:57 -0700 (PDT)
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
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 07/12] target/riscv/cpu: Restrict CPU migration to
 system-mode
Date: Mon,  4 May 2020 17:29:17 +0200
Message-Id: <20200504152922.21365-8-philmd@redhat.com>
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
X-List-Received-Date: Mon, 04 May 2020 15:30:04 -0000

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/riscv/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 059d71f2c7..6c78337858 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -485,10 +485,12 @@ static void riscv_cpu_init(Object *obj)
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
@@ -544,13 +546,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
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
2.21.3


