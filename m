Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMJWp-0008KG-Nh
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 21:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMJWS-0008Ih-Du; Sun, 29 Jan 2023 21:04:08 -0500
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMJWO-0004dV-GE; Sun, 29 Jan 2023 21:03:50 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R521e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VaM2vy._1675044203; 
Received: from 30.39.235.119(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VaM2vy._1675044203) by smtp.aliyun-inc.com;
 Mon, 30 Jan 2023 10:03:24 +0800
Message-ID: <8385d954-678e-d78d-c3ae-d74a4a902907@linux.alibaba.com>
Date: Mon, 30 Jan 2023 10:03:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/14] RISC-V: Adding T-Head MemPair extension
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
 <20230124195945.181842-9-christoph.muellner@vrull.eu>
 <48ff4151-25d9-4b4d-d50a-6516000599c7@linaro.org>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <48ff4151-25d9-4b4d-d50a-6516000599c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
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
X-List-Received-Date: Mon, 30 Jan 2023 02:04:13 -0000


On 2023/1/25 4:44, Richard Henderson wrote:
> On 1/24/23 09:59, Christoph Muellner wrote:
>> +static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp 
>> memop,
>> +                            int shamt)
>> +{
>> +    TCGv rd1 = dest_gpr(ctx, a->rd1);
>> +    TCGv rd2 = dest_gpr(ctx, a->rd2);
>> +    TCGv addr1 = tcg_temp_new();
>> +    TCGv addr2 = tcg_temp_new();
>> +
>> +    addr1 = get_address(ctx, a->rs, a->sh2 << shamt);
>> +    if ((memop & MO_SIZE) == MO_64) {
>> +        addr2 = get_address(ctx, a->rs, 8 + (a->sh2 << shamt));
>> +    } else {
>> +        addr2 = get_address(ctx, a->rs, 4 + (a->sh2 << shamt));
>> +    }
>> +
>> +    tcg_gen_qemu_ld_tl(rd1, addr1, ctx->mem_idx, memop);
>> +    tcg_gen_qemu_ld_tl(rd2, addr2, ctx->mem_idx, memop);
>> +    gen_set_gpr(ctx, a->rd1, rd1);
>> +    gen_set_gpr(ctx, a->rd2, rd2);
>
> Since dest_gpr may return cpu_gpr[n], this may update the rd1 before 
> recognizing the exception that the second load may generate.  Is that 
> correct?

Thanks. It's a bug. We should load all memory addresses to  local TCG  
temps first.

Do you think we should probe all the memory addresses for the store pair 
instructions? If so, can we avoid the use of a helper function?

>
> The manual says that rd1, rd2, and rs1 must not be the same, but you 
> do not check this.

The main reason is that assembler can do this check. Is it necessary to 
check this in QEMU?

Best Regards,
Zhiwei

>
>
> r~

