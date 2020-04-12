Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlJV-00021H-3N
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50011)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJQ-0001qK-MD
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJP-0006Da-N6
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:42:48 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44377)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJD-000686-9L; Sun, 12 Apr 2020 18:42:35 -0400
Received: by mail-wr1-x444.google.com with SMTP id d17so1634792wrg.11;
 Sun, 12 Apr 2020 15:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74G8KHhadiGPyGitkFydcSDSAs1meyukZBFpYk9pD6I=;
 b=dPCfqUi+fQcBEG3K/WPUk56J0LAaObHIxDG46h8wY4ZNxJLUwgj0NWwAwtUyFExGA5
 r5+4rSPzbfX1aAnLWCYcyKaohy7boPLvXOAepLJ662xZIblElg2FuJbH9ri897tTWZt6
 6dX5pQ1pFJrNZCtU/FRBwVhqd3WEKQzg34n135qBqGR6o/WT66bm/AhG31Mp2g7nVTy1
 SFvZGg+UwXBXaJM28hgts6+00mKiW6O1ivAvRJWYTbL2x/xGQq/FTarhAjFQggLC9JcG
 E1hW5iuN9t/c0S+zX8j1T48TCU8lERf/8j3iJAPh68RiIHQKW1o0OtQD+wO7zRQZOinH
 ipyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=74G8KHhadiGPyGitkFydcSDSAs1meyukZBFpYk9pD6I=;
 b=f772oGezS01RVlhSF2S1PMy8ic33QAldzotRBNvP+GFoFMN+ozuJrnXwSj3nVmHTr7
 ZnBFtSRCaGs08sJRJFW2z6jpHeQSIjKcyTE+8ZU1CYN2WccB0jsHElf2L4Bi0oqczUrx
 agOXqU77uLNMW/9NUAYdJPkNyaxZzufHCPLBlmDTgZ3LjTFCgWo5rnotOtLRgj0q2aD4
 3HMl2JpS36Lr7h7MbqniK1Uow47OkDLszbio4AO8uTiijP0lKUqd1j+6pjTjMUTuDD5W
 3ommnp8/IJ84YS7y7PqLrB6zlqDo+q1AzUwxd1A6M1nTHG/dRIsAST7On7O0wS7F+G6d
 bNIQ==
X-Gm-Message-State: AGi0PuZ+kFCw8pkKLWlEwrYmVYxBu40oG60WuzXIZWQrfFbX8TxEWGGI
 UviXaCoHSmmY80ID6CC/wUGR0S7qxqFj1g==
X-Google-Smtp-Source: APiQypKKinuxHdn5Rjo88Tjskg/kBYuSqrEjj1TM/hyqysUwAmGJpRRx5J4iHdFvz55iPD19d4CKUA==
X-Received: by 2002:adf:9441:: with SMTP id 59mr15577538wrq.211.1586731353887; 
 Sun, 12 Apr 2020 15:42:33 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:33 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.1 v3 12/23] hw/block/onenand: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:33 +0200
Message-Id: <20200412224144.12205-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
X-List-Received-Date: Sun, 12 Apr 2020 22:42:51 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/onenand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 898ac563a3..1f68dba28b 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -810,7 +810,11 @@ static void onenand_realize(DeviceState *dev, Error **errp)
     s->otp = memset(g_malloc((64 + 2) << PAGE_SHIFT),
                     0xff, (64 + 2) << PAGE_SHIFT);
     memory_region_init_ram_nomigrate(&s->ram, OBJECT(s), "onenand.ram",
-                           0xc000 << s->shift, &error_fatal);
+                           0xc000 << s->shift, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     vmstate_register_ram_global(&s->ram);
     ram = memory_region_get_ram_ptr(&s->ram);
     s->boot[0] = ram + (0x0000 << s->shift);
-- 
2.21.1


