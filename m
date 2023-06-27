Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4374BEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 06:21:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE24x-0007wY-SL; Tue, 27 Jun 2023 02:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qE24w-0007w6-7Z
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 02:21:30 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qE24s-0000at-UY
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 02:21:29 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso3214155e87.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 23:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1687846884; x=1690438884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Pe1lKlEte9odBdUn8Yh1NFVZ6H9gIwm0aa2j35EkhA=;
 b=LE2DQpYBcgbltuAjRWfYkbt9QZ/wIGq/+L3CBGU6OPJSp8dBTQKPJA2b2QdjngiIvt
 1EToFV6aqqfqY/MIgoc/EVGFSwVANXnkz26RwJmnrlDxzExTzl2s1W2YoXP/b9z7LxQp
 wPuOdTAqoSeyGJdC9KKhcRmPWg50tqWsnzMms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687846884; x=1690438884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Pe1lKlEte9odBdUn8Yh1NFVZ6H9gIwm0aa2j35EkhA=;
 b=RqFQt+ZYj2sJT3oAikFzpYdlXIkZ2uy9HqFPOAZEuaoPobswJqXAt3nyZeaPQ1BrfO
 sR5EtwHNF+PvIk40ChTEFXoXiIdCJeNs35Qc+RE7pAsFMfU3DXtc/s7I3AvSNyV/5e57
 +OrZ6Vyw69RTnO6WW4UWSxgJQeal8DNR8xfPkth48rHINxnj0nwq0bp7tvlgnAwmhkSg
 EnkZRNI8UoCiY14mxcRL6xQ5Ri3xLqoX1rTm0gXb2llpWKqJqLXBXmXKHnOJ8OJyY5hO
 ZjQjQqXQS/WnVVGEVOeaAOVsNs4WykJj+jfGa5+QhDfs2jOzFDliTHEBhScmkKvsQ/eO
 qhrw==
X-Gm-Message-State: AC+VfDwB0hmI1uKGYbvlRIhnFsIq6xhkgUXzusVoMbX9ncToafhLzp28
 o7gZK+EVxXIB6J0Yr8mrlcuZTOQG+ILZ0yIYJ8oX
X-Google-Smtp-Source: ACHHUZ4ZQ9icflqwjIdw0UaRMT9Z/SbuJQyz0T5kUl6N4B9HZ+Mbkhmz+Co3NYQjhDyawHkbIf6/b4XOvKQk9NPqznk=
X-Received: by 2002:a05:6512:2206:b0:4f9:740e:ca38 with SMTP id
 h6-20020a056512220600b004f9740eca38mr6488884lfu.53.1687846884138; Mon, 26 Jun
 2023 23:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
 <ZJphvbTsp6Q4Dfrq@x1>
In-Reply-To: <ZJphvbTsp6Q4Dfrq@x1>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 26 Jun 2023 23:21:12 -0700
Message-ID: <CAOnJCU+HqEgGpLGb1-4JrSC30rZZ_8Z5h3HMAKUN2xFu-D8uvA@mail.gmail.com>
Subject: Re: CFP open for RISC-V MC at Linux Plumbers Conference 2023
To: Drew Fustini <dfustini@baylibre.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, OpenSBI <opensbi@lists.infradead.org>, 
 U-Boot Mailing List <u-boot@lists.denx.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=atishp@atishpatra.org; helo=mail-lf1-x12e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Jun 26, 2023 at 9:08=E2=80=AFPM Drew Fustini <dfustini@baylibre.com=
> wrote:
>
> On Mon, Jun 19, 2023 at 12:55:39PM -0700, Atish Patra wrote:
> > The CFP for topic proposals for the RISC-V micro conference[1] 2023 is =
open now.
> > Please submit your proposal before it's too late!
>
> Thanks for posting. I am looking forward to it!
>
> > The Linux plumbers event will be both in person and remote
> > (hybrid)virtual this year. More details can be found here [2].
> >
> > We will start accepting proposals after 15th August 2023 to avoid last
> > minute visa/travel hassles.
> > The conference registration sells out pretty quickly too. Thus, we
> > would prefer to sort out the schedule sooner than later.
> >
> > The final deadline is 15th October 2023 though.
> >
> > [1] https://lpc.events/event/16/contributions/1148/
>
> I think that page is from 2022 and that this would be a better link:

Copy paste error :(

> https://lpc.events/blog/current/index.php/2023/06/23/risc-v-microconferen=
ce-cfp/
>

Thanks.

> Drew



--=20
Regards,
Atish

