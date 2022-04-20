Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh4o9-0007fF-0K
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 03:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh4o7-0007ee-6G; Wed, 20 Apr 2022 03:31:23 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:38455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh4o5-0003s0-JL; Wed, 20 Apr 2022 03:31:22 -0400
Received: by mail-io1-xd2d.google.com with SMTP id n134so954709iod.5;
 Wed, 20 Apr 2022 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q2o5q4uwRMTugBL1CvT39qNu67dYebsZ7yttp+TnEyM=;
 b=RwMUOFuBk0H0aJoCYj+DPakuZLIG+nPVFTi+8D68mdTDz8dQVTXj2syXBu9ZgNdZVW
 Yvbq0U4JxTeHADu6lAdueY4H9rt1H7bUimtKPIXvoo7AJhW98Tpc8j8ii/IMbw0WkgTf
 W4t9XIgwL7Vwi4LxA3cZQmSlaNb/JeLijiQ0vynKjoYPyp11bLWWo17m1ExmiVB7Tt5N
 gaODVIf/oxUYMBk87FVLNN9Ppxfivq+mxHKv30zxQ/P1GxLnlMiNLg48+sT9mND+i89x
 ydy6QYP7VjJioeKnURwwJ3ceoqN6FfNPXdBzo7sQ7D7LgA+Yivla1oynfcme7knmhl82
 gGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q2o5q4uwRMTugBL1CvT39qNu67dYebsZ7yttp+TnEyM=;
 b=WeersIU2Cc5opeOG7Hbbu0gDfVaRC5xP1G8E+jVstfEVZwDTr4S9BUtylJBaBm6b/4
 utEdyl/PlXHSRDsZ9WPBkXILFmf6Wg9ndmJj2DaHDjn7majcvHsr8Jqh/r1Wl2iVKZms
 AUrBIsTgrj0RU7w3VnEu1OjlNSp4rMb061PrxWmwDAP771rOxa8RDxxTIE4UUxOUdPkN
 3iKkiG0u57FiJ9tURrqlTArnM4YSXnvyiUXid+2ZnoHTbEIzNW/0G2SWJ8BXjW/wvwNa
 k1Dk1eWG7l06xNj761U9wsir+xkHBoQN6LUDTKCUKbmzz4t5rUxUrb1l9x47ObiRgQK5
 6KBQ==
X-Gm-Message-State: AOAM533HmxAj5lv0Vy8xLDpAtEY2chKvvr6lTb3L4+pwrnJ8nvbck8Q1
 0MvpYbrjd+Utua8UOTGSUv8GFQhWTLqwDEKe6cA=
X-Google-Smtp-Source: ABdhPJxfmV9g5+na9m9WLXUjXoYa5quiOblKwui7z2ZXew2uaCxobPsT+9kwkrv0hzjJqjbV/OUXygp4NjubHuq4ILo=
X-Received: by 2002:a05:6638:370c:b0:328:6ddf:8882 with SMTP id
 k12-20020a056638370c00b003286ddf8882mr8425566jav.267.1650439880001; Wed, 20
 Apr 2022 00:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-3-bmeng.cn@gmail.com>
In-Reply-To: <20220315065529.62198-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Apr 2022 17:30:54 +1000
Message-ID: <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/riscv: machine: Add debug state description
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 07:31:23 -0000

On Tue, Mar 15, 2022 at 5:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Add a subsection to machine.c to migrate debug CSR state.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - new patch: add debug state description
>
>  target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 5178b3fec9..4921dad09d 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -216,7 +216,38 @@ static const VMStateDescription vmstate_kvmtimer =3D=
 {
>          VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
>          VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
>          VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static bool debug_needed(void *opaque)
> +{
> +    RISCVCPU *cpu =3D opaque;
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    return riscv_feature(env, RISCV_FEATURE_DEBUG);

This fails to build:

../target/riscv/machine.c: In function =E2=80=98debug_needed=E2=80=99:
../target/riscv/machine.c:228:31: error: =E2=80=98RISCV_FEATURE_DEBUG=E2=80=
=99
undeclared (first use in this function); did you mean
=E2=80=98RISCV_FEATURE_EPMP=E2=80=99?
 228 |     return riscv_feature(env, RISCV_FEATURE_DEBUG);
     |                               ^~~~~~~~~~~~~~~~~~~
     |                               RISCV_FEATURE_EPMP
../target/riscv/machine.c:228:31: note: each undeclared identifier is
reported only once for each function it appears in
../target/riscv/machine.c:229:1: warning: control reaches end of
non-void function [-Wreturn-type]
 229 | }
     | ^

Alistair

> +}
>
> +static const VMStateDescription vmstate_debug_type2 =3D {
> +    .name =3D "cpu/debug/type2",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINTTL(mcontrol, type2_trigger_t),
> +        VMSTATE_UINTTL(maddress, type2_trigger_t),
> +        VMSTATE_END_OF_LIST()
> +   }
> +};
> +
> +static const VMStateDescription vmstate_debug =3D {
> +    .name =3D "cpu/debug",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D debug_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
> +        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, TRIGGER_TYPE2_NUM=
,
> +                             0, vmstate_debug_type2, type2_trigger_t),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -292,6 +323,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          &vmstate_pointermasking,
>          &vmstate_rv128,
>          &vmstate_kvmtimer,
> +        &vmstate_debug,
>          NULL
>      }
>  };
> --
> 2.25.1
>
>

