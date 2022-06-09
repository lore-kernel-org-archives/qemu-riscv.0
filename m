Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzRoT-0008Vk-6f
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jun 2022 19:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nzRoR-0008VR-CM; Thu, 09 Jun 2022 19:43:39 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:38416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nzRoP-0004Dl-OF; Thu, 09 Jun 2022 19:43:39 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 c3-20020a9d6843000000b0060c2c63c337so1401411oto.5; 
 Thu, 09 Jun 2022 16:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+MKVbyJiIg9VO9382YHO/BuVJMdUH0lEIY/DAyV3uWE=;
 b=l22P1eSfCWtG5LnZDJAw13I/hfEkwQnbfwrSQKhNl4TEJOM5SM9gXHTxG6MMKTWvZx
 Lu/tUGYhZUT+4s9LTCc4N243Np9yk7Am8YkvAZvo/5eqnOMi4Jyi62pfPmoiAlqCTmea
 NN7PuJE8ddEGuDEAz2WnNeCnEuT5fuGqfHwho0JwbcLvGe9cWncVwluKj79kA1HSrFgG
 Wr+TmLOj8wTdU7iCavWZM8x1r1+mFTwliECA09fmlzA86k6MNT5/iU1imFEwzmD50dUM
 fralw8zvmRvYo29tLsKx67gZxkdX7r9y8vo5I3LFISAgPQ8YlD//tsKdw6DxQdbUXan8
 dZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+MKVbyJiIg9VO9382YHO/BuVJMdUH0lEIY/DAyV3uWE=;
 b=AG2c7Arcc37BZSDvSnkj9m1gNKppk/HrO1QoTCp0m8vncjDsDFlzvjuYFaIvyH6U46
 GRe1CWwVHSYWqhnCLgGNJ6WfDk/zKl4b90HS1f76TXdfth5Y6Ol2cD6SWu0Xcc8BKmyl
 nvBi9ZSS/0Vza9SzxKy77enfMPin9WRUxeubE5GVCrsG8FfpiP1OYlT0i86ZdxjXTniG
 pmOxH83YjhS1Gc0566FTFSE0cXCmxpYOpkIN6KN8Lwh0u5YaTv0BXaBGcM6RUmlPhDxE
 Rvojri1J7rFHEBxru6KTRS42lDLCQ6vTgufGsatZcYMT121ppeO4V7rbHI2JBl9QEQ95
 TnwQ==
X-Gm-Message-State: AOAM530k07MrYAIrvaGVcuTQnNYOn6YjEVkB8yLLjQJE0yV966TfIikR
 EWCy2CJB10K6oC57OWR+V6hiIiyUWOSnIkB2qXs=
X-Google-Smtp-Source: ABdhPJwVVEHXp+7O5crogUZrlrKPTa+Cwec9pRItWrh674zi+99/vdkqYK7nwjqQnqwuKYC45UtlQOEGUHyHEIk8Z7M=
X-Received: by 2002:a05:6830:448e:b0:60b:254e:7439 with SMTP id
 r14-20020a056830448e00b0060b254e7439mr18242219otv.338.1654818215928; Thu, 09
 Jun 2022 16:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220608234701.369536-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220608234701.369536-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Jun 2022 09:43:09 +1000
Message-ID: <CAKmqyKM+bJLTfhXTyRNddE=gEeWfTjw9-pQ1dozhRCS+NSbU4w@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: trans_rvv: Avoid assert for RV32 and e64
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Robert Bu <robert.bu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x32f.google.com
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
X-List-Received-Date: Thu, 09 Jun 2022 23:43:39 -0000

On Thu, Jun 9, 2022 at 9:47 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> When running a 32-bit guest, with a e64 vmv.v.x and vl_eq_vlmax set to
> true the `tcg_debug_assert(vece <= MO_32)` will be triggered inside
> tcg_gen_gvec_dup_i32().
>
> This patch checks that condition and instead uses tcg_gen_gvec_dup_i64()
> is required.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1028
> Suggested-by: Robert Bu <robert.bu@gmail.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 391c61fe93..6b27d8e91e 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2097,8 +2097,16 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>          s1 = get_gpr(s, a->rs1, EXT_SIGN);
>
>          if (s->vl_eq_vlmax) {
> -            tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
> -                                MAXSZ(s), MAXSZ(s), s1);
> +            if (get_xl(s) == MXL_RV32 && s->sew == MO_64) {
> +                TCGv_i64 s1_i64 = tcg_temp_new_i64();
> +                tcg_gen_ext_tl_i64(s1_i64, s1);
> +                tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
> +                                     MAXSZ(s), MAXSZ(s), s1_i64);
> +                tcg_temp_free_i64(s1_i64);
> +            } else {
> +                tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
> +                                    MAXSZ(s), MAXSZ(s), s1);
> +            }
>          } else {
>              TCGv_i32 desc;
>              TCGv_i64 s1_i64 = tcg_temp_new_i64();
> --
> 2.36.1
>

