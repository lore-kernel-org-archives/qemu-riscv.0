Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJo3-00082u-VS
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJo2-00080q-6G; Wed, 20 Jul 2022 20:12:42 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJo0-0000LN-MB; Wed, 20 Jul 2022 20:12:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id c6so293238pla.6;
 Wed, 20 Jul 2022 17:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4EYb3WSO0T0R6BQ3bckP/hIITj/h0vCuQWagmV+gxq4=;
 b=Kl4sHMDZulEwY5HkE9KlrRkNgdv9yQ0dsMD4uX2UfiF38iQVshM28tmw/QXMpnGJwA
 ptONgwKBk4NDmPFRM41O6wInEIpP6T/fG68Su7OAQAR3TSw2ka/yA0rGaJA+K6976VNP
 +ekND6PwxHLGsavAaSFrhThDMnuf3S9jfm/47033Q6H7la8q49nV8d9CVxQYpRjjffOZ
 eIUodsgx6pdxPXuHvMxdb25Rs7A3T0TMQN5kL97PBLjroPTczpdAyFS1AK/VU9qqrtJX
 SsBQ0ZkpzHK/Gcs84ufCrlLAgg1V/+byUMAxs0aMWLTsdjaiq9I5tblVhyLyYoPzqEAN
 CLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4EYb3WSO0T0R6BQ3bckP/hIITj/h0vCuQWagmV+gxq4=;
 b=ct4a2xw9oSRYHuhW07PNucqNvWmJMe2wM5Q++XxCZzFbmBx2or7wwkQwedKZvPsUKF
 3HGvOJM5x83ktembzo4LCJ+gagGpmG+4lAWs3dvcMcAf4BbmBv8f2xv4xJxQePD0fJN7
 FmmY0J5LJ/KFNWsvkaCc9gz48GIZr4SUgEOws13evVbJnWnZ46DCGjk7I7UD1Y0YVeGY
 TrPC7ao+GStTZQ+Rlc8F4vapQls1PwTgnbGdjDV3z8BHji0agt8g3vad3SmwJg1gRzgG
 0Sw40SP+3oz3dtlADSwy/Drc1QkpcWKT9/jjVyXddX2K47b1ID3Um3VXWqbVXIWVO6ev
 Lwow==
X-Gm-Message-State: AJIora8drzHjSZpcpLGYoepmylwpnOLYF5Vrk1ocwTBH8Ry+THjub4ZC
 JEHogje1X2jZ73VeUXWC3XcyA2vHsISniL43FjU=
X-Google-Smtp-Source: AGRyM1t30/i5+byz3tUzmZwAKdji03VR85ZViG1NBL4pK3mq6XoXaQ8P6yaiLMUBgsJxOjj9QorvrqLPQa4mouNW+IA=
X-Received: by 2002:a17:902:690a:b0:16c:f877:d89d with SMTP id
 j10-20020a170902690a00b0016cf877d89dmr14558233plk.25.1658362359018; Wed, 20
 Jul 2022 17:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-3@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-3@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:12:12 +1000
Message-ID: <CAKmqyKP=gv49cq_a6oScLYgmyQwsLQq7rPg1-vZN7+kB2WbcPw@mail.gmail.com>
Subject: Re: [PATCH qemu v6 03/10] target/riscv: rvv: Add mask agnostic for vx
 instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 00:12:43 -0000

On Mon, Jun 20, 2022 at 4:51 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 2 ++
>  target/riscv/vector_helper.c            | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 0627eda0c0..07d86551a9 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1301,6 +1301,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, VTA, s->vta);
>      data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>      desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
>                                        s->cfg_ptr->vlen / 8, data));
>
> @@ -1468,6 +1469,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, VTA, s->vta);
>      data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>      desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
>                                        s->cfg_ptr->vlen / 8, data));
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index e3810d2bc3..6be3c4e739 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -899,10 +899,13 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
>      uint32_t vl = env->vl;
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>      uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>      uint32_t i;
>
>      for (i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
>              continue;
>          }
>          fn(vd, s1, vs2, i);
> --
> 2.34.2
>
>

