Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkERp-0003jp-4p
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 21:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkERn-0003jH-KC; Wed, 05 Apr 2023 21:29:55 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkERl-000325-Vc; Wed, 05 Apr 2023 21:29:55 -0400
Received: by mail-ua1-x932.google.com with SMTP id 89so26963458uao.0;
 Wed, 05 Apr 2023 18:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680744592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OgbbLdVf3SzBuzLEidz0n0NCPSSPThfHJ90CSkpfeLM=;
 b=CiCYw0gC+/wVeETQskTVM1JsYQi3JN+pI05Ezs39iLYBMNNEvE9Nys0nNfHnlgSdk0
 8U2wdsTECL1eULdLI1vRDPxeOsGqiMH+a0Xh7EK2I6jwGvnsPrkUGgdWPiHX3fp41rTA
 3GKolnNLf8mEiZm+qHQF/KcktnEbMej/zUFKSJ95vhyNJPCK5mVtTLzNhoxGorrzXI7u
 z5GBZ6NpVinRd6mZOE0NwOy/FnwEHZUGP6v27u3s9ltmKitl9VD11s8o66NZP9cLpQB6
 UsoVkem0eIXuCzjpa1KEtJpPKWQ/R3tf1AFPjSQNklSWfEWfjdE2MDiJaUUvgIg2iS7j
 AgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680744592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OgbbLdVf3SzBuzLEidz0n0NCPSSPThfHJ90CSkpfeLM=;
 b=jc0HClJYTt2b0DBNsAUO99lHfhsbkv1C86buAAiVYpyUbo5UU/JQ0keeqfhPF7BLMM
 ZamJ7JIhbqIqHwdGkRUhZmcMAO0rEeSKfneSUlMpSexnK0i66nUBvWC5IKtbrH9+tGf0
 /EwVVcCFjxKgUb7UET+srkd4779OhWpG72G9lj1SXE5hMyZ4+x5evWkMUT9oWqivohUZ
 5y2+U9bFoWQkNdmN3a2an5KQJizBeyZnpAGuVBeZOINLg4//B5KCutMg6dpNDN5sqEkJ
 nUwXE8MyeOmcHre78DkITuFF0r4z40bLJ512I0c0kWazVzDUjxeOrZnOWEXAsUKWNMh8
 N6gg==
X-Gm-Message-State: AAQBX9dckACfsGYK+m102OLqCTZwIiL5/dFaERmVLTtWxg4x/34pGKJB
 wxW0iSUy8va7BUQMlHNimQ3/G3Eh98Ir1j69K28=
X-Google-Smtp-Source: AKy350b300b69ybmXMVbBjLnz8ZsMZg19DMI0yaC6elxE4QyiyFkwpP/30G3Estc9AFo26W9K5h2Gz4o3FkicnO4+3k=
X-Received: by 2002:a1f:b2ca:0:b0:406:6b94:c4fe with SMTP id
 b193-20020a1fb2ca000000b004066b94c4femr6138523vkf.0.1680744592429; Wed, 05
 Apr 2023 18:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230405095720.75848-1-liweiwei@iscas.ac.cn>
 <20230405095720.75848-2-liweiwei@iscas.ac.cn>
 <CAKmqyKNCUY_AeUjUh=jbZ7aCJcS5TG7xgMpvUx7rQUuGZkv1qg@mail.gmail.com>
 <ef5fd175-a5fb-5731-a102-18787331596b@iscas.ac.cn>
In-Reply-To: <ef5fd175-a5fb-5731-a102-18787331596b@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 11:29:26 +1000
Message-ID: <CAKmqyKPVT5qch1cMp6fqF0BPnLwGgvqDYO4Cj_doC=vUYNZ1HQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] hw/riscv: Add signature dump function for spike to
 run ACT tests
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 01:29:55 -0000

On Thu, Apr 6, 2023 at 11:02=E2=80=AFAM liweiwei <liweiwei@iscas.ac.cn> wro=
te:
>
>
> On 2023/4/6 08:36, Alistair Francis wrote:
> > On Wed, Apr 5, 2023 at 7:58=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn>=
 wrote:
> >> Add signature and signature-granularity properties in spike to specify=
 the target
> >> signatrue file and the line size for signature data.
> >>
> >> Recgonize the signature section between begin_signature and end_signat=
ure symbols
> >> when loading elf of ACT tests. Then dump signature data in signature s=
ection just
> >> before the ACT tests exit.
> >>
> >> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> >> ---
> >>   hw/char/riscv_htif.c         | 44 ++++++++++++++++++++++++++++++++++=
+-
> >>   hw/riscv/spike.c             | 13 +++++++++++
> >>   include/hw/char/riscv_htif.h |  3 +++
> >>   3 files changed, 59 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> >> index 098de50e35..37d3ccc76b 100644
> >> --- a/hw/char/riscv_htif.c
> >> +++ b/hw/char/riscv_htif.c
> >> @@ -29,6 +29,8 @@
> >>   #include "chardev/char-fe.h"
> >>   #include "qemu/timer.h"
> >>   #include "qemu/error-report.h"
> >> +#include "exec/address-spaces.h"
> >> +#include "sysemu/dma.h"
> >>
> >>   #define RISCV_DEBUG_HTIF 0
> >>   #define HTIF_DEBUG(fmt, ...)                                        =
           \
> >> @@ -51,7 +53,10 @@
> >>   /* PK system call number */
> >>   #define PK_SYS_WRITE            64
> >>
> >> -static uint64_t fromhost_addr, tohost_addr;
> >> +const char *sig_file;
> >> +uint8_t line_size =3D 16;
> >> +
> >> +static uint64_t fromhost_addr, tohost_addr, begin_sig_addr, end_sig_a=
ddr;
> >>
> >>   void htif_symbol_callback(const char *st_name, int st_info, uint64_t=
 st_value,
> >>                             uint64_t st_size)
> >> @@ -68,6 +73,10 @@ void htif_symbol_callback(const char *st_name, int =
st_info, uint64_t st_value,
> >>               error_report("HTIF tohost must be 8 bytes");
> >>               exit(1);
> >>           }
> >> +    } else if (strcmp("begin_signature", st_name) =3D=3D 0) {
> >> +        begin_sig_addr =3D st_value;
> >> +    } else if (strcmp("end_signature", st_name) =3D=3D 0) {
> >> +        end_sig_addr =3D st_value;
> >>       }
> >>   }
> >>
> >> @@ -163,6 +172,39 @@ static void htif_handle_tohost_write(HTIFState *s=
, uint64_t val_written)
> >>               if (payload & 0x1) {
> >>                   /* exit code */
> >>                   int exit_code =3D payload >> 1;
> >> +
> >> +                /*
> >> +                 * Dump signature data if sig_file is specified and
> >> +                 * begin/end_signature symbols exist.
> >> +                 */
> >> +                if (sig_file && begin_sig_addr && end_sig_addr) {
> > There is no guarantee that these are initalised to zero, so this isn't
> > really checking anything is it?
>
> I think the static global variable will be  initialized to zero by defaul=
t.

Ah, yes you are right. static variables are initalised to zero as per
the C99 standard.

In which case:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> If not,  fromhost_addr and tohost_addr may have the same problem.
>
> Regards,
>
> Weiwei Li
>
> >

