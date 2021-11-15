Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmcM0-00010F-4Z
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 08:49:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLx-0000ys-D1
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 08:48:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmcLv-0005yv-Lg
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 08:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636984135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DnsB/WUUV5P4fY2Uku0xQfmUw6yQ5MSo3oTCQNXYz5E=;
 b=dZOJiZJlGBf8JqnFEHIm+S5PEC+HQx3VyRJzsZF/tNvxNXSTpqsEC3yWOO93VdNFAdCH55
 nIG2PrHtsWwlq2wt+djpCxBG2Uorwt8uZSXsFxcZHHVJ3b4hdaQlLHhFf6CyCzAPOQ+WWh
 WTtLA8OmfwUe9UuzAkDen7OSNYv1US4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-IHqQvcv1PaGlnIhEVX2cXA-1; Mon, 15 Nov 2021 08:48:51 -0500
X-MC-Unique: IHqQvcv1PaGlnIhEVX2cXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 202B31018F71;
 Mon, 15 Nov 2021 13:48:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEDBA17CEE;
 Mon, 15 Nov 2021 13:48:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A5AE11380A7; Mon, 15 Nov 2021 14:48:46 +0100 (CET)
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
Subject: Re: [PATCH RFC 1/2] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-2-armbru@redhat.com>
 <CAFEAcA94NzZq6fnvvF6aRJtHV29Wnrtudz4QKSoADo6=-QF5JA@mail.gmail.com>
Date: Mon, 15 Nov 2021 14:48:46 +0100
In-Reply-To: <CAFEAcA94NzZq6fnvvF6aRJtHV29Wnrtudz4QKSoADo6=-QF5JA@mail.gmail.com>
 (Peter Maydell's message of "Mon, 15 Nov 2021 13:40:36 +0000")
Message-ID: <871r3hjzr5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Mon, 15 Nov 2021 13:48:57 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 15 Nov 2021 at 12:56, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
>> and marked FIXME.
>>
>> Move it to the boards that create these devices.  Prior art: commit
>> eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
>> device "pl181".
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> @@ -670,7 +672,7 @@ static void sifive_u_machine_init(MachineState *machine)
>>
>>      /* Connect an SPI flash to SPI0 */
>>      flash_dev = qdev_new("is25wp256");
>> -    dinfo = drive_get_next(IF_MTD);
>> +    dinfo = drive_get(IF_MTD, 0, 0);
>>      if (dinfo) {
>>          qdev_prop_set_drive_err(flash_dev, "drive",
>>                                  blk_by_legacy_dinfo(dinfo),
>
>
> This part looks like it should have been in the other patch.

You're right.  Thanks!


