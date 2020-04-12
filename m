Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlDY-0005Ql-N6
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDW-0005Lh-Mm
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:36:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDV-000271-E9
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:36:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDM-0001rA-Bo; Sun, 12 Apr 2020 18:36:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id h9so8522755wrc.8;
 Sun, 12 Apr 2020 15:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlN4N/MyMKxw+6nyYt6mkHcMTTQwBCWy2vUqlxSx8T0=;
 b=o4Ei/9dOSd+pb+KfYpGct9KChO9QJ8t3INjgvz03nHbKqV9fZslP8Ow2/fLlWvdpC8
 WIhjv+vxJ9nJo2tS/+cKXe2J7n+38whRwAG3PNDX1El80psE7eA9GIRAsE8QunMWfQ35
 ov6JaB/4LnFtNr1sK+3BMa9KlLFht2LQwx0yp8L2QRFMI2yy3mCfRh7N30QhG4TjrMZD
 uK9tf4jiBaCdyf6sUGrEI0WBXGmtaM53z870M6kVKPdvKHq+1yVqV3H0yMCmx7zPgUhN
 djdaWnc7dAvHxRzPHzBMABbhZKQvHshfp9gO2KcPZrhFqQV2IYcha8XeezZPKGcTwnTC
 UvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jlN4N/MyMKxw+6nyYt6mkHcMTTQwBCWy2vUqlxSx8T0=;
 b=jwSeh5/l5DSzlmbWmP00SAfWvD+c95FQCmXw7PQWLTqXvovg57KFyHcKDGq/Pg4R4u
 RL6Sb1kHjwjngBo3OlIEaHOTUQvHW+EkqVZAomNuOo0Xy9qHaimPcNvN4xY3mJ88xonY
 sajq21MfzmWbFaIkkLhQ7JMCdJZJI471pR4cPf7EJ5hBmsP+u79X0lkqJPnWz8F9Pt9y
 Jo2cTdMCvpQb/dgl7/f6+3L3gvoIcuz+2V7CrNlvurBIeWgCxpnL49bre4wFfPb03N0m
 zTjX1WXwTonlelqrXSvOfql1/xSLrH8nojYY2nwrCCxe0dP2ir5d9YNBaUl5ffTbMIh4
 mkWQ==
X-Gm-Message-State: AGi0Pubi7CYfgefR1nDlg4tDGqsKQ/WKFcNzpuj9LVfm6f5t1P2UBO5j
 HAoYAvz9DL5FxeZN3xalWoyf2TCg5QOG2A==
X-Google-Smtp-Source: APiQypISyMaT/TEYDulrWCp1xfABa0NvDX/ISMcM9WlX6BfAJqa64wFywZotnnQ2RAljUAl7aZ359A==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr15903243wrw.228.1586730991085; 
 Sun, 12 Apr 2020 15:36:31 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:36:30 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 02/24] scripts/coccinelle: Script to simplify
 DeviceClass error propagation
Date: Mon, 13 Apr 2020 00:35:57 +0200
Message-Id: <20200412223619.11284-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
X-List-Received-Date: Sun, 12 Apr 2020 22:36:44 -0000

When a device uses an Error* with data not modified before realize(),
this call can be moved to init(). Add a Coccinelle patch to find such
uses.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ...implify-init-realize-error_propagate.cocci | 69 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 scripts/coccinelle/simplify-init-realize-error_propagate.cocci

diff --git a/scripts/coccinelle/simplify-init-realize-error_propagate.cocci b/scripts/coccinelle/simplify-init-realize-error_propagate.cocci
new file mode 100644
index 0000000000..2e3ec4d98a
--- /dev/null
+++ b/scripts/coccinelle/simplify-init-realize-error_propagate.cocci
@@ -0,0 +1,69 @@
+// Find error-propagation calls that don't need to be in DeviceClass::realize()
+// because they don't use information user can change before calling realize(),
+// so they can be moved to DeviceClass:initfn() where error propagation is not
+// needed.
+//
+// Copyright: (C) 2020 Philippe Mathieu-Daudé
+// This work is licensed under the terms of the GNU GPLv2 or later.
+//
+// spatch \
+//  --macro-file scripts/cocci-macro-file.h \
+//  --sp-file \
+//    scripts/coccinelle/simplify-init-realize-error_propagate.cocci \
+//  --timeout 60
+//
+// Inspired by https://www.mail-archive.com/qemu-devel@nongnu.org/msg692500.html
+
+
+@ match_class_init @
+TypeInfo info;
+identifier class_initfn;
+@@
+    info.class_init = class_initfn;
+
+
+@ match_instance_init @
+TypeInfo info;
+identifier instance_initfn;
+@@
+    info.instance_init = instance_initfn;
+
+
+@ match_realize @
+identifier match_class_init.class_initfn;
+DeviceClass *dc;
+identifier realizefn;
+@@
+void class_initfn(...)
+{
+    ...
+    dc->realize = realizefn;
+    ...
+}
+
+
+@ propagate_in_realize @
+identifier match_realize.realizefn;
+identifier err;
+identifier errp;
+identifier func_with_errp =~ "(?!object_property_set_link)";
+symbol error_abort, error_fatal;
+position pos;
+@@
+void realizefn@pos(..., Error **errp)
+{
+    ...
+    Error *err = NULL;
+    <+...
+    func_with_errp(..., \(&error_abort\|&error_fatal\));
+    ...+>
+}
+
+
+@ script:python @
+initfn << match_instance_init.instance_initfn;
+realizefn << match_realize.realizefn;
+p << propagate_in_realize.pos;
+@@
+print('>>> possible moves from {}() to {}() in {}:{}'
+      .format(initfn, realizefn, p[0].file, p[0].line))
diff --git a/MAINTAINERS b/MAINTAINERS
index 642c8e0b6b..6203543ec0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2058,6 +2058,7 @@ F: scripts/coccinelle/err-bad-newline.cocci
 F: scripts/coccinelle/error-use-after-free.cocci
 F: scripts/coccinelle/error_propagate_null.cocci
 F: scripts/coccinelle/remove_local_err.cocci
+F: scripts/coccinelle/simplify-init-realize-error_propagate.cocci
 F: scripts/coccinelle/use-error_fatal.cocci
 
 GDB stub
-- 
2.21.1


