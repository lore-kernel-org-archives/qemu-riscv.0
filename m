Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jviOL-0007Va-Ve
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jul 2020 10:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jviOK-0007TW-Hl
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:28:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35373
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jviOI-0003Wb-5J
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2020 10:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594823289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=NHkonzKyaJUONMciab36p/2KZYaTtetqNBd9lKV2594=;
 b=hAYHZS0eVxdR8nbWDIwJnnyBWc+Cfho/6/ZvzuWKkfA5eG8otQXCpnyl6kDQfEx5VGlv8S
 YQ7GWR+ScT04s93l35igqkK+6/riKqcP7v0fpN59jzUX7kRoA4sPY6A9/q0VeESmyeyb/D
 LQVzR4VbSm5JnGNGtDigCIwiHrK08Y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-3NI1SWhPM5K4eRiIXR-Izw-1; Wed, 15 Jul 2020 10:28:04 -0400
X-MC-Unique: 3NI1SWhPM5K4eRiIXR-Izw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4713780183C;
 Wed, 15 Jul 2020 14:28:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-26.ams2.redhat.com [10.36.112.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36FDD6FEF5;
 Wed, 15 Jul 2020 14:27:59 +0000 (UTC)
Subject: Re: [PATCH for-5.1 2/2] hw: Mark nd_table[] misuse in realize methods
 FIXME
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, nieklinnenbank@gmail.com,
 sundeep.lkml@gmail.com, alistair@alistair23.me, edgar.iglesias@gmail.com,
 mark.cave-ayland@ilande.co.uk, palmer@dabbelt.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20200715140440.3540942-1-armbru@redhat.com>
 <20200715140440.3540942-3-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5865965e-7075-0a6d-1e75-3ce174df68b6@redhat.com>
Date: Wed, 15 Jul 2020 16:27:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200715140440.3540942-3-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
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
X-List-Received-Date: Wed, 15 Jul 2020 14:28:12 -0000

On 15/07/2020 16.04, Markus Armbruster wrote:
> nd_table[] contains NIC configuration for boards to pick up.  Device
> code has no business looking there.  Several devices do it anyway.
> Two of them already have a suitable FIXME comment: "allwinner-a10" and
> "msf2-soc".  Copy it to the others: "allwinner-h3", "xlnx-versal",
> "xlnx,zynqmp", "sparc32-ledma", "riscv.sifive.u.soc".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/allwinner-h3.c | 1 +
>  hw/arm/xlnx-versal.c  | 1 +
>  hw/arm/xlnx-zynqmp.c  | 1 +
>  hw/dma/sparc32_dma.c  | 1 +
>  hw/riscv/sifive_u.c   | 1 +
>  5 files changed, 5 insertions(+)

Maybe we should add an entry to
https://wiki.qemu.org/Contribute/BiteSizedTasks for this?

Reviewed-by: Thomas Huth <thuth@redhat.com>


