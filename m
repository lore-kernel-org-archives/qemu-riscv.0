Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntM1W-0005ud-IE
	for mharc-qemu-riscv@gnu.org; Tue, 24 May 2022 00:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntM1U-0005uB-Ke; Tue, 24 May 2022 00:19:56 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntM1S-00071P-Kz; Tue, 24 May 2022 00:19:56 -0400
Received: by mail-il1-x12a.google.com with SMTP id q2so2704847ils.0;
 Mon, 23 May 2022 21:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mv7hu/UGl9Cd1UzuCzUeDsjCKtTyrjVvPoEWNwfzRQs=;
 b=nBhsndhjpwhdoopjXabzR8XrWbw9RWKb+n8SrQzJgeQVDWtnIVXrWnQb2y/kY3ePL2
 fQDLFRkrKw7aHmH8n5zZN51CrXD7u0rRMLZOlB1V62QfHKEaR3zAw7TqlWDdPyhzT7mK
 V73qHaoSYZ+fH/dWPv390j2MDzGfpZjztPP7H5iMpx8Luv6B/tSQGkH29AJTJLNrP/Qt
 15cm9otEh5G0TMYTROpOwn6DYQGM9y44EmLM5M1II6RQcf9Xx78+LlFm7MYw64SOT8JI
 0L3uM8kc/Ychyroq7AwLMkD7yfhothAmmZyhQnKvfoG+sT4004dLrO3RlbSz1C2FpZp9
 RykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mv7hu/UGl9Cd1UzuCzUeDsjCKtTyrjVvPoEWNwfzRQs=;
 b=KXxXwJHEpoSrqhlOlOdV1LccP6vygcu32i4quoNAZesL9lpIQ8ZV6T1cCWcC6V49L9
 /zNhX034QuumruZ7/T4p6iaA9KlteAF7azM5hYmAPSZ+hdM/b5QmX+NwAUMAgmFvSxcO
 7uUXC2sg4urxlwR/+k5I5Nkt7HGbmoGvbJ1AWgIXe3Flg18wn27wpLJuB7jxVIi6aykO
 vCXR8vFGuktWj70qeO71ghFglyuQArf4bZRcKK437m7uuAflkflqc0AL8ZhtOqJHfJhH
 U3i6O/NwkxfUwVOuVwMAYFX+9oME6R5rS4RBZLdw3UMpR7mmKBSfit+2oCNh+QdRzGEO
 5VAQ==
X-Gm-Message-State: AOAM5308Xe9CccdDyZwDq/T0FkklzCpPxmL5+3VWnff2uYIrENuQ4vgB
 DE4RwNsvt0AiCpV0jL7mekPWyA75e4B/SXxjrjw=
X-Google-Smtp-Source: ABdhPJxvRShqrvUZbz+XZdoOh38zS2V431pfFs56NR9WjIk9V/2L7UKp4iW9G/nVTRfSi4Kk3l9l9svpEys/z4mwFpc=
X-Received: by 2002:a05:6e02:1747:b0:2d1:a5d6:b793 with SMTP id
 y7-20020a056e02174700b002d1a5d6b793mr4616217ill.55.1653365992937; Mon, 23 May
 2022 21:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220518015316.20504-1-liweiwei@iscas.ac.cn>
 <CAKmqyKNBQo91af1m5t_wDOVMeh=6uYD9Q+KugoTOQYzQJUtf5w@mail.gmail.com>
 <3ed635e4-5705-007c-be5c-edd07936758d@iscas.ac.cn>
 <CAKmqyKPBqGvvE1LLu3s3zHNYJqhT=OKD5tLU02gmKfPdsBcy8w@mail.gmail.com>
 <d1e5e7b3-f508-77c2-a95a-3e6feb98a230@iscas.ac.cn>
In-Reply-To: <d1e5e7b3-f508-77c2-a95a-3e6feb98a230@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 May 2022 14:19:26 +1000
Message-ID: <CAKmqyKMiUU=mvETAJ=vKyHytL_u=tKfkO_-Myrw4p8ov-543iA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: add support for zmmul extension v0.1
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Tue, 24 May 2022 04:19:56 -0000

On Tue, May 24, 2022 at 12:25 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/5/24 =E4=B8=8A=E5=8D=885:15, Alistair Francis =E5=86=99=E9=
=81=93:
>
> On Mon, May 23, 2022 at 6:10 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> =E5=9C=A8 2022/5/23 =E4=B8=8B=E5=8D=882:34, Alistair Francis =E5=86=99=E9=
=81=93:
>
> On Wed, May 18, 2022 at 11:54 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>   - includes all multiplication operations for M extension
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c                      |  2 ++
>   target/riscv/cpu.h                      |  1 +
>   target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
>   3 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e373c61ba2..01b57d3784 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -903,6 +903,7 @@ static Property riscv_cpu_properties[] =3D {
>
>       /* These are experimental so mark with 'x-' */
>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> +    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
>
> Is this really experimental?
>
> Alistair
>
> I think it's experimental currently. The zmmul version in latest riscv
> spec is v0.1, even though described as  v1.0 in spike README.
>
> Hmm... Your right that it is only v0.1, but there is no indication of
> draft state in the RISC-V spec chapter on Zmmul
>
> Its specification status
> (https://wiki.riscv.org/display/home/specification+status) is Freeze
> Complete and TSC Sign-Off Voting.
>
> And It's not in the ratified extension
> list(https://wiki.riscv.org/display/home/recently+ratified+extensions).
>
> Any status update I missed?
>
> Confusing. Ok, I guess let's leave it as experimental, we can always
> remove the `x-` easily :)
>
> Regards,
>
> Weiwei Li
>
>       /* ePMP 0.9.3 */
>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>       DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> @@ -1027,6 +1028,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str, int max_str_len)
>        *    extensions by an underscore.
>        */
>       struct isa_ext_data isa_edata_arr[] =3D {
> +        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
>
> We should have some checks though. We don't want users to enable this
> and the multiply (M) extension
>
>
> Alistair
>
> Maybe we can add a check like this:
>
> /* M + Zmmul =3D Zmmul */
> if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
> warn_report("Zmmul will override M");
> cpu->cfg.ext_m =3D false;
> }

Yep, looks good

Alistair

>
> It seems OK to enable both M and Zmmul in gnu toolchain. However, divide =
operations
>
> will be disabled when Zmmul is enabled.
>
> Regards,
>
> Weiwei Li
>
>           ISA_EDATA_ENTRY(zfh, ext_zfh),
>           ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>           ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f5ff7294c6..68177eae12 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -405,6 +405,7 @@ struct RISCVCPUConfig {
>       bool ext_zhinxmin;
>       bool ext_zve32f;
>       bool ext_zve64f;
> +    bool ext_zmmul;
>
>       uint32_t mvendorid;
>       uint64_t marchid;
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
> index 16b029edf0..ec7f705aab 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -18,6 +18,12 @@
>    * this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>
> +#define REQUIRE_M_OR_ZMMUL(ctx) do {                      \
> +    if (!ctx->cfg_ptr->ext_zmmul && !has_ext(ctx, RVM)) { \
> +        return false;                                     \
> +    }                                                     \
> +} while (0)
> +
>   static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl,=
 TCGv bh)
>   {
>       TCGv tmpl =3D tcg_temp_new();
> @@ -65,7 +71,7 @@ static void gen_mul_i128(TCGv rl, TCGv rh,
>
>   static bool trans_mul(DisasContext *ctx, arg_mul *a)
>   {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
>   }
>
> @@ -109,7 +115,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
>
>   static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>   {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>       return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
>                               gen_mulh_i128);
>   }
> @@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv ar=
g2)
>
>   static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>   {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>       return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
>                               gen_mulhsu_i128);
>   }
> @@ -176,7 +182,7 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
>
>   static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>   {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>       /* gen_mulh_w works for either sign as input. */
>       return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
>                               gen_mulhu_i128);
> @@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a=
)
>   static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
>   {
>       REQUIRE_64_OR_128BIT(ctx);
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>       ctx->ol =3D MXL_RV32;
>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
>   }
> @@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw =
*a)
>   static bool trans_muld(DisasContext *ctx, arg_muld *a)
>   {
>       REQUIRE_128BIT(ctx);
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>       ctx->ol =3D MXL_RV64;
>       return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
>   }
> --
> 2.17.1
>
>

