Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDd8w-0003UK-B7
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 19:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDd8s-0003T6-CN
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 19:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDd8r-0000zD-7h
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 19:58:02 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26673
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDd8r-0000yb-3l
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 19:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584316680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrqXLxTQz0mEYrpZdea1ftAFgDjw4GVpWcXSJKx0Kfk=;
 b=W+cdevNYtgJic5EwEQzLN7WhsPVMZGmEeBVbiMSBC113aI+kUULa0ByUrz/wi44yBb1ua4
 iJyJGC2k+rUsgYAc8hOdgqL74al7fMLE2mE3DjPTuTEhqCrbtrrpwF7iNe1u5sMHIZJEJ1
 frdhXvlwqu1CVMSwLK0ftcktjsD8zrk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-ZQ4gcmiMMJuG5T8vyRc_8A-1; Sun, 15 Mar 2020 19:57:59 -0400
X-MC-Unique: ZQ4gcmiMMJuG5T8vyRc_8A-1
Received: by mail-wr1-f72.google.com with SMTP id b11so8107317wru.21
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 16:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pZnziEWWIqS/GPOcov+nb6Dnv8MFQCtODqZczgbWweM=;
 b=helItQhqvi70pVoD4i9TbyTHjpvSRJoc0weBjxRDKtqeXke/Ru/D1XuzJ9CiC8Tclx
 090XHvXAMRdkTiDbhA8ey5cH44/NFPBZ6bpmuMeLBUYY2jVz3/lMioY+N5/MncP/8WPQ
 3ORZNl08inJ+90fxoGlWjNNj56ovpxkSIpxdP30tGAGnujIcwTY8oGfzHhe7OIoePVQ5
 uQQpkzKmEiYtllk697/C9eiwwHs74eD1OexpL0YXSNxoNwyEuVWrWN+C7NzhC9PAFS/F
 ResmQQuS8Yyuei1+vQoI6CyIIDt9ptVedQUg4FbXmHDE2iDkdJwj8g+N3j35AWmPHEmg
 ovhA==
X-Gm-Message-State: ANhLgQ1V3u0zt4khyCmf5zFBwDZ+mZvcSjvrO2FJ1+lgy/ED7i3scRYX
 XcqZGUF5e4uoYvhfSa1rxZj05JbwjiQN3izkhBDDt9XmR66dYi/TKSw1g5VqaTxqQLRZJ6Cj4nC
 j/cqsY5iZZCtUws0=
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr31959721wrt.102.1584316678139; 
 Sun, 15 Mar 2020 16:57:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvvFt9gU4znEJ4H91Jd+cteS6sghn/vl4FgyB2z0OHcVOS/QTpXxbRNQNhQnyf400OsrgpbWA==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr31959706wrt.102.1584316677988; 
 Sun, 15 Mar 2020 16:57:57 -0700 (PDT)
Received: from localhost.localdomain (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id j39sm12580913wre.11.2020.03.15.16.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 16:57:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2 07/12] target/riscv/cpu: Restrict CPU migration to
 system-mode
Date: Mon, 16 Mar 2020 00:57:11 +0100
Message-Id: <20200315235716.28448-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200315235716.28448-1-philmd@redhat.com>
References: <20200315235716.28448-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Sun, 15 Mar 2020 23:58:03 -0000

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


