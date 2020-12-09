Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn7yG-0007i5-JA
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 17:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn7yF-0007hk-1I; Wed, 09 Dec 2020 17:30:03 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:35978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn7yD-0000qs-Cj; Wed, 09 Dec 2020 17:30:02 -0500
Received: by mail-io1-xd42.google.com with SMTP id z136so3407393iof.3;
 Wed, 09 Dec 2020 14:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LPSiVGA1mi0uz7KfoFUUGfLPlcPXJD1Lil0t5jswboM=;
 b=cHkDWTObYKWwVRfqEphIqZ+DUGPysovPb4PhO4s++yrhGQRaGO91WpLQ3geCipvLKB
 5JVTZvlWxjZT1SnSWjj9+g9Z4C2eyXfPaXPfEk02jOK9zxUByQ6Y1+kAyrNt8tfvKjcG
 EkkmZfSd8iiYbzo183hPUgngV6YOl7KS+0xGkRNEtKZoS2RPv6XcHHnkwLkZuf/ZxD4U
 TerdNhbqsjNvy1XZW5GdE2Ac2Kwxb3ZTr380fTzuHV+HhudUb0fats3geM2v82PRYG7Q
 sCA0oaAJmb1w0SCg3YsIrU/e1+qtemoRhXTk0zl8Saw7do2VHu/C4QvyyqMlL5dn/Rtq
 1YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LPSiVGA1mi0uz7KfoFUUGfLPlcPXJD1Lil0t5jswboM=;
 b=UR8clFKdkA/iPKPwXlVGpcTauxDbo5m4W4CMhZ0A/IUXXo/EfDYM+YUD+6EpWjDFqn
 XSF73kT+AGSpS2xJ5ENzWpF04AAbBTc0VjNpijwt2xG0Y7/CgPgyf1LmMxI1lI3iaDnt
 L2W7kVZ//S8iUlEpNGiLzdH2pea38VCQZqXPmWsVgXsS/fCq5ltTF0LmbxuAk+6Hz8JK
 AKjNkSb93ke74wkSCkAKmuvsdBvoW3DgQC8Yj5FqHOFbxsDQnC38f0wkPKt2GVgtf5WU
 toAhUxM56J/1PKK+nWUaZL7pQpJn8YhfjMpqfGR+tYZLwsckKPOMD7uvec2gsuJGBZYQ
 /ciA==
X-Gm-Message-State: AOAM531m014DhWtlDuUgCD04X8IAW9tJIm8bCzI04/pg8qzTvWW9pvIN
 rQSkfEzaTPMUFVT9bKeMYXkzzWs/m61vJnzqEW/Hihs0aLo=
X-Google-Smtp-Source: ABdhPJzHjZt+rlT1yzBRrQVSS5uL6BinzkWsvuiNN5VoSWKogzC3rJ9hw9G0bA8KppQPRWeLKhP6ha+EWZja9PmWrxo=
X-Received: by 2002:a02:a419:: with SMTP id c25mr5921118jal.91.1607553000044; 
 Wed, 09 Dec 2020 14:30:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <3f1ff73c70b003826bf436ae4c937b62cac79bdc.1607467819.git.alistair.francis@wdc.com>
 <1de03a6f-47d9-6032-ec66-eddea15b1760@linaro.org>
In-Reply-To: <1de03a6f-47d9-6032-ec66-eddea15b1760@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Dec 2020 14:29:33 -0800
Message-ID: <CAKmqyKOFepUsgYcYO9P+Drira0WqVP-yDXhWHRstNB5mh6BBTQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] target/riscv: Specify the XLEN for CPUs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
X-List-Received-Date: Wed, 09 Dec 2020 22:30:03 -0000

On Wed, Dec 9, 2020 at 8:03 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/8/20 4:56 PM, Alistair Francis wrote:
> > +#ifdef TARGET_RISCV64
> > +static void rv64_sifive_u_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > -    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> > +    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >  }
> >
> > -static void rvxx_sifive_e_cpu_init(Object *obj)
> > +static void rv64_sifive_e_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > -    set_misa(env, RVXLEN | RVI | RVM | RVA | RVC | RVU);
> > +    set_misa(env, RV64 | RVI | RVM | RVA | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> >  }
> > +#else
>
> I guess it isn't much duplication, but you could retain the rvxx functions and
> pass in xlen as an argument.  Either way,

Good idea, this file still needs more work in the future. So I'll do
that when fixing it up.

>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks.

Alistair

>
> r~

