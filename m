Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlDx-0006XH-LM
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDv-0006Rx-8j
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDu-0002nP-8j
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:07 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36717)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDn-0002fI-Qo; Sun, 12 Apr 2020 18:36:59 -0400
Received: by mail-wr1-x443.google.com with SMTP id u13so8049446wrp.3;
 Sun, 12 Apr 2020 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s0AvIH4tmhY8dJIWOooS3DYC6YTsxY1MNRofHTiR85M=;
 b=sJ/YqrK5TugYkQl5sc0s15+oijPE5rmDui2mmm426O3nS20g7Iqp2ltIuK0f0PBihj
 zN6rI0IbarDeMJvzhgzN9dAl5a89IN8iFLiBum11DWPxCw34nwRQPRZzxNHaNfKXKlW2
 3taNV/vYtbmHh/XkeiuNMqVZjraJ3zIsdVqLGCmZTcQyZKjdTiOL9h1wbUaVF+0ZIM/L
 DGJBtNsbKlG1iR82A/FsRGmUt7tk4ZuyMSaghR9c+hSJ9RlLPWMs8rR5eKpmHlnr17Qc
 Ivmo5Ie0zkDMFGMzDIuZpSKSnvsu/cAiaozPT7HkKGLTxUzqrHA8VBE9EqiE6ToGqcz2
 mB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s0AvIH4tmhY8dJIWOooS3DYC6YTsxY1MNRofHTiR85M=;
 b=ikRldUAQPJNeIMPDLYBR9S+CYksDluwOWCm0HWTT9e+OTuxe7vxJAOixuElaU61a+i
 tgAd0Zk3YVWbxV7Q7qkWdgTmQmgQtuk3X1NZ/yQRPSpoSH+h9bajhxCkGPnv5q8QRddU
 H5KUNFjGwxTNCxsRCekD4caVqRAsbGMiUc3PUUkcDYfNz0ruXTn2i/ZiqjYKZJTEDJSz
 ypfOGPSjTPOZ4ZxEW67pJxu7xGhNHeOi9kDEGJVC7W/T8Yyt9Rp92jcsxjECszzo1mJS
 tKAMkrhN8Z2CbFeg/wTle6MuL3/NPIQKj+U2GZK9i3JJmjgfWsw5om5DJj9hfiibEftM
 Nw6w==
X-Gm-Message-State: AGi0PuZAcdWTnR6YwJ5TYAlekcq7UeW6/dzqkm01oSkm3WFMB1kLJNci
 OTtOIxHOs3DY26EKrsBkweKVyfYGmTZNTA==
X-Google-Smtp-Source: APiQypLXH/6sQRIVIVNKxcaxLPq1HWiNj+xu9u69ExZwdmp1hQGbfDARpX36GS/jz/BXjj5w6OycLg==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr15131900wrn.289.1586731018704; 
 Sun, 12 Apr 2020 15:36:58 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:36:58 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 10/24] hw/arm/fsl-imx31: Move some code from
 realize() to init()
Date: Mon, 13 Apr 2020 00:36:05 +0200
Message-Id: <20200412223619.11284-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:08 -0000

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: hw/arm/fsl-imx31.c
  >>> possible moves from fsl_imx31_init() to fsl_imx31_realize() in hw/arm/fsl-imx31.c:68

Move the calls using &error_abort which don't depend on input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Typo 'depend of' -> 'depend on' (eblake)
---
 hw/arm/fsl-imx31.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 8472d2e911..61287e24f6 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -62,6 +62,8 @@ static void fsl_imx31_init(Object *obj)
     for (i = 0; i < FSL_IMX31_NUM_GPIOS; i++) {
         sysbus_init_child_obj(obj, "gpio[*]", &s->gpio[i], sizeof(s->gpio[i]),
                               TYPE_IMX_GPIO);
+        object_property_set_bool(OBJECT(&s->gpio[i]), false, "has-edge-sel",
+                                 &error_abort);
     }
 }
 
@@ -191,8 +193,6 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
             { FSL_IMX31_GPIO3_ADDR, FSL_IMX31_GPIO3_IRQ }
         };
 
-        object_property_set_bool(OBJECT(&s->gpio[i]), false, "has-edge-sel",
-                                 &error_abort);
         object_property_set_bool(OBJECT(&s->gpio[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.21.1


