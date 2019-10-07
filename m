Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHXx1-0001kL-QB
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 14:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52260)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dayeol@berkeley.edu>) id 1iHXwy-0001js-CT
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 14:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dayeol@berkeley.edu>) id 1iHXww-0006R8-Qz
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 14:41:39 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34784)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dayeol@berkeley.edu>) id 1iHXww-0006Qg-Gz
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 14:41:38 -0400
Received: by mail-pg1-x542.google.com with SMTP id y35so8763357pgl.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Oct 2019 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berkeley-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KJzG2axKoZkgi+l/x9Y+YilciqreDl/CMUAdZrHp2aw=;
 b=iGcgrGOCKgHnYj0SOxs4byq0fzbx3qX+oOOzRHokaMHdEiD8mDY6Q3JygO931nMbqJ
 fzWFuzu8hPpdhWk9JEnpE9d6x6zzAzcKHAEg2Na+INFJAhv2R6MjZtcaHYVNgf4QI37D
 DJHpuk9lHL1TtvncnkAmP+sOVvxQxpuOEpdJj6gkcHoVTyTXvsbvxUILntTXb9dQ8gcf
 Z6LRr/tYlTaRBPD1Hfdz+sKjaKSnjMpdbfjjuufDgw5Vt+YvzSTKtUSVrbtfDlneELT8
 I1c74nccf5kKFy1rhccOhr50gar9wY4rJrAUbthHyDcAJkW6rmbxmppVpHe0BJjFH4+z
 21Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJzG2axKoZkgi+l/x9Y+YilciqreDl/CMUAdZrHp2aw=;
 b=PzZq+/PJmvt+a4D8rqyfebL86TL9/0CXBxGbDbVUBWqYep1p8utoQbBqUgbMwxJLRl
 YV8xgfdP4vK8gSb7DuWmUFw3KTBPF7MnexzwqUZnc+ClVusnnbgraaqMUaAyKxB/EBxf
 WDR8J0aU8Hdvj4yJNnLPm92TX/82xIdXgY+NLMBZXEAAHLKM1TwNKRhiUO/5J1wScxjX
 YtyWcx5Nd0ccCEuF43HnIxnDHp59GSnEJN4dHlSw1F7zrpa6SBqInuaCkH7qlh3rZm81
 hkCm0y+tXx7kCbzFQ2LzHIk7pcehkcXMu5YpcCzVz05YjpMCPpxshwWa5ayMVukAaFim
 zhWA==
X-Gm-Message-State: APjAAAVKeLqwNcWICqq5Cf3c6YjkV19DWuqzxp3ZFiTvPxYGJBBOtB93
 +OZL789YVhlqyFRHEgRoiM1QK8J6edRMzwacOeMlcA==
X-Google-Smtp-Source: APXvYqy56w92ZslacwtCzrc4WCV82EQC6F0vE5pppvDkBeVbKt5gFBFOxqcL+j6uZvTu+A5wjfNQqF6iLd1S+OS1L5I=
X-Received: by 2002:aa7:8816:: with SMTP id c22mr25727116pfo.197.1570473697061; 
 Mon, 07 Oct 2019 11:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191007052813.25814-1-dayeol@berkeley.edu>
 <5583387c-5c5b-8890-999b-2ba4d75cd69d@linaro.org>
 <CACjxMEsw+Deh176JLP2aF4Pdkb_s8MiPApwMON-_K6ed61-Zyw@mail.gmail.com>
 <3747223d-23ee-1f28-e165-b2b0c5746b68@linaro.org>
In-Reply-To: <3747223d-23ee-1f28-e165-b2b0c5746b68@linaro.org>
From: Dayeol Lee <dayeol@berkeley.edu>
Date: Mon, 7 Oct 2019 11:41:26 -0700
Message-ID: <CACjxMEtPRxTQdOYFL97G7aYXC6KTBuGY2avf1bPJLYGEpURh=Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: PMP violation due to wrong size parameter
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000d7ce0905945666d7"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Mon, 07 Oct 2019 18:41:42 -0000

--000000000000d7ce0905945666d7
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 7, 2019 at 11:25 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/7/19 10:19 AM, Dayeol Lee wrote:
> > Thank you very much for the clarification!
> >
> > I found tlb_set_page with size != TARGET_PAGE_SIZE makes the translation
> way
> > too slow; the Linux doesn't seem to boot.
>
> To clarify, PMP specifies a range.  That range has only two end points.
> Therefore, a maximum of 2 pages may be affected by a mis-aligned PMP
> boundary.
>
> It sounds like you're getting size != TARGET_PAGE_SIZE for all pages.
>
>
The cause of the problem is not a mis-aligned PMP boundary.
Let's say a PMP range is 0x1000 - 0x2000
if pmp_hart_has_privs() gets addr=0x2000 and size=0,
pmp_hart_has_privs() will ALWAYS return false because the code assumes size
> 0.
It checks if (addr) and (addr + size - 1) are within the PMP range for each
PMP entry.
(addr + size - 1) is supposed to be the last byte address of the memory
access, but it ends up with (addr - 1) if size = 0.
Thus, pmp_hart_has_privs() returns false as (addr - 1) = 0x1fff is within
the range, and addr = 0x2000 is out of the range (partial match violation).

--000000000000d7ce0905945666d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 7, 2019 at 11:25 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 10/7/19 10:19 AM, Dayeol Lee wr=
ote:<br>
&gt; Thank you very much for the clarification!<br>
&gt; <br>
&gt; I found tlb_set_page with size !=3D TARGET_PAGE_SIZE makes the transla=
tion way<br>
&gt; too slow; the Linux doesn&#39;t seem to boot.<br>
<br>
To clarify, PMP specifies a range.=C2=A0 That range has only two end points=
.<br>
Therefore, a maximum of 2 pages may be affected by a mis-aligned PMP bounda=
ry.<br>
<br>
It sounds like you&#39;re getting size !=3D TARGET_PAGE_SIZE for all pages.=
<br><br></blockquote><div><br></div><div>The cause of the problem is not a =
mis-aligned PMP boundary.</div><div>Let&#39;s say a PMP range is 0x1000 - 0=
x2000</div><div>if pmp_hart_has_privs() gets addr=3D0x2000 and size=3D0,</d=
iv><div>pmp_hart_has_privs() will ALWAYS return false because the code assu=
mes size &gt; 0.</div><div>It checks if (addr) and (addr=C2=A0+ size - 1) a=
re within the PMP range for each PMP entry.</div><div>(addr=C2=A0+ size - 1=
) is supposed to be the last byte address of the memory access, but it ends=
 up with (addr - 1) if size =3D 0.</div><div>Thus, pmp_hart_has_privs() ret=
urns false as (addr - 1) =3D 0x1fff is within the range, and addr =3D 0x200=
0 is out of the range (partial match violation).</div><div><br></div><div><=
br></div><div><br></div></div></div>

--000000000000d7ce0905945666d7--

