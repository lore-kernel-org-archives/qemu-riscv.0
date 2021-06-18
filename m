Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lu8XB-0001b5-1C
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jun 2021 03:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu8X9-0001aj-5X; Fri, 18 Jun 2021 03:03:19 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:40750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu8X6-0003tm-Qb; Fri, 18 Jun 2021 03:03:18 -0400
Received: by mail-io1-xd2c.google.com with SMTP id l64so5954964ioa.7;
 Fri, 18 Jun 2021 00:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5X/4/nkzLfoBwiMVzIa5NXVjagI+mBMH8kfiOpkIoOU=;
 b=XsHytVEpOFGi3j1l6J+oUqu6eX3MVpH6z37IVPh/wz73x5rMYqTLIyui281h+ofFuN
 KL3nA8OyhLXByHUKNYV1jKBdLH092O0pm07KraRjqiY5DD4kLuHdWpbBZaWBZA5VLMdt
 Pv9tpV7vHNL2O1b9po6YgYgG8YDegaYDt83JqIAdoiDDTFz5J+z6md6fwiQ1Hz4ex6Vq
 7J7z2jAw6vXTIvOZBGaHRh6ASoD/LDeYituWUnQdnm0R8zSSgtixYwDm3dZ8TqoZ8QLQ
 TQwpUYAy4JJiB6IXQE33Q9EibAyLjIKRPC7VuTBE251Gx2yi+ts8RpJqZfImAr92gB9u
 WGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5X/4/nkzLfoBwiMVzIa5NXVjagI+mBMH8kfiOpkIoOU=;
 b=piRq1nqDomHmP/7h3Uvej+l9QIzT9YlVf+FHYWcCo+6VAthJjfDPereWSNLoNXNELj
 bGPfpkxhVCQSIz2gXPGFwzIRr8VhH1ui04MsLJWs6wkCXqTpETRaz8yKqTJa4Zp6617V
 +G4+L/r7gU4XI1DrAEBg3xdSsAQT5HDeTU+rlzGXX32z549FtZaFYanxKkkWTiwe9L5D
 skBsdMu60G+FrVTbPDgl+CmykOU/9eWSykEodcfxvgRNBPMRIE00RBYHgtrHlUczeyf8
 1ldFjU8WLBzs6dxk8WEJRLD2zV3TG0cs/Cp2ziHfPcQaFgRUHefEJLrPiwJWqs0dqVZS
 RbSA==
X-Gm-Message-State: AOAM5334ft8aVSUyr2/2oLCN8fSrgSd/ls/kDyd19BIVtd6wW8P/rUP5
 rehLv5bZ+Ds6guyR+o0NJGq6I4J0T5rnvTjM0e8=
X-Google-Smtp-Source: ABdhPJxfacj8r1X5XHOKbCi4PZFL/h7QAPwnKneJ0PcGEUyIrgf6WXqCWq91L8wljrFUpSpRs4Jkcoi0K0QI/iM36mE=
X-Received: by 2002:a02:8784:: with SMTP id t4mr1968465jai.26.1623999794720;
 Fri, 18 Jun 2021 00:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623196022.git.alistair.francis@wdc.com>
 <b40ec8986ba8e7de3a3cf0ee4718b4868793be67.1623196022.git.alistair.francis@wdc.com>
 <d3057566-0b3f-4fdc-73c6-323eb6366b8f@redhat.com>
 <CAKmqyKNs5GwcGwRUZ8v17MJd40_STjOgqu-2vRU7ee21x79cKw@mail.gmail.com>
 <e2d39538-ee41-97e5-f547-793229a998b0@redhat.com>
In-Reply-To: <e2d39538-ee41-97e5-f547-793229a998b0@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 17:02:48 +1000
Message-ID: <CAKmqyKM5raxUZqJwnhF9Uzb7NoksTeE+HumMywZZBO-Pn30p3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/timer: Initial commit of Ibex Timer
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Fri, 18 Jun 2021 07:03:19 -0000

On Fri, Jun 11, 2021 at 9:52 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/06/21 01:01, Alistair Francis wrote:
> > On Wed, Jun 9, 2021 at 5:57 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> On 09/06/21 01:48, Alistair Francis wrote:
> >>> Add support for the Ibex timer. This is used with the RISC-V
> >>> mtime/mtimecmp similar to the SiFive CLINT.
> >>>
> >>> We currently don't support changing the prescale or the timervalue.
> >>>
> >>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>
> >> Any chance this could have a qtest?  It would also be nice if the CPU
> >
> > Yep, do you have a good example of what the qtest should look like?
>
> Without having access to the IRQ line it's a bit hard to write it, but
> the qtests for various real-time clocks are probably the closest.
>
> >> had qemu_irqs for MEIP/MTIP/SEIP (possibly MSIP too but that one is
> >> bidirectional), so that instead of riscv_cpu_update_mip you can just
> >> connect to a GPIO pin of the CPU and do qemu_set_irq.  It could also be
> >> used by the qtests via irq_intercept_in.
> >
> > Yeah the riscv_cpu_update_mip() is not ideal. As it is what we
> > currently also use for the CLINT I don't want to fix it up here. In
> > the future I'll work on changing riscv_cpu_update_mip in all the
> > RISC-V timers to use GPIO lines instead.
>
> If you add GPIO output pins to the CPU, the devices can be converted
> away from riscv_cpu_update_mip one by one.

I've added this conversion to my TODO list and hopefully soon I'll be
able to remove riscv_cpu_update_mip(), but I don't want to block this
series or the ACLINT one on that.

Then I can look at qtests.

Alistair

>
> Paolo
>

