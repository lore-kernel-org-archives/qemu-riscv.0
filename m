Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Kek-0000ya-KP
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Keh-0000qT-TJ
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Keg-00062R-H6
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:43 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38756
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Keg-00061X-CY
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxC+1Wm7lZTcIVTNIaK8R7xk0TXOBYBpGoQjSWP/PII=;
 b=Qw4VmDWFl9cjM+6DS9gFgdRyBh3vwmz69Idc8/S3NQUWzFrcMaQDcwNiqk03frFAKkWRau
 63S6YiYDo49r+IyQr3J7JpR7Bz5r8zrcFxHo8eSMnl+3/1UBl3ag740/JFsvdUJasoBK5s
 3PluKPLrtm5P2XIS1W2ahYYp7yOA38U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-hS13bvBEMBafOfBptJSRhg-1; Mon, 24 Feb 2020 15:48:40 -0500
X-MC-Unique: hS13bvBEMBafOfBptJSRhg-1
Received: by mail-wr1-f71.google.com with SMTP id t3so4382598wrp.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2020 12:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxYYROcVaswdAAx61tJuJg4MU34WxQsacT4wWudpNIs=;
 b=uEFpCre/ARB9KJNQqmStc4x1Jr1W+vWZ9rwAGdijwD+WKW3p00gowtDebxJuxlStuV
 axTUYIbwy3paP+G/6ZJcPlAOB6UWyOtf5Uqv3xj9Ql3XiRxRZqamns4f+knuD8A7D+pw
 I5ElxKpppgwi+xLppJRxAIRgvcvxtzlNnhcuu4z6mGPgSYgw8tAileBR4rPs2PuQff66
 /biR53DiEq0slRcdOt12Wh2n1YK47Rd4EhlJCUodg1aOBjUMv0Nft+FIYjZ6MVPiQslE
 e1cZ5W3outswi3uc8+x21quRj4Zq3Nttncm1xX9+TLJrYtbG9IJG+UERhZQtEOnDo7U4
 5RXA==
X-Gm-Message-State: APjAAAUl4Oj5WVOPGl88/h3KCPsGJoUf4C6BA2Z516dsnO/ZNyTYv/aE
 lYz+es3A7tHgEBqiFK7m1BDwzMmcawBYmRBRV4wMk5nxnnm+YhomzdIQGo+5aRYbZgA1YL+rNba
 PHfsxQfF9TXZzdDE=
X-Received: by 2002:a1c:988c:: with SMTP id a134mr754284wme.163.1582577318816; 
 Mon, 24 Feb 2020 12:48:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqzF5UQ/qMSypEffTZ4LT2TIQPI6VnHE6rztTv1MazMcJxwUbIcYMiiwSsJE1b22ph9AcNyntA==
X-Received: by 2002:a1c:988c:: with SMTP id a134mr754255wme.163.1582577318492; 
 Mon, 24 Feb 2020 12:48:38 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Richard Henderson <rth@twiddle.net>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Max Reitz <mreitz@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Fabien Chouteau <chouteau@adacore.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v2 03/32] scripts/cocci: Rename memory-region-{init-ram ->
 housekeeping}
Date: Mon, 24 Feb 2020 21:47:59 +0100
Message-Id: <20200224204828.23167-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200224204828.23167-1-philmd@redhat.com>
References: <20200224204828.23167-1-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 20:48:45 -0000

As we are going to add various semantic changes related to the memory
region API, rename this script to be more generic.
Add a 'usage' header, and an entry in MAINTAINERS to avoid checkpatch
warning.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 ...t-ram.cocci =3D> memory-region-housekeeping.cocci} | 13 +++++++++++++
 MAINTAINERS                                         |  1 +
 2 files changed, 14 insertions(+)
 rename scripts/coccinelle/{memory-region-init-ram.cocci =3D> memory-region=
-housekeeping.cocci} (84%)

diff --git a/scripts/coccinelle/memory-region-init-ram.cocci b/scripts/cocc=
inelle/memory-region-housekeeping.cocci
similarity index 84%
rename from scripts/coccinelle/memory-region-init-ram.cocci
rename to scripts/coccinelle/memory-region-housekeeping.cocci
index d290150872..3699c1017e 100644
--- a/scripts/coccinelle/memory-region-init-ram.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -1,3 +1,16 @@
+/*
+  Usage:
+
+    spatch \
+        --macro-file scripts/cocci-macro-file.h \
+        --sp-file scripts/coccinelle/memory-region-housekeeping.cocci \
+        --keep-comments \
+        --in-place \
+        --dir .
+
+*/
+
+
 // Replace by-hand memory_region_init_ram_nomigrate/vmstate_register_ram
 // code sequences with use of the new memory_region_init_ram function.
 // Similarly for the _rom and _rom_device functions.
diff --git a/MAINTAINERS b/MAINTAINERS
index 195dd58cac..316a8edbb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1998,6 +1998,7 @@ F: include/exec/ramblock.h
 F: memory.c
 F: include/exec/memory-internal.h
 F: exec.c
+F: scripts/coccinelle/memory-region-housekeeping.cocci
=20
 SPICE
 M: Gerd Hoffmann <kraxel@redhat.com>
--=20
2.21.1


