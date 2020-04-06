Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jLVrC-0002EJ-DU
	for mharc-qemu-riscv@gnu.org; Mon, 06 Apr 2020 13:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr9-00029M-DA
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 13:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr8-00030b-A5
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 13:48:19 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39147)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr5-0002re-TB; Mon, 06 Apr 2020 13:48:16 -0400
Received: by mail-wr1-x441.google.com with SMTP id p10so494113wrt.6;
 Mon, 06 Apr 2020 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/+xpnZXxL3cFhRkJssEMl59sGjVJ9aCTEzd20s6bUS4=;
 b=eaq++UwGu8KUgl3mySdioEdAD0mg2PTD9IARIan+xzjwoJRkYjfin6NhIH/9wyXsMc
 Re9o2e437QZftUY+ur5i683wW6Hv34giVjvjpOgejbPMVX9G2rvTDTWAMAG69y2OTJfx
 LGnu66vWsWXzpoZ3YVqH8U4xHt2znQxCs2XChWLpf1uZNEBcZ9xEUNzOo+g2PnPXsy6K
 SMcxJGLScTW/jQTYe9jQE21to0ZrIh10QgCkNS6BwLEQyn+BR0MORufceAnWFuqcxYsJ
 QGyveLzdl8UtEN5lXzzYbvdIgM/Wg+O0V0oMjsntpxIpv1lI1OfDqYh1tmNDzwpwWEQ0
 ugmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/+xpnZXxL3cFhRkJssEMl59sGjVJ9aCTEzd20s6bUS4=;
 b=INQ2buCoCEDWPGyoPP4tVjRZKZwBEP4QPZzR5mj3nV5A7mLDjXm8jvLGeHVyUpdDp1
 nyj9xtwaFEvOSBkqajAxpq/+hpYQVSNiHiAOsj8an6lUSQUy1RSIET5t03aU30NfsMlz
 gOUqVLOwvJmjlqykMa70QIbZnj65UrHXVXJJM9tYlTfdHCXltDHTuZghjaHAveoTACL3
 TLqa8VMBqzc6ObAc7KbLxxcIUysWrdCG7CrPKWJtCsypYadSTcIT7kDKgNWJEdoGN9EV
 A8+fjyxqQoAUKyBtJ1ElXgmxDmL2u24cPIZoquxo+E8GefPZ3APQT4AfluYW6KgX1KMm
 aLEg==
X-Gm-Message-State: AGi0Pua7Zt/ve/e/7HG3Odull+k+IQrCxB7+aWvqFCi93+hTXVIDzXVP
 G+76f+yniW91Ak8tI2XhxZQbTV8/B68=
X-Google-Smtp-Source: APiQypJr9DjAZxFDFzGBUYfzBedN9ES/AYALPRnFRLr8XWHw8mhrUxXjH0Ezu90khHWvlxInSofGWQ==
X-Received: by 2002:adf:f68b:: with SMTP id v11mr354132wrp.270.1586195294649; 
 Mon, 06 Apr 2020 10:48:14 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH-for-5.1 v2 21/54] hw/riscv/sifive_u: Move some code from
 realize() to init()
Date: Mon,  6 Apr 2020 19:47:10 +0200
Message-Id: <20200406174743.16956-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Mon, 06 Apr 2020 17:48:20 -0000

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/riscv/sifive_u.c
  >>> possible moves from riscv_sifive_u_soc_init() to riscv_sifive_u_soc_realize() in ./hw/riscv/sifive_u.c:473

Move the calls using &error_abort which don't depend of input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


