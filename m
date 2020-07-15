Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvi1l-0007Sl-Ab
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jul 2020 10:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1j-0007Ou-Uk
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:04:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35578
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1h-0007JQ-PC
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594821889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WKVwDo8gc++pP1vRtC4pwYv8NmmthcI9PuigKAgGKc0=;
 b=Ky3ZXx6X0p7nbJsREddSkWbCnZPwMeAmtOI8Rxazx7QmTm3UlGcRscIouTYCjmBZC7NECG
 k6siAz7J+6R30vM97GjKLFaXKlCNi2wWAVkPxtpsM+XY1bnyvgvRE3zdwaOg/C1VC+37Xb
 QVKIFm31EuU1UKUep3lXYGWNDnX0bS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-vjk8lqGSPX2dD9doOgOCxg-1; Wed, 15 Jul 2020 10:04:45 -0400
X-MC-Unique: vjk8lqGSPX2dD9doOgOCxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA19718C63C5;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D3905D9C5;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A2F4E11386A6; Wed, 15 Jul 2020 16:04:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, nieklinnenbank@gmail.com,
 sundeep.lkml@gmail.com, alistair@alistair23.me, edgar.iglesias@gmail.com,
 mark.cave-ayland@ilande.co.uk, palmer@dabbelt.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, thuth@redhat.com
Subject: [PATCH for-5.1 0/2] Unbreak make check SPEED=slow
Date: Wed, 15 Jul 2020 16:04:38 +0200
Message-Id: <20200715140440.3540942-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:37:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Jul 2020 14:04:52 -0000

On the one hand, getting bitten by this bug in production seems
somewhat unlikely.  On the other hand, shipping with broken "make
check" would be embarrassing.  So let's consider the fix for 5.1.

Markus Armbruster (2):
  msf2: Unbreak device-list-properties for "msf-soc"
  hw: Mark nd_table[] misuse in realize methods FIXME

 hw/arm/allwinner-h3.c | 1 +
 hw/arm/msf2-soc.c     | 9 +++++----
 hw/arm/xlnx-versal.c  | 1 +
 hw/arm/xlnx-zynqmp.c  | 1 +
 hw/dma/sparc32_dma.c  | 1 +
 hw/riscv/sifive_u.c   | 1 +
 6 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.26.2


