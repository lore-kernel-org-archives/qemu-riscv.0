Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRCFl-0005dG-WD
	for mharc-qemu-riscv@gnu.org; Wed, 22 Apr 2020 06:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRCFj-0005aC-Gs
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 06:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRCFi-0000Ar-RA
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 06:05:11 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44702
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRCFi-00006X-EP
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 06:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587549909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9EcqVeYqvigPiSD6IPipYSy7lwBCN6HkO6NYflX4Yfw=;
 b=ZDh4wb9C8+3sEuScKO2J0Fv1Tc8JOs3Fp1A+Zh23KKChqhoubfXQ4BnGPebhBff2KG77c3
 H+E3s6FH7hUsGmU5kVPvQ+bb3l8KPOKzrZN2hlBf3inWpagLgqSSaD+rP0hnHPw/iTV1Cc
 QT+mbNjlLqzTIznT7KXi4XRWEs2t5Ec=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-qA16r5J-Mu6hAlY4sjfgDg-1; Wed, 22 Apr 2020 06:04:51 -0400
X-MC-Unique: qA16r5J-Mu6hAlY4sjfgDg-1
Received: by mail-wr1-f69.google.com with SMTP id 11so809742wrc.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Apr 2020 03:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V9rIBjaXCVFb+27MgqipRdDkydXyWxQTqrdeF3j3K7Q=;
 b=AHVa+UrzYRsuS8U4eXfLdCxkk4IDdMG7Ed73nPHWGBAmPXDir0iBaeFHJrlm7lAQuE
 zOZdRD/ewHMmLxaaS3aWXVgg4MhpZ+LMXH6TW7v36DOJcALa8ZiHz3n/vLeASMVyiNz5
 IQ7sCLtRhgNtzW23MGbdSiC9blLlkNVotOgKbQxe3AsiE9O8I2OQJzd2/MsnpDYFYB+o
 q60x5gnCyHfP7HLMPHdJZgj0WH2ZOo1oDDiDLQJjCrbByuTP+roZDswMmDHRVWsw5m2X
 u7uTuMA0vQFmgIbATbYFLtgpWnMDcsD1ioTAtulxOMuPU3wHcJYPrXOJ0aGAVs3DOgwQ
 yzPw==
X-Gm-Message-State: AGi0Pua66Fup3A4rUr7tINsxfkAMZ0kFoX52QLr5oMf5VPigovXwG6rj
 Wi6zjgKjYiXGWEfawRkFdnIuHG7hiXwYiHr4AVY2wjRKiO+KKklAo+nqaYcziHJm9ceOGbZr9Z7
 gu/ijOI1NA8EX3AE=
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr16266481wrt.122.1587549890035; 
 Wed, 22 Apr 2020 03:04:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypJi1/Ccx2CyW2jaEpUD/YDxYboR6/Ttj/sE06nbKuydu66J+exL8QRn6ZXkPtrJKKB7n6VejA==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr16266445wrt.122.1587549889695; 
 Wed, 22 Apr 2020 03:04:49 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id h16sm8364071wrw.36.2020.04.22.03.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 03:04:49 -0700 (PDT)
Subject: Re: [PATCH] roms: opensbi: Upgrade from v0.6 to v0.7
To: Bin Meng <bmeng.cn@gmail.com>, Anup Patel <anup.patel@wdc.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <1587389038-1549-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKMzUzHC1FhV6ccjswjRvQH_h6DuUwEWjte4CAEmxPOKDg@mail.gmail.com>
 <CAEUhbmUTEVPF6f91SqrXL-_M-G_Jg2D29cBjbCs1YBGm2fk6QA@mail.gmail.com>
 <CAEUhbmWsNmTTTFz66M4sK-pEtEMOhfoYzCHYVyEF4AJ2X02twA@mail.gmail.com>
 <bd7da39b-4ece-7e72-a0a0-1d401c3b8c34@redhat.com>
 <CAEUhbmWCNGTn34wGSUvbwAbuY15VeDPPnFF2em4=XKEH5kReKw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f70626ab-3527-475e-de97-b399cc1d378c@redhat.com>
Date: Wed, 22 Apr 2020 12:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWCNGTn34wGSUvbwAbuY15VeDPPnFF2em4=XKEH5kReKw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Wed, 22 Apr 2020 10:05:12 -0000

On 4/22/20 11:50 AM, Bin Meng wrote:
> On Wed, Apr 22, 2020 at 4:15 PM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
>>
>> On 4/22/20 3:30 AM, Bin Meng wrote:
>>> Hi Alistair,
>>>
>>> On Tue, Apr 21, 2020 at 9:34 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>
>>>> Hi Alistair,
>>>>
>>>> On Tue, Apr 21, 2020 at 2:41 AM Alistair Francis <alistair23@gmail.com=
> wrote:
>>>>>
>>>>> On Mon, Apr 20, 2020 at 6:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>>>
>>>>>> Upgrade OpenSBI from v0.6 to v0.7 and the pre-built bios images.
>>>>>>
>>>>>> The v0.7 release includes the following commits:
>>>>>>
>>>>>> f64f4b9 lib: Add a new platform feature to bringup secondary harts
>>>>>> b677a9b lib: Implement hart hotplug
>>>>>> 5b48240 lib: Add possible hart status values
>>>>>> e3f69fc lib: Implement Hart State Management (HSM) SBI extension
>>>>>> 6704216 lib: Check MSIP bit after returning from WFI
>> [...]
>>>>>> 6c7922e lib: Support vector extension
>>>>>> 615587c docs: Update README about supported SBI versions
>>>>>> 66d0184 lib: Allow overriding SBI implementation ID
>>>>>> 9f1b72c include: Bump-up version to 0.7
>>
>> The git-short-log in the commit message is very appreciated, thanks.
>>
>>>>>>
>>>>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>>>>
>>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>>>
>>>>> Can you share a git branch with this patch? From memory these binary
>>>>> patches don't apply well from emails.
>>
>> Indeed. These patches are good candidate to use the 'git-format-patch
>> --no-binary' option with a link to a git repository to fetch the full
>> commit:
>>
>=20
> Some other project mailing lists do not prevent binary patch mails. If
> this is QEMU convention, I suggest we document this in
> https://wiki.qemu.org/Contribute/SubmitAPatch.

This is not a convention, but a personal suggestion. QEMU mailing list=20
don't have this limitation AFAIK. However some MTA do weird things when=20
relaying encoded binaries, and the result is patch are simply not=20
applicable.
Also such large (broken) mails are a pain when your mailbox has quota.

I added this entry:
https://wiki.qemu.org/Contribute/SubmitAPatch#Avoid_posting_large_binary_bl=
ob

>=20
>>     --no-binary
>>       Do not output contents of changes in binary files,
>>       instead display a notice that those files changed.
>>       Patches generated using this option cannot be applied
>>       properly, but they are still useful for code review.
>>
>>>>
>>>> Sure. Please grab the bits from http://github.com/lbmeng/qemu opensbi =
branch.
>>>>
>>>> You can also use patchwork to help with your custodian work.
>>>> http://patchwork.ozlabs.org/project/qemu-devel/patch/1587389038-1549-1=
-git-send-email-bmeng.cn@gmail.com/
>>>>
>>>> Click on the "mbox" button to download the patch and apply it.
>>>
>>> Will this be 5.0, or 5.1?
>>
>> Unlikely 5.1, too late.
>=20
> I am fine. Just wanted to know the strategy of which QEMU release to
> ship which OpenSBI release. +Anup in case he has some comments.

Well I'm not taking any decision here, I'm simply sharing the impression=20
I have after reading the thread between Palmer and Peter:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg697142.html
You can still ask Alistair to insist to Peter, but you'd need a strong=20
reason :)

>=20
> Regards,
> Bin
>=20


