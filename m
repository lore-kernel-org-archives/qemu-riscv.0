Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C9EE14A9
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 03:07:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe5Lx-0003HO-IN; Wed, 06 Sep 2023 23:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5Lu-0003Gl-O6; Wed, 06 Sep 2023 23:06:43 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5Lr-00074a-8n; Wed, 06 Sep 2023 23:06:42 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-501bd7711e8so756705e87.1; 
 Wed, 06 Sep 2023 20:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694055997; x=1694660797; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2hLNecNqI67WEy27RvsyEVYeOLlfaknTaehm/QrlaA=;
 b=gUaN4LT4wJddFQjD/T9orzIv3ZiwJkrjsR3xN9ky+V9L/yUD10oV/WffXtn7aWjDEZ
 cspqkmXxdhRE30Ra9wygF9neVTpga1CzHUSQgHe2DvnhHNBrh50QQgAQ9hL+cr4nuGJm
 HI6bAo/bCMRHneHtrefRWUj3E6hPYITiCmHc3atqTwOm31ECk5AsPkkyB2/xqtOL/UnR
 eeHk6bZwFBvyefVZ0mgPzAMYHMe6exs5G1nh5xeqQ2fK67aEZ23tvA3rrB2pljqGaqji
 cq2TJZaIbqfhlcja9E3/myZ0CH/9txfDBply76Xle/dca3kM45V9XnHURJdsytYdhybu
 GFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694055997; x=1694660797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2hLNecNqI67WEy27RvsyEVYeOLlfaknTaehm/QrlaA=;
 b=FjG9rdyweKAwE5ZtD9A3jT2lvgVK1aj1h7NHjcNaaxMDEKF/m6owVSxZe8215lTbFQ
 VPkY+79OVUx3vLucGGEulHFlMJvfp95P7dN+2xA1IpgaNgx7G31LkgGfMaeA0etuiANj
 uKw04UYSM9clTCPi7gifFX2QBC887Se2Z/UFZ2fngd2FxfLoMJcEnEKrRF46wU3bV5i0
 NIambN9X8gC4P6LBFQQljflQXdML/mzQNUNpKKdHEbmicMduel+GtaCbyOAyYBDYiFF3
 li604llI1n4pokFqZ1PsFp4/1Ng8B5tWi95a5NfeiOb/+yQLnRDWxX61vLDYOug/2PHC
 dgbg==
X-Gm-Message-State: AOJu0YzdemklhtfsTNLvfUvhH0Kl1kdMGAiaCz2EgFFAv4QUP7H/hZkJ
 ZnPywTauaMPkFyrUjD5UKg1SQtOLLsTLVcxYdtI=
X-Google-Smtp-Source: AGHT+IGHTh1XOW9xl3qrCetmWZ7kh2PoAdW7xHncVboBGrGEd3BQ5c7Z/85wcW7kBNX8Bvy46dVNOMV8NMeYFc0xYyg=
X-Received: by 2002:ac2:5f6a:0:b0:501:bbbb:de1e with SMTP id
 c10-20020ac25f6a000000b00501bbbbde1emr3411145lfc.6.1694055996479; Wed, 06 Sep
 2023 20:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230808090914.17634-1-nikita.shubin@maquefel.me>
In-Reply-To: <20230808090914.17634-1-nikita.shubin@maquefel.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 13:06:01 +1000
Message-ID: <CAKmqyKMLW5DJ8PJDiCZcV2PEXfpK2UCrbyOKYT1JHv_d4bOETg@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: don't read CSR in riscv_csrrw_do64
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-lf1-x130.google.com
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

On Tue, Aug 8, 2023 at 7:10=E2=80=AFPM Nikita Shubin <nikita.shubin@maquefe=
l.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> As per ISA:
>
> "For CSRRWI, if rd=3Dx0, then the instruction shall not read the CSR and
> shall not cause any of the side effects that might occur on a CSR read."
>
> trans_csrrwi() and trans_csrrw() call do_csrw() if rd=3Dx0, do_csrw() cal=
ls
> riscv_csrrw_do64(), via helper_csrw() passing NULL as *ret_value.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changelog v2:
> - fixed uninitialized old_value
>
> Changelog v3:
> - reword comment and commit message as Deniel suggested
>
> ---
>  target/riscv/csr.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..c5564d6d53 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3908,21 +3908,27 @@ static RISCVException riscv_csrrw_do64(CPURISCVSt=
ate *env, int csrno,
>                                         target_ulong write_mask)
>  {
>      RISCVException ret;
> -    target_ulong old_value;
> +    target_ulong old_value =3D 0;
>
>      /* execute combined read/write operation if it exists */
>      if (csr_ops[csrno].op) {
>          return csr_ops[csrno].op(env, csrno, ret_value, new_value, write=
_mask);
>      }
>
> -    /* if no accessor exists then return failure */
> -    if (!csr_ops[csrno].read) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -    /* read old value */
> -    ret =3D csr_ops[csrno].read(env, csrno, &old_value);
> -    if (ret !=3D RISCV_EXCP_NONE) {
> -        return ret;
> +    /*
> +     * ret_value =3D=3D NULL means that rd=3Dx0 and we're coming from he=
lper_csrw()
> +     * and we can't throw side effects caused by CSR reads.
> +     */
> +    if (ret_value) {
> +        /* if no accessor exists then return failure */
> +        if (!csr_ops[csrno].read) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +        /* read old value */
> +        ret =3D csr_ops[csrno].read(env, csrno, &old_value);
> +        if (ret !=3D RISCV_EXCP_NONE) {
> +            return ret;
> +        }
>      }
>
>      /* write value if writable and write mask set, otherwise drop writes=
 */
> --
> 2.39.2
>
>

