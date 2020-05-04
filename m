Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2q-0004yt-GP
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2m-0004uZ-HQ
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30448
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2l-000459-P1
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1y68tSMd7GHh+zg/0ObvfZVux+/GWTFhhxzdBf7Eqg=;
 b=Lbpz57rMK36EdkQUQPGz9j/4IPevZAuMenbMHzS/bQ8Y60+w7PhySR2fO9uq7cdB9HnhC2
 chN3H+0bbdc/APq7sZMci1swBNQuUN8neKl85OEdewWLZKjKLpMlgOIoibMbmUWHM86MXa
 N2zVwQWF/75sflIwemayP/O+ZzuibWI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-aBSeSs2OOPCDZskIt3m1pQ-1; Mon, 04 May 2020 11:30:04 -0400
X-MC-Unique: aBSeSs2OOPCDZskIt3m1pQ-1
Received: by mail-wm1-f71.google.com with SMTP id f17so3693616wmm.5
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YNPGUt+XVjuWBOuW4Jb8vVwTVbsUuMXWCCmym4ZUFC0=;
 b=RreBlgwdzoJHWTnIDUsWIalXagO8XRxtDkRYDTYligbc4xw8IBF35O1I2C9HCuP8tl
 BF+rAqQTgP8//a/JnSoBnUr05vYAvlmTrdMOS/9VzTxbCE7Oe/icWB+/2u0Ux67f1hhv
 K4RTzBJLVfYS4CtrGXuNEWupogs9XSuCF3cU1jQ4BISl/3I61PNtQ1g1WkchlcYTLd+g
 MHCKP7Uf+FoVABdg9h4h554KNbq1oeAt8QiMfy8JIUIrdh2IF+qQxoHGQtI0fshMbM6u
 6I0LiQz6NFzOYow+Vk97z8oQalMFdKWz+51cnsh9Y8vu+l8UDhh068XGzq+LZhANTsyD
 B0fw==
X-Gm-Message-State: AGi0PuaqqidFYmRwqYUAepR9qlZDQ28sAD4hHinwAYBrYr133M1aXgUY
 FLDUnaKFEfnVMNs8JNHiFkkb5XGLJTAXdz3a04fsGhfvj47xZx+ZpWNfZITfBw0KGQAOAgC9ReG
 WP2kRUyK22+Lis4w=
X-Received: by 2002:a5d:4092:: with SMTP id o18mr19706359wrp.227.1588606203346; 
 Mon, 04 May 2020 08:30:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypInjUOxX2jKxirAze76WfFjfMC15k/Kv3N9pOHz2KJiR8nTXoBJrwU87jPMHlBSpO3bEcdHRw==
X-Received: by 2002:a5d:4092:: with SMTP id o18mr19706340wrp.227.1588606203145; 
 Mon, 04 May 2020 08:30:03 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id 32sm18198202wrg.19.2020.05.04.08.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:30:02 -0700 (PDT)
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
Subject: [PATCH v3 08/12] exec: Assert CPU migration is not used on user-only
 build
Date: Mon,  4 May 2020 17:29:18 +0200
Message-Id: <20200504152922.21365-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 05:09:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Mon, 04 May 2020 15:30:09 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 exec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 2874bb5088..3a39ffb1eb 100644
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
2.21.3


