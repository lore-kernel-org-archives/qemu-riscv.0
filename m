Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Keg-0000mr-Ae
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kee-0000mB-B9
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kec-0005vT-NU
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44617
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kec-0005uV-IR
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBf1Nz3dO7lmnq6x8HgckUD4/9P7/UEzlUI+mgbV/5Q=;
 b=XMj7UkRy2EpxhnTeNtl2VVqUfFnxHqfFiLuDbQCuM9B7KNj6x/QlXSe9Dtze/eNk9x2/U3
 +6PQU0RI3AUYB15gHeKDUfCq/1U0yPNBMhb1SYEGciP9jmcdsW6wEiXVl5Pw/KoAH1VCVU
 Bot3eIAmmMkzuDVrDtxWRkC2dBAziSg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-HDVdCyIaNWieDjgOxoR6Ig-1; Mon, 24 Feb 2020 15:48:35 -0500
X-MC-Unique: HDVdCyIaNWieDjgOxoR6Ig-1
Received: by mail-wm1-f69.google.com with SMTP id n17so244857wmk.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2020 12:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9F9enB4mqr+YPnaVrLHGBnKs+NXe+icyfAm27ef64A=;
 b=ud+EoqvvnZ2Q7k7xSWPoCgLn7GzEVo47xdf7zAjz66sY7AEd84sNaWMpMwnnBSmcki
 A3dK2pJgH7MMbNdPV7t7RmrsVItqWUFctblOn500t7co3U9zhkPA4B9ixL4mmnAIIQjj
 x9GQLSoR+NmS67XuVkG7DmtfWxadty365a8JuXXOGbHjkJRfNzZBmKE58fQSINR9gwLh
 ap6WEv9qTHfOhPVRORWakEgSrYMA71PvQG+41e3Ogx/ceU6/BkFg/GN5+FpWDsSedbW4
 tjxHaAEvqW4DgzrG0G4Tyc3zy5LIWoLDnZd8jek1/mZoeiSfuEkrywljQ6xOS1hZyq80
 tWng==
X-Gm-Message-State: APjAAAVMhxfZ4RnHr94xrMoBzt/4F6QWbk0zWMlPvhtIp7Zw2FcoFvO3
 PzZ1AHeFwq4i22ciRnK8yF55PdoYj4I14N9Bv8kgIvJ8kCBi8l4GXIkBfoUitHXMp3bycQBqn8Q
 obcUaNOaIZTF4Cng=
X-Received: by 2002:a7b:c759:: with SMTP id w25mr805779wmk.15.1582577314794;
 Mon, 24 Feb 2020 12:48:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxBizVAfehGk3miduLVPYkPJAIfgR+35+r8qEsbPuDdZQRaeyaOJy4zQqQ4Y2N2h4q3ZdVrQ==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr805686wmk.15.1582577313662;
 Mon, 24 Feb 2020 12:48:33 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:32 -0800 (PST)
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
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-trivial@nongnu.org
Subject: [PATCH v2 01/32] memory: Correctly return alias region type
Date: Mon, 24 Feb 2020 21:47:57 +0100
Message-Id: <20200224204828.23167-2-philmd@redhat.com>
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
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 24 Feb 2020 20:48:41 -0000

Since memory region aliases are neither rom nor ram, they are
described as i/o, which is often incorrect. Return instead the
type of the original region we are aliasing.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: qemu-trivial@nongnu.org

 memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/memory.c b/memory.c
index aeaa8dcc9e..ce1179874e 100644
--- a/memory.c
+++ b/memory.c
@@ -2818,6 +2818,9 @@ void address_space_destroy(AddressSpace *as)
=20
 static const char *memory_region_type(MemoryRegion *mr)
 {
+    if (mr->alias) {
+        return memory_region_type(mr->alias);
+    }
     if (memory_region_is_ram_device(mr)) {
         return "ramd";
     } else if (memory_region_is_romd(mr)) {
--=20
2.21.1


