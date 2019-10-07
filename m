Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHWfY-0002Go-MZ
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 13:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dayeol@berkeley.edu>) id 1iHWfV-00029S-LE
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 13:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dayeol@berkeley.edu>) id 1iHWfT-0000q9-Oj
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 13:19:32 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33185)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dayeol@berkeley.edu>) id 1iHWfT-0000pD-B9
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 13:19:31 -0400
Received: by mail-pl1-x641.google.com with SMTP id d22so7199353pls.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Oct 2019 10:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berkeley-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0jM2EbhQp5OuMkBVePwdxLyjvQ1BUKCkrGxUtHCHOtw=;
 b=ofNw0AVzwCg5Fn6+pGgBca0O3aG3hwJUhMoTeM4kNG0wixUQbE+jhZUTaogKEcmQWA
 NynqV14VDBzrlSbAZ9z11ixyvKR30wA+3senvVlD4HpCXa4A0yRxK4v5UGSQPJx7tWFL
 sga1XMFq9MhpGzkLvbly6GlK98dR/87FpNPVJx5SQ+lFjScbbm5syURAvPPAx+WvRZN9
 4wYcc2slzAJ4hpPkxHTTiF4hIokoFuXjz7SY/F+liiklCPOcK9QmstOoR6+didTBr3m/
 jS6irGKhFOOQMxFJ2CJaXX+qq9eZmPhkiz7Kwo3NWPQonkWwk7VKgwxksevrLl0rtPPT
 5bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0jM2EbhQp5OuMkBVePwdxLyjvQ1BUKCkrGxUtHCHOtw=;
 b=bgGgFZ8J6VHp1rR94qz9umj+sQp3FkMWbijdhpDittKS5bojAscGv2SE8bde37VKDl
 Zx9qY+/LnooOzNMqZYEjWmEx3wx8cAVQMB6wEbt4EwgsAKUzEentU0H8hAv1u8l/Rehn
 IkEroSBShRodIk50hKfILH2I/6E1JiUqKyBKVKFhFTaWjJv0KBu2Wf/lnDE3ksHel6ym
 ITny7d3j7/DE+/ImQyCZqy5PCyRZ7YCTI1QuVzDWqbJZC6tIT3PpPg2MbtYnqg3mUbxS
 caVEFK7QpC5xN3xgZWNSOFJivBF4eW3eAc1Sfo8ES43e1hcfedJbbqfGP0xinRL2aWjO
 fHkw==
X-Gm-Message-State: APjAAAXlquzw8KBZuQ20cYjtnHUK+D1KseKTzMi5FnQ6y66kUpJMSgA9
 jmEI13OFUkhIVfD8VAJvNmlJZzCv5sTKMpSxxZR+NA==
X-Google-Smtp-Source: APXvYqwoErOY34fu1A4KhIrVhCcBTJiuxKyewwemH2kK0qwyYo/JBtB99M1YO28u8BB28M0fQy1FxECB4SPh1niOIkE=
X-Received: by 2002:a17:902:2e:: with SMTP id 43mr31712457pla.55.1570468769964; 
 Mon, 07 Oct 2019 10:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191007052813.25814-1-dayeol@berkeley.edu>
 <5583387c-5c5b-8890-999b-2ba4d75cd69d@linaro.org>
In-Reply-To: <5583387c-5c5b-8890-999b-2ba4d75cd69d@linaro.org>
From: Dayeol Lee <dayeol@berkeley.edu>
Date: Mon, 7 Oct 2019 10:19:18 -0700
Message-ID: <CACjxMEsw+Deh176JLP2aF4Pdkb_s8MiPApwMON-_K6ed61-Zyw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: PMP violation due to wrong size parameter
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000002a65b40594554190"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Mon, 07 Oct 2019 17:19:35 -0000

--0000000000002a65b40594554190
Content-Type: text/plain; charset="UTF-8"

Thank you very much for the clarification!

I found tlb_set_page with size != TARGET_PAGE_SIZE makes the translation
way too slow; the Linux doesn't seem to boot.

If that's the only way to reduce PMP granularity to less than
TARGET_PAGE_SIZE,
Can we just set the PMP default granularity to TARGET_PAGE_SIZE as it did
before?

OR

Can we bypass the partial match violation when size is unknown? (check the
starting address only)

I think both of the options does not exactly match with the ISA
specification,
but given that size=0 always causes the problem, I want it to be fixed as
soon as possible.

Any thoughts would be appreciated!

On Mon, Oct 7, 2019, 6:00 AM Richard Henderson <richard.henderson@linaro.org>
wrote:

> On 10/6/19 10:28 PM, Dayeol Lee wrote:
> > riscv_cpu_tlb_fill() uses the `size` parameter to check PMP violation
> > using pmp_hart_has_privs().
> > However, the size passed from tlb_fill(), which is called by
> > get_page_addr_code(), is always a hard-coded value 0.
> > This causes a false PMP violation if the instruction presents on a
> > PMP boundary.
> >
> > In order to fix, simply correct the size to 4 if the access_type is
> > MMU_INST_FETCH.
>
> That's not correct.
>
> In general, size 0 means "unknown size".  In this case, the one tlb lookup
> is
> going to be used by lots of instructions -- everything that fits on the
> page.
>
> If you want to support PMP on things that are not page boundaries, then you
> will also have to call tlb_set_page with size != TARGET_PAGE_SIZE.
>
> Fixing that will cause instructions within that page to be executed one at
> a
> time, which also means they will be tlb_fill'd one at a time, which means
> that
> you'll get the correct size value.
>
> Which will be 2 or 4, depending on whether the configuration supports the
> Compressed extension, and not just 4.
>
>
> r~
>

>

--0000000000002a65b40594554190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div>Thank you very much for the clarifi=
cation!</div><div><br></div><div>I found tlb_set_page with size !=3D TARGET=
_PAGE_SIZE makes the translation way too slow; the Linux doesn&#39;t seem t=
o boot.</div><div><br></div><div>If that&#39;s the only way to reduce PMP g=
ranularity to less than TARGET_PAGE_SIZE,</div><div>Can we just set the PMP=
 default granularity to TARGET_PAGE_SIZE as it did before?</div><div><br></=
div><div>OR=C2=A0</div><div><br></div><div>Can we bypass the partial match =
violation when size is unknown? (check the starting address only)</div><div=
><br></div><div>I think both of the options does not exactly match with the=
 ISA specification,</div><div>but given that size=3D0 always causes the pro=
blem, I want it to be fixed as soon as possible.</div><div><br></div><div>A=
ny thoughts would be=C2=A0appreciated!</div><div><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Oct 7, 2019, 6:00 AM Richard Henderson &lt;<a href=3D"mailto:r=
ichard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 10/6/19 10:28 PM=
, Dayeol Lee wrote:<br>
&gt; riscv_cpu_tlb_fill() uses the `size` parameter to check PMP violation<=
br>
&gt; using pmp_hart_has_privs().<br>
&gt; However, the size passed from tlb_fill(), which is called by<br>
&gt; get_page_addr_code(), is always a hard-coded value 0.<br>
&gt; This causes a false PMP violation if the instruction presents on a<br>
&gt; PMP boundary.<br>
&gt; <br>
&gt; In order to fix, simply correct the size to 4 if the access_type is<br=
>
&gt; MMU_INST_FETCH.<br>
<br>
That&#39;s not correct.<br>
<br>
In general, size 0 means &quot;unknown size&quot;.=C2=A0 In this case, the =
one tlb lookup is<br>
going to be used by lots of instructions -- everything that fits on the pag=
e.<br>
<br>
If you want to support PMP on things that are not page boundaries, then you=
<br>
will also have to call tlb_set_page with size !=3D TARGET_PAGE_SIZE.<br>
<br>
Fixing that will cause instructions within that page to be executed one at =
a<br>
time, which also means they will be tlb_fill&#39;d one at a time, which mea=
ns that<br>
you&#39;ll get the correct size value.<br>
<br>
Which will be 2 or 4, depending on whether the configuration supports the<b=
r>
Compressed extension, and not just 4.<br>
<br>
<br>
r~<br>
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br></blockquote></div></div></=
div>
</div>

--0000000000002a65b40594554190--

