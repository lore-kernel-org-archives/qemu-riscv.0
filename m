Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzvDl-0006Rq-Sg
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 23:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1hzuZA-0006Vk-0h
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 23:12:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1hzuZ8-0005bZ-QD
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 23:12:11 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:36948)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1hzuYw-0005TH-EZ; Mon, 19 Aug 2019 23:11:58 -0400
Received: by mail-lj1-x241.google.com with SMTP id t14so3682860lji.4;
 Mon, 19 Aug 2019 20:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=opF2Kjd4xhjet2Ok9MagWcGdoiR+78PtkQz6eXk5xsk=;
 b=pvwuH6x4g2RD618z9nkWleyIT+6+twBUIvVz2ZiuSW7t4OUC4ypUZILRbI5tzpPlXM
 01ZuAi7rMVbJ/luuKM7/OU8+CfxDwOxM6yahhJ3FIi819g+J3mXGhXnFSX/T1hMbQ6Mc
 NpAZHDg0y+faC9iil7yD+b4B2CydMwJ86lVkBLi4tvsx16pbw924ZQId/jkaGPvOa+Ks
 WFXC5CDoUf8lUcDbksineCbDwMOgbIHsZA57FmmrbSrozZKk3KLX+nRSQrFq4epUkdWZ
 6Fuf4XDh5PVWVOzVjPB1MGcakGK3z8A6DUeUD15puLgREEMw0VyMuXJS7dIKmU9Zb9OS
 kNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=opF2Kjd4xhjet2Ok9MagWcGdoiR+78PtkQz6eXk5xsk=;
 b=Qm1aHZ5yrKlnl563+JmeO4G+G2lpmm0eDzkZuwkxmB2yAabcLxpc0t1FIjayC42THw
 DqmMZQaGRanCkJ8W2g6FNscLJA1JBAsPi1+RwWgsVDuW/ke7CAbwTeKA43LQ3tyoTiEv
 n2ISmt4GLzK0hclwHW9NpGDuS/I1jFG4IvhZINPrTKSCACaUTSXBGD5qNqsJQcQBhJJJ
 6UycYKkoG1tx8MCo5Av37IShSETwx0xlfqvYI/iGBv+fWDQBbZa2G37eWZEXuLNUkjRd
 hrsS7/K6SLBNOw5YEqPelLiu0BYOgf+MIWisjA2s7SmZOa136XG0W5PUdsp9ppEDuX9W
 5Z3w==
X-Gm-Message-State: APjAAAV5RVR+ey9+7B2Gqqz+KJmJheX29InimYupNSckMlFWnsDQtgV0
 tVrGwuMhdgC9Ncr+jwSwak9zHcwrrPcC98vXUG4=
X-Google-Smtp-Source: APXvYqx049c5BZmAP/osr25SDM/2wewEcsQwTaKoKF5FTV81RkVyM97wkfYz72vrFlTUdvzt6yXvg9zXn8tOUEjgzJg=
X-Received: by 2002:a2e:9a84:: with SMTP id p4mr2611284lji.52.1566270716435;
 Mon, 19 Aug 2019 20:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941032362.60179@bt.com> <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
 <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
 <3b983f77-8503-3fcd-7c42-45d0121845e6@redhat.com>
 <b79a173d-a682-21da-6e7f-489ce06c8f7a@linaro.org>
In-Reply-To: <b79a173d-a682-21da-6e7f-489ce06c8f7a@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 20 Aug 2019 05:11:46 +0200
Message-ID: <CAJy5ezpXMNnMTWh67cY1xOrWQEySsjv8uuTkd3VS5pyMKM9FAQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 tony.nguyen@bt.com, 
 qemu-devel@nongnu.org, frederic.konrad@adacore.com, berto@igalia.com, 
 qemu-block@nongnu.org, arikalo@wavecomp.com, pasic@linux.ibm.com, 
 hpoussin@reactos.org, anthony.perard@citrix.com, 
 xen-devel@lists.xenproject.org, philmd@redhat.com, green@moxielogic.com, 
 jiri@resnulli.us, ehabkost@redhat.com, b.galvani@gmail.com, 
 eric.auger@redhat.com, alex.williamson@redhat.com, stefanha@redhat.com, 
 jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au, 
 claudio.fontana@suse.com, crwulff@gmail.com, laurent@vivier.eu, 
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org, 
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net, 
 peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com, 
 keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com, 
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de, 
 magnus.damm@gmail.com, atar4qemu@gmail.com, minyard@acm.org, sw@weilnetz.de, 
 yuval.shaia@oracle.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, 
 peter.chubb@nicta.com.au, clg@kaod.org, shorne@gmail.com, 
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com, 
 amarkovic@wavecomp.com, jan.kiszka@web.de, aurelien@aurel32.net, 
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, jasowang@redhat.com, 
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, robh@kernel.org, lersek@redhat.com, 
 borntraeger@de.ibm.com, joel@jms.id.au, antonynpavlov@gmail.com, 
 chouteau@adacore.com, Andrew.Baumann@microsoft.com, mreitz@redhat.com, 
 walling@linux.ibm.com, dmitry.fleytman@gmail.com, mst@redhat.com, 
 mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de, 
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me, 
 paul.durrant@citrix.com, david@gibson.dropbear.id.au, 
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net, 
 stefanb@linux.ibm.com
Content-Type: multipart/alternative; boundary="000000000000ace486059083d1f5"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
X-Mailman-Approved-At: Mon, 19 Aug 2019 23:54:09 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [qemu-s390x] [PATCH v7 33/42] exec:
 Replace device_endian with MemOp
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
X-List-Received-Date: Tue, 20 Aug 2019 03:12:13 -0000

--000000000000ace486059083d1f5
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Aug. 2019, 23:01 Richard Henderson, <richard.henderson@linaro.org>
wrote:

> On 8/19/19 11:29 AM, Paolo Bonzini wrote:
> > On 19/08/19 20:28, Paolo Bonzini wrote:
> >> On 16/08/19 12:12, Thomas Huth wrote:
> >>> This patch is *huge*, more than 800kB. It keeps being stuck in the the
> >>> filter of the qemu-s390x list each time you send it. Please:
> >>>
> >>> 1) Try to break it up in more digestible pieces, e.g. change only one
> >>> subsystem at a time (this is also better reviewable by people who are
> >>> interested in one area)
> >>
> >> This is not really possible, since the patch is basically a
> >> search-and-replace.  You could perhaps use some magic
> >> ("DEVICE_MEMOP_ENDIAN" or something like that) to allow a split, but it
> >> would introduce more complication than anything else.
> >
> > I'm stupid, at this point of the series it _would_ be possible to split
> > the patch by subsystem.  Still not sure it would be actually an
> advantage.
>
> It might be easier to review if we split by symbol, one rename per patch
> over
> the entire code base.
>
>
> r~
>

Or if we review your script (I assume this wasn't a manual change). I'm not
sure it's realistic to have review on the entire patch or patches.

Best regards,
Edgar

>

--000000000000ace486059083d1f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 19 Aug. 2019, 23:01 Richard Henderson, &lt;<a =
href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 8/19/19 11:29 AM, =
Paolo Bonzini wrote:<br>
&gt; On 19/08/19 20:28, Paolo Bonzini wrote:<br>
&gt;&gt; On 16/08/19 12:12, Thomas Huth wrote:<br>
&gt;&gt;&gt; This patch is *huge*, more than 800kB. It keeps being stuck in=
 the the<br>
&gt;&gt;&gt; filter of the qemu-s390x list each time you send it. Please:<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 1) Try to break it up in more digestible pieces, e.g. change o=
nly one<br>
&gt;&gt;&gt; subsystem at a time (this is also better reviewable by people =
who are<br>
&gt;&gt;&gt; interested in one area)<br>
&gt;&gt;<br>
&gt;&gt; This is not really possible, since the patch is basically a<br>
&gt;&gt; search-and-replace.=C2=A0 You could perhaps use some magic<br>
&gt;&gt; (&quot;DEVICE_MEMOP_ENDIAN&quot; or something like that) to allow =
a split, but it<br>
&gt;&gt; would introduce more complication than anything else.<br>
&gt; <br>
&gt; I&#39;m stupid, at this point of the series it _would_ be possible to =
split<br>
&gt; the patch by subsystem.=C2=A0 Still not sure it would be actually an a=
dvantage.<br>
<br>
It might be easier to review if we split by symbol, one rename per patch ov=
er<br>
the entire code base.<br>
<br>
<br>
r~<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Or if we review your script (I assume this wasn&#39;t a manual change). I=
&#39;m not sure it&#39;s realistic to have review on the entire patch or pa=
tches.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</di=
v><div dir=3D"auto">Edgar=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000ace486059083d1f5--

