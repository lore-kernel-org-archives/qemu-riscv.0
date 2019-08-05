Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1huhAq-00073B-PQ
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 13:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49789)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1huhAo-0006zu-Km
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 13:53:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1huhAn-0000U9-Iq
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 13:53:30 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:42567)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1huhAk-0000QV-Rt; Mon, 05 Aug 2019 13:53:27 -0400
Received: by mail-lf1-x144.google.com with SMTP id s19so58711120lfb.9;
 Mon, 05 Aug 2019 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NWrdhd6IK5ogkm+079EGOFpGlhM3R+f8lNK5BH9VsZM=;
 b=n/h9wWK3Q5QnfhsHl3WWWo0c/pEsQ0H50BEI7rM+tQ5WnoAuRpbT8r6D+AlRaRHC0R
 3ahzmBAgxoaInfj4j+5U4DcPDT1i1sRYk28kPjSL0TrcqZc/y/EhK4Mm9sgrEtwcBmVy
 ihYB0DVuOKv9WtV/zBotm3j8SET0jQdQIaPI8PYnxI3Df4AOztQ8TpK59vaggl9XjXRw
 L04Sy0SWvn48Tuy3D+vn71530J8XAhG2/E+QscTYVVoolxjiPMk99WxVKeADvQu6yrYU
 erlAkWLg2LUeZi64RVXVNXJ/wrxWF/pvwBwi2TkZXqcWwGmuMRHj1fxV9KVPbJgPIauz
 njIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NWrdhd6IK5ogkm+079EGOFpGlhM3R+f8lNK5BH9VsZM=;
 b=OVP/H3ek5CCKOyZulU2dr2QWeP+7iTZ7/cSls7cSxYzUoHSiQBpx0g9gowm7UMJrK/
 HyH4m/C3A4cHn53LWRSowAiTs2aAGc/PItdn5+iz45c8CMMphArPLKa7mqyPfrFEXn3Q
 fnoB+ftwZgQXgCU+Mm9XMl86Kn8bzS4VUABJNByD0pXww7VGS82u4mo6unkNO2VNlXZh
 0WhY0oesSvCaGLya3XZCKvcKDzY+qSS0iOLnOEIFOS5b13qtW7bi4EJR8kcr2lphKWgi
 0QiCPXDQEs1GjPh3J3zEMvoBGMvJSioMYTfsDsTMtQJP5HCcr9rg+ePNZkz1WsGudlBI
 B1NA==
X-Gm-Message-State: APjAAAWMddvfKIuE8d+K78147nU6I05jHKgsoMLZTqIKppqs9C2yBMS4
 KBhzaMerOdezhMpiYS6j/YZG++/J7cQfe0Wxl0Y=
X-Google-Smtp-Source: APXvYqwP+TPN/T4+ND01cZvAZxgQ8ABn1M8WIH54C4XpDaVb1sQvb6IPDliLNR/vWU3WpMZnT98iSJPGC7UWrTNLEYg=
X-Received: by 2002:a19:6904:: with SMTP id e4mr53909314lfc.156.1565027605052; 
 Mon, 05 Aug 2019 10:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <4116c27c037b5e7f4822cfd7199724450dc6b5da.1564080680.git.alistair.francis@wdc.com>
 <CAEiOBXUcwp5rZbdH7VuQjnM3Xq5-ONTWmcDp1Da+C1n_-w95Uw@mail.gmail.com>
 <CAKmqyKMJ-Kji0n_HjBX_73T2PerxOF5XWK7mhguegXJ6BztL_A@mail.gmail.com>
 <CAEiOBXXSHojFUtkvTXYrhQQcjmqnDSoMAQHqRhvQz_0g=K_SZw@mail.gmail.com>
In-Reply-To: <CAEiOBXXSHojFUtkvTXYrhQQcjmqnDSoMAQHqRhvQz_0g=K_SZw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Aug 2019 10:49:44 -0700
Message-ID: <CAKmqyKNx+HdYD738BGSAjOf1OuaPBeD5k1x5Yx1-BsD=GbbWFw@mail.gmail.com>
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v1 6/6] target/riscv: Fix
 Floating Point register names
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
X-List-Received-Date: Mon, 05 Aug 2019 17:53:31 -0000

On Wed, Jul 31, 2019 at 1:10 AM Chih-Min Chao <chihmin.chao@sifive.com> wro=
te:
>
>
>
> On Wed, Jul 31, 2019 at 2:41 AM Alistair Francis <alistair23@gmail.com> w=
rote:
>>
>> On Mon, Jul 29, 2019 at 8:19 AM Chih-Min Chao <chihmin.chao@sifive.com> =
wrote:
>> >
>> >
>> > On Fri, Jul 26, 2019 at 2:56 AM Alistair Francis <alistair.francis@wdc=
.com> wrote:
>> >>
>> >> From: Atish Patra <atish.patra@wdc.com>
>> >>
>> >> As per the RISC-V spec, Floating Point registers are named as f0..f31
>> >> so lets fix the register names accordingly.
>> >>
>> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> >> ---
>> >>  target/riscv/cpu.c | 8 ++++----
>> >>  1 file changed, 4 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> >> index f8d07bd20a..af1e9b7690 100644
>> >> --- a/target/riscv/cpu.c
>> >> +++ b/target/riscv/cpu.c
>> >> @@ -40,10 +40,10 @@ const char * const riscv_int_regnames[] =3D {
>> >>  };
>> >>
>> >>  const char * const riscv_fpr_regnames[] =3D {
>> >> -  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
>> >> -  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
>> >> -  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
>> >> -  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
>> >> +  "f0", "f1", "f2",  "f3",  "f4", "f5", "f6", "f7",
>> >> +  "f8", "f9", "f10",  "f11",  "f12", "f13", "f14", "f15",
>> >> +  "f16", "f17", "f18",  "f19",  "f20", "f21", "f22", "f23",
>> >> +  "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31"
>> >>  };
>> >
>> >
>> > Could you indicate the section of the spec ?
>>
>> Chapter 11: "=E2=80=9CF=E2=80=9D Standard Extension for Single-Precision
>> Floating-Point, Version 2.2", section 11.1, Figure 11.1 shows f0 -
>> f32.
>>
>> > By chapter 20 of user spec, the patch changes the floating register na=
me to architecture name but leave the integer register use the ABI name.
>>
>> You mean the Packed-SIMD extension?
>>
>> Alistair
>
>
> I means  "Chapter 20RISC-V Assembly Programmer=E2=80=99s Handbook".
> There is an table, "Table 20.1: Assembler mnemonics for RISC-V integer an=
d =EF=AC=82oating-point registers.",  describes
> the architecture name and ABI name for integer and floating-point registe=
r.

Ah ok. In general I think it makes sense to base the names on the spec
and not other sources.

Alistair

>
> By the way,  I reference the riscv-spec-2.2
>
> chihmin
>
>
>>
>> >
>> > chihmin
>> >>
>> >>  const char * const riscv_excp_names[] =3D {
>> >> --
>> >> 2.22.0
>> >>
>> >>

