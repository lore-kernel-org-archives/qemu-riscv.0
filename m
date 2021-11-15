Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmlpq-0005Jz-5w
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 18:56:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmlpn-0005HD-Kv; Mon, 15 Nov 2021 18:56:24 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=41555
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmlpm-0003v4-2z; Mon, 15 Nov 2021 18:56:23 -0500
Received: by mail-io1-xd2e.google.com with SMTP id y16so23654763ioc.8;
 Mon, 15 Nov 2021 15:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xJnt1KRZsLPYi+/quzjDDBJzUJ5tvtyLO1gPsYTFDhk=;
 b=fIh2TGqmescBmGXXxNNjPRIbx1yfqha9ZSMdThwi/9QTaRBMppPs9sf8stNEeESO+U
 yB5RWx7Q/WX6arxNavDTrBlnJlsK8bntAzBM/WvGWDzzatUL1YTMeweYKDKl3dzVO+r5
 vz3ap7WZZFUofH/e+TSAQprZIo7GI6i7Y2pKBWtYLKJ8AsGrrQjs7uezrubvwQngT+e9
 +QK5MssBQAFxr5rOT/bmdzGyeBVgzQtF2ZHTmVDNVtTr/Os0lu5PM4KBKgBvC3csi5UO
 jD5OVaSxPqjczss6491U43KC0h0ohOd+aY12TP1b5y9YfuBiT05Rtbt+t8KW9uo09vOa
 2KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJnt1KRZsLPYi+/quzjDDBJzUJ5tvtyLO1gPsYTFDhk=;
 b=UETZV7w9zLrGpO8luJim7vJiGbaROK+KReufZKbXs4Y+n7xHJ8d/dF3Fj5Vzz8XFmE
 uOur8DAzBP6+0cV733+1nSEEM5omc45TlaE27VKyMha8wSRE3dnG4oxa5ScWy5Ei1VFB
 fuvYvIPJjSqGFyinQ96Dem6vFi0xFvr6Mms8AljbbhDmeXOsX8jOqrh3LT59pB/ByER/
 +plj92mxWZ5ddvTlZMnDV1uPs3EVat2F8lbU6zg5d2A4Js7Fc3J9MIZ+W3UMntd5QM9l
 IXMRDVzep17z8AzNEhVzYcw8ztaZf9O+6Iwla6BtFSEo1ZIEBb174+gSYeLTmUdxHZIa
 DuZg==
X-Gm-Message-State: AOAM531108EXKtyGgrEfwWdwZTsNcLH+e1jkLZuOi03yXlVU1fusdC+0
 6+P0O7qN+SmtAhwoEVQKh9e89oJr/XByQmRvnL8=
X-Google-Smtp-Source: ABdhPJwMTnSM798ii9kSOZCCeUzjr24Xu1OonDfzUxRJHu+2+E+W+6TJhcfC9IjE1S3nxYx5TYCy2OLxvQikiBcYSmk=
X-Received: by 2002:a6b:6802:: with SMTP id d2mr1869963ioc.187.1637020580660; 
 Mon, 15 Nov 2021 15:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20211029085922.255197-1-frank.chang@sifive.com>
 <20211029085922.255197-68-frank.chang@sifive.com>
In-Reply-To: <20211029085922.255197-68-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Nov 2021 09:55:54 +1000
Message-ID: <CAKmqyKN59431cmvf0FqzVQ7raBcK9qsYAE2W9HuTCEofbXCabg@mail.gmail.com>
Subject: Re: [PATCH v9 67/76] target/riscv: rvv-1.0: trigger illegal
 instruction exception if frm is not valid
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 23:56:25 -0000

On Fri, Oct 29, 2021 at 8:14 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> If the frm field contains an invalid rounding mode (101-111),
> attempting to execute any vector floating-point instruction, even
> those that do not depend on the rounding mode, will raise an illegal
> instruction exception.
>
> Call gen_set_rm() with DYN rounding mode to check and trigger illegal
> instruction exception if frm field contains invalid value at run-time
> for vector floating-point instructions.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 7589c8ce32a..53c8573f117 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2374,6 +2374,10 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>                      int rm)
>  {
>      if (checkfn(s, a)) {
> +        if (rm != RISCV_FRM_DYN) {
> +            gen_set_rm(s, RISCV_FRM_DYN);
> +        }
> +
>          uint32_t data = 0;
>          TCGLabel *over = gen_new_label();
>          gen_set_rm(s, rm);
> @@ -2459,6 +2463,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>          require_rvf(s) &&
>          vext_check_isa_ill(s) &&
>          require_align(a->rd, s->lmul)) {
> +        gen_set_rm(s, RISCV_FRM_DYN);
> +
>          TCGv_i64 t1;
>
>          if (s->vl_eq_vlmax) {
> @@ -2540,6 +2546,10 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
>      if (opfv_widen_check(s, a)) {                                  \
> +        if (FRM != RISCV_FRM_DYN) {                                \
> +            gen_set_rm(s, RISCV_FRM_DYN);                          \
> +        }                                                          \
> +                                                                   \
>          uint32_t data = 0;                                         \
>          static gen_helper_gvec_3_ptr * const fns[2] = {            \
>              gen_helper_##HELPER##_h,                               \
> @@ -2627,6 +2637,10 @@ static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
>      if (opfv_narrow_check(s, a)) {                                 \
> +        if (FRM != RISCV_FRM_DYN) {                                \
> +            gen_set_rm(s, RISCV_FRM_DYN);                          \
> +        }                                                          \
> +                                                                   \
>          uint32_t data = 0;                                         \
>          static gen_helper_gvec_3_ptr * const fns[2] = {            \
>              gen_helper_##HELPER##_h,                               \
> @@ -2668,6 +2682,10 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
>      if (opxfv_narrow_check(s, a)) {                                \
> +        if (FRM != RISCV_FRM_DYN) {                                \
> +            gen_set_rm(s, RISCV_FRM_DYN);                          \
> +        }                                                          \
> +                                                                   \
>          uint32_t data = 0;                                         \
>          static gen_helper_gvec_3_ptr * const fns[3] = {            \
>              gen_helper_##HELPER##_b,                               \
> @@ -3138,6 +3156,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
>      if (require_rvv(s) &&
>          require_rvf(s) &&
>          vext_check_isa_ill(s)) {
> +        gen_set_rm(s, RISCV_FRM_DYN);
> +
>          unsigned int ofs = (8 << s->sew);
>          unsigned int len = 64 - ofs;
>          TCGv_i64 t_nan;
> @@ -3162,6 +3182,8 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
>      if (require_rvv(s) &&
>          require_rvf(s) &&
>          vext_check_isa_ill(s)) {
> +        gen_set_rm(s, RISCV_FRM_DYN);
> +
>          /* The instructions ignore LMUL and vector register group. */
>          TCGv_i64 t1;
>          TCGLabel *over = gen_new_label();
> --
> 2.25.1
>
>

