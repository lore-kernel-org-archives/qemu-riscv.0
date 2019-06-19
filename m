Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdedA-0002rY-8I
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 13:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49803)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hdecw-0002TU-Ee
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 13:44:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hdeQk-0000sy-V8
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 13:31:32 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:45681)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>) id 1hdeQk-0000pD-IF
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 13:31:30 -0400
Received: by mail-lj1-x22b.google.com with SMTP id m23so4033256lje.12
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2019 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3mL3ZUVava+pP1RmOAzINwSq3TIHF8Ye3R0BSoCEok=;
 b=YUQo0Vsbem+8lHwY+tf6EldVwcUo70mInKbcGZJhbv+C5A2KSAEwdKbLNAVUu+ao/K
 uCJ+ETBuYGiRoMcLtMZgUTPAlKv8WsBzLJonJg9qqHyaNUvVy1ybJ9Q61kZa67Sz1qBr
 mMw3ZpPDvudwjffMm/mclc/4y1RHiYaibUZZMO9/hD9j6LXefhJ7Xpt4NfLpE3nmSu6T
 9lRw8MNPRgGuqFOA4uBDkgjAe7FFZBlz7/IE6QkMt5XmzDbbnauk3Qo+JU6cGsFJZXAU
 TRREuHgxgyymm7qjRsKOujQ4fgZYJTRr/wcaqnVWuM4+BJlWMm4ZKrS3VXpRbQ3F6OoD
 eKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3mL3ZUVava+pP1RmOAzINwSq3TIHF8Ye3R0BSoCEok=;
 b=BJvmWqXxt7PxUwDrFuFXLnTmvKdnua/FTasQ7dQSCDgeeClfAYsfpKOKC9UpTLief9
 tqhYrqAD1anALniVeV6QHu6oUsUB2P3ojTierYDqj0CI3eoQtImn32iaJ+la5rGqu4Fo
 DvV6BbtIjLZLrjnMfRY9JJQYfimuG9jhvtzdjv+uBv49fvZrHJyWZdSx8Dzwg0PIyuUw
 b4zSI2NarA8vXTachozXnMh1CajtCFg/HIX7mpa3pQTNcsHbTiWnJ++987PJ20o6WsGl
 EuQQLxLtGuKDi5XyBrD+wwJ2jJlaczxh0sJoADO0nTvCf1wfCu2syUc48j3yxCcIo+K7
 c1iA==
X-Gm-Message-State: APjAAAW7T0C8lxZXBLsDvbdkMiY+e2Q2vWskjebfdkyjhAxl38df1xIW
 zmcOw1sa/ASskjPrgrbgS/aygByABS8S3KGtE+c=
X-Google-Smtp-Source: APXvYqyK17AwV8CF/YvfEfnObghtzfkAqnccgO21yQK5fTwjX5CCH53zjE+wHomvjEIIiqvsqgAhQHn0xcB+0P8q8g4=
X-Received: by 2002:a2e:8847:: with SMTP id z7mr4722985ljj.51.1560965480847;
 Wed, 19 Jun 2019 10:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <Gpx9RF86BWnRvLPI5Kz0PRHM3oiLy4nkgS-FiQueS0d3dSS4N-N008stUGzVV-NctfG95esZlphJJ1A7J4rlkU6VniTM_Oxyrg1MfRpGwlA=@protonmail.com>
In-Reply-To: <Gpx9RF86BWnRvLPI5Kz0PRHM3oiLy4nkgS-FiQueS0d3dSS4N-N008stUGzVV-NctfG95esZlphJJ1A7J4rlkU6VniTM_Oxyrg1MfRpGwlA=@protonmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Wed, 19 Jun 2019 13:30:51 -0400
Message-ID: <CANnJOVEAbK1Bc+TTE9xGozDcxTt6ezpdDnpQ+LRafgV-1gy=ug@mail.gmail.com>
To: Quentin Mundell <quentin.mundell@protonmail.com>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000fe1ba2058bb098f8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::22b
Subject: Re: [Qemu-riscv] TLB refresh issue
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
X-List-Received-Date: Wed, 19 Jun 2019 17:44:11 -0000

--000000000000fe1ba2058bb098f8
Content-Type: text/plain; charset="UTF-8"

I wasn't able to find the commit you bisected to, but is your code
executing a `sfence.vma` instruction after every instance that it changes
satp? Until recently this wasn't necessary with QEMU because QEMU flushed
the TLB more aggressively than required by the spec, but the behavior was
chayou are referringnged in a recent commit
<https://github.com/qemu/qemu/commit/1e0d985fa9136a563168a3da66f3d17820404ee2#diff-243969738b77de10c014622a3d749a44>.


Jonathan

On Wed, Jun 19, 2019 at 11:46 AM Quentin Mundell via Qemu-riscv <
qemu-riscv@nongnu.org> wrote:

> Hello,
>
> I have updated my QEMU version (from 3.x to today's master).
> I now get all sort of weird and not easily reproducible exceptions
> triggered in my risc-v guest, happening from both user and supervisor mode.
>
> The command I use is roughly `qemu-system-riscv64 -machine sifive_u -m
> 1024 -kernel mybinary.elf` (sorry, I cannot share the elf).
>
> I have bisected this issue back to commit
> c7b95171881569284501ed01fec7acb8654db7b.
> Some TLB flushes were removed in the following places:
> target/riscv/cpu_helper.c: `csr_write_helper(env, s, CSR_MSTATUS);` ->
> `env->mstatus = s;` (twice)
> target/riscv/op_helper.c: `csr_write_helper(env, s, CSR_MSTATUS);` ->
> `env->mstatus = s;` (twice)
> These are the places where the privileged mode is switched.
>
> If I add them back (`tlb_flush(env_cpu(env));`), everything is fine again.
>
> However, in the `riscv_cpu_set_mode` function, I see the following
> comment:
> > tlb_flush is unnecessary as mode is contained in mmu_idx
> It would suggest adding back TLB flushes is not the way to go...
>
> Does someone with better knowledge of the codebase can tell me how to
> proceed here?
> - Should I submit a patch adding back the TLB flushes?
> - Is it an issue somewhere else?
>
> Regards
> QM
>
>
>

--000000000000fe1ba2058bb098f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I wasn&#39;t able to find the commit you bisected to,=
 but is your code executing a `sfence.vma` instruction after every instance=
 that it changes satp? Until recently this wasn&#39;t necessary with QEMU b=
ecause QEMU flushed the TLB more aggressively than required by the spec, bu=
t <a href=3D"https://github.com/qemu/qemu/commit/1e0d985fa9136a563168a3da66=
f3d17820404ee2#diff-243969738b77de10c014622a3d749a44">the behavior was chay=
ou are referringnged in a recent commit</a>. <br></div><div><br></div><div>=
Jonathan</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jun 19, 2019 at 11:46 AM Quentin Mundell via Qemu-r=
iscv &lt;<a href=3D"mailto:qemu-riscv@nongnu.org">qemu-riscv@nongnu.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
>Hello,<br></div><div><br></div><div>I have updated my QEMU version (from 3=
.x to today&#39;s master).<br></div><div>I now get all sort of weird and no=
t easily reproducible exceptions triggered in my risc-v guest, happening fr=
om both user and supervisor mode.<br></div><div><br></div><div>The command =
I use is roughly `qemu-system-riscv64 -machine sifive_u -m 1024 -kernel myb=
inary.elf` (sorry, I cannot share the elf).<br></div><div><br></div><div><d=
iv>I have bisected this issue back to commit c7b95171881569284501ed01fec7ac=
b8654db7b.<br>
Some TLB flushes were removed in the following places:<br>
target/riscv/cpu_helper.c: `csr_write_helper(env, s, CSR_MSTATUS);` -&gt; `=
env-&gt;mstatus =3D s;` (twice)<br>
target/riscv/op_helper.c: `csr_write_helper(env, s, CSR_MSTATUS);` -&gt; `e=
nv-&gt;mstatus =3D s;` (twice)</div><div>These are the places where the pri=
vileged mode is switched.<br></div><div><br></div><div>If I add them back (=
`tlb_flush(env_cpu(env));`), everything is fine again.<br></div><div><br></=
div><div>However, in the `riscv_cpu_set_mode` function, I see the following=
 comment: <br></div><div>&gt; tlb_flush is unnecessary as mode is contained=
 in mmu_idx<br></div><div>It would suggest adding back TLB flushes is not t=
he way to go...<br></div><div><br></div><div>Does someone with better knowl=
edge of the codebase can tell me how to proceed here?<br></div><div>- Shoul=
d I submit a patch adding back the TLB flushes?<br></div><div>- Is it an is=
sue somewhere else?<br></div><div><br></div><div>Regards<br></div><div>QM<b=
r></div><div><br></div></div><div><br></div></blockquote></div>

--000000000000fe1ba2058bb098f8--

