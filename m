Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puMbW-0007oe-4V
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 20:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1puMbU-0007oA-Hz
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 20:13:48 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1puMbS-0000Rs-Su
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 20:13:48 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-24e5c1f6461so549824a91.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 17:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1683159224; x=1685751224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zTvejoe6dBo3A8bJH01X9r1bicvWNji+lxmxNnbG1k8=;
 b=YdC1Wto5RfCBS5qP55H3pqJFish5UxyAV/r5DfM/GrFwAffIcyOFpw5FXb4AbTAgAI
 Tq487oALVZzmfZWRfIw/BAC9avu98NXGGBvAMg4HQflN7oz5qiVML14275s8p4eK5Vk4
 xelZevn5F8BVfUA9TB1G85vhUCs/r+7cm+KNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683159224; x=1685751224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTvejoe6dBo3A8bJH01X9r1bicvWNji+lxmxNnbG1k8=;
 b=QVNcJ3NxknEdfNpERIdJSX1AGQG0t9gN21lh7jWHha9/yGsqo06EQ539Fa58fcjPl0
 0wOx04zpXmLZXi2zqb6f4ZlP2nQJYCpEWCGiW841u9NidRE0iuqY8SGEaxaoJtstsJnU
 cUATwjBi/mCLYzmhco7tqz++NpTEvzW2kOLUiAPYc3mTfYGfi8+K2gY658K1rrys5Tgj
 fY8rQjZPo3yBQP7Z9CaWKLmQ/47lNw1ixAuzxL/Z9Utf0CGy4Sl8oBpHCOgTpT3nsA5h
 BPF+EIZZTN/yNxUFfmMnaezEjiY9sYrzT3pM/SLgd/Ss2TMF/SWypYCmCdK+xGOlPpx6
 QS9g==
X-Gm-Message-State: AC+VfDxA3h4e6mL0Txs9ZA5DXNVOuMpBrP/iwbLw7LFgeZjI3OZHtOOd
 DzBr0NAoJHsGhBxpATk0joKvv0/RsMFxa/JiDKYx
X-Google-Smtp-Source: ACHHUZ7wQUgwCfEjmAzy2UljuxArFbC0G/CSyypfSMVgFLyVaL+0KSsh+6wVbVkrvhhkDoMsGdm4UsRa+UTdmvVx+RY=
X-Received: by 2002:a17:90b:4a01:b0:237:62f7:3106 with SMTP id
 kk1-20020a17090b4a0100b0023762f73106mr396154pjb.17.1683159224506; Wed, 03 May
 2023 17:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <SJ0PR04MB787223A0357CF1901224B0AE906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <SJ0PR04MB7872731EEB43478A94698A34906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
In-Reply-To: <SJ0PR04MB7872731EEB43478A94698A34906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 4 May 2023 05:43:33 +0530
Message-ID: <CAOnJCUL3ou38Jw3MRExp3j64-tqQP0cPvbgF0Sk2izcCTn+X5Q@mail.gmail.com>
Subject: Re: QEMU SIG Meeting
To: Alistair Francis <Alistair.Francis@wdc.com>, sig-qemu@lists.riscv.org
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "alistair@alistair23.me" <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=atishp@atishpatra.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 04 May 2023 00:13:48 -0000

On Fri, Apr 28, 2023 at 8:02=E2=80=AFAM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> Ok! The calendar events are created (took a few goes) and you should be a=
ble to see them.
>
>

The meeting invite doesn't have the direct link to zoom or the
passcode for the meeting.

>
> Also I have lost any RISC-V list messages sent over the last month, so Gu=
erney if you want to resend your email I can try and help.
>
>
>
> Alistair
>
>
>
> From: Alistair Francis
> Sent: Friday, 28 April 2023 12:17 PM
> To: qemu-riscv@nongnu.org
> Cc: alistair@alistair23.me
> Subject: QEMU SIG Meeting
>
>
>
> Hello!
>
>
>
> Sorry about the delay! We have had some technical issues over here and I =
haven't had access to emails. I am trying to switch over to my personal ema=
il to simplify things in the future.
>
>
>
> So a few updates from last time.
>
>
>
> First, Zhiwei and I are switching chair and vice-chair positions. I'm no =
longer a RISC-V foundation member so I can't remain as chair.
>
>
>
> Secondly let's actually schedule that meeting! From the poll the two best=
 times are:
>
>
>
> Tuesday 4PM AEST -> Tuesday 6AM UTC
> Thursday 10AM AEST -> Thursday 12AM UTC
>
>
>
> So let's alternate between those two. We can start with fortnightly (so p=
eople should be able to attend a meeting a month) and go from there.
>
>
>
> Alistair
>
>



--=20
Regards,
Atish

