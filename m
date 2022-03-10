Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSNjx-0001lo-8Q
	for mharc-qemu-riscv@gnu.org; Thu, 10 Mar 2022 13:42:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nSNjq-0001kj-Vt
 for qemu-riscv@nongnu.org; Thu, 10 Mar 2022 13:42:15 -0500
Received: from [2a00:1450:4864:20::630] (port=38742
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nSNjm-00081j-UL
 for qemu-riscv@nongnu.org; Thu, 10 Mar 2022 13:42:14 -0500
Received: by mail-ej1-x630.google.com with SMTP id r13so14109734ejd.5
 for <qemu-riscv@nongnu.org>; Thu, 10 Mar 2022 10:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TIcVy6G9XKgqmpduG6jRsKAF4Y2q7cyCir5tEsbD9es=;
 b=FUTyPXTjaJlU1hvXujnLWjLplwu3hWRIuQ8MToXEuvmTO9wLLuUdZCjRAU1IbKWWxU
 dokqYeniWLFNpS7z1RzqOukNKW8O3zkeBI4OXmxqLwI6D3K1TnpojXri9i2HL7g05CGF
 dwK2ioc8zu8I+FeRj4loaTjd6koe/dbKthyxgGtaljGKUhWcHnW0LFwubC39kzcZBhzw
 KnUelXvFuA7v8SMGR36oZ45+8RlODmQfpWIpa0jKNCrE6sdMI1Bm7/jXJTtjPq/AaDk7
 mbT8R/uLX8Dq6cM9H8YbbDLaOY7sRI2yWWqROB/xw6FhlxN66dIz5d/L3ZbPOrGptTDf
 RwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TIcVy6G9XKgqmpduG6jRsKAF4Y2q7cyCir5tEsbD9es=;
 b=3RGEcB0RLFaPEcI5Ncw7Rilzj2cHV01cM7uFHfgj4DvsGeBNxR2S+PBTN73aNRDTc4
 SILmdVtuSzhsb4XMpXXZysjWZaQpN2TQUgECDjRQx6oMOnbzGNdcI6yClxjvqjmmSBDE
 Mz6dD06k0eQC0UxN/W8VjwL0PVckg+J3AauNDxJ5yigbDeeOYzuEdeIa+kGV/34Zf1k2
 kzKwtYfseUK7+oGKdj70AIcfxDv8/66lsEGfETo24zHt4xka5dyFO0o/WvKp/n97cuqs
 ICyJMbp6+ZdVhy9OG83THScy4InnUceZPKDuhPOad9KO0qzWaXb3Mgg3rb8YoEB23dVO
 4Lqw==
X-Gm-Message-State: AOAM532pWV88zY0skm58eyfaVmAitynMul5mjJkn/HFfDFsDwEugXcJO
 +YME2CZtMMmWKePJPpGRwHN1l+SYG4C2+1wqvSZktQ==
X-Google-Smtp-Source: ABdhPJyTMRsZA06VQKqzWBVSTDvYC/nhwuj7u3/B6PNviJn7Fr5fLB1qHHZVbLV2BD5D+7V014kTQMyenA39Qg7faVQ=
X-Received: by 2002:a17:907:2d11:b0:6db:8eab:94dd with SMTP id
 gs17-20020a1709072d1100b006db8eab94ddmr2107674ejc.502.1646937728244; Thu, 10
 Mar 2022 10:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20220309005302.315656-1-atishp@rivosinc.com>
 <CANzO1D3aM4+fDRbr7KeQm4E=Ghe-QMh=DFZZP-MN46=rmkuqcQ@mail.gmail.com>
In-Reply-To: <CANzO1D3aM4+fDRbr7KeQm4E=Ghe-QMh=DFZZP-MN46=rmkuqcQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 10 Mar 2022 10:41:57 -0800
Message-ID: <CAHBxVyEmTthJdArjgdmmtyD31UWhtcXr+4zTkZ9-dZO9QXkYjQ@mail.gmail.com>
Subject: Re: [PATCH v4] target/riscv: Add isa extenstion strings to the device
 tree
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=atishp@rivosinc.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 10 Mar 2022 18:42:15 -0000

On Wed, Mar 9, 2022 at 5:47 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B43=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=888:53=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> The Linux kernel parses the ISA extensions from "riscv,isa" DT
>> property. It used to parse only the single letter base extensions
>> until now. A generic ISA extension parsing framework was proposed[1]
>> recently that can parse multi-letter ISA extensions as well.
>>
>> Generate the extended ISA string by appending  the available ISA extensi=
ons
>> to the "riscv,isa" string if it is enabled so that kernel can process it=
.
>>
>> [1] https://lkml.org/lkml/2022/2/15/263
>>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Suggested-by: Heiko Stubner <heiko@sntech.de>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>
>> Changes from v3->v4:
>> 1. Fixed the order of the extension names.
>> 2. Added all the available ISA extensions in Qemu.
>>
>> Changes from v2->v3:
>> 1. Used g_strconcat to replace snprintf & a max isa string length as
>> suggested by Anup.
>> 2. I have not included the Tested-by Tag from Heiko because the
>> implementation changed from v2 to v3.
>>
>> Changes from v1->v2:
>> 1. Improved the code redability by using arrays instead of individual ch=
eck
>> ---
>>  target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ddda4906ffb7..2521a6f31f9f 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -34,6 +34,12 @@
>>
>>  /* RISC-V CPU definitions */
>>
>> +/* This includes the null terminated character '\0' */
>> +struct isa_ext_data {
>> +        const char *name;
>> +        bool enabled;
>> +};
>> +
>>  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
>>
>>  const char * const riscv_int_regnames[] =3D {
>> @@ -898,6 +904,42 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>>      device_class_set_props(dc, riscv_cpu_properties);
>>  }
>>
>> +#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
>> +
>> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max=
_str_len)
>> +{
>> +    char *old =3D *isa_str;
>> +    char *new =3D *isa_str;
>> +    int i;
>> +    struct isa_ext_data isa_edata_arr[] =3D {
>> +        ISA_EDATA_ENTRY(svinval, ext_svinval),
>> +        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
>> +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
>> +        ISA_EDATA_ENTRY(zba, ext_zba),
>> +        ISA_EDATA_ENTRY(zbb, ext_zbb),
>> +        ISA_EDATA_ENTRY(zbc, ext_zbc),
>> +        ISA_EDATA_ENTRY(zbs, ext_zbs),
>> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
>> +        ISA_EDATA_ENTRY(zfh, ext_zfhmin),
>> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
>> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
>> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
>> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
>> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
>> +    };
>
>
> Hi Atish,
>
> According to RISC-V Unpriviledge spec, Section 28.6:
> https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L85
>
> "The first letter following the =E2=80=9CZ=E2=80=9D conventionally indica=
tes the most closely
> related alphabetical extension category, IMAFDQLCBKJTPV.
> For the =E2=80=9CZam=E2=80=9D extension for misaligned atomics,
> for example, the letter =E2=80=9Ca=E2=80=9D indicates the extension is re=
lated to the =E2=80=9CA=E2=80=9D standard extension.
> If multiple =E2=80=9CZ=E2=80=9D extensions are named, they should be orde=
red first by category,
> then alphabetically within a category=E2=80=94for example, =E2=80=9CZicsr=
 Zifencei Zam=E2=80=9D."
>

Yes. Sorry I missed that part. Will fix it.

> So I think the order of "Z" extensions should be:
> zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32f, zve64f, zhinx, zhi=
nxmin
>
> Also, I think "Zifencei" and "Zicsr" should also be covered as well,
> and all extensions should follow the order defined in Table 28.11:
> https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L141
>

I thought about that earlier as well. Zifencei & Zicsr was already
part of the ISA and carved out as an extension later.
Qemu/Any supervisor support that by default and won't work without
that. We can't possibly disable those and boot anything.

Do you think there is any benefit adding it ?


> "The table also defines the canonical order in which extension names must=
 appear in the name string,
> with top-to-bottom in table indicating first-to-last in the name string,
> e.g., RV32IMACV is legal, whereas RV32IMAVC is not."
>
> So the overall order would be:
> zicsr, zifencei, zfh, zfhmin, zfinx, zdinx, zba, zbb, zbc, zbs, zve32f, z=
ve64f, zhinx, zhinxmin, svinval, svnapot, svpbmt,
>
> Regards,
> Frank Chang
>
>>
>> +
>> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>> +        if (isa_edata_arr[i].enabled) {
>> +            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>> +            g_free(old);
>> +            old =3D new;
>> +        }
>> +    }
>> +
>> +    *isa_str =3D new;
>> +}
>> +
>>  char *riscv_isa_string(RISCVCPU *cpu)
>>  {
>>      int i;
>> @@ -910,6 +952,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>>          }
>>      }
>>      *p =3D '\0';
>> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>>      return isa_str;
>>  }
>>
>> --
>> 2.30.2
>>
>>

