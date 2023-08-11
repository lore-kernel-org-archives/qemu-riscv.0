Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EC4C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 18:22:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUWm5-0001ue-SF; Fri, 11 Aug 2023 14:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qUWm4-0001s5-H9
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 14:22:12 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qUWm2-0003Zc-MM
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 14:22:12 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9a828c920so34889001fa.1
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1691778128; x=1692382928;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8r2XTGoSFK/Ew7sP8+tgqU0eersxAp/UPb63bW1de4=;
 b=Noz59LQMP88FFM7/lbQVcFiwwpbB/XPB2rAhStQDsdmzNpMPmBOJBKZKkqs/E6+xs1
 g2Fr1P0mtADFG6fS7AKkeGk9z75tdsPtanUxIX5qSf7HG8gBjmaJEXL67x2b8VGaC3Xh
 o4E/039x4H9F19sVGMDaF93cTj+lpCrK9NexE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691778128; x=1692382928;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8r2XTGoSFK/Ew7sP8+tgqU0eersxAp/UPb63bW1de4=;
 b=LCRMTT6UrsxDGF26CyZRY7XjIAAsujFI07GHhnqc6DZmjOGbIpyFkf12Lt2WUmmW3x
 ZKJ4WEbdQjKJRppq40JArOk8uFsFNlcqoHBPnVM9m7Y3/0SCavs2UL95sXSxtR7e7RfV
 gOGqRjAY/w7jRklHrugRe880QiaA8fJuSFO6R39+J1+L3Kj72gL/weB6QmWziZYh64pM
 ZJIH8acfHz2QiBUoMuGYEbBHxm6FVLKYfwfesmStVQE+nAmafPIoKJVTQeSX+WJQljiL
 AjwOl0cMr2lZXODIukjhmIVKt2JpQlZMewog61tuq857QGaLsL3kPSNdCWKLb/8EeH1s
 Hgpw==
X-Gm-Message-State: AOJu0YxaJrjjjNsI6nuXO6q32ZXV1eWbx/CXkePA2dqM6qZS0fovXXnq
 R2r6QbhzI++Dl7cIE6qyUSbQBLvqAIJ6DE5JAMtB
X-Google-Smtp-Source: AGHT+IHapfAu1BbGq3btuhA/HvbeXQkd1BbdryNDA6Rcye6NSjzJXsiWnv3YfSYB9xYBZAegXGBGDutSUdyY/cUfmuo=
X-Received: by 2002:a2e:9d85:0:b0:2b1:a89a:5f2b with SMTP id
 c5-20020a2e9d85000000b002b1a89a5f2bmr2210137ljj.2.1691778127979; Fri, 11 Aug
 2023 11:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
 <ZJphvbTsp6Q4Dfrq@x1>
 <CAOnJCU+HqEgGpLGb1-4JrSC30rZZ_8Z5h3HMAKUN2xFu-D8uvA@mail.gmail.com>
In-Reply-To: <CAOnJCU+HqEgGpLGb1-4JrSC30rZZ_8Z5h3HMAKUN2xFu-D8uvA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 11 Aug 2023 11:21:56 -0700
Message-ID: <CAOnJCUKwjqLtneCbdgqde0tDY0fWvBeBbuP8KXQ-vde+X2Rc4Q@mail.gmail.com>
Subject: Re: CFP open for RISC-V MC at Linux Plumbers Conference 2023
To: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 OpenSBI <opensbi@lists.infradead.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Drew Fustini <dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=atishp@atishpatra.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Jun 26, 2023 at 11:21=E2=80=AFPM Atish Patra <atishp@atishpatra.org=
> wrote:
>
> On Mon, Jun 26, 2023 at 9:08=E2=80=AFPM Drew Fustini <dfustini@baylibre.c=
om> wrote:
> >
> > On Mon, Jun 19, 2023 at 12:55:39PM -0700, Atish Patra wrote:
> > > The CFP for topic proposals for the RISC-V micro conference[1] 2023 i=
s open now.
> > > Please submit your proposal before it's too late!
> >
> > Thanks for posting. I am looking forward to it!
> >
> > > The Linux plumbers event will be both in person and remote
> > > (hybrid)virtual this year. More details can be found here [2].
> > >
> > > We will start accepting proposals after 15th August 2023 to avoid las=
t
> > > minute visa/travel hassles.
> > > The conference registration sells out pretty quickly too. Thus, we
> > > would prefer to sort out the schedule sooner than later.
> > >

Gentle reminder. We will start accepting proposals from next week (15th Aug=
ust).
We are planning to have 6-7 slots this year.


> > > The final deadline is 15th October 2023 though.
> > >

As per LPC committee's recommendation, the final deadline has been
moved to 15th september
to ease travel arrangements.

> > > [1] https://lpc.events/event/17/contributions/1417/
> >
> > I think that page is from 2022 and that this would be a better link:
>
> Copy paste error :(
>
> > https://lpc.events/blog/current/index.php/2023/06/23/risc-v-microconfer=
ence-cfp/
> >
>
> Thanks.
>
> > Drew
>
>
>
> --
> Regards,
> Atish



--=20
Regards,
Atish

