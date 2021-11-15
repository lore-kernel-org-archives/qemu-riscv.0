Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmcLJ-00005T-9L
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 08:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLH-000055-ON
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 08:48:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLF-0005tT-KK
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 08:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636984091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=39X9PHyLgG5tKgwq8KHgl7E9/h1ZlQME+TsbaEXLlrw=;
 b=Z51v133kjJYihUJ6S1o9quCBm7IqkELHTcW9m+8iTI8fQzl3HZdooimPGAi448HMEXMlk7
 o+lsFoZWQ1hepvyA0muGXofkZv71mq/jFC4np8XUo2TIAW+isI3YLKhzVYZ45K/KrUvdSS
 ZlZLQcw30F/563mUhoQ5Xy/WIMEcd5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-Xv4NxenOOdGGoggfrfxtoA-1; Mon, 15 Nov 2021 08:48:08 -0500
X-MC-Unique: Xv4NxenOOdGGoggfrfxtoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC53719251A2;
 Mon, 15 Nov 2021 13:48:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC61F5F4EF;
 Mon, 15 Nov 2021 13:48:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4854011380A7; Mon, 15 Nov 2021 14:48:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  hreitz@redhat.com,
 clg@kaod.org,  andrew@aj.id.au,  joel@jms.id.au,  b.galvani@gmail.com,
 jcd@tribudubois.net,  andrew.smirnov@gmail.com,  sundeep.lkml@gmail.com,
 hskinnemoen@google.com,  kfting@nuvoton.com,  nieklinnenbank@gmail.com,
 Andrew.Baumann@microsoft.com,  f4bug@amsat.org,
 edgar.iglesias@gmail.com,  alistair@alistair23.me,
 bin.meng@windriver.com,  palmer@dabbelt.com,  atar4qemu@gmail.com,
 mark.cave-ayland@ilande.co.uk,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
 <CAFEAcA-dxXdsaKP5G7nhSROqwsRS9=r44G7rvNpEKbjgX8BbGQ@mail.gmail.com>
Date: Mon, 15 Nov 2021 14:48:02 +0100
In-Reply-To: <CAFEAcA-dxXdsaKP5G7nhSROqwsRS9=r44G7rvNpEKbjgX8BbGQ@mail.gmail.com>
 (Peter Maydell's message of "Mon, 15 Nov 2021 13:38:43 +0000")
Message-ID: <875ystjzsd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Nov 2021 13:48:16 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> drive_get_next() is basically a bad idea.  It returns the "next" block
>> backend of a certain interface type.  "Next" means bus=0,unit=N, where
>> subsequent calls count N up from zero, per interface type.
>>
>> This lets you define unit numbers implicitly by execution order.  If the
>> order changes, or new calls appear "in the middle", unit numbers change.
>> ABI break.  Hard to spot in review.
>>
>> Explicit is better than implicit: use drive_get() directly.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/sysemu/blockdev.h           |  1 -
>>  blockdev.c                          | 10 ----------
>>  hw/arm/aspeed.c                     | 21 +++++++++++++--------
>>  hw/arm/cubieboard.c                 |  2 +-
>>  hw/arm/imx25_pdk.c                  |  2 +-
>>  hw/arm/integratorcp.c               |  2 +-
>>  hw/arm/mcimx6ul-evk.c               |  2 +-
>>  hw/arm/mcimx7d-sabre.c              |  2 +-
>>  hw/arm/msf2-som.c                   |  2 +-
>>  hw/arm/npcm7xx_boards.c             |  6 +++---
>>  hw/arm/orangepi.c                   |  2 +-
>>  hw/arm/raspi.c                      |  2 +-
>>  hw/arm/realview.c                   |  2 +-
>>  hw/arm/sabrelite.c                  |  2 +-
>>  hw/arm/versatilepb.c                |  4 ++--
>>  hw/arm/vexpress.c                   |  6 +++---
>>  hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>>  hw/arm/xlnx-versal-virt.c           |  3 ++-
>>  hw/arm/xlnx-zcu102.c                |  6 +++---
>>  hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>>  hw/misc/sifive_u_otp.c              |  2 +-
>>  hw/riscv/microchip_pfsoc.c          |  2 +-
>>  hw/sparc64/niagara.c                |  2 +-
>>  23 files changed, 49 insertions(+), 52 deletions(-)
>
> This would be easier to review if it didn't try to change all of
> these board/SoC models at once. Each one of them is entirely
> separate review work.

Happy to split, but first I'd like to get some advice on the part I'm
unsure about; see my cover letter.


