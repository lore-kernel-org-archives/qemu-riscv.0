Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDp4D-0001Bp-JP
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 10:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mDp4C-0001AE-KW; Wed, 11 Aug 2021 10:18:48 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:40522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mDp4A-000571-KH; Wed, 11 Aug 2021 10:18:48 -0400
Received: by mail-yb1-xb35.google.com with SMTP id l3so4938558ybt.7;
 Wed, 11 Aug 2021 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B97tyH7orm73Um4s0Nn3DVYxta80EI9V/wbNdrQiju0=;
 b=S82dGUL7r9TWluA96Wtu8DfBvp0OYV4DaK1umtiYJo1EDh0XLcVvxkNuNx9CCMd9IM
 xXWIaqBvoOVEQZMF6e1l7F4qk+6cPu3M9X9th2apHv8Jsk8QmLdyBtyVb2VHJ7S4Pk4B
 wgE2ElJl9c9eANnqTgKswzM7T429xzTrv+yxQnGwFnGHuCUPgnBFDMaXscPz8+u72Qk4
 Y4JPvqvttuuRz80GiKD1CS7yB0mLbrRmiVKDLMxDN1trkHKW6TqMrcL1Nn9P7nWPEh6F
 J+V5ZL70Of0XkbAwZqvLH7HnHiywk7XrDCSXroZfrr9z+WS845eScJEOENeCzrz4e7tP
 Km0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B97tyH7orm73Um4s0Nn3DVYxta80EI9V/wbNdrQiju0=;
 b=LnaD7Wf6c5gIdUtXGWcQ8+SZzb6v8CkLx7kHwGdVo81EvJOJB1nga29aLEE1TZGPBG
 qr1R1QYaRYLgF1aqeTIo5UbpJk4EN9jOoDLjpg8+/Llq3PaPMkWtXDShaxAtK1yew/X2
 riUBt8I8b5cEC9lqyKgeOCDEtttzZ1FH8iC8gWaOdUXXsSS3A4l70AuSI63pQ9+XjbG2
 VpxwIaO3W8DbG0CSg8delK3tAXqlepLRtYXm8VOL3X3wLVsD61GonVWTuWhWMaB9/NpR
 TCeiHZMgXf4xbZolNsFna1ZsTBwHu8muGEChosv1mrSQZq1vPt0lP4X5vtY+6r8HTVGv
 TKfw==
X-Gm-Message-State: AOAM5328UKhPVL4CsM9/RVDmkJQPH5rDv9FCTGH0xd1Hww2QDFudxzLV
 BxsTIi7mAqKKLfRgOCEiz3eUfQeTVYF9FbK+Wk8=
X-Google-Smtp-Source: ABdhPJyuphFDs1AEJufPpsaY7UmhWCpbxZnPow8yeodp7u6CtytxijfRS29agAAE81n9GzwXH9Mghkb3pN1TBJbUuIM=
X-Received: by 2002:a25:be09:: with SMTP id h9mr47991914ybk.239.1628691525225; 
 Wed, 11 Aug 2021 07:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210810033310.7252-1-zhiwei_liu@c-sky.com>
 <CAEUhbmUdLzc7Xt0VEFQaOPRWy-BZqv-p_9pipSzOVzQ+6mo-ig@mail.gmail.com>
 <b3a5feb1-e257-ad91-d0bf-30f1645af848@c-sky.com>
In-Reply-To: <b3a5feb1-e257-ad91-d0bf-30f1645af848@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 11 Aug 2021 22:18:34 +0800
Message-ID: <CAEUhbmVt6+xMRd-Nzjff8_E7k-jc05MsVZvjUQrAoaeXQAb8uQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Don't wrongly overide isa version
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 Aug 2021 14:18:49 -0000

On Wed, Aug 11, 2021 at 10:07 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/8/11 =E4=B8=8B=E5=8D=885:26, Bin Meng wrote:
> > On Tue, Aug 10, 2021 at 11:35 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrot=
e:
> >> For some cpu, the isa version has already been set in cpu init functio=
n.
> >> Thus only overide the isa version when isa version is not set, or
> > typo: override, please fix the commit title as well
> OK
> >
> >> users set different isa version explicitly by cpu parameters.
> >>
> >> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> >> ---
> >>   target/riscv/cpu.c | 14 ++++++++------
> >>   1 file changed, 8 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 991a6bb760..425efba0c8 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -392,9 +392,7 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
> >>       RISCVCPU *cpu =3D RISCV_CPU(dev);
> >>       CPURISCVState *env =3D &cpu->env;
> >>       RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
> >> -    int priv_version =3D PRIV_VERSION_1_11_0;
> >> -    int bext_version =3D BEXT_VERSION_0_93_0;
> >> -    int vext_version =3D VEXT_VERSION_0_07_1;
> >> +    int priv_version =3D env->priv_ver;
> >>       target_ulong target_misa =3D env->misa;
> >>       Error *local_err =3D NULL;
> >>
> >> @@ -417,9 +415,11 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)
> >>           }
> >>       }
> >>
> >> -    set_priv_version(env, priv_version);
> >> -    set_bext_version(env, bext_version);
> >> -    set_vext_version(env, vext_version);
> >> +    if (!env->priv_ver) {
> >> +        set_priv_version(env, PRIV_VERSION_1_11_0);
> >> +    } else if (env->priv_ver !=3D priv_version) {
> >> +        set_priv_version(env, priv_version);
> >> +    }
> > This logic seems incorrect to me. So if cpu init function does not set
> > the priv, and cfg set it to v1.10, v1.11 will be set in the new logic.
>
> Yes,  it's also here.
>

But the previous logic makes sure the cfg value overrides the cpu init
value which seems to be intended. So in that case, it should still be
v1.10 not v1.11.

Regards,
Bin

