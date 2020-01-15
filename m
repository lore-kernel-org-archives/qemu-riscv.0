Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irjeH-0003FE-HS
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jan 2020 09:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shihpo.hung@sifive.com>) id 1irjeE-0003Ev-OT
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 09:27:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shihpo.hung@sifive.com>) id 1irjeD-0007S0-83
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 09:27:54 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44238)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shihpo.hung@sifive.com>)
 id 1irjeD-0007QB-1y
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 09:27:53 -0500
Received: by mail-wr1-x441.google.com with SMTP id q10so15943770wrm.11
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2020 06:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TTblYoglIXYAwtNqvTtUQH62e0FOZG9e0GefOBYk3fo=;
 b=VJCO24VaKi3Sza1b+i4wcrl51olDPxWJytBtrTqq2U7olM4++miyjpVQItzgRz6RrA
 QovBeF+N+v9+PX0EY89AoImKsXbCIzyX/Ist8ygjZeDBZ4ZgYIESGPEVq5EZKNWGp4nP
 D8/99MDOFd5xH1bp0V76RMnBn/k6GfaBOskuL0jIUsXdbDLeVQ+VB1UN/WXK2wRArCdH
 MD07Px3gzmNSNavHPn6Z6JRoHfKktcLm9An+ioRjiLV80do9DluGQRPBvR9vSElX7yix
 ahuIV7uTa4IVnSE4RLm6wBbzG/c0a2w1H4nY4ScEbz4/lUH5WPUK8CFxoCdjfJ2Tr9K5
 pt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TTblYoglIXYAwtNqvTtUQH62e0FOZG9e0GefOBYk3fo=;
 b=pTSntxEf3tYlr9Ltj0Mh4sO6iL8KbvRI9y7SqBpBBWOq5NxU+gBTHAA+6l8ev/9eET
 R0+RqMN6Jo18Phr204koKUdBtYVeFIVWAmPkDVKoWWp4sQrvURk7sJ/QkWPSh0kFEX4h
 0GF7ul7WERGA1Ev18/AoJDUq9eKhLOAB2zkJSoK4HPjwWBlD98eAlgA9DNYBl37xltON
 6lGrDmCZ+l5SfFCK4okSqqUznYW9s5zhKIPuD45UEml0y6CHkKGab9idn4mS/gpKWGLR
 dg1r9R7SR0lkz3FHTpCxWAXQb+qSKevqRvnnQ5ETdsjk1oKFpKf/+IFMsN2VxC8DbXef
 01SA==
X-Gm-Message-State: APjAAAUWKdobQe1g+VIBbosQPXyr3bVAli5PcUQ5vef1/fIoGnMKUra6
 Wq/fv7xaBhTSGdEeFXHezC8ONvWq5YHbA6/1W+0PHg==
X-Google-Smtp-Source: APXvYqz+YWkXkQ0FUbjuO6JaISI1Fx7eSgRHAxIySzvSeqLksyKZr70r/qT7v0pMnZIThR/m+QJhCoUAQ5c3f0LpQIY=
X-Received: by 2002:a05:6000:12:: with SMTP id
 h18mr30011608wrx.87.1579098471220; 
 Wed, 15 Jan 2020 06:27:51 -0800 (PST)
MIME-Version: 1.0
References: <1579069053-22190-1-git-send-email-shihpo.hung@sifive.com>
 <CAKmqyKNeAFRP7eCLtw1b0P53ub3k--+dROpPRynzCwM8DF15ng@mail.gmail.com>
In-Reply-To: <CAKmqyKNeAFRP7eCLtw1b0P53ub3k--+dROpPRynzCwM8DF15ng@mail.gmail.com>
From: ShihPo Hung <shihpo.hung@sifive.com>
Date: Wed, 15 Jan 2020 22:27:39 +0800
Message-ID: <CALoQrwf6FEqKaSC1z3Kf1Mz0E0820dttHUFONE_-pP0U=T77_w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] target/riscv: Fix tb->flags FS status
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="0000000000007162f6059c2e83ed"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Wed, 15 Jan 2020 14:27:56 -0000

--0000000000007162f6059c2e83ed
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 2:29 PM Alistair Francis <alistair23@gmail.com>
wrote:

> > -    *flags = cpu_mmu_index(env, 0);
> > -    if (riscv_cpu_fp_enabled(env)) {
> > -        *flags |= TB_FLAGS_MSTATUS_FS;
> > -    }
> > +    *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
>
> I don't think this is right, you should use the riscv_cpu_fp_enabled()
> function.
>
> Right now it's the same as env->mstatus & MSTATUS_FS but when the
> Hypervisor extension goes in riscv_cpu_fp_enabled() will be more
> complex.
>
> Alistair
>
> I agree using riscv_cpu_fp_enabled() to hide the complexity when checking
FP,
but here I only duplicate the FP status (disabled/initial/clean/dirty) to
tb->flags
no matter FP is enabled or not.

Is it still necessary to check this before duplicating it?

I think it is not as long as TB_FLAGS_MSTATUS_FS is equivalent to
MSTATUS_FS.
But I don't know what changes hypervisor extension brings, please correct
me if I am wrong.

ShihPo

--0000000000007162f6059c2e83ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15, 2020 at 2:29 PM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>&gt; -=C2=A0 =C2=A0 *flags =3D cpu_mmu_index(env, 0);<br>
&gt; -=C2=A0 =C2=A0 if (riscv_cpu_fp_enabled(env)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *flags |=3D TB_FLAGS_MSTATUS_FS;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 *flags =3D cpu_mmu_index(env, 0) | (env-&gt;mstatus &am=
p; MSTATUS_FS);<br>
<br>
I don&#39;t think this is right, you should use the riscv_cpu_fp_enabled() =
function.<br>
<br>
Right now it&#39;s the same as env-&gt;mstatus &amp; MSTATUS_FS but when th=
e<br>
Hypervisor extension goes in riscv_cpu_fp_enabled() will be more<br>
complex.<br>
<br>
Alistair<br><br></blockquote><div>I agree using riscv_cpu_fp_enabled() to h=
ide the complexity when checking FP,</div><div>but here I only duplicate th=
e FP status (disabled/initial/clean/dirty) to tb-&gt;flags</div><div>no mat=
ter FP is enabled or not.</div><div><br></div><div>Is it still necessary to=
 check this before duplicating it?</div><div><br></div><div>I think it is n=
ot as long as=C2=A0TB_FLAGS_MSTATUS_FS is equivalent=C2=A0to MSTATUS_FS.</d=
iv><div>But I don&#39;t know what changes hypervisor extension brings, plea=
se correct me if I am wrong.</div><div><br></div><div>ShihPo</div><div><br>=
</div></div></div>

--0000000000007162f6059c2e83ed--

