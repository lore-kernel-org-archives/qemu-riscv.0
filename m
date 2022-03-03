Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPqkz-0002EQ-4q
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 14:04:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nPqkx-00029Q-Fk
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 14:04:55 -0500
Received: from [2607:f8b0:4864:20::929] (port=37867
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nPqkv-0005QK-L5
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 14:04:55 -0500
Received: by mail-ua1-x929.google.com with SMTP id y1so2591202uap.4
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 11:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V/PqalYPy1xmdGgZPO5WkTgRA+MzOs6qYVBjzdnB7vw=;
 b=mdXkNTNNe8D3UJB4+lSOhUvjKKGxR9Y4GtgMCLTgT1VwKglrFDp0IQfxU3y6yDcOVc
 ZCMrKaulktFNxUWluuXc7/Uvhq/rlrvaJMfJEBO6mVwnm05OeHhM/Lu5Dfv97NOwe85j
 0XyKqStQZ92IYJOg4Td24NN9c/z6p68VThbww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V/PqalYPy1xmdGgZPO5WkTgRA+MzOs6qYVBjzdnB7vw=;
 b=gugJqZr8WPxvW88RQRZbKgpu4KsCWxVHU1Xlgq18uJmECWd3YZ57Bq2yTNAEESjuM4
 LxvE2qplt33+Hy7VZ+5FgPy+IVyPQ4p0lF8ifNRotqF9dexaAy0BxoqStC3cRFV9owxz
 +ucgmp1WSqb5DUKsVVbOwW4baBos90YRmNbt6jE1s++sxJ5BCTzjkdgz5HQR3FW48kil
 dAA9++Mm9h+fkKofL+OY4UlmBbpR9Ys1jGDvuxup6NGp24tfkN2B8zCGG9bylp9Rp9a3
 5kWO2uhAnTl9C+pPYTwAdlDpdaWuDtD6tctoS9OTkSx0ebrTQlfiDHqVCilJzvEd0so6
 /TcA==
X-Gm-Message-State: AOAM532e2Kjv/TxoxQubOzQHeFBWCOkwimPRKuBAP3JAc6PUU9/Qh4GD
 rO58cW/BV8WzrFrWX9XYGdW38dIKTL7vpxitfyi+BXPrZQ==
X-Google-Smtp-Source: ABdhPJwI97M/bs9vyFfH6uiHRpksSOYCzz87WgbB3/CqSOAHE9OlsciP0CVdgqClqfaCv2JwUEmjMPE4+5JH039mQGI=
X-Received: by 2002:a81:7586:0:b0:2dc:14a7:ced2 with SMTP id
 q128-20020a817586000000b002dc14a7ced2mr8496127ywc.443.1646333929361; Thu, 03
 Mar 2022 10:58:49 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
 <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
In-Reply-To: <CANzO1D05q8_-PSs5KJsnO+MPWVWLrFoYsvhPXGK2eUC8rwBqDw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 3 Mar 2022 10:58:38 -0800
Message-ID: <CAOnJCULn7BbyfyeHpPQkyLTQyTcXrfu9wBheMAXDdFTnnRMphA@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Frank Chang <frank.chang@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=atishp@atishpatra.org; helo=mail-ua1-x929.google.com
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
X-List-Received-Date: Thu, 03 Mar 2022 19:04:55 -0000

On Fri, Feb 25, 2022 at 11:46 PM Frank Chang <frank.chang@sifive.com> wrote=
:
>
>
>
> Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=BC=9A
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
>> Suggested-by: Heiko Stubner <heiko@sntech.de>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
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
>>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index b0a40b83e7a8..2c7ff6ef555a 100644
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
>> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>>      device_class_set_props(dc, riscv_cpu_properties);
>>  }
>>
>> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max=
_str_len)
>> +{
>> +    char *old =3D *isa_str;
>> +    char *new =3D *isa_str;
>> +    int i;
>> +    struct isa_ext_data isa_edata_arr[] =3D {
>> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
>> +        { "svinval", cpu->cfg.ext_svinval },
>> +        { "svnapot", cpu->cfg.ext_svnapot },
>
>
> We still have other sub-extensions, e.g. Zfh, Zba, Zbb, Zbc, Zbs... etc.
> Do you mind adding them as well?
>

Do we really need it ? Does any OS actually parse it from the device tree ?
AFAIK, Linux kernel doesn't use them. As the device tree is intended
to keep the information useful
for supervisor software, I prefer to avoid bloating if possible.

> Also, I think the order of ISA strings should be alphabetical as describe=
d:
> https://github.com/riscv/riscv-isa-manual/blob/master/src/naming.tex#L96
>

Ahh yes. I will order them in alphabetical order and leave a big
comment for future reference as well.

> Regards,
> Frank Chang
>
>>
>> +    };
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
>> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
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


--=20
Regards,
Atish

