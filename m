Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703ACC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 03:49:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxJHL-0008UJ-Nf; Sun, 29 Oct 2023 23:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxJHF-0008MY-LX; Sun, 29 Oct 2023 23:49:22 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxJHE-0001vp-2K; Sun, 29 Oct 2023 23:49:21 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4a403fdebedso1517605e0c.1; 
 Sun, 29 Oct 2023 20:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698637757; x=1699242557; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+IznOnGDoyCFfZ4oxd+PR1eo6n6a2Lpv6pEMYhjxJE=;
 b=MLLtApYmJe+oYZY46nawoZkxzKWtHNt9DEHPDXFSn6+hAmNWYoQUlgF81O5RxXVafV
 fpOCAfue0AkP51I0oyrx8/RF+t98bXDpRENXweM6+mJCLXHQMV6H24eOPY5e6HvkI8Ey
 cNZnaesWR18dTsa+2BlF7zDbS63n+wVxLhv29P9plC/VDeBdVDiQ5AGtmClwJS/W3HLz
 itNacOFwKTHoD/XkBVAURykKlVYcoQbXFYgWLLcEQD4FlxjLWluXC630UZPlvtuy7RcK
 r927Nq063hlZrP8+2IZKAXy9QVbAmpYwXEFyWVQZ1zsHiTYpoHO8ZSBhNHjnyacg9R52
 Bxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698637757; x=1699242557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+IznOnGDoyCFfZ4oxd+PR1eo6n6a2Lpv6pEMYhjxJE=;
 b=fbagCONSOB5ZVFQSt+wNzaabN/FeE2XQJF80UdFR0bFGl9Bt2J2p4pzg6/jL2qM2po
 f2s4PzoLNcuH0LJPPdGe4lIN7YqIh36fmwkvR+Fz/BD6dYK3HEe8frVQ44bUQvJ/9sEF
 sQV4Chwe7624acAmQ4yygFBWr3LpRlrCwtUrDKVNzQeULR+xkFubPznLe9a9y7gXX+Yp
 D7+Ngv7iB93+1HQgTsL8Hlb9jUXzGd3Yb0+XxBXhS+wA21riWTwkiRJkuVs3NwUanWOs
 0aita1bsdWpNGo+SGxtF9Kj94pT7bCngweUG6QhLadUeutB06doBFd7v69mmiogRfJSj
 k/2A==
X-Gm-Message-State: AOJu0YyFGH87cJ7jTncrItn2t918YdRQ5ECz2NPDTqbip8RGlJ7TS+Dz
 EfcmYi68xRuuZXCTmP3V7Bv7s662LhtzP2tk7PY=
X-Google-Smtp-Source: AGHT+IFgsJ06qHV2Y5zd5qKGox645aIuL2Y7JQJzhG24d6Zh5Ne+4W2859BpOOAjolyn4lFl/eHcSU+cl2vkr1PtP9g=
X-Received: by 2002:a1f:2d56:0:b0:49d:c1f5:d491 with SMTP id
 t83-20020a1f2d56000000b0049dc1f5d491mr6497224vkt.15.1698637757608; Sun, 29
 Oct 2023 20:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-10-dbarboza@ventanamicro.com>
In-Reply-To: <20231028085427.707060-10-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 13:48:50 +1000
Message-ID: <CAKmqyKMZXPED2P=MTy1J_saz9jFQ3NF_=1+0JJhzXtZi0o2xYw@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] target/riscv/tcg: handle profile MISA bits
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Oct 28, 2023 at 7:35=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The profile support is handling multi-letter extensions only. Let's add
> support for MISA bits as well.
>
> We'll go through every known MISA bit. If the profile doesn't declare
> the bit as mandatory, ignore it. Otherwise, set the bit in env->misa_ext
> and env->misa_ext_mask.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 910360ce37..6ba27b824b 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -828,6 +828,19 @@ static void cpu_set_profile(Object *obj, Visitor *v,=
 const char *name,
>          return;
>      }
>
> +    for (i =3D 0; misa_bits[i] !=3D 0; i++) {
> +        uint32_t bit =3D misa_bits[i];
> +
> +        if  (!(profile->misa_ext & bit)) {
> +            continue;
> +        }
> +
> +        g_hash_table_insert(misa_ext_user_opts,
> +                            GUINT_TO_POINTER(bit),
> +                            (gpointer)value);
> +        riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
> +    }
> +
>      for (i =3D 0; profile->ext_offsets[i] !=3D RISCV_PROFILE_EXT_LIST_EN=
D; i++) {
>          ext_offset =3D profile->ext_offsets[i];
>
> --
> 2.41.0
>
>

