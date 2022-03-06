Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nQjnn-0007wc-An
	for mharc-qemu-riscv@gnu.org; Sun, 06 Mar 2022 00:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nQjnj-0007w3-HL
 for qemu-riscv@nongnu.org; Sun, 06 Mar 2022 00:51:29 -0500
Received: from [2a00:1450:4864:20::134] (port=41561
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nQjnh-0007gV-OC
 for qemu-riscv@nongnu.org; Sun, 06 Mar 2022 00:51:27 -0500
Received: by mail-lf1-x134.google.com with SMTP id f37so20971942lfv.8
 for <qemu-riscv@nongnu.org>; Sat, 05 Mar 2022 21:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WRiAuOKIvkKV4Gkhp7asfjGWi8B7qhdZ9PL824ZLjcw=;
 b=Ux815N0UARNWOEi7lQHg1LHo9XLZZUpQFVykikj0bdO0/bftuROdZaCFQ7pu4zynPN
 FG3lWAt8WOtJH3PqzGmixw2POAZGKfHW5VFR4ETMQGucjyNfo4j512D4lA+tfYRtBbFx
 mrp7CM6f/UaaTJCc9ChtvTCfj4fmwcvCTwKzEggXHLeGjyFR7iXsQ28a7Yh0kXt8HecO
 u/f6aybDLnG9RGuO+XObCxwDg+VS8a0fS8a31yYmbZ9U+3WyKttH6GRM/qTNNWgyz3Xa
 VFjIrY6c9Xl8rzTVXUkWBOO8CdD3t7Dbbr1rjvM2lKtb2AkUs9Eb5VN5FO9IexoI5P7s
 b5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WRiAuOKIvkKV4Gkhp7asfjGWi8B7qhdZ9PL824ZLjcw=;
 b=2Oqn1axXjw6LtWTvwTbOzqV6dQ9Q7Oy0Ty/Z3a9p43LS7qhNf+0vExvAGCg0W8SBwg
 1oIODIl4fwXLu66pl9MGa+4AfSLS4/ITV0IB9z3zBDh6rwGgi/aB2fF7Wu76D36c3VYt
 Iqxa4dKV1YrBjUge92C+2wfg69yQToqEtRUaEaMTOoJ783zRdltRA7ZioacYuB1NFqQf
 q+aU/gII0KMlNQQeaY7hKN3FXZqeGKWlJnN0hnqw/V0N8nvSsiz0ubtOPbgUkLiQLD05
 fkDCnR2XvGBaLeneFwibSnYXDOAAwUGRM1MvhAor9Eia+OFNLEaS8Nq7DFPg/K/ZHwzy
 S68Q==
X-Gm-Message-State: AOAM531GD2K5rY5jaxHF3AfPPxFEaaY8dJ2/5lDLo7bAS7dZIzNKw1s9
 Fuq3nzHyqhsL+Eq0RJg5bAAUlg7bjGu60mUi84lutA==
X-Google-Smtp-Source: ABdhPJx6yyfLMoZ+JQ8pqEvW4OEng8ySckouX33ofC4wjiSkUxmCh11FWHHXvRq3N5H2IqBGZo5S6CuIF8ZnlPWvkW4=
X-Received: by 2002:ac2:4357:0:b0:448:287d:d713 with SMTP id
 o23-20020ac24357000000b00448287dd713mr1726412lfl.130.1646545883428; Sat, 05
 Mar 2022 21:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
 <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
 <CAOnJCULn7BbyfyeHpPQkyLTQyTcXrfu9wBheMAXDdFTnnRMphA@mail.gmail.com>
 <5780243.1I65i12eNQ@phil>
 <CAHBxVyE2QRE8+W36AzgQ5=0GJMuPCgcGVzmS-VOLqDWHxPWkug@mail.gmail.com>
 <CAE_xrPhd4L9C_oTTn_Zc==NQ_TeBk+0OBZ7h3cxH7cRXY835BQ@mail.gmail.com>
In-Reply-To: <CAE_xrPhd4L9C_oTTn_Zc==NQ_TeBk+0OBZ7h3cxH7cRXY835BQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 6 Mar 2022 11:21:12 +0530
Message-ID: <CAK9=C2WPO=AEE538EizgBnBqKwnwncmyHosNm3m0yK9qci9sVw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Frank Chang <frank.chang@sifive.com>
Cc: Atish Kumar Patra <atishp@rivosinc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stuebner <heiko@sntech.de>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=apatel@ventanamicro.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 06 Mar 2022 05:51:29 -0000

On Sun, Mar 6, 2022 at 11:06 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Sun, Mar 6, 2022 at 7:42 AM Atish Kumar Patra <atishp@rivosinc.com> wr=
ote:
>>
>>
>>
>> On Sat, Mar 5, 2022 at 10:05 AM Heiko Stuebner <heiko@sntech.de> wrote:
>>>
>>> Hi,
>>>
>>> Am Donnerstag, 3. M=C3=A4rz 2022, 19:58:38 CET schrieb Atish Patra:
>>> > On Fri, Feb 25, 2022 at 11:46 PM Frank Chang <frank.chang@sifive.com>=
 wrote:
>>> > > Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=88=
23=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=
=BC=9A
>>> > >>
>>> > >> The Linux kernel parses the ISA extensions from "riscv,isa" DT
>>> > >> property. It used to parse only the single letter base extensions
>>> > >> until now. A generic ISA extension parsing framework was proposed[=
1]
>>> > >> recently that can parse multi-letter ISA extensions as well.
>>> > >>
>>> > >> Generate the extended ISA string by appending  the available ISA e=
xtensions
>>> > >> to the "riscv,isa" string if it is enabled so that kernel can proc=
ess it.
>>> > >>
>>> > >> [1] https://lkml.org/lkml/2022/2/15/263
>>> > >>
>>> > >> Suggested-by: Heiko Stubner <heiko@sntech.de>
>>> > >> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>> > >> ---
>>> > >> Changes from v2->v3:
>>> > >> 1. Used g_strconcat to replace snprintf & a max isa string length =
as
>>> > >> suggested by Anup.
>>> > >> 2. I have not included the Tested-by Tag from Heiko because the
>>> > >> implementation changed from v2 to v3.
>>> > >>
>>> > >> Changes from v1->v2:
>>> > >> 1. Improved the code redability by using arrays instead of individ=
ual check
>>> > >> ---
>>> > >>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
>>> > >>  1 file changed, 29 insertions(+)
>>> > >>
>>> > >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> > >> index b0a40b83e7a8..2c7ff6ef555a 100644
>>> > >> --- a/target/riscv/cpu.c
>>> > >> +++ b/target/riscv/cpu.c
>>> > >> @@ -34,6 +34,12 @@
>>> > >>
>>> > >>  /* RISC-V CPU definitions */
>>> > >>
>>> > >> +/* This includes the null terminated character '\0' */
>>> > >> +struct isa_ext_data {
>>> > >> +        const char *name;
>>> > >> +        bool enabled;
>>> > >> +};
>>> > >> +
>>> > >>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG"=
;
>>> > >>
>>> > >>  const char * const riscv_int_regnames[] =3D {
>>> > >> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass =
*c, void *data)
>>> > >>      device_class_set_props(dc, riscv_cpu_properties);
>>> > >>  }
>>> > >>
>>> > >> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, i=
nt max_str_len)
>>> > >> +{
>>> > >> +    char *old =3D *isa_str;
>>> > >> +    char *new =3D *isa_str;
>>> > >> +    int i;
>>> > >> +    struct isa_ext_data isa_edata_arr[] =3D {
>>> > >> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
>>> > >> +        { "svinval", cpu->cfg.ext_svinval },
>>> > >> +        { "svnapot", cpu->cfg.ext_svnapot },
>>> > >
>>> > >
>>> > > We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs...=
 etc.
>>> > > Do you mind adding them as well?
>>> > >
>>> >
>>> > Do we really need it ? Does any OS actually parse it from the device =
tree ?
>>> > AFAIK, Linux kernel doesn't use them. As the device tree is intended
>>> > to keep the information useful
>>> > for supervisor software,
>>>
>>> That actually isn't true ;-) .
>>>
>>> The devicetree is intended to _describe_ the hardware present in full
>>> and has really nothing to do with what the userspace needs.
>>> So the argument "Linux doesn't need this" is never true when talking
>>> about devicetrees ;-) .
>>
>>
>> Yes. I didn=E2=80=99t mean that way. I was simply asking if these extens=
ions currently in use. I just mentioned Linux as an example.
>>
>> The larger point I was trying to make if we should add all the supported=
 extensions when they are added to Qemu or on a need basis.
>>
>> I don=E2=80=99t feel strongly either way. So I am okay with the former a=
pproach if that=E2=80=99s what everyone prefers!
>
>
> Linux Kernel itself might not,
> but userspace applications may query /proc/cpuinfo to get core's capabili=
ties, e.g. for those vector applications.
> It really depends on how the application is written.
>
> I still think adding all the enabled extensions into the isa string would=
 be a proper solution, no matter they are used or not.
> However, we can leave that beyond this patch.

I agree. Adding all enabled extensions in ISA string is aligned with
what this patch is doing so no harm in updating this patch.

Regards,
Anup

>
> Regards,
> Frank Chang
>
>>>
>>>
>>> On the other hand the devicetree user doesn't need to parse everything
>>> from DT. So adding code to parse things only really is needed if you
>>> need that information.
>>
>>
>> Agreed.
>>
>>>
>>> So if some part of the kernel needs to know about those additional
>>> extensions, the array entries for them can also be added in a later pat=
ch.
>>
>>
>> Yes. That was the idea in isa extension framework series where the exten=
sion specific array entries will only be added when support for that extens=
ion is enabled.
>>>
>>>
>>>
>>> Heiko
>>>
>>> > > Also, I think the order of ISA strings should be alphabetical as de=
scribed:
>>> > > https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.te=
x#L96
>>> > >
>>> >
>>> > Ahh yes. I will order them in alphabetical order and leave a big
>>> > comment for future reference as well.
>>> >
>>> > > Regards,
>>> > > Frank Chang
>>> > >
>>> > >>
>>> > >> +    };
>>> > >> +
>>> > >> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>>> > >> +        if (isa_edata_arr[i].enabled) {
>>> > >> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, =
NULL);
>>> > >> +            g_free(old);
>>> > >> +            old =3D new;
>>> > >> +        }
>>> > >> +    }
>>> > >> +
>>> > >> +    *isa_str =3D new;
>>> > >> +}
>>> > >> +
>>> > >>  char *riscv_isa_string(RISCVCPU *cpu)
>>> > >>  {
>>> > >>      int i;
>>> > >> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>>> > >>          }
>>> > >>      }
>>> > >>      *p =3D '\0';
>>> > >> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>>> > >>      return isa_str;
>>> > >>  }
>>> > >>
>>> > >> --
>>> > >> 2.30.2
>>> > >>
>>> >
>>> >
>>> >
>>>
>>>
>>>
>>>

