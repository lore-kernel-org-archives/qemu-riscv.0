Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpBo-0000fK-FI
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpBl-0000Y5-4g
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpBk-00041u-7h
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:41 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30085
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpBk-00040J-31
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SuVECRO5K7Gvy7TFYYgJaxwMNPrKIUm0bQrl4kHjTk=;
 b=bl1XhSYVoMl2TreOxlRdsvtqiNdmlrpa0tFISeeesUCi2Xr5rlQ3KmtEVlP6GT+lbEBJX2
 3DdKPMW1Pp6pHx11IqTWE/OrkqnN0lE8Oi9d+QlJeQcCLTml6/n/RDmgg/zYfi2DADjRxl
 fwk7HHO7AWyu9aKRcxLLJSFYyI9eiew=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-DQATcE3yNyGcxQwt2Dr9gQ-1; Fri, 13 Mar 2020 14:37:37 -0400
X-MC-Unique: DQATcE3yNyGcxQwt2Dr9gQ-1
Received: by mail-wm1-f72.google.com with SMTP id z26so3675887wmk.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qrHY3POAwgPR/yw4WHGaOw9mwemlFbyLT5p0JEbbnw=;
 b=NjjfZBeE7eiH1vq7izCVo+APpopI4THYGfTnf8N87Ld4Ex8UUcBxr1cKvv8qPnXoAD
 Tl7ITA0Q/3/kRva928DuLSwWiYX8PHcXBcuXASY6fRzuet8+q9Q4OvkwDDSkR67XiRNT
 qAQTgOPrjUeFp28B9lqhXpfsyeI8TrmwLXXXsjZV7YHTbEov949oFsAtWoYWnbIB1YlB
 TUVO9BeR95xzosqGc59tlw9hrC9kY6vxViwDAaeJGwm/bux55z0XoP34hMfmi4erDo55
 SA2gGyQ6dk9B4tV1VdasUQmEHbnb4MGb5O8LSXtUHuhyc0kvqfFlfZnEM/S4zY5oFEyK
 zldQ==
X-Gm-Message-State: ANhLgQ3ebQyH12Gjc5yj3i1pUmlaR1vIDihaZtO9XF4DWwxBBYnxx8a3
 QNKB2jdbo2WH3uwyspcrjkD9glGYns6WkM0dVfQ3S4GcFtNz0iYVhi8khKH6erZKkzXP0uq5DlW
 m5bkfqJyL7AeMOGE=
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr10863175wme.80.1584124656632; 
 Fri, 13 Mar 2020 11:37:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvhA9+6w6SxST3JF6c4Ko2DAdhDZUQcupyXKHijFIIWpb7ZBMQOtnHcAwPsLhSqhwg+SoVqzw==
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr10863153wme.80.1584124656402; 
 Fri, 13 Mar 2020 11:37:36 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id b6sm24047514wrv.43.2020.03.13.11.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:35 -0700 (PDT)
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
Subject: [PATCH 08/14] exec: Assert CPU migration is not used on user-only
 build
Date: Fri, 13 Mar 2020 19:36:46 +0100
Message-Id: <20200313183652.10258-9-philmd@redhat.com>
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:42 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 exec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 0cc500d53a..7bc9828c5b 100644
--- a/exec.c
+++ b/exec.c
@@ -946,7 +946,9 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
=20
     qemu_plugin_vcpu_init_hook(cpu);
=20
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    assert(cc->vmsd =3D=3D NULL);
+#else /* !CONFIG_USER_ONLY */
     if (qdev_get_vmsd(DEVICE(cpu)) =3D=3D NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
--=20
2.21.1


