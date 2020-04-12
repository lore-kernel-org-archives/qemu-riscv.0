Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlJc-0002MU-6C
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJZ-0002DP-0C
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJX-0006KP-UT
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:56 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40132)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJR-0006EJ-5C; Sun, 12 Apr 2020 18:42:49 -0400
Received: by mail-wr1-x443.google.com with SMTP id s8so8528848wrt.7;
 Sun, 12 Apr 2020 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hCgEmZ8AI9qEuOAvT32ajI8Fl44JGL9aN5nhSoKC5cM=;
 b=SBd+viBpKNQCqQUWksBouKPZSOSSsJAn47ATAN++ZNeiAe0faIIbQa3g3L4aR6i0mT
 Vg2y+PRyLKxmpV08dE+hZTXbNBfbENs+sQ5UvJLlQdb4pgODWSCNcc8Pz6NZEtSJNDRv
 86D6HgIYgJJBgrDUHwic8phO8rQuwyKeUi19wYhokBxVtQ+t5LQ5J1VPfdUewsDi6BWR
 7yy3wstS7SWiUu1KVXilqG1rK+X0Eqo98HH/EhddocHsjFQua7sCTKvVYUKpKQKZJxW8
 18BUVJdh7ZoXxUIgIV/keVQtA8BQTHxZDs+5MeSuavGYhoewsxwicTgQI7GUmx/GBAyG
 zuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hCgEmZ8AI9qEuOAvT32ajI8Fl44JGL9aN5nhSoKC5cM=;
 b=Y0dd7eueebniBJkul1hYcyUG4DnXNiQoHh++rrJaC4jLtjDSSHbYf+rvhFhgiyOgTR
 sQRBR0wLtEQBf1jkbzZDNpCceblVz3KiPRurgqnAs2+PcTpqYmVrzbACBpzkUM7aocYb
 cXtmDrHIf0fHNc19YFocdg5jjZS/QdjehXW1+UiAvszsnvAbW2wqoLls+Rx8Tn5usRN/
 ufvNWmJF67F8w+BbfpwfbUVev1nuusIVK6OZIxpVb8uy7mIzWopS2+ZZM5fTtar0p4RR
 oJOxw6qFj93bnT4TjB05S3fymmsd/eWSDxzU2pKbrHIPMKYp5+UiTVzmT/60Uh1VLDHG
 tkWA==
X-Gm-Message-State: AGi0PuZ8Mv7JCwjnfL2saDsXo3y8BXkPHbH5nNOCpq1LmqP14JqV6/9d
 2THtFBguxMJMmkYuKHGUH9Ftcs70Gi7z9Q==
X-Google-Smtp-Source: APiQypJDFJxGMn9FJuLgcSCbAWocdm79zSC2mMz2wveZGVl3kocSuE38GLeqCLATxKX3m5ONDUonAw==
X-Received: by 2002:adf:904e:: with SMTP id h72mr15647061wrh.367.1586731368081; 
 Sun, 12 Apr 2020 15:42:48 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 Michael Walle <michael@walle.cc>, Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH-for-5.1 v3 16/23] hw/arm/stm32fx05_soc: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:37 +0200
Message-Id: <20200412224144.12205-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:58 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/add-missing-error_propagate.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stm32f205_soc.c | 4 ++++
 hw/arm/stm32f405_soc.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index b1be4fde40..fba18bc204 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -159,6 +159,10 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     /* ADC 1 to 3 */
     object_property_set_int(OBJECT(s->adc_irqs), STM_NUM_ADCS,
                             "num-lines", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(s->adc_irqs), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 2b8a84a695..6db77d296b 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -181,6 +181,10 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     object_property_set_int(OBJECT(&s->adc_irqs), STM_NUM_ADCS,
                             "num-lines", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->adc_irqs), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
-- 
2.21.1


