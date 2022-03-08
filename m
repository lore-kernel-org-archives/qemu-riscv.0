Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nRing-00026N-CV
	for mharc-qemu-riscv@gnu.org; Tue, 08 Mar 2022 17:59:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nRinY-000249-9t
 for qemu-riscv@nongnu.org; Tue, 08 Mar 2022 17:59:21 -0500
Received: from [2607:f8b0:4864:20::b31] (port=35797
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nRinW-0007du-EE
 for qemu-riscv@nongnu.org; Tue, 08 Mar 2022 17:59:20 -0500
Received: by mail-yb1-xb31.google.com with SMTP id z30so820613ybi.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Mar 2022 14:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Aoe3/m3imYoVYAC4DFea/Da8HMROtIpGBIPkHpNY3AQ=;
 b=LS0nUpo63dxiAeJzMLcmswqgx6C+cgfj5F/jrCUm8nQm2VKBRM5uSs7uAI7A8GDaHf
 LGkqi0llZVxNdaq/p9RvfFVNA1T9uDUPhII6wtJ/2/HV+p+jt6wISXPWKKWW5rpe+3GF
 cLHf4YF25dxgoxGrdsWujFgZADkt9vUVn8lA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Aoe3/m3imYoVYAC4DFea/Da8HMROtIpGBIPkHpNY3AQ=;
 b=k5lDqApNY1oF6ZeJPgv0IshnEQ1TGiWgOARqd1f0JPhWBXbLd67iIHUWArTRuEujyK
 JTPIV3ZXlzpGZrNBuZUlUdGSjQ6dzW/iU+67023QorSZKlE8m514nYnj3/j9MoPs0YTh
 Oacu/hykhiAL6qW2pBILgmd35UW6NTW8X+YAbYYvI6MUqxl2lyLvjWPYt7PFg6U4os7l
 H9FC1j8pIVapxbIX9mx/ZZmYcIlweg+nKW9DeaqpD4Xn15xqQl1Wh3Llho85TSy+zlTp
 z2gFjCOMDSLRpn6HgTp4bQ/A2XYzLN/bm1db++gnUsKtaFmfQFwwucIlUimkeMbnZ6MZ
 j/zg==
X-Gm-Message-State: AOAM531eQInwHI8QYnyqDXmacWvEVX120tVzs+zXI0zzqYkuQjH169Si
 iiYVJDUkLBQnucKxMNDherYB7/w8x4WbX9GaPr+fvtX0/FIE
X-Google-Smtp-Source: ABdhPJwdsixqzKrRNA9Dp7fRQUEnW7VN7wR6kQl/d+lxtL1omz5dG/AEJFXprXToL3hWZbhIOnIA6jUsi5NV4w6vSsE=
X-Received: by 2002:a0d:f1c7:0:b0:2db:d2bc:be11 with SMTP id
 a190-20020a0df1c7000000b002dbd2bcbe11mr14881578ywf.62.1646780024842; Tue, 08
 Mar 2022 14:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
 <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
 <CAOnJCULn7BbyfyeHpPQkyLTQyTcXrfu9wBheMAXDdFTnnRMphA@mail.gmail.com>
 <5780243.1I65i12eNQ@phil>
 <CAHBxVyE2QRE8+W36AzgQ5=0GJMuPCgcGVzmS-VOLqDWHxPWkug@mail.gmail.com>
 <CAE_xrPhd4L9C_oTTn_Zc==NQ_TeBk+0OBZ7h3cxH7cRXY835BQ@mail.gmail.com>
 <CAHBxVyEe=ecBJOj457U2PKj0RcX23JYurEbhO4_PS-oF-FpaJQ@mail.gmail.com>
 <CAE_xrPjkPjdBvH-+DfmLYZwboFPpxtvQb3upSdE6mMUz+ZwfnQ@mail.gmail.com>
In-Reply-To: <CAE_xrPjkPjdBvH-+DfmLYZwboFPpxtvQb3upSdE6mMUz+ZwfnQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 8 Mar 2022 14:53:34 -0800
Message-ID: <CAOnJCUK6KvcN8m8kxPdZULAKKdY7wymZGtVL4z_AuD72H3G1Pg@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Frank Chang <frank.chang@sifive.com>
Cc: Atish Kumar Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Heiko Stuebner <heiko@sntech.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Tue, 08 Mar 2022 22:59:21 -0000

On Sat, Mar 5, 2022 at 10:43 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Sun, Mar 6, 2022 at 2:12 PM Atish Kumar Patra <atishp@rivosinc.com> wr=
ote:
>>
>>
>>
>> On Sat, Mar 5, 2022 at 9:36 PM Frank Chang <frank.chang@sifive.com> wrot=
e:
>>>
>>> On Sun, Mar 6, 2022 at 7:42 AM Atish Kumar Patra <atishp@rivosinc.com> =
wrote:
>>>>
>>>>
>>>>
>>>> On Sat, Mar 5, 2022 at 10:05 AM Heiko Stuebner <heiko@sntech.de> wrote=
:
>>>>>
>>>>> Hi,
>>>>>
>>>>> Am Donnerstag, 3. M=C3=A4rz 2022, 19:58:38 CET schrieb Atish Patra:
>>>>> > On Fri, Feb 25, 2022 at 11:46 PM Frank Chang <frank.chang@sifive.co=
m> wrote:
>>>>> > > Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=
=8823=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=
=EF=BC=9A
>>>>> > >>
>>>>> > >> The Linux kernel parses the ISA extensions from "riscv,isa" DT
>>>>> > >> property. It used to parse only the single letter base extension=
s
>>>>> > >> until now. A generic ISA extension parsing framework was propose=
d[1]
>>>>> > >> recently that can parse multi-letter ISA extensions as well.
>>>>> > >>
>>>>> > >> Generate the extended ISA string by appending  the available ISA=
 extensions
>>>>> > >> to the "riscv,isa" string if it is enabled so that kernel can pr=
ocess it.
>>>>> > >>
>>>>> > >> [1] https://lkml.org/lkml/2022/2/15/263
>>>>> > >>
>>>>> > >> Suggested-by: Heiko Stubner <heiko@sntech.de>
>>>>> > >> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>>>> > >> ---
>>>>> > >> Changes from v2->v3:
>>>>> > >> 1. Used g_strconcat to replace snprintf & a max isa string lengt=
h as
>>>>> > >> suggested by Anup.
>>>>> > >> 2. I have not included the Tested-by Tag from Heiko because the
>>>>> > >> implementation changed from v2 to v3.
>>>>> > >>
>>>>> > >> Changes from v1->v2:
>>>>> > >> 1. Improved the code redability by using arrays instead of indiv=
idual check
>>>>> > >> ---
>>>>> > >>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
>>>>> > >>  1 file changed, 29 insertions(+)
>>>>> > >>
>>>>> > >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>>> > >> index b0a40b83e7a8..2c7ff6ef555a 100644
>>>>> > >> --- a/target/riscv/cpu.c
>>>>> > >> +++ b/target/riscv/cpu.c
>>>>> > >> @@ -34,6 +34,12 @@
>>>>> > >>
>>>>> > >>  /* RISC-V CPU definitions */
>>>>> > >>
>>>>> > >> +/* This includes the null terminated character '\0' */
>>>>> > >> +struct isa_ext_data {
>>>>> > >> +        const char *name;
>>>>> > >> +        bool enabled;
>>>>> > >> +};
>>>>> > >> +
>>>>> > >>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZ=
G";
>>>>> > >>
>>>>> > >>  const char * const riscv_int_regnames[] =3D {
>>>>> > >> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClas=
s *c, void *data)
>>>>> > >>      device_class_set_props(dc, riscv_cpu_properties);
>>>>> > >>  }
>>>>> > >>
>>>>> > >> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,=
 int max_str_len)
>>>>> > >> +{
>>>>> > >> +    char *old =3D *isa_str;
>>>>> > >> +    char *new =3D *isa_str;
>>>>> > >> +    int i;
>>>>> > >> +    struct isa_ext_data isa_edata_arr[] =3D {
>>>>> > >> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
>>>>> > >> +        { "svinval", cpu->cfg.ext_svinval },
>>>>> > >> +        { "svnapot", cpu->cfg.ext_svnapot },
>>>>> > >
>>>>> > >
>>>>> > > We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs.=
.. etc.
>>>>> > > Do you mind adding them as well?
>>>>> > >
>>>>> >
>>>>> > Do we really need it ? Does any OS actually parse it from the devic=
e tree ?
>>>>> > AFAIK, Linux kernel doesn't use them. As the device tree is intende=
d
>>>>> > to keep the information useful
>>>>> > for supervisor software,
>>>>>
>>>>> That actually isn't true ;-) .
>>>>>
>>>>> The devicetree is intended to _describe_ the hardware present in full
>>>>> and has really nothing to do with what the userspace needs.
>>>>> So the argument "Linux doesn't need this" is never true when talking
>>>>> about devicetrees ;-) .
>>>>
>>>>
>>>> Yes. I didn=E2=80=99t mean that way. I was simply asking if these exte=
nsions currently in use. I just mentioned Linux as an example.
>>>>
>>>> The larger point I was trying to make if we should add all the support=
ed extensions when they are added to Qemu or on a need basis.
>>>>
>>>> I don=E2=80=99t feel strongly either way. So I am okay with the former=
 approach if that=E2=80=99s what everyone prefers!
>>>
>>>
>>> Linux Kernel itself might not,
>>> but userspace applications may query /proc/cpuinfo to get core's capabi=
lities, e.g. for those vector applications.
>>> It really depends on how the application is written.
>>>
>>> I still think adding all the enabled extensions into the isa string wou=
ld be a proper solution, no matter they are used or not.
>>> However, we can leave that beyond this patch.
>>
>>
>>
>> Fair enough. I will update the patch to include all the extension availa=
ble.
>
>
> Thanks, that would be great.
>
> BTW, I think current QEMU RISC-V isa string includes both "s" and "u":
> https://github.com/qemu/qemu/blob/master/target/riscv/cpu.c#L37
> But in fact, they should not be presented in the DTS isa string.
> Do you think we should exclude them as well?
>

There is a patch in the mailing list fixing that issue

https://lists.nongnu.org/archive/html/qemu-riscv/2022-02/msg00099.html

> Regards,
> Frank Chang
>
>>
>>>
>>> Regards,
>>> Frank Chang
>>>
>>>>>
>>>>>
>>>>> On the other hand the devicetree user doesn't need to parse everythin=
g
>>>>> from DT. So adding code to parse things only really is needed if you
>>>>> need that information.
>>>>
>>>>
>>>> Agreed.
>>>>
>>>>>
>>>>> So if some part of the kernel needs to know about those additional
>>>>> extensions, the array entries for them can also be added in a later p=
atch.
>>>>
>>>>
>>>> Yes. That was the idea in isa extension framework series where the ext=
ension specific array entries will only be added when support for that exte=
nsion is enabled.
>>>>>
>>>>>
>>>>>
>>>>> Heiko
>>>>>
>>>>> > > Also, I think the order of ISA strings should be alphabetical as =
described:
>>>>> > > https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.=
tex#L96
>>>>> > >
>>>>> >
>>>>> > Ahh yes. I will order them in alphabetical order and leave a big
>>>>> > comment for future reference as well.
>>>>> >
>>>>> > > Regards,
>>>>> > > Frank Chang
>>>>> > >
>>>>> > >>
>>>>> > >> +    };
>>>>> > >> +
>>>>> > >> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>>>>> > >> +        if (isa_edata_arr[i].enabled) {
>>>>> > >> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name=
, NULL);
>>>>> > >> +            g_free(old);
>>>>> > >> +            old =3D new;
>>>>> > >> +        }
>>>>> > >> +    }
>>>>> > >> +
>>>>> > >> +    *isa_str =3D new;
>>>>> > >> +}
>>>>> > >> +
>>>>> > >>  char *riscv_isa_string(RISCVCPU *cpu)
>>>>> > >>  {
>>>>> > >>      int i;
>>>>> > >> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>>>>> > >>          }
>>>>> > >>      }
>>>>> > >>      *p =3D '\0';
>>>>> > >> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>>>>> > >>      return isa_str;
>>>>> > >>  }
>>>>> > >>
>>>>> > >> --
>>>>> > >> 2.30.2
>>>>> > >>
>>>>> >
>>>>> >
>>>>> >
>>>>>
>>>>>
>>>>>
>>>>>


--=20
Regards,
Atish

