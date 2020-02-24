Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Km7-0006AX-Is
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 15:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Km4-00063O-M3
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:56:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Km2-0002xp-Ik
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:56:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38539
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Km2-0002wp-Do
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 15:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBf1Nz3dO7lmnq6x8HgckUD4/9P7/UEzlUI+mgbV/5Q=;
 b=Z7IFn7uMULPt+eEx54eV8f1N9jpH0HtqbV/jXBGsuPXv2eqlqXjaJP/arRvd559dcfotUJ
 SpWvpQM4SwpnHK3GgYRe0Jo1RXXLlp4saq37BttCMSee1NnHQW9gHpDBr8kJ7uom03lYHk
 jKC4UKb5LHddmKs5AUnaSDXe6MXxLi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-vv3vpfscMoS28J8ygPcnhA-1; Mon, 24 Feb 2020 15:56:15 -0500
X-MC-Unique: vv3vpfscMoS28J8ygPcnhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E001B107ACC4;
 Mon, 24 Feb 2020 20:56:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C390B5C883;
 Mon, 24 Feb 2020 20:55:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Jason Wang <jasowang@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Max Reitz <mreitz@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Michael Walle <michael@walle.cc>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>, qemu-trivial@nongnu.org
Subject: [PATCH RESEND v2 01/32] memory: Correctly return alias region type
Date: Mon, 24 Feb 2020 21:55:02 +0100
Message-Id: <20200224205533.23798-2-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 24 Feb 2020 20:56:22 -0000

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


