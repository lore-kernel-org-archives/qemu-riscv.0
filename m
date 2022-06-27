Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5cxG-00036x-VV
	for mharc-qemu-riscv@gnu.org; Sun, 26 Jun 2022 20:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5cxF-00034U-Ea; Sun, 26 Jun 2022 20:50:17 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5cxD-0006UB-MF; Sun, 26 Jun 2022 20:50:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso10791985pjn.2; 
 Sun, 26 Jun 2022 17:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DlAh+MYm0ALR+t6lZ20MDfm4ojm0H8/WPoHVLxPsxKA=;
 b=hP8YQhAXIPaZ+ZFfKDVgEIo8Q1OsypA6yNW7dJbtNHJPBYNFgsC66hH1kA9PemUS/2
 jU1gQelaA3HVWM09dUi0u4ww5tyHt8Ebwy8qGHP0rRr0fcXSXaUAIJxuE8znwQ7PlNWa
 mJiY8t2f0T+zo7l6uJcUzWmUhCsFCfWnmyL1t7lGoEp65YhJvF+M9BC9UsngTcrUf5fj
 XrbNts+CDocMcBP2pkU2LFctl6U0QRxODWn95lmmDa/eCFMEPjiFN8RdIjmDaGCWQ2OM
 mbVNITJqTnhbk0HF8wXcNpHdNFXA2H/bFAO2nn1Yp7mx1gkap9MdqmlFQHMc0XFsMYWp
 bRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DlAh+MYm0ALR+t6lZ20MDfm4ojm0H8/WPoHVLxPsxKA=;
 b=kezi91aPdi6+JxhSEbsklqUp8sTuxeSZ3l0bKrcn9Lxks627QuKOSwCF6Oqq0Nf+/d
 ls1RSWP/krVyJfX16hqn67L9j+LFEY7+JJCvTVbD6wlhinhAX7HhnYq3uPUIE9aFx+fv
 EvpUgHahMc0KeGIBrFmtm8KRal9s2hZGKaylVR6/Pmp93GAbLG6/DA1SfyT08Yu8Fdei
 cS/SfvSYCn2CbjZpfeGRe41CuBbIW/9wWGAjgCKDdSbqO9LLrtTYghEtB3CVMU8THBsa
 K+KxJa+INT8ezg3SJf+UA1ouM3mYd6yx50WHnUVGRO72fI3xRdNx7mWrwjX6KH1wlv/q
 8J1g==
X-Gm-Message-State: AJIora9hdWQZbr/WEjBFNM877usolRXgAZElm4e8NRekzf7DpAipoLAI
 4gNOTPK2tdBVOovPs27G7yIDkAWxRS91GgNajaQ=
X-Google-Smtp-Source: AGRyM1viI7b/YM9lxPOgKqonkGeyk0A+95HtWF2bRlW723CGZ1CA6nufzG//abqR8/JdsxeuwFayO9PyNWPLSs4GqPo=
X-Received: by 2002:a17:902:bc4c:b0:16a:4849:ddbe with SMTP id
 t12-20020a170902bc4c00b0016a4849ddbemr10993584plz.25.1656291013055; Sun, 26
 Jun 2022 17:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmXukS+zH=pjiF9NQWBkYguGCDiDAjOOjeZteOzR6xWK=Q@mail.gmail.com>
 <CAKmqyKOAZZRVherNSu__i0rtS3w15cZ2QAutw4=Qp5y5b_N0rw@mail.gmail.com>
 <CAHBxVyHd4LXAv6OY7mOzAbfww8tMxARpgTkrx2LBJc9_UCbNfw@mail.gmail.com>
In-Reply-To: <CAHBxVyHd4LXAv6OY7mOzAbfww8tMxARpgTkrx2LBJc9_UCbNfw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jun 2022 10:49:46 +1000
Message-ID: <CAKmqyKM20eYMRS8iqd_Cz5LmT-eG0XrFum1NVaQFV1wrtqSpYA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Reduce FDT address alignment constraints
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 27 Jun 2022 00:50:17 -0000

On Thu, Jun 23, 2022 at 3:45 PM Atish Kumar Patra <atishp@rivosinc.com> wrote:
>
> On Wed, Jun 22, 2022 at 9:15 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Jun 8, 2022 at 4:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > +Atish
> > >
> > > On Wed, Jun 8, 2022 at 2:20 PM Alistair Francis
> > > <alistair.francis@opensource.wdc.com> wrote:
> > > >
> > > > From: Alistair Francis <alistair.francis@wdc.com>
> > > >
> > > > We previously stored the device tree at a 16MB alignment from the end of
> > > > memory (or 3GB). This means we need at least 16MB of memory to be able
> > > > to do this. We don't actually need the FDT to be 16MB aligned, so let's
> > > > drop it down to 2MB so that we can support systems with less memory,
> > > > while also allowing FDT size expansion.
> > > >
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/992
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  hw/riscv/boot.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > > index 57a41df8e9..e476d8f491 100644
> > > > --- a/hw/riscv/boot.c
> > > > +++ b/hw/riscv/boot.c
> > > > @@ -226,11 +226,11 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> > > >      /*
> > > >       * We should put fdt as far as possible to avoid kernel/initrd overwriting
> > > >       * its content. But it should be addressable by 32 bit system as well.
> > > > -     * Thus, put it at an 16MB aligned address that less than fdt size from the
> > > > +     * Thus, put it at an 2MB aligned address that less than fdt size from the
> > > >       * end of dram or 3GB whichever is lesser.
> > > >       */
> > > >      temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> > > > -    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
> > > > +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> > > >
> > >
> > > @Atish Patra  may have some pointers about the 16MiB alignment requirement.
> >
>
> Sorry. I missed this patch for some reason. 16MiB alignment was just
> chosen as a safe option.
> We couldn't put it at the end of DRAM and I just wanted to place it at
>  a reasonable distance.
>
> 2MB should be totally okay.

Can I get a review or Ack :)

Alistair

>
> > Any thoughts?
> >
> > Alistair
> >
> > >
> > > Regards,
> > > Bin

