Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DA6E6F084
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 19:24:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t6xF0-0007tR-Pf; Fri, 01 Nov 2024 15:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1t6xEz-0007t8-BN
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 15:23:25 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1t6xEx-0003Cz-88
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 15:23:25 -0400
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a4e5a7b026so8079665ab.3
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2024 12:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730489001; x=1731093801;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4l5/w9xruay6xyDjzJDQyNntrDGmfORLFmyBuWicy4=;
 b=TWyGZoHSz4NuJsJmrfsqsKYnNZuF9QeE8hAiHcK55on/0WwjO9yNsIs1rC2VxdxJSR
 pN/GBFr6bWEOts0DPtccvgl/o8YYQQrBu8Kl6I0rPYHn0wxQv8xcql04/7g+3pZQq1Gu
 +avzb3Bnwe0kiHSYuM8EXbzxo1S23HX9AkWH/3Jv0nE8bk2K1TVIge6quLVJotAd89g0
 9BlrIuVsPrGwi84nM/4Kkk0Py8yWvDtYBKsBK/s41Q79r7IPFFnOWbIkMZwgPQClq9TH
 Ikqp2V1ixr3jU6pdT8XnswMujbzLqZ1tiKPn5nrrdF8Y13R9d7zuRZ0zqtRDxxJ0409f
 axdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730489001; x=1731093801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4l5/w9xruay6xyDjzJDQyNntrDGmfORLFmyBuWicy4=;
 b=UXaiSeEPzBunMmpjFf63loGy+HAP6Hu11rbg7g3ZJrcgfTAPULVZSFR04Oqn8W2Jk3
 KaCWv9YBqQD0RqiukUYnn15PeUmuCl+V8Mw57IGYO3P4cog5Zlfj2zgC3GXkyUsKThwb
 9PlwKYjK0/R4SBFly+uFIiJLYvcnyMQ2RpykpvhRgEV5n8bFLl7aJZpTxlRKvLLrReuk
 zs/cqULF/HqKjqA0AaYO7BBMWDkr55XXP3/FRPds1+3256anMButUP3Khi1XzuFg1DUH
 mlaDkxBLoj2PAcvEoBhaotWdhDhpLOcv+kjxuHCokfFYFUg26xB/cheH1cPpBzG3rvyI
 Qo4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Qvp4Xe/Yz3grRwwwofnmTr0RwBEl//DOhlZEgL3wVNv8/g9aKtAHbPEB7m2r7AOpAGkPze1jd3aw@nongnu.org
X-Gm-Message-State: AOJu0YwWh2+ZRHzVugiQCVkTNb1t8Ux5jh2Nn9WCviQK+JOg2Fj/OwG7
 Mcd2PR19P+H4mTq7EI6fkKTMuUFOBkGSD0qQRdSIbnuBg9fiI8wewmIfHlIh5nONIAzgSo/tVCn
 T6TPNoRJHgKyVmUzkVg5wrL2HJqbJpD0ZahcOoQ==
X-Google-Smtp-Source: AGHT+IEusD1gY9zRh75mUIBlR2ZdLia9dlg6q+P3Sk+lXkvxhsjboo2P8vzNiho9BZMX0vlix2pWbkWs2FgS/QMTmPA=
X-Received: by 2002:a92:c26b:0:b0:3a4:ecdb:d615 with SMTP id
 e9e14a558f8ab-3a60f1fd51amr86738265ab.8.1730488999721; Fri, 01 Nov 2024
 12:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241101170833.1074954-1-pierrick.bouvier@linaro.org>
 <2e1af830-a90a-447f-ab47-1c3d49463134@ventanamicro.com>
 <CAFEAcA92CuvGUJQk5LFE1X3a8dH21ksE_QXETjVPnU3v1bVSzw@mail.gmail.com>
 <fd9ee34a-24e1-43fb-950b-aba585473085@ventanamicro.com>
 <CAFEAcA_SYAC_UsEs+xy7aZEHsA1bC0umnsAF5ZmtjmZKEVSA+Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_SYAC_UsEs+xy7aZEHsA1bC0umnsAF5ZmtjmZKEVSA+Q@mail.gmail.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Fri, 1 Nov 2024 12:23:08 -0700
Message-ID: <CAH2o1u4ZAkH-bWN8SRkNj8-n9i3NtJpodopUpQyE=pwO5mKkDw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: fix build error with clang
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
 Cleber Rosa <crosa@redhat.com>, qemu-riscv@nongnu.org, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=tjeznach@rivosinc.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Nov 1, 2024 at 11:49=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Fri, 1 Nov 2024 at 18:13, Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > (Ccing Tomasz)
> >
> > On 11/1/24 2:48 PM, Peter Maydell wrote:
> > > On Fri, 1 Nov 2024 at 17:36, Daniel Henrique Barboza
> > > <dbarboza@ventanamicro.com> wrote:
> > >>
> > >>
> > >>
> > >> On 11/1/24 2:08 PM, Pierrick Bouvier wrote:
> > >>> Introduced in 0c54ac, "hw/riscv: add RISC-V IOMMU base emulation"
> > >>>
> > >>> ../hw/riscv/riscv-iommu.c:187:17: error: redefinition of '_pext_u64=
'
> > >>>
> > >>>     187 | static uint64_t _pext_u64(uint64_t val, uint64_t ext)
> > >>>
> > >>>         |                 ^
> > >>>
> > >>> D:/a/_temp/msys64/clang64/lib/clang/18/include/bmi2intrin.h:217:1: =
note: previous definition is here
> > >>>
> > >>>     217 | _pext_u64(unsigned long long __X, unsigned long long __Y)
> > >>>
> > >>>         | ^
> > >>>
> > >>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > >>> ---
> > >>>    hw/riscv/riscv-iommu.c | 4 ++--
> > >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> > >>> index feb650549ac..f738570bac2 100644
> > >>> --- a/hw/riscv/riscv-iommu.c
> > >>> +++ b/hw/riscv/riscv-iommu.c
> > >>> @@ -184,7 +184,7 @@ static void riscv_iommu_pri(RISCVIOMMUState *s,
> > >>>    }
> > >>>
> > >>>    /* Portable implementation of pext_u64, bit-mask extraction. */
> > >>> -static uint64_t _pext_u64(uint64_t val, uint64_t ext)
> > >>> +static uint64_t pext_u64(uint64_t val, uint64_t ext)
> > >>
> > >> I suggest name it 'riscv_iommu_pext_u64' to be clear that this is a =
local scope function,
> > >> not to be mistaken with anything available in clang or any other com=
piler.
> > >
> > > More generally, we should avoid using leading '_' in QEMU function
> > > names; those are reserved for the system.
> > >
> > > Also, what does this function do? The comment assumes that
> > > the reader knows what a "pext_u64" function does, but if you
> > > don't then it's fairly inscrutable bit-twiddling.
> > > "bit-mask extraction" suggests maybe we should be using
> > > the bitops.h extract functions instead ?
> >
> > This is the function:
> >
> >
> > /* Portable implementation of pext_u64, bit-mask extraction. */
> > static uint64_t _pext_u64(uint64_t val, uint64_t ext)
> > {
> >      uint64_t ret =3D 0;
> >      uint64_t rot =3D 1;
> >
> >      while (ext) {
> >          if (ext & 1) {
> >              if (val & 1) {
> >                  ret |=3D rot;
> >              }
> >              rot <<=3D 1;
> >          }
> >          val >>=3D 1;
> >          ext >>=3D 1;
> >      }
> >
> >      return ret;
> > }
>
> Yes, but what does it actually *do* ? :-)  Presumably
> it extracts some subpart of 'val' based on 'ext', but
> what is the format it expects 'ext' to be in, and what
> kinds of input are valid?
>
> For comparison, our extract64 function says:
>
>  * extract64:
>  * @value: the value to extract the bit field from
>  * @start: the lowest bit in the bit field (numbered from 0)
>  * @length: the length of the bit field
>  *
>  * Extract from the 64 bit input @value the bit field specified by the
>  * @start and @length parameters, and return it. The bit field must
>  * lie entirely within the 64 bit word. It is valid to request that
>  * all 64 bits are returned (ie @length 64 and @start 0).
>
> so even if you haven't come across it before you can see
> what the function is intended to do, what inputs are valid
> and what are not, and so on, and you don't need to try to
> reverse-engineer those from the bit operations.
>
> I'm not necessarily opposed to having separate implementations
> of these things if it means the code follows the architectural
> specifications more closely, but if we do have them can
> we have documentation comments that describe the behaviour?
>

Hey,

Thank you for the fix. Using a common name and underscore was not a good id=
ea ;)
The function is an implementation of the bit extraction function as
documented in RISC-V IOMMU Spec [1], section '2.3.3. Process to
translate addresses of MSIs'.

It is also known as PEXT instruction in x86/AVX2 architecture, for
non-contiguous bits extraction, that's why I've used this name, as it
might be more familiar to the readers, and to avoid confusion with
existing extract64() function in bitops.h.


[1] link: https://github.com/riscv-non-isa/riscv-iommu/releases/tag/v1.0.0

Hope this helps,
- Tomasz

> thanks
> -- PMM

