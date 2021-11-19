Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo27P-0005Qb-56
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 06:31:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo27N-0005Oq-67
 for qemu-riscv@nongnu.org; Fri, 19 Nov 2021 06:31:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo27K-0005t6-0V
 for qemu-riscv@nongnu.org; Fri, 19 Nov 2021 06:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637321500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjADZdpv+kqxT3byimXu2czxf2V1cuSA9XYjAonax/M=;
 b=HHiD8Zcin9iBgQ42bT53zkP2yPjJ2FqNRMFaCJYbfxgPh5aYlHR33PylVZ0YZMomdrG4rN
 K+npFxmqc1cYU3dayE2J5N0MgyK/FXqIiJbGRCkE59hPy3frHsIkQJ7Pvf40orf5YnRY0p
 IVi05QUiX60bqhcL2hT4Bf9BiIksSMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-kFriTCRIOPONIt8N-uz_7Q-1; Fri, 19 Nov 2021 06:31:37 -0500
X-MC-Unique: kFriTCRIOPONIt8N-uz_7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63C5110247A9;
 Fri, 19 Nov 2021 11:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2731F19733;
 Fri, 19 Nov 2021 11:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 846AC11380A7; Fri, 19 Nov 2021 12:31:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-riscv@nongnu.org,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org,  Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
References: <20211119102549.217755-1-thuth@redhat.com>
 <f2de8ec7-3157-0f87-cfc8-70633e0f8658@redhat.com>
 <4a4c5223-905f-9974-3e54-e4ccd133c359@redhat.com>
Date: Fri, 19 Nov 2021 12:31:34 +0100
In-Reply-To: <4a4c5223-905f-9974-3e54-e4ccd133c359@redhat.com> (Thomas Huth's
 message of "Fri, 19 Nov 2021 12:02:01 +0100")
Message-ID: <87o86gnzzd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 11:31:45 -0000

Thomas Huth <thuth@redhat.com> writes:

> On 19/11/2021 11.40, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 11/19/21 11:25, Thomas Huth wrote:
>>> Configuring a drive with "if=3Dnone" is meant for creation of a backend
>>> only, it should not get automatically assigned to a device frontend.
>>> Use "if=3Dpflash" for the One-Time-Programmable device instead (like
>>> it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).
>>>
>>> Since the old way of configuring the device has already been published
>>> with the previous QEMU versions, we cannot remove this immediately, but
>>> have to deprecate it and support it for at least two more releases.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   docs/about/deprecated.rst | 6 ++++++
>>>   hw/misc/sifive_u_otp.c    | 9 ++++++++-
>>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>=20
>>> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
>>> index 18aa0bd55d..cf6098ff2c 100644
>>> --- a/hw/misc/sifive_u_otp.c
>>> +++ b/hw/misc/sifive_u_otp.c
>>> @@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState *dev,=
 Error **errp)
>>>                             TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
>>>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>>>   -    dinfo =3D drive_get_next(IF_NONE);
>>> +    dinfo =3D drive_get_next(IF_PFLASH);
>>> +    if (!dinfo) {
>>> +        dinfo =3D drive_get_next(IF_NONE);
>>=20
>> Isn't it a bug to call drive_get_next() from DeviceRealize()?
>> Shouldn't drive_get_next() be restricted to the MachineClass?

drive_get_next() needs to die:

    Subject: [PATCH v2 00/13] Eliminate drive_get_next()
    Message-Id: <20211117163409.3587705-1-armbru@redhat.com>

Not for 6.2.

> Yes, that would certainly be better - but considering that we are
> already past RC1 of the 6.2 release, I'd rather prefer to keep this
> patch rather as small as possible and do such refactorings during the
> next development cycle instead.

Concur.

Your patch conflicts with mine.  No worries, I'll rebase.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


