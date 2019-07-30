Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hsX40-0001BK-3U
	for mharc-qemu-riscv@gnu.org; Tue, 30 Jul 2019 14:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48008)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hsX3y-00017I-07
 for qemu-riscv@nongnu.org; Tue, 30 Jul 2019 14:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hsX3w-0004Vy-VN
 for qemu-riscv@nongnu.org; Tue, 30 Jul 2019 14:41:29 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36185)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hsX3p-0004NF-KP; Tue, 30 Jul 2019 14:41:23 -0400
Received: by mail-lj1-x244.google.com with SMTP id i21so63082344ljj.3;
 Tue, 30 Jul 2019 11:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6x4Ws9huxSor2++4BkFdFro5fPr4QnDjt3Fzt15bGxI=;
 b=nM0C8ZnrcgFGACkAq5UDFWdmYk672KKTaiSpxjFnxKKi0yPoqDUFnxPxksFt5LKVga
 4pDtl+mXLJMLVoqMA713Lr88ZRo6Ho1s/FRI1MwMB5tVcxqvLvtC0J/ZI4yBN5Aydsm3
 JPUDayDoOfHZjmOPUSKpfV7/jAGcKYNhZsiCa9VanINaWyoqm9x7yiMysc8Ehg5xGHLs
 1NygfAC4qcaz77ljG39be1f0svVGxf9HWwSZO69J1ctSbUatgQASEXqPCmmaagYN8zNh
 EmPRqjvp8BpqMspMwm2r8l3zL5+/9I1c797WiuZDzHH4l1HcvTEksgq2eSIep/1Eynyb
 Q6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6x4Ws9huxSor2++4BkFdFro5fPr4QnDjt3Fzt15bGxI=;
 b=V7oh6igY9mkb15cOzvRGRwSUO+l2a18SaBjOHy1UTDcpuGCYwb9LopcccGx2vxt40d
 fMGX+mRcmTUtSJ4oGsW4BLBty+BYH+Ly/NcsVj0uOKIY3dkT97AqOcP+nMmirbUvzws+
 F1YSNij9Nd7IiD9mu477QjP6CZRPf4tIkyerrlnjEzt09bUAyTWLK3T4bHCqMATgb4AJ
 zOj1RT/fZvP8rP2pDMWVJ4C0LKShrsVtY3xwXX8ZZI4S+M1ZkNroSQ7KxftKyjgCPfrT
 KAM2Cmqzedd3//9f4CmDVnJnTgcU8O9fgpfnbHUHumy5Rd8gNvonZH2cu4WQWphJp9gd
 Al9Q==
X-Gm-Message-State: APjAAAUuIklL1/S04p5DnIOnE29BZ1IwI59VFAOEbvSEgZIFv0xSoXBg
 KMuV+zEgXWHpOnhH9cJxPM111qK+1kg9mdYkrpA=
X-Google-Smtp-Source: APXvYqwn9e6cDiilT3z1k0DQW8TDA0P46Y/civ3ystoc2CecJ2Gpco5H/hXDir9gB/m5DCitfhys6XEHWbACDojjiro=
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr37050119ljj.146.1564512079486; 
 Tue, 30 Jul 2019 11:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <4116c27c037b5e7f4822cfd7199724450dc6b5da.1564080680.git.alistair.francis@wdc.com>
 <CAEiOBXUcwp5rZbdH7VuQjnM3Xq5-ONTWmcDp1Da+C1n_-w95Uw@mail.gmail.com>
In-Reply-To: <CAEiOBXUcwp5rZbdH7VuQjnM3Xq5-ONTWmcDp1Da+C1n_-w95Uw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Jul 2019 11:37:46 -0700
Message-ID: <CAKmqyKMJ-Kji0n_HjBX_73T2PerxOF5XWK7mhguegXJ6BztL_A@mail.gmail.com>
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
X-List-Received-Date: Tue, 30 Jul 2019 18:41:30 -0000

On Mon, Jul 29, 2019 at 8:19 AM Chih-Min Chao <chihmin.chao@sifive.com> wro=
te:
>
>
> On Fri, Jul 26, 2019 at 2:56 AM Alistair Francis <alistair.francis@wdc.co=
m> wrote:
>>
>> From: Atish Patra <atish.patra@wdc.com>
>>
>> As per the RISC-V spec, Floating Point registers are named as f0..f31
>> so lets fix the register names accordingly.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  target/riscv/cpu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index f8d07bd20a..af1e9b7690 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -40,10 +40,10 @@ const char * const riscv_int_regnames[] =3D {
>>  };
>>
>>  const char * const riscv_fpr_regnames[] =3D {
>> -  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
>> -  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
>> -  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
>> -  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
>> +  "f0", "f1", "f2",  "f3",  "f4", "f5", "f6", "f7",
>> +  "f8", "f9", "f10",  "f11",  "f12", "f13", "f14", "f15",
>> +  "f16", "f17", "f18",  "f19",  "f20", "f21", "f22", "f23",
>> +  "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31"
>>  };
>
>
> Could you indicate the section of the spec ?

Chapter 11: "=E2=80=9CF=E2=80=9D Standard Extension for Single-Precision
Floating-Point, Version 2.2", section 11.1, Figure 11.1 shows f0 -
f32.

> By chapter 20 of user spec, the patch changes the floating register name =
to architecture name but leave the integer register use the ABI name.

You mean the Packed-SIMD extension?

Alistair

>
> chihmin
>>
>>  const char * const riscv_excp_names[] =3D {
>> --
>> 2.22.0
>>
>>

