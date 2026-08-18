Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E65C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 10:28:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwH38-0008Fj-IC; Tue, 18 Aug 2026 06:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wwH37-0008FG-Ku
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 06:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wwH35-0005R5-8f
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 06:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787048881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W076oaTN3mZWIncnazxWsBO9fhAcOCOEX8Q2I8p5CLg=;
 b=eppk7YwaBRX8tMln3XHcKo2Igujo5Mp0QCxKVpbGy//l2zYVwMQO6ud9AbFJkyG/obg1w4
 vgz3jmdGIfUBBw7rQqghWFoi+UrxaPyB6X5JExdf3tOAaoLnXgBd6KCJUXRaZlbqbqvrLi
 5tyEfK/AGnRuLJkzEb0t73/yoIQ+kwI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-hNacZlGdNuy6Vnq8XB-HcQ-1; Tue, 18 Aug 2026 06:28:00 -0400
X-MC-Unique: hNacZlGdNuy6Vnq8XB-HcQ-1
X-Mimecast-MFC-AGG-ID: hNacZlGdNuy6Vnq8XB-HcQ_1787048880
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-47f83450a8eso3481329f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 03:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787048879; x=1787653679;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W076oaTN3mZWIncnazxWsBO9fhAcOCOEX8Q2I8p5CLg=;
 b=NosQ50GGjoOGsLjQV+3lnY/aBLFZMOi4i1dFm43JriQSxQIyqpWOna/+u0qnB1P/8C
 arfsdp2ptLvuGg/6R+hRH+B2UtUfDx8yknGqnyEHABbnlEThXIHcewSK1A0lTam7BLOE
 drfXveLeiQZKNqo6L2+V5drDoqgqdSy0dFcFrCF69tAIZztDd5Onb5pM2aN8NtjjBXao
 592TofcrshDKKuh4ffhmEFZN/lGA7VlGjVIU9N/m5P9an+RF+G9eMHQpfYQyYj8ckO3b
 9gPCMyspxgy4HMbt5Q8MnebR5cbEW/uY+Eomi9pRax5h2iiATePpom4EgfN9hPJPHXrj
 Eh5g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqm2wASFoFzj61rtdTF/tg34w/nYxtjeEhNeTsJT40yysqHb/6E5QssJFHfi0DKiNC1OdFnJE8fvrj2@nongnu.org
X-Gm-Message-State: AOJu0Yyg90qCNwfBUBdNZ2REUlN8Ya1Rb1rrdlVHcD6PBxhT60P0mSCr
 8qM6p0cQMm/0oWQ6IDme3N6YnHYebgrRDJNg+0zAkn/QCZ2CKk9YDAgKrfUfPI87CIzB4EqrKxo
 adhvE1jekPMHesn7TAL00YDukek35bo/YFqvpmLofGt3ruDddLYaALyeKokTgqork0MsTL9Ar9V
 bWqjo+Ov2vKSOCa/dJXBZz4Ym0pYpz1oQ=
X-Gm-Gg: AR+sD11FGJDXSsYCdt+EWb0YvlT5hZh8kFKyfcgn0qFdLtbBe9qkphPz4Nva32ksJhs
 5KWZkTtm8MM/yY3S1yrifVj/KxD2u9XsNd2N7Fy+p8L/FXu9RGlZJad/bKE/HIS4+dleDRjFGOw
 HjJem3it8ZY+ALHauQ5p2d532e+HSRBXLyNCjoOi5/LXmuAk/ivkZLq/zjpMMJiMiZFFFsDFPnx
 NzuiLwgs2cVi2jc8xDUva6gKjh0VBRyj98hB2EqxrduTtU3V3IUSEHJgGs=
X-Received: by 2002:a05:6000:615:b0:47f:d0fb:ea40 with SMTP id
 ffacd0b85a97d-482a90d8d18mr10830307f8f.21.1787048879528; 
 Tue, 18 Aug 2026 03:27:59 -0700 (PDT)
X-Received: by 2002:a05:6000:615:b0:47f:d0fb:ea40 with SMTP id
 ffacd0b85a97d-482a90d8d18mr10830231f8f.21.1787048879091; Tue, 18 Aug 2026
 03:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
 <20260813181640.6537-3-philmd@oss.qualcomm.com>
 <13c02cbb-79db-4ebd-9fa1-63ffeb0b43f4@redhat.com>
 <32b54253-a109-44b2-bbdf-ab6440814522@oss.qualcomm.com>
In-Reply-To: <32b54253-a109-44b2-bbdf-ab6440814522@oss.qualcomm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 18 Aug 2026 12:27:46 +0200
X-Gm-Features: AcwNN1VFiSjMiuQJ71eW-xkX8E_0sDDKU1gt8oWaanCnXolW3nB6r0igM4GL6Ss
Message-ID: <CABgObfbw7wO1s2jcMoiT6ZCZei1KBTETTW-3vzffmao615dP3Q@mail.gmail.com>
Subject: Re: [PATCH 02/16] cpus: Improve qemu_cpu_kick_self() docstring
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, kvm@vger.kernel.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jqMCjkLwkGMz7f5KqvbFqQM1XzTFeyqHp5fGBugoGPw_1787048880
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

On Mon, Aug 17, 2026 at 5:46=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
> >> -/* Unblock cpu */
> >> +/**
> >> + * qemu_cpu_kick_self - Force vCPU to re-enter to its inner main loop
> >> + *
> >> + * Signal the current vCPU thread to exit any blocking operations and
> >> + * re-enter its inner execution loop to process pending requests,
> >> + * possibly returning to its outer execution loop.
> >> + *
> >> + * Must be called from within the vCPU thread itself.
> >> + */
> >
> > Neither is correct.

Right, the first of the two in "neither" referred to the existing
"unblock CPU" comment (it's clearly unblocked if it's calling
qemu_cpu_kick_self!).  The requirement to call from the vCPU thread is
correct, sorry about the imprecise reference.

> I got confused by this comment in accel/mshv/mshv-all.c and interpreted
> too much:

Yes, that code is broken and there is a patch queued to make it go away.

Paolo

> /*
>   * The signal handler is triggered when QEMU's main thread receives a
> SIG_IPI
>   * (SIGUSR1). This signal causes the current CPU thread to be kicked,
> forcing a
>   * VM exit on the CPU. The VM exit generates an exit reason that breaks
> the loop
>   * (see mshv_cpu_exec). If the exit is due to a Ctrl+A+x command, the
> system
>   * will shut down. For other cases, the system will continue running.
>   */
> static void sa_ipi_handler(int sig)
> {
>      /* TODO: call IOCTL to set_immediate_exit, once implemented. */
>
>      qemu_cpu_kick_self();
> }
> >
> > I'd rather have something like:
> >
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index 83cbd120a84..e5d068e341f 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -3292,7 +3292,7 @@ static void kvm_cpu_kick_self(void)
> >       if (kvm_immediate_exit) {
> >           kvm_cpu_kick(current_cpu);
> >       } else {
> > -        qemu_cpu_kick_self();
> > +        cpus_kick_thread(current_cpu);
> >       }
> >   }
> >
> > diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> > index 8a1af35ed32..b9b1ee39850 100644
> > --- a/target/i386/nvmm/nvmm-all.c
> > +++ b/target/i386/nvmm/nvmm-all.c
> > @@ -753,7 +753,7 @@ nvmm_vcpu_loop(CPUState *cpu)
> >   #if NVMM_USER_VERSION >=3D 2
> >               nvmm_vcpu_stop(vcpu);
> >   #else
> > -            qemu_cpu_kick_self();
> > +            cpus_kick_thread(current_cpu);
> >   #endif
> >           }
> >
> > and get rid of qemu_cpu_kick_self() completely.
>
> OK I'll take that route.
>


