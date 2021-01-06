Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kx7Ab-0004wX-Bc
	for mharc-qemu-riscv@gnu.org; Wed, 06 Jan 2021 06:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kx7AZ-0004tr-Fa
 for qemu-riscv@nongnu.org; Wed, 06 Jan 2021 06:40:03 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kx7AX-0006yn-8p
 for qemu-riscv@nongnu.org; Wed, 06 Jan 2021 06:40:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id 3so2351880wmg.4
 for <qemu-riscv@nongnu.org>; Wed, 06 Jan 2021 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=f1hDkLDYSffgyCej41WjzuQmeq9TxZ6OlvLEdOBU+Xg=;
 b=IpuiiGfqaIR4Hwwgm04iuBpj8o5apeOTw+2AxNXnPwX+nnW5o3CH+haPhfGH0FIfmR
 shB9dKIzCzgbPeRAzmXq5C2fuAbtmHXeKD9ezo0eIiuAPsex03Uzxhrnki1F1waKNkWv
 7XUXaKJ8Z7farJP5oHowRy4T1arhZY+kS9kImshL+NB3fy9OpbZnPUpC8ctfkmSCbBWx
 49Fjf0sKmaMFTLpNRriPBrY4iacttxJciVGmxGfAJilomlIYCnMHFGXaFy1gCdspz+DA
 SPUgf0Yqawr5znVRObTRcg7/zljHwR5Og97WMWYcUAQ1+JA5Os1cYhlA2h7UNI9dcLtQ
 Grdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=f1hDkLDYSffgyCej41WjzuQmeq9TxZ6OlvLEdOBU+Xg=;
 b=Y1OTAvZDa6KiGqGPdadZ09p9Sl3pUnmRRCXY5EZCI6ai5TnXeOIpxXVyt0KN57OthE
 PxCiTtosw5vpC6vgLVcZrvyVjVZNBL1sabJV3W5Qv4fxwtD7LZbEB98xqBoG4B0RTJ9f
 PnQNPxsxVHKK0FFgo5Dx57hJHncpwD4WQPJoqiEDrParBwgzsaBqStBIzGavFdvdV/VE
 tmvt3R0UbpZMbRyYZk6vC/Ok3JPFxRXMz0q5KouuCQUv7LX6T9qKWt8YMLPkMBKYmUio
 T9F5UuaRGo6KZUEqb2ycZxmqQeCK/rr5yuvzRWjGMl8QeEuCREHs3HE4/rrEhmtV+uXe
 ry6A==
X-Gm-Message-State: AOAM531nsPRLxqKm2CN2dtE/RSBP4BHJ7Yo04Zin5GqRfXBnfSximlRB
 4NaID9ClQG3Rw40dhqcu8RoNEQ==
X-Google-Smtp-Source: ABdhPJyKTaX9jY7pjSLQCJoILOIslpC4vngMBFK/Enb8en0FIdxsXpesSNfYMjxLluSCqhwZtIhSlw==
X-Received: by 2002:a7b:c773:: with SMTP id x19mr3220155wmk.127.1609933199250; 
 Wed, 06 Jan 2021 03:39:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q73sm2756066wme.44.2021.01.06.03.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 03:39:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9CBA1FF7E;
 Wed,  6 Jan 2021 11:39:56 +0000 (GMT)
References: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
 <CAKmqyKO-7x9Ea9xKuAAm5Z0b8zLr0Xqhrwya43iqByhxjeDCGw@mail.gmail.com>
 <CAOkUe-AqC4UXOPZeX+uyXqucF12AaW_76oDqgn6EE-PomckYjA@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng
 <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] gdb: riscv: Add target description
Date: Wed, 06 Jan 2021 11:35:08 +0000
In-reply-to: <CAOkUe-AqC4UXOPZeX+uyXqucF12AaW_76oDqgn6EE-PomckYjA@mail.gmail.com>
Message-ID: <87czyi2t0z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 06 Jan 2021 11:40:03 -0000


Sylvain Pelissier <sylvain.pelissier@gmail.com> writes:

> Hello,
>
> I may have made an error by copy pasting the comment into the file. I sent
> a new v3 with git send-email. I hope it is fine now.

Your v3 doesn't include the review tags you got for v2 which makes it
look un-reviewed. See:

  https://wiki.qemu.org/Contribute/SubmitAPatch#Proper_use_of_Reviewed-by:_=
tags_can_aid_review

You can either apply them manually by copy and paste when you reword the
commit message or use a tool to apply the old version and collect tags
from the mailing list archive.

> Regards
>
> Sylvain
>
> On Tue, 5 Jan 2021 at 22:03, Alistair Francis <alistair23@gmail.com> wrot=
e:
>
>> On Wed, Dec 30, 2020 at 12:26 AM Sylvain Pelissier
>> <sylvain.pelissier@gmail.com> wrote:
>> >
>> > Target description is not currently implemented in RISC-V architecture.
>> Thus GDB won't set it properly when attached. The patch implements the
>> target description response.
>> >
>> > Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
>>
>> Hello,
>>
>> This patch fails to apply. How did you send the email?
>>
>> Alistair
>>
>> > ---
>> >  target/riscv/cpu.c | 13 +++++++++++++
>> >  1 file changed, 13 insertions(+)
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index 254cd83f8b..ed4971978b 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] =3D {
>> >      DEFINE_PROP_END_OF_LIST(),
>> >  };
>> >
>> > +static gchar *riscv_gdb_arch_name(CPUState *cs)
>> > +{
>> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
>> > +    CPURISCVState *env =3D &cpu->env;
>> > +
>> > +    if (riscv_cpu_is_32bit(env)) {
>> > +        return g_strdup("riscv:rv32");
>> > +    } else {
>> > +        return g_strdup("riscv:rv64");
>> > +    }
>> > +}
>> > +
>> >  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>> >  {
>> >      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
>> > @@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c,
>> void *data)
>> >      /* For now, mark unmigratable: */
>> >      cc->vmsd =3D &vmstate_riscv_cpu;
>> >  #endif
>> > +    cc->gdb_arch_name =3D riscv_gdb_arch_name;
>> >  #ifdef CONFIG_TCG
>> >      cc->tcg_initialize =3D riscv_translate_init;
>> >      cc->tlb_fill =3D riscv_cpu_tlb_fill;
>> > --
>> > 2.25.1
>>


--=20
Alex Benn=C3=A9e

