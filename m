Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irIPw-0002u8-JM
	for mharc-qemu-riscv@gnu.org; Tue, 14 Jan 2020 04:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56699)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shihpo.hung@sifive.com>) id 1irIPt-0002tp-Gc
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 04:23:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shihpo.hung@sifive.com>) id 1irIPs-0005Rg-5K
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 04:23:17 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56004)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shihpo.hung@sifive.com>)
 id 1irIPr-0005RH-Sd
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 04:23:16 -0500
Received: by mail-wm1-x344.google.com with SMTP id q9so12869189wmj.5
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2020 01:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iPeDJfmX+J9JbWkJuINWmfwIPDEVf2XLnDWb9B1TWPg=;
 b=aQOD5X1peBcWxJLpQxo32r2MHu9a2ry77QKtnoMspmRDkFOHAUFjsqO2GOctZi15Rp
 ROOOBqsT9s0M+QPy9PpNBRtxBApbNGI5QsE8kyhwn7/t8j0RJFowXnYkRNOK9JQLETQG
 mggoMrYyHPrDS06CqHIeQDYcUyfppI+lGDX++5zhMqcJD4ejW4ig38wdJZ6d7hXnYC2M
 1EmpnfsbAr88beMycoeaETM6Y2dsprE06o8ZNn9jOt9qSctyRaUbk9Zfkjk3I3uYTlDP
 2l/khFhTboDz0vOblCFY98F+UeVxX9ruBPXxe0dO9xGbOHvsmu83tw/QLI4UbhQsTd8X
 9nIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iPeDJfmX+J9JbWkJuINWmfwIPDEVf2XLnDWb9B1TWPg=;
 b=CiHZDwt8Fy9gKzsucDbPPINjLOB+UtGr0r2vCXco2gZHsxdj30HOqGPc4CnibJ6PK3
 cR95Vk2PWeFtIlzqQ15MZj3GqRxdzoI7Y55on0zjiKuGts5NuXWjN19jjPE0kctivcuQ
 TBH+9miuLIB83U4BVc/ZHQXiSFbRq/TpjxAamp8r7wegoUQbbAuMBauX3jrGE+lFEhgt
 Rnod4g6pUN04zfW8aODnARmg/C4MK4oUaLPyoh+0zv46lyR4zW47QrGzCOROBlHQl58D
 5wj+M09E07IWzmF/2umnwQLFn6GAclkwBtgJUJdBxfk+ejzPO7SXSEeQRPvPMZpBVV68
 g+WQ==
X-Gm-Message-State: APjAAAUWJJibLZYAHdBQKf12nstYgAeA0e4UCUaSt0gJnNnyrkrkJKrA
 Dwx6fc6jJqA7EzDFUpTE1FdFL2DobrIujcVC0o0ejA==
X-Google-Smtp-Source: APXvYqxVfzDei3APqPZld6ioOps6RTUSFSmjqqzznkLEOIyiiG5jYt0f/VNTvSorLmscKBuH+kZvqeu7zrLSv1Yd6F8=
X-Received: by 2002:a7b:cf2d:: with SMTP id m13mr25901438wmg.163.1578993794085; 
 Tue, 14 Jan 2020 01:23:14 -0800 (PST)
MIME-Version: 1.0
References: <1578647134-13216-1-git-send-email-shihpo.hung@sifive.com>
 <19df333a-9a93-d3af-e7ab-fce212bb4978@linaro.org>
In-Reply-To: <19df333a-9a93-d3af-e7ab-fce212bb4978@linaro.org>
From: ShihPo Hung <shihpo.hung@sifive.com>
Date: Tue, 14 Jan 2020 17:23:02 +0800
Message-ID: <CALoQrweYaT27OPbF9yC=3JmxnGom=mg1kJdW5XFBpkM_Q4aKww@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Set mstatus.DS & FS correctly
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000330d37059c1624d3"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
X-List-Received-Date: Tue, 14 Jan 2020 09:23:19 -0000

--000000000000330d37059c1624d3
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 14, 2020 at 10:32 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/9/20 11:05 PM, shihpo.hung@sifive.com wrote:
> > Because ctx->mstatus_fs changes dynamically during runtime, we should
> > remove the mstatus_fs check at the translation stage.
>
> This change is incorrect.
>
> The actual bug is in cpu_get_tb_cpu_state(), as I just noticed during
> review:
>
> "[PATCH 2/3] RISC-V: use FIELD macro to define tb flags"
> https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg02455.html


I didn't understand the purpose of mstatus_fs, but now I get it.
Thanks for pointing me to.
I will resend my patches.

--000000000000330d37059c1624d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 14, 2020 at 10:32 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 1/9/20 11:05 PM, <a href=3D"mailto:shihpo.hung@sifive=
.com" target=3D"_blank">shihpo.hung@sifive.com</a> wrote:<br>
&gt; Because ctx-&gt;mstatus_fs changes dynamically during runtime, we shou=
ld<br>
&gt; remove the mstatus_fs check at the translation stage.<br>
<br>
This change is incorrect.<br>
<br>
The actual bug is in cpu_get_tb_cpu_state(), as I just noticed during revie=
w:<br>
<br>
&quot;[PATCH 2/3] RISC-V: use FIELD macro to define tb flags&quot;<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg02455.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2020-01/msg02455.html</a></blockquote><div><br></div><div>I di=
dn&#39;t understand the purpose of mstatus_fs, but now I get it.</div><div>=
Thanks for pointing me to.</div><div>I will resend my patches.</div></div><=
/div>

--000000000000330d37059c1624d3--

