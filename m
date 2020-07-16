Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvx3j-0000z1-Bg
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jul 2020 02:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jvx3h-0000wC-8d
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2020 02:07:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49410
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jvx3e-0002E8-OE
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2020 02:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594879669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=knwO7RwYQKuJ2UM5mbdYylCoJAMAOp3ETRj6uEeCO34=;
 b=hRfMh2Put3tCP+IbjU/FWd1xFrXON+TUK3F4NDBU/ALera2hwfUze3lxn8z7huBR5zu0vz
 Hrzxd8MVKCL6JR2S/Pf471qYQy3cBZC+V92cvmNOMik/9qnQfvtHdDHtfsKsjBBiYFLyaR
 Y17++zKIFH8elqM5Hc3ZxOCdEPcEFqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-zi0zKrDfN5Oe6As6I1KFxw-1; Thu, 16 Jul 2020 02:07:44 -0400
X-MC-Unique: zi0zKrDfN5Oe6As6I1KFxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAA1D1081;
 Thu, 16 Jul 2020 06:07:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64AEF5C1C3;
 Thu, 16 Jul 2020 06:07:39 +0000 (UTC)
Subject: Re: [PATCH for-5.1 1/2] msf2: Unbreak device-list-properties for
 "msf-soc"
To: sundeep subbaraya <sundeep.lkml@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beniamino Galvani <b.galvani@gmail.com>, nieklinnenbank@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, palmer@dabbelt.com
References: <20200715140440.3540942-1-armbru@redhat.com>
 <20200715140440.3540942-2-armbru@redhat.com>
 <ef1d7fe4-0558-cc7b-16d7-906c4aa9915b@amsat.org>
 <87wo34u9fv.fsf@dusky.pond.sub.org>
 <CALHRZurw_HsyFmNWYuG_Cagx8cTTBCGzafWmx6JHJ+NS7aVKOw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <9b3f870c-481f-79f1-e55e-074ee0d95633@redhat.com>
Date: Thu, 16 Jul 2020 08:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CALHRZurw_HsyFmNWYuG_Cagx8cTTBCGzafWmx6JHJ+NS7aVKOw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 00:51:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Jul 2020 06:07:53 -0000

On 16/07/2020 04.59, sundeep subbaraya wrote:
> On Wed, Jul 15, 2020 at 8:12 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> On 7/15/20 4:04 PM, Markus Armbruster wrote:
>>>> Watch this:
>>>>
>>>>     $ qemu-system-aarch64 -M ast2600-evb -S -display none -qmp stdio
>>>>     {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 5}, "package": "v5.0.0-2464-g3a9163af4e"}, "capabilities": ["oob"]}}
>>>>     {"execute": "qmp_capabilities"}
>>>>     {"return": {}}
>>>>     {"execute": "device-list-properties", "arguments": {"typename": "msf2-soc"}}
>>>>     Unsupported NIC model: ftgmac100
>>>>     armbru@dusky:~/work/images$ echo $?
>>>>     1
>>>>
>>>> This is what breaks "make check SPEED=slow".
>>>>
>>>> Root cause is m2sxxx_soc_initfn()'s messing with nd_table[] via
>>>> qemu_check_nic_model().  That's wrong.
>>>>
>>>> We fixed the exact same bug for device "allwinner-a10" in commit
>>>> 8aabc5437b "hw/arm/allwinner-a10: Do not use nd_table in instance_init
>>>> function".  Fix this instance the same way: move the offending code to
>>>> m2sxxx_soc_realize(), where it's less wrong, and add a FIXME comment.
>>>
>>> That addresses this other thread, right?
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720658.html
>>
>> Correct!  I wasn't aware of it, thanks for making the connection.
>>
> 
> Thanks Markus for the fix.

It's rather just a work-around that avoids the crash than a real fix. I
think we can use it for the upcoming 5.1 release, but it would be great
if you could rework this code for 5.2, so that the nd_table handling is
moved to msf2-som.c instead.

 Thanks,
  Thomas


