Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMQ5l-0007Ew-17
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 04:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMQ5f-0007EH-6K; Mon, 30 Jan 2023 04:04:40 -0500
Received: from out30-1.freemail.mail.aliyun.com ([115.124.30.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMQ5b-0002Cm-WA; Mon, 30 Jan 2023 04:04:38 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VaR58Jo_1675069464; 
Received: from 30.221.97.63(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VaR58Jo_1675069464) by smtp.aliyun-inc.com;
 Mon, 30 Jan 2023 17:04:25 +0800
Message-ID: <3dc36bdc-97df-9ba5-ee12-3a9b5f7793d3@linux.alibaba.com>
Date: Mon, 30 Jan 2023 17:04:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 09/14] RISC-V: Adding T-Head MemIdx extension
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-10-christoph.muellner@vrull.eu>
 <3d864ae7-5430-8db9-f91c-fd24f428b04d@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <3d864ae7-5430-8db9-f91c-fd24f428b04d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.1;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-1.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.092, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 30 Jan 2023 09:04:42 -0000


On 2023/1/25 5:21, Richard Henderson wrote:
> On 1/24/23 09:59, Christoph Muellner wrote:
>> +/* XTheadMemIdx */
>> +
>> +/*
>> + * Load with memop from indexed address and add (imm5 << imm2) to rs1.
>> + * If !preinc, then the load address is rs1.
>> + * If  preinc, then the load address is rs1 + (imm5) << imm2).
>> + */
>> +static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp 
>> memop,
>> +                         bool preinc)
>> +{
>> +    TCGv rd = dest_gpr(ctx, a->rd);
>> +    TCGv addr = get_address(ctx, a->rs1, preinc ? a->imm5 << a->imm2 
>> : 0);
>> +
>> +    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
>> +    addr = get_address(ctx, a->rs1, !preinc ? a->imm5 << a->imm2 : 0);
>
> First, you're leaking the previous 'addr' temporary.
Although all temps allocated by temp_new() will be freed after the 
instruction translation automatically, we can improve current 
implementation.
> Second, get_address may make modifications to 'addr' which you don't 
> want to write back.
Good catch.
> Third, you are not checking for rd != rs1.
Yes.
>
> I think what you want is
>
>     int imm = a->imm5 << a->imm2;
>     TCGv addr = get_address(ctx, a->rs1, preinc ? imm : 0);
>     TCGv rd = dest_gpr(ctx, a->rd);
>     TCGv rs1 = get_gpr(ctx, a->rs1, EXT_NONE);
>
>     tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
>     tcg_gen_addi_tl(rs1, rs1, imm);
>     gen_set_gpr(ctx, a->rd, rd);
>     gen_set_gpr(ctx, a->rs1, rs1);

Yes, we should write back the 'addr' without modification.

Best Regards,
Zhiwei

>
>
> r~

