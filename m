Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppVpN-0003WU-Oo
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 11:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1ppVp7-00036G-2d
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 11:03:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1ppVp5-0004wE-DD
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 11:03:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so652686f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Apr 2023 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682003025; x=1684595025; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rHD9yU2TDrQYwvqwCc3qRe/B5CL4utebJOWgZ88mIeM=;
 b=dqQYeKUphTG8VtpVCT706vCpYJswhGVqWnqBGsy72PCJhszxE4xE/bHaLCvKa848O0
 WmEU5P9fNRKX91Q2JxWatK6k7yXj4XLANANPdqoyEKKtov/eZ5FyVRjiDpHIe7tS/StT
 6CSMzIFWgVkHhXo/6D+HdMXw6mlJ3ihc4PYOX+oT7XL3sUuKdeytG/qZcIFDCKlOVXZt
 2h/oEf9AEhaPgn6bEaidRQMilR3G0X5HDN0Kl8TlX06MbVFaFqKlK2QTxGXSXjnCORQA
 f56MptmHmw9bNRs2TW6s1wUuBdkj01t8/HVseGGsPi0HFD3eFthEdOxQGZmb8TNlOJRs
 y3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682003025; x=1684595025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rHD9yU2TDrQYwvqwCc3qRe/B5CL4utebJOWgZ88mIeM=;
 b=ZQetQmQYSPrTDEnnaMPFu642XbQrc3mRGQ2KFiFti52pO+5CK/u9pC20+neeils9k3
 iB2Ljr1g7PS3V8cUn8CfLa1jWJqoiyqLFjPMOVuqgEJyN+TfljchRWSq7d5Wk1i7jWZg
 lW0oTqQdMEjWvK0ejx/TIMC72NxkPVJlY3kXYaHM5mcBaeaRvu7qYtoqL3AbBSLhCC+t
 soQVWK1b/ewGpe5aePx/D4VU4Zpe7ks/1qKhSx0AloQrRR4xxA0ZggcFNHczI08v8fGT
 dQaAH0IhTKLfo3dYNiaPdXINXrBCRqcdMF3hw2QTfj4ty/aTNTaWcYUrbkzQT0jK67Zq
 xLhA==
X-Gm-Message-State: AAQBX9c9+zqlPkpuUnYrlUq+WZUiI6A5zk1L06NBea/2ZD2Obu64616Q
 3YUr/84VOpiMDkiMZhnUMMEAr7UQHsMh3xQdANEOmD6NoWW5dfNv
X-Google-Smtp-Source: AKy350Y1Jda4D4n4YzIFnJX2Jxj7/R75oFS9F2yiHc8H/6DOG7/b+mHvG4+L2XLFGMJrqRewGvR50hB5f8p6Seyx9OE=
X-Received: by 2002:adf:e2c6:0:b0:2f3:f696:ea0e with SMTP id
 d6-20020adfe2c6000000b002f3f696ea0emr1483846wrj.69.1682003024901; Thu, 20 Apr
 2023 08:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230419104756.71455-1-alexghiti@rivosinc.com>
 <CAKmqyKOXpbnBwwBa54U2XXhzYQTxJxYqFJgsDhH1LnV-MsUoTw@mail.gmail.com>
In-Reply-To: <CAKmqyKOXpbnBwwBa54U2XXhzYQTxJxYqFJgsDhH1LnV-MsUoTw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 20 Apr 2023 17:03:33 +0200
Message-ID: <CAHVXubg-67oMwOd3GM6YDrLRJ_KcGPdP8e_587CJdm8WXvdC-A@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Make sure an exception is raised if a pte is
 malformed
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrea Parri <andrea@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 20 Apr 2023 15:03:56 -0000

On Thu, Apr 20, 2023 at 1:31=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Wed, Apr 19, 2023 at 8:48=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosi=
nc.com> wrote:
> >
> > As per the privileged specification, in 64-bit, if any of the pte reser=
ved
> > bits 60-54 is set an exception should be triggered, and the same applie=
s to
> > napot/pbmt bits if those extensions are not enabled
> > (see 4.4.1, "Addressing and Memory Protection").
> >
> > Reported-by: Andrea Parri <andrea@rivosinc.com>
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Thanks for the patch
>
> Do you mind sending a v3 rebased on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next ?

Sure, I have just sent the v3.

Thanks for your quick review!

Alex

>
> Alistair
>
> > ---
> >  target/riscv/cpu_bits.h   |  1 +
> >  target/riscv/cpu_helper.c | 15 +++++++++++----
> >  2 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index fca7ef0cef..8d9ba2ce11 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -640,6 +640,7 @@ typedef enum {
> >  #define PTE_SOFT            0x300 /* Reserved for Software */
> >  #define PTE_PBMT            0x6000000000000000ULL /* Page-based memory=
 types */
> >  #define PTE_N               0x8000000000000000ULL /* NAPOT translation=
 */
> > +#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
> >  #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits =
*/
> >
> >  /* Page table PPN shift amount */
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index f88c503cf4..8dc832d1bb 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -946,13 +946,20 @@ restart:
> >
> >          if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
> >              ppn =3D pte >> PTE_PPN_SHIFT;
> > -        } else if (pbmte || cpu->cfg.ext_svnapot) {
> > -            ppn =3D (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIF=
T;
> >          } else {
> > -            ppn =3D pte >> PTE_PPN_SHIFT;
> > -            if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) =
{
> > +            if (pte & PTE_RESERVED) {
> > +                return TRANSLATE_FAIL;
> > +            }
> > +
> > +            if (!pbmte && (pte & PTE_PBMT)) {
> >                  return TRANSLATE_FAIL;
> >              }
> > +
> > +            if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
> > +                return TRANSLATE_FAIL;
> > +            }
> > +
> > +            ppn =3D (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIF=
T;
> >          }
> >
> >          if (!(pte & PTE_V)) {
> > --
> > 2.37.2
> >
> >

