Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntVgG-0006va-86
	for mharc-qemu-riscv@gnu.org; Tue, 24 May 2022 10:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ntVgF-0006vD-3Z; Tue, 24 May 2022 10:38:39 -0400
Received: from [187.72.171.209] (port=61025 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ntVgC-0002S5-HY; Tue, 24 May 2022 10:38:38 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 24 May 2022 11:38:27 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id ED6808002AF;
 Tue, 24 May 2022 11:38:26 -0300 (-03)
Message-ID: <8f017b84-f00e-b3a9-bf2c-f3900f420fbb@eldorado.org.br>
Date: Tue, 24 May 2022 11:38:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] target/riscv: add support for zmmul extension v0.1
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20220524045320.18606-1-liweiwei@iscas.ac.cn>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20220524045320.18606-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 May 2022 14:38:27.0232 (UTC)
 FILETIME=[EE03DA00:01D86F7B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 24 May 2022 14:38:39 -0000

On 24/05/2022 01:53, Weiwei Li wrote:
> 
>   - includes all multiplication operations for M extension
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> 
> v2:
> * disable M when both M and Zmmul are enabled
>
I tested locally and everything seems to be working
LGTM

Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>

> ---
>   target/riscv/cpu.c                      |  7 +++++++
>   target/riscv/cpu.h                      |  1 +
>   target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
>   3 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e373c61ba2..aec6882c5f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -598,6 +598,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>               cpu->cfg.ext_ifencei = true;
>           }
> 
> +        if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
> +            warn_report("Zmmul will override M");
> +            cpu->cfg.ext_m = false;
> +        }
> +
>           if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>               error_setg(errp,
>                          "I and E extensions are incompatible");
> @@ -903,6 +908,7 @@ static Property riscv_cpu_properties[] = {
> 
>       /* These are experimental so mark with 'x-' */
>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> +    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
>       /* ePMP 0.9.3 */
>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>       DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> @@ -1027,6 +1033,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>        *    extensions by an underscore.
>        */
>       struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
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
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
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
>   static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)
>   {
>       TCGv tmpl = tcg_temp_new();
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
> @@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
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
> @@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
>   static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
>   {
>       REQUIRE_64_OR_128BIT(ctx);
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>       ctx->ol = MXL_RV32;
>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
>   }
> @@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
>   static bool trans_muld(DisasContext *ctx, arg_muld *a)
>   {
>       REQUIRE_128BIT(ctx);
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>       ctx->ol = MXL_RV64;
>       return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
>   }
> --
> 2.17.1
> 
> 


-- 
Víctor Cora Colombo
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

