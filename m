Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmBnY-0006td-Nf
	for mharc-qemu-riscv@gnu.org; Wed, 04 May 2022 05:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmBnP-0006qi-0Y; Wed, 04 May 2022 05:59:50 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:41662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmBnN-0005i8-7k; Wed, 04 May 2022 05:59:46 -0400
Received: by mail-il1-x12e.google.com with SMTP id z12so554933ilp.8;
 Wed, 04 May 2022 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L775xIhyEtGdvtyJxtd6jZGnN+beuZ3L+Ykku/6ZhS4=;
 b=b/6Cj/PWFcaHy/mGqMgq6/NWgD11mhEZcMTFqYs/wsCYdx7VGjdoqRFbhzo0ocrioq
 vfR5ohKD5nvoL7lx5B2vlRpc7VgLQIJggUXm818fMzE46G1wLMegFVHfpUEb15WXsVhH
 WcGFF9RyqFG9CeVbJrZppsBGecsYZQFSWB0xa0vt/+ZVL/c1BCnBZLqa5wbvX8yWtYDq
 p/DNTsvVabY5t524gJ2khbr60P5q7h8HNQOwqxrfGIchm1Q49Uuk1qMnNRk9TrY6Kirw
 KGTc0gXgGf03zpBhnkYUhsrYKmAc8/99O9rzORJRiLkx7Hes4/vN/5hZSjyau9JLnv3b
 VYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L775xIhyEtGdvtyJxtd6jZGnN+beuZ3L+Ykku/6ZhS4=;
 b=dk33MQOet2q47Kv07+aak0oZb9Kmc+dVWFYWUhHdNvTGV/32cnn9oiOlgSs5BP7DYm
 GUM9X12dPfLlbbMYmQ9EifVKEsBSPvyo2abr6DZXJs2pgvdGc2Wu0loOPl+83V32DIHe
 bGvG2Lc2fCCZre8dBLmS+ZZpli+gl1y4cfG4G4TVyLhncLHFzzoVnCQChZIiWMpSyxLS
 szape+dSqUQTQy4MLKYGUzwVX7CMQ2eJrQz+vUbMRUP0worj8PsCA3fkrxshtAGbabSQ
 vdvbS7ZaFh4CId1yzmk9NJBKLmWZzXoCtmrDEMH7p5ikUm/UX4pocRPvVz0M4dlx3WEN
 c7rg==
X-Gm-Message-State: AOAM531DGSjcQT+Plr8kV4doHE2t8+FoZefbOa85jfTJ74c5WaolqMVC
 FX9cBgSpkH2d4sXxtSS0aZ/sajt6SujrqmEQjU8=
X-Google-Smtp-Source: ABdhPJxYE/lnRurGiC+eDeF/dwDe+W2neayf4gxOIOtQ8BwVCQNsaC1/Jh0oDWdIBWUwzFvBVGY7P0HfbBsYA01jfac=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr8238053ilb.86.1651658383466; Wed, 04
 May 2022 02:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-4-apatel@ventanamicro.com>
 <CANzO1D1M-wH-r-T58E9qJ7X5MTruiAXP87UdYikWanrXgswuJA@mail.gmail.com>
 <CAAhSdy27e84WXJ8fKjzN9RxRoPvz5gmwUN3na2cMFGuJ5TpjAg@mail.gmail.com>
In-Reply-To: <CAAhSdy27e84WXJ8fKjzN9RxRoPvz5gmwUN3na2cMFGuJ5TpjAg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 May 2022 19:59:17 +1000
Message-ID: <CAKmqyKOu+aaMwghrbpf7U_cK14N+AV0tkC=h2V1Mpd+7X1H16Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/riscv: Consider priv spec version when
 generating ISA string
To: Anup Patel <anup@brainfault.org>
Cc: Frank Chang <frank.chang@sifive.com>, Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Wed, 04 May 2022 09:59:50 -0000

On Sat, Apr 30, 2022 at 2:31 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Apr 30, 2022 at 8:39 AM Frank Chang <frank.chang@sifive.com> wrote:
> >
> > Hi Anup,
> >
> > If we want to limit the generated ISA string to/after a specific privilege spec version.
> > Shouldn't we also check the privilege spec version when these extensions are enabled?
> > Otherwise, it's possible that one extension is enabled,
> > but the privilege spec version is smaller than the one in which the extension is supported.
> > (This is possible if user specifies the privileged spec version through the command line.)
> > The ISA string therefore won't include the enabled extension.
>
> This patch is only a temporary fix for the sifive_u machine where I am
> seeing some
> of these new extensions available in ISA string.
>
> We need a separate series to have the priv spec version influence
> individual extension
> enabling/disabling.

I agree with Frank, I think it makes more sense to just never enable
the extension instead of not telling the guest it's enabled.

Alistair

>
> Regards,
> Anup
>
> >
> > Regards,
> > Frank Chang
> >
> >
> > On Fri, Apr 29, 2022 at 11:49 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >>
> >> Most of the multi-letter extensions (such as Svpbmt, Svnapot, Svinval,
> >> etc) are only available after Priv spec v1.12 so ISA string generation
> >> should check the minimum required priv spec version for all extensions.
> >>
> >> Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> >> device tree")
> >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >> ---
> >>  target/riscv/cpu.c | 36 +++++++++++++++++++-----------------
> >>  1 file changed, 19 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 02ee7d45d8..d8c88b96bc 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -44,6 +44,7 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
> >>  struct isa_ext_data {
> >>      const char *name;
> >>      bool enabled;
> >> +    uint32_t min_priv_ver;
> >>  };
> >>
> >>  const char * const riscv_int_regnames[] = {
> >> @@ -974,7 +975,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
> >>      device_class_set_props(dc, riscv_cpu_properties);
> >>  }
> >>
> >> -#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> >> +#define ISA_EDATA_ENTRY(name, prop, priv) {#name, cpu->cfg.prop, priv}
> >>
> >>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> >>  {
> >> @@ -1000,25 +1001,26 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> >>       *    extensions by an underscore.
> >>       */
> >>      struct isa_ext_data isa_edata_arr[] = {
> >> -        ISA_EDATA_ENTRY(zfh, ext_zfh),
> >> -        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> >> -        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> >> -        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> >> -        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> >> -        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
> >> -        ISA_EDATA_ENTRY(zba, ext_zba),
> >> -        ISA_EDATA_ENTRY(zbb, ext_zbb),
> >> -        ISA_EDATA_ENTRY(zbc, ext_zbc),
> >> -        ISA_EDATA_ENTRY(zbs, ext_zbs),
> >> -        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> >> -        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> >> -        ISA_EDATA_ENTRY(svinval, ext_svinval),
> >> -        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> >> -        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> >> +        ISA_EDATA_ENTRY(zfh, ext_zfh, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zba, ext_zba, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zbb, ext_zbb, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zbc, ext_zbc, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zbs, ext_zbs, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(svinval, ext_svinval, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(svnapot, ext_svnapot, PRIV_VERSION_1_12_0),
> >> +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt, PRIV_VERSION_1_12_0),
> >>      };
> >>
> >>      for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> >> -        if (isa_edata_arr[i].enabled) {
> >> +        if (isa_edata_arr[i].enabled &&
> >> +            cpu->env.priv_ver >= isa_edata_arr[i].min_priv_ver) {
> >>              new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> >>              g_free(old);
> >>              old = new;
> >> --
> >> 2.34.1
> >>
> >>
>

