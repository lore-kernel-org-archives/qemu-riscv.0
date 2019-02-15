Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gucP2-0005j1-Pq
	for mharc-qemu-riscv@gnu.org; Fri, 15 Feb 2019 07:15:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gucP0-0005h5-FS
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 07:15:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gucOy-0000SK-8x
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 07:15:34 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:49820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gucOu-0000O9-KL; Fri, 15 Feb 2019 07:15:28 -0500
Received: from tweenies.uni-paderborn.de ([131.234.189.21]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 nylar)
	id 1gucOt-00040H-Mm; Fri, 15 Feb 2019 13:15:27 +0100
Received: from mail.uni-paderborn.de by tweenies with queue id 3122226-4;
	Fri, 15 Feb 2019 12:15:25 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: Peer Adelt <peer.adelt@hni.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20190213155414.22285-1-palmer@sifive.com>
	<20190213155414.22285-22-palmer@sifive.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <c104c6de-4594-d55e-3910-be86f4be199b@mail.uni-paderborn.de>
Date: Fri, 15 Feb 2019 13:15:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190213155414.22285-22-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.15.120916, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.23.5561002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 21/35] target/riscv: Remove
 manual decoding from gen_branch()
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2019 12:15:35 -0000


On 2/13/19 4:54 PM, Palmer Dabbelt wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>
> We now utilizes argument-sets of decodetree such that no manual
> decoding is necessary.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
>   target/riscv/insn_trans/trans_rvi.inc.c | 46 +++++++++++++++++-------
>   target/riscv/translate.c                | 47 -------------------------
>   2 files changed, 33 insertions(+), 60 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index 39af38081ede..000cb6a37bdd 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -72,41 +72,61 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>       return true;
>   }
>   
> -static bool trans_beq(DisasContext *ctx, arg_beq *a)
> +static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>   {
> -    gen_branch(ctx, OPC_RISC_BEQ, a->rs1, a->rs2, a->imm);
> +    TCGLabel *l = gen_new_label();
> +    TCGv source1, source2;
> +    source1 = tcg_temp_new();
> +    source2 = tcg_temp_new();
> +    gen_get_gpr(source1, a->rs1);
> +    gen_get_gpr(source2, a->rs2);
> +
> +    tcg_gen_brcond_tl(cond, source1, source2, l);
> +    gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
> +    gen_set_label(l); /* branch taken */
> +
> +    if (!riscv_has_ext(ctx->env, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {


Also has_ext()

Cheers,

Bastian


