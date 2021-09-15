Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPrl-0004Q6-NS
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 04:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mQPrh-0004Mz-UE; Wed, 15 Sep 2021 04:01:59 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mQPrZ-0002AJ-Kg; Wed, 15 Sep 2021 04:01:57 -0400
Received: by mail-ej1-x62e.google.com with SMTP id qq21so4197741ejb.10;
 Wed, 15 Sep 2021 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4sIo4dY+w6n6jvoC/Z9COpa+SeeqxhWVdowUg7W5fEg=;
 b=eUGvTTHP1sed4Jju33Ohsw9j7f3vPkndCcOWNezHVetg8uE4RpxofsxyXjfkGjkqaM
 7TowyvrNuawHbxH3xVvHjsHUbCNhqk0UO8pMiUP8EP3h5opxiyPbujj4OzV/LJdYoZ/p
 /9793NXhmjGB3icZ80SoYORjpqsQR72qL+4KZSWmhY6Ya6xUYF6Oejc5kwaoz//jlSB8
 NXsiiuGaMFrqSfxbZlZgNDknVyOo6WP4s6nK5Muyjx+AJSy2eIupyseWL8R9Nqjs7IJv
 a6VVJCbAnHDf4oTm8aL8OK/Rso0ZUqqmX8mz3PYGlS+8AMafqvTf/8iQOI6p8cETNSMx
 hGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4sIo4dY+w6n6jvoC/Z9COpa+SeeqxhWVdowUg7W5fEg=;
 b=NK4zFT/CnZ23J1T5GzD8uW7odsfQmtUe6kwQh18gSriGPmZWDp2CGlYwhe/5oCiwWV
 7o2RjkLS2sYvi27eNRUwJnIur/ms94sf2E/UpSJuiRrT64TucezZbMoeLMDLjFNRnrIk
 sHC9Pw+5nrPzUh0ByTWZ7wgkVM2MTPZPTzotNsIGURqbEj8mu1OEZc/A3QxDgm4M+R3U
 iMMUaG9hjwJlYV7FdCA+sumS++Inrs4RKC/PHs2lrDwTDjFLqTDDysUUOYn7c+LJNJNN
 xv2voN3IGvCLQsb24tJo9Sc+6a6aJvAF1vgeQg8pLfRAjsxN9cKP7WmMQDQ9hEIIs5VL
 Gw+w==
X-Gm-Message-State: AOAM5329RjvyYdIV3hyxDI7bSNmE5ci4tPheRTBviQFd0BkxK7qneLNZ
 tHerc2YNPHWiuBm8t0cK7t67DDxPUnQwqAZuIPk=
X-Google-Smtp-Source: ABdhPJwTrEtQpg4XbvhHCAeI58eEGNk483DnpKyzqD96LrjuyT4r97pGhlLXD07J8oiC/q1u0qyUWWzNS110NuJcZno=
X-Received: by 2002:a17:906:1f49:: with SMTP id
 d9mr10327487ejk.150.1631692902010; 
 Wed, 15 Sep 2021 01:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-50-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-50-berrange@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 15 Sep 2021 01:01:30 -0700
Message-ID: <CAMo8BfKyi1dTQrLTNQPOcxhPCpyi0Mii4Zmj9tcchLR=waFCkg@mail.gmail.com>
Subject: Re: [PATCH v2 49/53] target/xtensa: convert to use format_tlb callback
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>, 
 Bin Meng <bin.meng@windriver.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Xu <peterx@redhat.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Halil Pasic <pasic@linux.ibm.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, Yuval Shaia <yuval.shaia.ml@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>, 
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 qemu-s390x <qemu-s390x@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Chris Wulff <crwulff@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.689, HK_RANDOM_FROM=0.999,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 15 Sep 2021 08:02:00 -0000

On Tue, Sep 14, 2021 at 7:35 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> Change the "info tlb" implementation to use the format_tlb callback.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  target/xtensa/cpu.h        |   2 +-
>  target/xtensa/mmu_helper.c | 126 +++++++++++++++++++++----------------
>  target/xtensa/monitor.c    |  10 ++-
>  3 files changed, 79 insertions(+), 59 deletions(-)
>
> diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
> index b01ff9399a..d499255984 100644
> --- a/target/xtensa/mmu_helper.c
> +++ b/target/xtensa/mmu_helper.c
> @@ -1055,7 +1055,7 @@ int xtensa_get_physical_addr(CPUXtensaState *env, b=
ool update_tlb,
>      }
>  }
>
> -static void dump_tlb(CPUXtensaState *env, bool dtlb)
> +static void dump_tlb(CPUXtensaState *env, bool dtlb, GString *buf)
>  {
>      unsigned wi, ei;
>      const xtensa_tlb *conf =3D
> @@ -1094,34 +1094,40 @@ static void dump_tlb(CPUXtensaState *env, bool dt=
lb)
>
>                  if (print_header) {
>                      print_header =3D false;
> -                    qemu_printf("Way %u (%d %s)\n", wi, sz, sz_text);
> -                    qemu_printf("\tVaddr       Paddr       ASID  Attr RW=
X Cache\n"
> -                                "\t----------  ----------  ----  ---- --=
- -------\n");
> +                    g_string_append_printf(buf, "Way %u (%d %s)\n",
> +                                           wi, sz, sz_text);
> +                    g_string_append_printf(buf, "\tVaddr       Paddr    =
   "
> +                                           "ASID  Attr RWX Cache\n"
> +                                           "\t----------  ----------  --=
--  "
> +                                           "---- --- -------\n");

These lines had a nice visual alignment, now they are broken randomly.
Can we please keep them aligned?

>                  }
> -                qemu_printf("\t0x%08x  0x%08x  0x%02x  0x%02x %c%c%c %-7=
s\n",
> -                            entry->vaddr,
> -                            entry->paddr,
> -                            entry->asid,
> -                            entry->attr,
> -                            (access & PAGE_READ) ? 'R' : '-',
> -                            (access & PAGE_WRITE) ? 'W' : '-',
> -                            (access & PAGE_EXEC) ? 'X' : '-',
> -                            cache_text[cache_idx] ?
> -                            cache_text[cache_idx] : "Invalid");
> +                g_string_append_printf(buf, "\t0x%08x  0x%08x  0x%02x  "
> +                                       "0x%02x %c%c%c %-7s\n",
> +                                       entry->vaddr,
> +                                       entry->paddr,
> +                                       entry->asid,
> +                                       entry->attr,
> +                                       (access & PAGE_READ) ? 'R' : '-',
> +                                       (access & PAGE_WRITE) ? 'W' : '-'=
,
> +                                       (access & PAGE_EXEC) ? 'X' : '-',
> +                                       cache_text[cache_idx] ?
> +                                       cache_text[cache_idx] : "Invalid"=
);
>              }
>          }
>      }
>  }
>
>  static void dump_mpu(CPUXtensaState *env,
> -                     const xtensa_mpu_entry *entry, unsigned n)
> +                     const xtensa_mpu_entry *entry, unsigned n, GString =
*buf)
>  {
>      unsigned i;
>
> -    qemu_printf("\t%s  Vaddr       Attr        Ring0  Ring1  System Type=
    CPU cache\n"
> -                "\t%s  ----------  ----------  -----  -----  -----------=
--  ---------\n",
> -                env ? "En" : "  ",
> -                env ? "--" : "  ");
> +    g_string_append_printf(buf, "\t%s  Vaddr       Attr        "
> +                           "Ring0  Ring1  System Type    CPU cache\n"
> +                           "\t%s  ----------  ----------  -----  -----  =
"
> +                           "-------------  ---------\n",

And here as well?

--=20
Thanks.
-- Max

