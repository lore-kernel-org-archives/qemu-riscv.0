Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWttq-0003rs-3W
	for mharc-qemu-riscv@gnu.org; Thu, 15 Apr 2021 00:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWtto-0003rF-HG; Thu, 15 Apr 2021 00:46:40 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:34491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWttm-0005HP-MT; Thu, 15 Apr 2021 00:46:40 -0400
Received: by mail-io1-xd34.google.com with SMTP id x16so22982986iob.1;
 Wed, 14 Apr 2021 21:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qo2JUiTAyB/1PBGaNf8Dz353eWmCwGm6YOC/9P+FTjM=;
 b=cN69jFnUCWmeVtxn1qN62g4YtP++snyOvLeSNvgyy6s0Q1rSFdLUnqbsQfHrHB/bXM
 B+iCFyZXETQfFnGGrM2B3Kh1+c2Leg0jNnMKVaArVEWkh1HP+TY8kNJxHRXJkjpRHIMy
 4XqRU6dAci2h6zSaHX2ZIceU1n2nsSoFBY3qC2/qovp5z0Vwx3JfzAYmlmYx+/ydcCcv
 FA7PIQrXLFMrOlcD+JFr0Jedtj7WuwZTT3CTPdbTcY3c7jHK5Ds7Vbpb0KtbaZDgOR4Q
 tC0UGu7XEXzZw4gS/DeItqkFf6342aD4QrYpUCeVcnuwmiqnN28ZodvpmDaclIfNl5eg
 nRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qo2JUiTAyB/1PBGaNf8Dz353eWmCwGm6YOC/9P+FTjM=;
 b=l2B6oQl86VhgMayT579tdv9ViOiO+6Ggztetz+IzZb4Zi5hJkN5/xT78Hs5XhGE7Jo
 XubqJXMdxcnywODWTRNhtY+WNT0wJTiQce6xqmUDSlpjf+ysxijP981pt5SmlK93itfz
 35/R2HQ2tHvJ6GwAFU2GhLtH0cIE1ud5otvGg1e/NzEflJI0c1O6oEkl3cEj6oMi6YIr
 30nQ6Ri6Hj1ppL/Ts3gG60me2Yse82ieKoAANB7LiUyrBA76fKXWLXiHx5zFHKmCnh/p
 48I0z/P8okuEL9El21uA8qx8tvtIgkQEC2H3/wHMojQgVU3EMk20tGuQCDV7uEl6FjIL
 /jgg==
X-Gm-Message-State: AOAM5310ET0EXPTwUiG3QJZWvgfstj7sXdya+qg2j34/l7hC0HwJiP3N
 BsiJX14sytp7Gsf8tKurdM6L5KDpRSwW0m1bHJU=
X-Google-Smtp-Source: ABdhPJxo7JLC0dSzHJBDiuaGJziYyU88vjpHgFPJg6L29WHNwOJVSV40VfqqyU66Wet85aoxzjEa6J+HJE+T5Ds3VTk=
X-Received: by 2002:a5d:878e:: with SMTP id f14mr1185227ion.176.1618461996781; 
 Wed, 14 Apr 2021 21:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <17b7c38a-f780-0216-3e3b-fd0d2178c004@c-sky.com>
In-Reply-To: <17b7c38a-f780-0216-3e3b-fd0d2178c004@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 14:46:10 +1000
Message-ID: <CAKmqyKM430xxwC+JyXBKwFiE4Y=1_mk4Qq3b3D+EKUszSneWRA@mail.gmail.com>
Subject: Re: [PATCH 00/38] target/riscv: support packed extension v0.9.2
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 15 Apr 2021 04:46:40 -0000

On Tue, Apr 13, 2021 at 1:28 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> ping +1.
>
> On 2021/2/12 =E4=B8=8B=E5=8D=8811:02, LIU Zhiwei wrote:
> > This patchset implements the packed extension for RISC-V on QEMU.
> >
> > This patchset have passed all my direct Linux user mode cases(RV64) and
> > bare metal cases(RV32) on X86-64 Ubuntu host machine. I will later push
> > these test cases to my repo(https://github.com/romanheros/qemu.git
> > branch:packed-upstream-v1).
> >
> > I have ported packed extension on RISU, but I didn't find a simulator o=
r
> > hardware to compare with. If anyone have one, please let me know.
> >
> > Features:
> >    * support specification packed extension v0.9.2(https://github.com/r=
iscv/riscv-p-spec/)
> >    * support basic packed extension.
> >    * support Zp64.
> >
> > LIU Zhiwei (38):
> >    target/riscv: implementation-defined constant parameters
> >    target/riscv: Hoist vector functions
> >    target/riscv: Fixup saturate subtract function

Thanks for the patches and sorry for the long delay.

I have applied patch 3 as it fixes a bug.

As for the other patches they are on both my review queue and Palmer's
review queue. It takes a lot of time to review these large patch
series, especially as I haven't been involved with the extension
development, so I have to both understand the extension and then
review the code.

If you would like to help speed things up you could review other
patches. That way I will have more time left to review your patches.

Alistair

> >    target/riscv: 16-bit Addition & Subtraction Instructions
> >    target/riscv: 8-bit Addition & Subtraction Instruction
> >    target/riscv: SIMD 16-bit Shift Instructions
> >    target/riscv: SIMD 8-bit Shift Instructions
> >    target/riscv: SIMD 16-bit Compare Instructions
> >    target/riscv: SIMD 8-bit Compare Instructions
> >    target/riscv: SIMD 16-bit Multiply Instructions
> >    target/riscv: SIMD 8-bit Multiply Instructions
> >    target/riscv: SIMD 16-bit Miscellaneous Instructions
> >    target/riscv: SIMD 8-bit Miscellaneous Instructions
> >    target/riscv: 8-bit Unpacking Instructions
> >    target/riscv: 16-bit Packing Instructions
> >    target/riscv: Signed MSW 32x32 Multiply and Add Instructions
> >    target/riscv: Signed MSW 32x16 Multiply and Add Instructions
> >    target/riscv: Signed 16-bit Multiply 32-bit Add/Subtract Instruction=
s
> >    target/riscv: Signed 16-bit Multiply 64-bit Add/Subtract Instruction=
s
> >    target/riscv: Partial-SIMD Miscellaneous Instructions
> >    target/riscv: 8-bit Multiply with 32-bit Add Instructions
> >    target/riscv: 64-bit Add/Subtract Instructions
> >    target/riscv: 32-bit Multiply 64-bit Add/Subtract Instructions
> >    target/riscv: Signed 16-bit Multiply with 64-bit Add/Subtract
> >      Instructions
> >    target/riscv: Non-SIMD Q15 saturation ALU Instructions
> >    target/riscv: Non-SIMD Q31 saturation ALU Instructions
> >    target/riscv: 32-bit Computation Instructions
> >    target/riscv: Non-SIMD Miscellaneous Instructions
> >    target/riscv: RV64 Only SIMD 32-bit Add/Subtract Instructions
> >    target/riscv: RV64 Only SIMD 32-bit Shift Instructions
> >    target/riscv: RV64 Only SIMD 32-bit Miscellaneous Instructions
> >    target/riscv: RV64 Only SIMD Q15 saturating Multiply Instructions
> >    target/riscv: RV64 Only 32-bit Multiply Instructions
> >    target/riscv: RV64 Only 32-bit Multiply & Add Instructions
> >    target/riscv: RV64 Only 32-bit Parallel Multiply & Add Instructions
> >    target/riscv: RV64 Only Non-SIMD 32-bit Shift Instructions
> >    target/riscv: RV64 Only 32-bit Packing Instructions
> >    target/riscv: configure and turn on packed extension from command li=
ne
> >
> >   target/riscv/cpu.c                      |   32 +
> >   target/riscv/cpu.h                      |    6 +
> >   target/riscv/helper.h                   |  332 ++
> >   target/riscv/insn32-64.decode           |   93 +-
> >   target/riscv/insn32.decode              |  285 ++
> >   target/riscv/insn_trans/trans_rvp.c.inc | 1224 +++++++
> >   target/riscv/internals.h                |   50 +
> >   target/riscv/meson.build                |    1 +
> >   target/riscv/packed_helper.c            | 3862 ++++++++++++++++++++++=
+
> >   target/riscv/translate.c                |    3 +
> >   target/riscv/vector_helper.c            |   90 +-
> >   11 files changed, 5912 insertions(+), 66 deletions(-)
> >   create mode 100644 target/riscv/insn_trans/trans_rvp.c.inc
> >   create mode 100644 target/riscv/packed_helper.c
> >

