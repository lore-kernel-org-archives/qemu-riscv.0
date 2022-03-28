Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYgZn-0003Eh-2A
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 00:01:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYgZk-0003Cq-3z; Mon, 28 Mar 2022 00:01:52 -0400
Received: from [2607:f8b0:4864:20::133] (port=39449
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYgZh-0000nq-Nc; Mon, 28 Mar 2022 00:01:51 -0400
Received: by mail-il1-x133.google.com with SMTP id u13so153956ilv.6;
 Sun, 27 Mar 2022 21:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIW2dAsRKyeCJsq5Pr7CvMYcbQr/4xRhjkV2ZW0Qwfw=;
 b=Hz6INFrYyG28SBK+B4XzHY0zPzOcrXNNG7qm7z1AiGMVfLT459s2Da7ofEl8nXp+sF
 6nKGj36sdsT5nSaGgQ0BNG07QxrPn19eInEzvjbAGZvjUXxotb1sjHfkUmI11Uy4kiyx
 5PcTJZnCjWiP9ZMpcS8U5u4D3/OMpKRMk8+bHMHQR0v0CAZChLPD6rc5rkHa2AjNdAyG
 U333gJf5j+9TA4MXYGBXBDvSDh6Jo2UO+rGVFacymj0rB0ByhSf0AiyIo6vQptoAnAFN
 0TNe0fAjF9Y98HHnTlD30kWit/zl+h/UPgOU+WfsVuGU+4TxooXT1rTnacUxs+yNe/Pc
 KVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIW2dAsRKyeCJsq5Pr7CvMYcbQr/4xRhjkV2ZW0Qwfw=;
 b=D//rfDkb1P2t2HR3hc3T/SMoP1jPQeugBCkw/WHq/BXU+Uvyhet7T3IOltOADuRjZJ
 MIQjOoNCmWN9SVEZzTHUuqSGAWHlaC5syKfJ66t2zHJQ9P4eF2fiJuKDarWqx8jjy6oU
 UzsSkHZz/cfZBmJlGRofGXWWtzqT5XNwXHXOmkTvBMtPw0qbDAoBWuxohQnKsXwGGsyb
 OmJjGQzawEeYVT9Doma3W3cmAYObD2HbsGb4DjlkemBVJPeRV7ASSkLLQIWUYcfuTRlD
 8wEBEq9ZgqMVCICz0LkHLa/eHrHrJDcvFfCObveeaS6cDm4JUFjQm6OCE2Y9npOof8DT
 xN6g==
X-Gm-Message-State: AOAM531cWc09aSPs9rs1/VqMsq8WVs7IzPad1w1fhLjtlC3pdgwEF8ni
 SSM8+lIsD/st5BFiZnoLjaNF96/iwL14CcYssXE=
X-Google-Smtp-Source: ABdhPJyFq8VAPkVRZEwQXL1BcLIXDTbJZso+A7aAlVrVFHp7RoRhTpGs/QuLTbXliHdyHXSCkagTxiXyKNjlOmKOe6k=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr4850695ilb.86.1648440105279; Sun, 27
 Mar 2022 21:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Mar 2022 14:01:19 +1000
Message-ID: <CAKmqyKPJ1dcdEZkAExnkkBgxOV5KSLFYTpANUG7pCeyMZvV5Aw@mail.gmail.com>
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Mon, 28 Mar 2022 04:01:52 -0000

On Fri, Mar 25, 2022 at 7:03 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> for some cases, scale is always equal or less than 0, since lmul is not larger than 3
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

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

