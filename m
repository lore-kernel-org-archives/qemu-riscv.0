Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pud1a-00017V-WD
	for mharc-qemu-riscv@gnu.org; Thu, 04 May 2023 13:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1pud1E-0000ym-Hm
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 13:45:31 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1pud0o-0000CR-Pk
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 13:45:05 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8c30ac7e3so9658701fa.1
 for <qemu-riscv@nongnu.org>; Thu, 04 May 2023 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683222300; x=1685814300; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqK2t+w4eAv2nMLC+YhHzeQAd1EUZLTAFl/0DTKysgU=;
 b=He0gswm+AmCreIYLP23RW22eqYkqC9jkxR4V0qjghAtmUkb4GKYTwEIWTWkAVdKlpW
 SVUO3P6GATy/gUFX/EBZyrkCYzCHzX2Vf3J97CK2o8vivDaMjHcP+YOl9jdeOmcMs5Rs
 is/rYX2BzhdheNih/lQZNTZuPAJ0JYZENKjb89iKRZqV5CVfE9xjJ6JiRBhlNwKlq1si
 zgb81flxoz0f7LpLZLPHzNbQfQn6O75Cb3CMAnSuLX5v1pAZaOSMEgHKhHrnmgAdzPuW
 Lzte8k54AlHOGSwd8Xf5Ks0lXvy/pxJ+wLxI164VjioY7Lc8Ggf5o4/NmCDE3H96LDsQ
 Z1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683222300; x=1685814300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqK2t+w4eAv2nMLC+YhHzeQAd1EUZLTAFl/0DTKysgU=;
 b=fjEcS/dV/yNr90v0oVBpyNUix39Y+Y/LcbpjUxC9SR0Koctc7gS2qhtNC/vT3ZY8D/
 idJSh6dY2wE/q2Av+fx5Hvdrpt4dJYWUlPr7mGgtMRxsei47fsYXP+iIEUB18usgf9D+
 gEXYaKA8atXlrroEmipj2+NOtffSHt6Ei9TfYSMZrE6WuBPJRf5Eo4gBgXMnFRnSXbxI
 k1JFpFxbgu/XSGW7KvjMKbSWSp/TTc47osO46wzjjAaBoY/Gv5b1O5NBwBWfn++XxbOr
 nddpFNe4aKCZulAnMjYpoeBRv30AICa+czZo811YDhgQf8HYe9VuI2cUsSwfXgB4OknW
 /gPQ==
X-Gm-Message-State: AC+VfDyvFQm/won9+Ep9BjSunsEoaPWwtlSCsWFTYT8BMg+kIze9vLXN
 CLklfUAha6xD/ELG/NIAVPTZGDztnLKUheEjAwTh4Q==
X-Google-Smtp-Source: ACHHUZ5nh8wQZxsPzpI3A8099vqS+p2xsmcjhDyK9f+SgPpt9nZxLRjomgPagfioVwtKL3jM90A2L4+HQbKvBB9sV+c=
X-Received: by 2002:a2e:7e02:0:b0:2a7:b986:3481 with SMTP id
 z2-20020a2e7e02000000b002a7b9863481mr1156463ljc.41.1683222300249; Thu, 04 May
 2023 10:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <SJ0PR04MB787223A0357CF1901224B0AE906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <SJ0PR04MB7872731EEB43478A94698A34906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <CAOnJCUL3ou38Jw3MRExp3j64-tqQP0cPvbgF0Sk2izcCTn+X5Q@mail.gmail.com>
 <SJ0PR04MB78728BA9A1105067AD238C62906D9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <SJ0PR04MB787226486E2F78B2693FDCF1906D9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <CAKC1njRj_a-ASY_WWFp10ajfA9ut790JOAuRNqF=_UEqRc6zuw@mail.gmail.com>
In-Reply-To: <CAKC1njRj_a-ASY_WWFp10ajfA9ut790JOAuRNqF=_UEqRc6zuw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 4 May 2023 23:14:49 +0530
Message-ID: <CAHBxVyGrMMw7q5qm45A1mhhu8er5n4n3ahv2Lmg1=MvP7Dtj2w@mail.gmail.com>
Subject: Re: [RISC-V] [sig-qemu] QEMU SIG Meeting
To: sig-qemu@lists.riscv.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "alistair@alistair23.me" <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 04 May 2023 17:45:42 -0000

On Thu, May 4, 2023 at 9:39=E2=80=AFAM Deepak Gupta <debug@rivosinc.com> wr=
ote:
>
> I can see the passcode now in the meeting invite and it lets me through (=
although the meeting is over).
> I am assuming it'll work next time.
>

It was just me & Alistair in the meeting. I guess nobody else joined
due to the access issue.
It should work fine from the next time.

> -Deepak
>
> On Wed, May 3, 2023 at 5:37=E2=80=AFPM Alistair Francis <Alistair.Francis=
@wdc.com> wrote:
>>
>> Is that better?
>>
>> Alistair
>>
>> -----Original Message-----
>> From: Alistair Francis
>> Sent: Thursday, 4 May 2023 10:35 AM
>> To: Atish Patra <atishp@atishpatra.org>; sig-qemu@lists.riscv.org
>> Cc: qemu-riscv@nongnu.org; alistair@alistair23.me
>> Subject: RE: QEMU SIG Meeting
>>
>> Hmmm... The link is in the original invite. I'll try updating it and see=
 if that works.
>>
>> Alistair
>>
>> -----Original Message-----
>> From: Atish Patra <atishp@atishpatra.org>
>> Sent: Thursday, 4 May 2023 10:14 AM
>> To: Alistair Francis <Alistair.Francis@wdc.com>; sig-qemu@lists.riscv.or=
g
>> Cc: qemu-riscv@nongnu.org; alistair@alistair23.me
>> Subject: Re: QEMU SIG Meeting
>>
>> On Fri, Apr 28, 2023 at 8:02=E2=80=AFAM Alistair Francis <Alistair.Franc=
is@wdc.com> wrote:
>> >
>> > Ok! The calendar events are created (took a few goes) and you should b=
e able to see them.
>> >
>> >
>>
>> The meeting invite doesn't have the direct link to zoom or the passcode =
for the meeting.
>>
>> >
>> > Also I have lost any RISC-V list messages sent over the last month, so=
 Guerney if you want to resend your email I can try and help.
>> >
>> >
>> >
>> > Alistair
>> >
>> >
>> >
>> > From: Alistair Francis
>> > Sent: Friday, 28 April 2023 12:17 PM
>> > To: qemu-riscv@nongnu.org
>> > Cc: alistair@alistair23.me
>> > Subject: QEMU SIG Meeting
>> >
>> >
>> >
>> > Hello!
>> >
>> >
>> >
>> > Sorry about the delay! We have had some technical issues over here and=
 I haven't had access to emails. I am trying to switch over to my personal =
email to simplify things in the future.
>> >
>> >
>> >
>> > So a few updates from last time.
>> >
>> >
>> >
>> > First, Zhiwei and I are switching chair and vice-chair positions. I'm =
no longer a RISC-V foundation member so I can't remain as chair.
>> >
>> >
>> >
>> > Secondly let's actually schedule that meeting! From the poll the two b=
est times are:
>> >
>> >
>> >
>> > Tuesday 4PM AEST -> Tuesday 6AM UTC
>> > Thursday 10AM AEST -> Thursday 12AM UTC
>> >
>> >
>> >
>> > So let's alternate between those two. We can start with fortnightly (s=
o people should be able to attend a meeting a month) and go from there.
>> >
>> >
>> >
>> > Alistair
>> >
>> >
>>
>>
>>
>> --
>> Regards,
>> Atish
>
> _._,_._,_
> ________________________________
> Links:
>
> You receive all messages sent to this group.
>
> View/Reply Online (#13) | Reply To Group | Reply To Sender | Mute This To=
pic | New Topic
> Your Subscription | Contact Group Owner | Unsubscribe [atishp@rivosinc.co=
m]
>
> _._,_._,_

