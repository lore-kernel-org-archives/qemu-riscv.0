Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmeQG-00068R-3K
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 11:01:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmeQD-00066U-WC
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 11:01:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmeQ8-0000BU-Ir
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 11:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636992084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=84H5Q4BoQIAfTyarkILBkOQn7xhp7BjF6T+UxyIUUHw=;
 b=LI7pmm4SKCry4hJQxn9TREtM6DietLgKvPODTP1BAL6rDBaZHgp77OoU8u6DN4yOggopyO
 X/9OS9UnIoDm1KqKT+4o6TsJ6geuCSPVpBYzANaEdcPkDzi0RVQXwUldxGBSTuCou1ewWt
 WXpoKDn4oFFqTwA48zNIjjOdYEjG+s0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-d3HtzfBJPISmC4xQiXS2RQ-1; Mon, 15 Nov 2021 11:01:20 -0500
X-MC-Unique: d3HtzfBJPISmC4xQiXS2RQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76737804141;
 Mon, 15 Nov 2021 16:01:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CB7F5C1BB;
 Mon, 15 Nov 2021 16:01:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9AA4211380A7; Mon, 15 Nov 2021 17:01:15 +0100 (CET)
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
Subject: Re: [PATCH RFC 0/2] Eliminate drive_get_next()
References: <20211115125536.3341681-1-armbru@redhat.com>
 <CAFEAcA9gQCQv7XENgT-ap+2qhiggZTt-yEHQ1WJ6__5hHRRU1A@mail.gmail.com>
Date: Mon, 15 Nov 2021 17:01:15 +0100
In-Reply-To: <CAFEAcA9gQCQv7XENgT-ap+2qhiggZTt-yEHQ1WJ6__5hHRRU1A@mail.gmail.com>
 (Peter Maydell's message of "Mon, 15 Nov 2021 14:05:50 +0000")
Message-ID: <87fsrxflx0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 16:01:30 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> This is RFC because I'm unsure about the removal of
>>
>>     /* Reason: init() method uses drive_get_next() */
>>     dc->user_creatable = false;
>>
>> in PATCH 1.  Both users appear to wire up some GPIO.  If that's
>> necessary for the thing to work, we should just replace the comment.
>
> Looking at the code, it sort of is and sort of isn't. The GPIO line
> is the chip-select line. If you don't connect it then (because the
> ssi-sd device configures cs_polarity to SSI_CS_LOW, requesting an
> active-low chip-select) the device will always be selected. If
> the machine created an SSI bus with no SSI device attached to it
> then in theory the user could create an ssi-sd device and connect
> it there and have it work. But in practice it's really unlikely:
> machines create SSI buses with specific wired-in devices on them,
> and the guest OS knows what it has to do to enable the chip select
> for the device it wants to talk to (often some known GPIO pin on
> a GPIO controller).
>
> So I would keep the user_creatable = false, with a reason of
> "user should wire up GPIO chip-select line". But see below for

I'll do it this way.

> a pile of contrary precedent.
>
> (The chip-select GPIO is created in the parent class, incidentally.)
>
>> Aside: there may be devices that need manual wiring to work, yet don't
>> have user_creatable unset.  Bugs if you ask me.  I don't have smart
>> ideas on how to track them down.
>
> Me neither. I notice that the TYPE_M25P80 is also an SSI peripheral
> with an active-low chipselect but that one doesn't set user_creatable
> to false. TYPE_SSD0323 also is user-creatable and that one has an
> active-high chipselect, which means the user can create a device but
> it will then never be usable because it will ignore all transactions.
> (More generally, looks like most subclasses of TYPE_SSI_PERIPHERAL
> don't set user_creatable = false.)

For sysbus devices, we clear user_creatable by default, because sysbus
devices pretty much always[*] need wiring.  Is this the case for SSI bus
devices, too?


[*] The most prominent exception is "dynamic sysbus", which I believe
was a mistake.


