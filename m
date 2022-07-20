Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oE2Hv-0001tU-Cx
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 01:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oE2Ht-0001t3-Ko; Wed, 20 Jul 2022 01:30:21 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oE2Hs-0000gM-3A; Wed, 20 Jul 2022 01:30:21 -0400
Received: by mail-pg1-x535.google.com with SMTP id s206so15445673pgs.3;
 Tue, 19 Jul 2022 22:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eypITnaFFvCA82xDJLc77wL7Nk89KerGmG4aC3K+0iY=;
 b=QRbIIahIbiyqsTp+EEPtyZMgyfy1ImCsObQHHBd2jgvjFvJu7CzL9Q5ZA5jsQONFMB
 J2iG3aqMbNAwS3ksqo0gkO+uIrBDXWmEu80bBeyMAL/yVJ95gAAfcd1MDQjC13tAE2UC
 gIz3/A/lhSbB9GeRq17YPYdORhV/1zp1EKGbfTIWsnfB8DOPzChfqxn1ShvLQYrDGTb0
 gvJN9OvuiNFDzcaR1BVBUq3D16WVvH5iOcmMcdyPhxuIyKYpOYcpa/AwJ6zmiLsclmPQ
 mFBRDDoke3PWC8hN22OsqYuYDbOHfPl6AeRmmG4fmdFeUTSL405z1uO+ywHrK7zCQFIG
 Yxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eypITnaFFvCA82xDJLc77wL7Nk89KerGmG4aC3K+0iY=;
 b=1qvKWp6nYPivaPwQlAyjPN+0J5J6uMbKmBr2GUv8qjy7xkEcOqpeehH84OpiIQY10d
 +V4/mmYM89Ne/VwyDWlK28pAFQa98Rn43+yj6x9THv+dcewrDFAb2UVE2Cas13EHr9pw
 F25cwggT333Jovphb2UZGLZiW2KR+iPEb9D90Wx52cqbFNUgLk9gLDCGkltJFHmLETp8
 /0puCVsrypLhFkXGeDz3C6rLOGpMBsbKlqwLt9w50FpBT3OJHha4hUA/p6ayk6Go9zgg
 sSmeNe37Ima64obvn2XH5zzkZtTNr43UAfJRqET4UB21rduM0e+0tdKQO2nxlBKgh3oj
 ZJ2g==
X-Gm-Message-State: AJIora9SVsIlUs/IlYFN2sdzq4RK4u7PtFRXBUtgME/gOs9xIZTvvaki
 gBwPR2IKFxqXyS5l9dPuORefgQTQNEh27nnaOzA=
X-Google-Smtp-Source: AGRyM1vzZoYIk34QRV9jZuh/HQa4H6j465/f1pJAoji+4V7rjbKb5J+Hm6Tvmk6qIcQu0fxVgMXSl1J+O1GJB9fz/P4=
X-Received: by 2002:a05:6a00:885:b0:510:950f:f787 with SMTP id
 q5-20020a056a00088500b00510950ff787mr36596866pfj.83.1658295017846; Tue, 19
 Jul 2022 22:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220718035249.17440-1-jim.shu@sifive.com>
 <CAAhSdy0XUp1KGvmiPhG0eaTk1bnzwVGrW83jDXSLsrzK_NtXDw@mail.gmail.com>
 <CALw707qqVxROpindXhxPjAvccjTYaYoC_vTjtfkM+Do_pMLQRA@mail.gmail.com>
 <CAAhSdy2dm5p8wb4YSppS=yT8L4ctZc9J9mT=-jPdLe5p=VR6=A@mail.gmail.com>
In-Reply-To: <CAAhSdy2dm5p8wb4YSppS=yT8L4ctZc9J9mT=-jPdLe5p=VR6=A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Jul 2022 15:29:51 +1000
Message-ID: <CAKmqyKNxOpyHxcf3JJdX+XJPYfwCVjKc87xTZ+w1qzJFr5OfKA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support SW update of PTE A/D bits and
 Ssptwad extension
To: Anup Patel <anup@brainfault.org>
Cc: Jim Shu <jim.shu@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Wed, 20 Jul 2022 05:30:22 -0000

On Wed, Jul 20, 2022 at 1:52 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Jul 20, 2022 at 5:02 AM Jim Shu <jim.shu@sifive.com> wrote:
> >
> > Hi Anup,
> >
> > Do you think it is OK if we only use ssptwad as a CPU option name
> > but not a RISC-V extension? just like MMU and PMP options of RISC-V.
> > (And we could change it to RISC-V extension in the future
> > if Ssptwad becomes the formal RISC-V extension)
> >
> > Both HW/SW update schemes are already defined in RISC-V priv spec,
> > so I think it's reasonable to implement them in QEMU. The only issue here is
> > to choose a proper CPU option name to turn on/off HW update of A/D bits.
>
> I am not saying that we should avoid implementing it in QEMU.
>
> My suggestion is to differentiate HW optionalities from ISA extensions
> in QEMU. For example, instead of referring to this as Ssptwad, we should
> call it "hw_ptwad" or "opt_ptwad" and don't use the "ext_" prefix.
>
> @Alistair Francis might have better suggestions on this ?

I'm just trying to wrap my head around this.

So the priv spec has this line:

"Two schemes to manage the A and D bits are permitted"

The first scheme just raises a page-fault exception, the second scheme
updates the A/D bits as you would expect.

The profiles spec then states that you must do the second scheme, as
that is what all software expects.

This patch is adding optional support for the first scheme.

Why do we want to support that? We can do either and we are
implementing the much more usual scheme. I don't see a reason to
bother implementing the other one. Is anyone ever going to use it?

Alistair

