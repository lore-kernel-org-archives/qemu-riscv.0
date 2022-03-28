Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYdvT-0007fC-H6
	for mharc-qemu-riscv@gnu.org; Sun, 27 Mar 2022 21:12:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYdvS-0007d6-9T; Sun, 27 Mar 2022 21:12:06 -0400
Received: from [2607:f8b0:4864:20::131] (port=39532
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYdvQ-0000A4-MJ; Sun, 27 Mar 2022 21:12:05 -0400
Received: by mail-il1-x131.google.com with SMTP id y7so8939609ilv.6;
 Sun, 27 Mar 2022 18:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t9AcWXjhSPpsT02mESZyal9fBmFb/BrqYUmgJrCxeP0=;
 b=BZfwdmM5jqIkT332B/tHo0OgC6Iun4FkC21GULKRphThvn5WBI33Qq0sOk0p6NrMvP
 RtXPfbIuL7b3eYZftFRTI1P4PNEH7h0jTi38sBSpYuKmRCaEBW41hBcr5wkUME5KBdas
 8wHiD/KrMJ+G+rDxqL10dF9JHHu5H/uGJTbcqVhz3/jXWQf6AFrqagdypVIVwtUDAvsy
 VUqtTzcCJ0pWcsBiR/Lst02Eq1bRoV416GJf/MtaEiXX7etouKvhNpG9/SarszkSSfV3
 7DGH5xVTSve5XybyxPRUucH3j+wLEpA8XScDpakekC/bmKVCFk4HQyOrmLQFpthn987A
 eSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9AcWXjhSPpsT02mESZyal9fBmFb/BrqYUmgJrCxeP0=;
 b=pI0k9vZd4ZZ9iqqlZEdeC0IhdDbBUDnKFTjfNqYrqnUZbAvRP38wQhaZonhltkVEzp
 qmInCCyV4uQqNbOly707x22kJQ7KvK4Cf0AyKfa2qKjZzRJV7q55YeHwEdQmLUYySjwK
 H/dhttdZ3wwQE6CGFNolmgmos1L0ZeGrn/Oi2nl14t4UKQenrHyHt3X1xdPFBWCsSFad
 jTEfRIYM2wraz1V+XUhw2TAIfuig2Kgvhsf8Y8H9TNEzQ7ZuRc/7iX+s7206cmKjB7lP
 LHz0Se4aUZ9HL1bs2HWlKG1YnQdv33g8hprGk+j3qZJ6ZCUt1xDSvp93UD/ZuHi4U1R/
 fhKg==
X-Gm-Message-State: AOAM530cU2kTRSZ/dhYIeS65CazVDdH87l82Yc1edwnTu9hLBaEpFHpP
 euX+U1zw53S24u5qq/EAptm66wOgt82X42Q9k0VviJFApxA=
X-Google-Smtp-Source: ABdhPJw9ERadzj5OZ0n6GpUNHq6OmvigeLIkAKn26s81czwjNVg//5lsJj3uS32Y8FTKDXePVsnX/iip7XWqHJSFeMY=
X-Received: by 2002:a05:6e02:20ec:b0:2c6:158a:cb33 with SMTP id
 q12-20020a056e0220ec00b002c6158acb33mr4603427ilv.113.1648429923214; Sun, 27
 Mar 2022 18:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Mar 2022 11:11:37 +1000
Message-ID: <CAKmqyKPv=G6o1hBqcUJ=guCaoROt6Bx60jXPEqknEHxm0wuj6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: optimize condition assign for scale < 0
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Mar 2022 01:12:06 -0000

On Fri, Mar 25, 2022 at 7:03 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> for some cases, scale is always equal or less than 0, since lmul is not larger than 3
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 4ea7e41e1a..2878ca3132 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1198,7 +1198,7 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
>  static inline uint32_t MAXSZ(DisasContext *s)
>  {
>      int scale = s->lmul - 3;
> -    return scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
> +    return s->cfg_ptr->vlen >> -scale;
>  }
>
>  static bool opivv_check(DisasContext *s, arg_rmrr *a)
> @@ -3597,8 +3597,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
>
>      if (a->vm && s->vl_eq_vlmax) {
>          int scale = s->lmul - (s->sew + 3);
> -        int vlmax = scale < 0 ?
> -                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
> +        int vlmax = s->cfg_ptr->vlen >> -scale;
>          TCGv_i64 dest = tcg_temp_new_i64();
>
>          if (a->rs1 == 0) {
> @@ -3630,8 +3629,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
>
>      if (a->vm && s->vl_eq_vlmax) {
>          int scale = s->lmul - (s->sew + 3);
> -        int vlmax = scale < 0 ?
> -                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
> +        int vlmax = s->cfg_ptr->vlen >> -scale;
>          if (a->rs1 >= vlmax) {
>              tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
>                                   MAXSZ(s), MAXSZ(s), 0);
> --
> 2.17.1
>
>

