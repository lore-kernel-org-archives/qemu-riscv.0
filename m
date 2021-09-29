Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVj7X-0000Bi-QP
	for mharc-qemu-riscv@gnu.org; Wed, 29 Sep 2021 19:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVj7W-0000BQ-OA; Wed, 29 Sep 2021 19:36:14 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:38610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVj7V-00036s-3b; Wed, 29 Sep 2021 19:36:14 -0400
Received: by mail-io1-xd2a.google.com with SMTP id z184so5296713iof.5;
 Wed, 29 Sep 2021 16:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fy85Wze5xBlgPnSXClQw/7iNZhoVYQObjdkVFNBiAyo=;
 b=pV+1kR1vKKjqZ6x91/O6M/101btdIgtAZT9MgI1wJD2jlfPHtkpCVwnesedLG5F2uR
 TBoPyQqHUNyhAu2ykJe3JbLM/wXgen0bZ0Y2smdKNxUwzEWNn8MG2Ij22ncmrRn6kwvX
 apN1elBOwd5iQ/b5mNjImSIZhElIeY7BhvGVgKi6NY1+Kf9Hle0fjElnLzT7au49gJlf
 emuV9A53/a3TKLaOZvahRApRU6KBskWWZjUSLaC71qr8Sp9gO+Z+CgmTpf5iCeOL6H6a
 hBGs+TsIgOl/5/ZqKIECSDlY643IzKwCyuvWwvnDzgIcupPtrcZ+PiFxqPQpas5KbT1l
 Cydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fy85Wze5xBlgPnSXClQw/7iNZhoVYQObjdkVFNBiAyo=;
 b=PC0Pu6fxTplADJxpx/fg9w12LMsYHO5pZx1Tn8VSiKkg6dSFkiBFGsTlmzSntHPpkL
 quF5GRZY7kAXdA5aX3JUntHAN29b150A2/tqvEsgxNDJ8j+FF1onihk3vWsM6xT57nMB
 1HBpyts1ykA/jaUzJM7oOjQ/HwxYp0zpTuqZ6MI4oKrwlSvWjHFT0Sw2k62+3AmVjeai
 3e6jCsFSFhyL5ODapjWKjs1PuJv+E8mDtF8ys41Z8lrE2uJteijjFKurSPtePPufMjrC
 yAAxjyOWrHW20HqaRlmt4eY7uKrvFjnofdJ8RTZUkx0AAYaZxEqLC/LWlfD0ia1nj0k5
 6f+g==
X-Gm-Message-State: AOAM530raSh/EFpS7liobo/07WpjXp1fA6cpYtbVr1KMWLJHH8xNU3ux
 9ZKJ7BkO9uwmQ6qnVVKFpV665xUJtHnynSs4XEI=
X-Google-Smtp-Source: ABdhPJz6aQebl3GhazcsqfoB2ZtHbAkltxwBFeE2B0gvqPjSTVnoesz6c4gq7S0zaC3wzRO2mcvbcDsm2FnzsTO9a64=
X-Received: by 2002:a5e:c101:: with SMTP id v1mr1747020iol.90.1632958571009;
 Wed, 29 Sep 2021 16:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <c617a04d4e3dd041a3427b47a1b1d5ab475a2edd.1632871759.git.alistair.francis@wdc.com>
 <CAEUhbmVq9Jy9AvkzPvTb-FSLnu5h7wK+RaKdJ7gfU0pjqt6tPQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVq9Jy9AvkzPvTb-FSLnu5h7wK+RaKdJ7gfU0pjqt6tPQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Sep 2021 09:35:44 +1000
Message-ID: <CAKmqyKP=B4Cp2ZASVy0KmbR-JMGdoF4zDsN1OdV6Pz_EPhSJew@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/riscv: shakti_c: Mark as not user creatable
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 29 Sep 2021 23:36:15 -0000

On Wed, Sep 29, 2021 at 7:47 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Sep 29, 2021 at 7:30 AM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Mark the shakti_c machine as not user creatable.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/shakti_c.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> > index 2f084d3c8d..e7cd3bdfb4 100644
> > --- a/hw/riscv/shakti_c.c
> > +++ b/hw/riscv/shakti_c.c
> > @@ -150,6 +150,12 @@ static void shakti_c_soc_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> >      dc->realize = shakti_c_soc_state_realize;
> > +    /* Reasons:
>
> nits: the multi-line comment format should use:
>
> /*
>  *
>  */

Fixed when applying the patch

Applied to riscv-to-apply.next

Alistair

>
> > +     *     - Creates CPUS in riscv_hart_realize(), and can create unintended
> > +     *       CPUs
> > +     *     - Uses serial_hds in realize function, thus can't be used twice
> > +     */
> > +    dc->user_creatable = false;
> >  }
> >
> >  static void shakti_c_soc_instance_init(Object *obj)
>
>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

