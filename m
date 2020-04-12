Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlEa-0008Ag-6l
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEX-000827-0w
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEV-0003Bh-WC
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:44 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40811)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEO-00036r-L8; Sun, 12 Apr 2020 18:37:36 -0400
Received: by mail-wm1-x341.google.com with SMTP id a81so8356808wmf.5;
 Sun, 12 Apr 2020 15:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hYB5vJlsKA+XSoc5iK2InUvEzWA5ZYFw0I+M2ardO5E=;
 b=BYyCk3ysLTDOxvtJ73/q5WWa8lxptRXaEql9KyX9gVYciRP/cpSDx11z3VBLqHevGi
 ykC7mEJ03yLE/tNA/itYzDSffQy6jbRPpseuo4UqzJ1uwsRXkn18iaqw/MgWpta6rCaT
 Vf1xxjmga+cOmGjRjidRgWAANClD4FNUO7tM8ku5pWUsQgEUGow0aQYZLEoTR2w68m3q
 HKsUCKIUSPXFhNMA6/3dH1nAmCg56ltQs5nmbsUpxZuOsveyypf7KtCiqet1I8wUDQ45
 Rfxiy1kXt4i6mFRQRkSwWLB7gmGiq1RQeinPvKQFwAcfef+hzWeAFiyqMP0WeCAZKQuX
 bfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hYB5vJlsKA+XSoc5iK2InUvEzWA5ZYFw0I+M2ardO5E=;
 b=BhfuFYmKdKk7xTqNzY/0sF5KxbdjTul577k9LuCiZMAG0Mlv+fZ1ZItBEgy1FZ6zUg
 m6Hz/Hf+MkODf9BA0sUFv+uEfq/6uintFPhJaLdmX9X0hQurFygsiGSLs69katCwmMD5
 d5dqRW16L2eve7NqiR5SzeoUvP29U+os9AmZxrmwvMUXSu4u8hcHaSKHkKXkH6++WWEe
 gCuv6nM5TruwbAnkGakg2W81McT62a1lWg3RXX5F9OCrySGqLQxZ+29Q1OkHHQ6lz1N4
 i5Sd3XSVB2ITAy2oFGvZa3ScJpnl9blEvT8NxDIKQvQa13QZi7km4ihaXymJEcjIZ+56
 qVGg==
X-Gm-Message-State: AGi0PuZwRNVBDikrKfx48MNd8ye6KK6obBExxz5mXJuqwgS47CRXGMqs
 utMovFcnFCVRxiN0ZVz8Nqsfe5hnG28yKg==
X-Google-Smtp-Source: APiQypKljnwa59JiW3WSGCMMentFT30+ckG5mxUcJQUjQFWIdEJUCrFL68+FcSlCzYIkbBjcw+shKw==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr15552087wml.20.1586731055515; 
 Sun, 12 Apr 2020 15:37:35 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:37:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xie Changlong <xiechanglong.d@gmail.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-riscv@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.1 v3 21/24] hw/riscv/sifive_u: Move some code from
 realize() to init()
Date: Mon, 13 Apr 2020 00:36:16 +0200
Message-Id: <20200412223619.11284-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:46 -0000

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/riscv/sifive_u.c
  >>> possible moves from riscv_sifive_u_soc_init() to riscv_sifive_u_soc_realize() in ./hw/riscv/sifive_u.c:473

Move the calls using &error_abort which don't depend on input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Typo 'depend of' -> 'depend on' (eblake)
---
 hw/riscv/sifive_u.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9c90c94c33..754af19eef 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -441,6 +441,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
     qdev_prop_set_uint32(DEVICE(&s->otp), "serial", OTP_SERIAL);
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
+    object_property_set_int(OBJECT(&s->gem), GEM_REVISION, "revision",
+                            &error_abort);
 }
 
 static bool sifive_u_get_start_in_flash(Object *obj, Error **errp)
@@ -569,8 +571,6 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
         qdev_set_nic_properties(DEVICE(&s->gem), nd);
     }
-    object_property_set_int(OBJECT(&s->gem), GEM_REVISION, "revision",
-                            &error_abort);
     object_property_set_bool(OBJECT(&s->gem), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.21.1


