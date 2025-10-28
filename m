Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA45CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 09:17:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDfpR-0004RN-Co; Tue, 28 Oct 2025 05:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDfpN-0004Qc-AP
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 05:17:17 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDfpI-0002AO-02
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 05:17:16 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-781014f4e12so71178817b3.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 02:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761643028; x=1762247828; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F18Qs7uJzCXbncLZaxQP7n0h804Mv95+qZ16khmVUw8=;
 b=FMuCdHgx1yY6VujQ6++vqnQE8CUB6cdu3Zxqzq0qTie+wF4qQ2mb7kV5wNAU9djaOH
 xhhAgH4LuHuJHEAF9ffNwNjVMwxS8m/3uYJaR89bAMUrOWrjnuxgwinPlUE7ZX6cZcEp
 77KsTmLM0wHf8gWUswKrFiBXQpCEBh7drYUZ65pkxrAJEViXz0h7ZEbYFpgKMH0dyyqj
 IteuHuwGE9MSC+g2kp5rqvnhq2PqnFUVocWcpBnrKGCbTU7X1SrjKVZyvm4bunD26K4Q
 3IuF6fo1DMUzp9ZIroIC0ZMvPUgqJfW1VtoRq01aiBV0247pHa0F+AcP2oqO9T/2Knkh
 5b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761643028; x=1762247828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F18Qs7uJzCXbncLZaxQP7n0h804Mv95+qZ16khmVUw8=;
 b=KgRPFvWrnmwPVzPrCl7ad8xNY1EsoMgZ+K8OhfRO9PyC1mRwaaNxlQ9OPd9f3qFX4W
 0sF/wW1vNHyzM6OXYKmjkEO1wMigG0dDU6SHdhux7LRFaHQ29phjnz9MlC4G1bM+qGiL
 68VfJh4z0XU62II4T3AgA88OZyJYA72YxUQWO8+YR41Kx8COPnq+kd2Mw5A5QR1IykVX
 SfvQDUtbjbfQTHe5v1wKErWGYtUN/a+TNJ7HBvHzji58ZvX5KWuBLyHuZxZ40Je7OAjC
 uBb0ssRpN3ZXPIsALRwFI7sUmPgS8wBS25D8pkGt7gRErV/9IwbvbpWyz7kEi/IeEsZj
 SxZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3PEETpiSgPzFVWizXQsAc3nk0hx8vClK8sCOCQMBlXn41yDzaj7yes08gxVt6SYbOpbaZyIlviLCd@nongnu.org
X-Gm-Message-State: AOJu0YxRy9lZ/Fs9maF7Ep1cepcjxUynQ3ocXMnLYSkGuZuZBRdWkR3m
 9eClB42l/jINs6TcuOYUtJPqVPkiXDul1Wytn1OYr7HG+HP5PW46Ty3CvgGDkEm83PYZzBIOPNf
 coUC3LCZLIZ10ZyR+TzvAeDycrHVeITeXNyiuTTBVJQ==
X-Gm-Gg: ASbGncuuHW4WsmwMuIqQw4SEOPBLm4URTMhggfr2zEs0AurTzYjMJty70a2PSXXIL9h
 OXWywyZ52Duxed1Q8Po+qTFtUxCYE/50WaURlnaJUUugvyFqok79IcxLtBRJK0IXd4POlgMnReS
 r+mRjQN85wH49YSwzVyVS6U4EnXS7HwWlkxL9psr1IeByMnEg4yL20IC+UPCB5qvop3yzmyvVlP
 ehuv9cXiVxHYfwzewQc5FcX13CfJBsVn5IcZ+dsivzmU0FZnxSvkfhrhF7feg==
X-Google-Smtp-Source: AGHT+IFNsRSM6+VmnHjj6xShmMdhbWjGAZBBnXGhFnLBOUM0O7uKe/hC0NBJt+79GlM2c9OKgsRs9lph53a8WB6Lsnc=
X-Received: by 2002:a05:690c:a9c:b0:781:212f:b508 with SMTP id
 00721157ae682-78618005701mr26252427b3.63.1761643027997; Tue, 28 Oct 2025
 02:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251028080258.23309-1-philmd@linaro.org>
 <CAJ+F1CJYxKD23TFCy1-rbZf0Y_mSMdyVH=nFDM6eomDhVpmHYA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJYxKD23TFCy1-rbZf0Y_mSMdyVH=nFDM6eomDhVpmHYA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 09:16:56 +0000
X-Gm-Features: AWmQ_bnqlankZg7HwNowUaghAHfhTfclXG021WTDErfY94qHmZl2Taap05FWcYk
Message-ID: <CAFEAcA-O_Ocyrc11Y5TNmtja0RdgGJqA=gUAX_ya6oSUVRnzEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] hw/sysbus: Spring cleanups (part 1)
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 28 Oct 2025 at 08:50, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Oct 28, 2025 at 12:04=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> <philmd@linaro.org> wrote:
> >
> > - Use proper SysBus accessors
> >
> > Since v1:
> > - Reduce series
> >
> > Philippe Mathieu-Daud=C3=A9 (7):
> >   hw/sysbus: Use memory_region_name()
> >   hw/i386/microvm: Use proper SysBus accessors
> >   hw/i386/ioapic: Use proper SysBus accessors
> >   hw/timer/hpet: Use proper SysBus accessors
> >   hw/acpi/cxl: Use proper SysBus accessors
> >   hw/ppc/e500: Use proper SysBus accessors
> >   hw/pci-bridge/pci_expander_bridge: Use proper SysBus accessors
> >
>
> There are a bunch of compilation issues that I will let you address for v=
3.
>
> It looks like it should be possible to remove the "addr" field from
> SysBusDevice.mmio. On the surface it looks redundante with
> MemoryRegion.addr. I might be missing something.

Yes, I think they'll always be the same value. But
MemoryRegion::addr is private data of MemoryRegion
and there's no 'get' function provided; SysBus shouldn't
be reaching inside an MR struct to look at its internals.

(There is a memory_region_set_address(), so we could
I guess provide a memory_region_get_address() ?)

-- PMM

