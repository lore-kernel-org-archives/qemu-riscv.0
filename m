Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCzkI-0006YO-KF
	for mharc-qemu-riscv@gnu.org; Mon, 09 Aug 2021 03:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mCzkG-0006Y7-Ne; Mon, 09 Aug 2021 03:30:48 -0400
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:59660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mCzkD-00048x-Nz; Mon, 09 Aug 2021 03:30:48 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.081255|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0179929-0.00120733-0.9808;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KxMi2oB_1628494235; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KxMi2oB_1628494235)
 by smtp.aliyun-inc.com(10.147.42.241);
 Mon, 09 Aug 2021 15:30:36 +0800
Subject: Re: [RFC PATCH 04/13] target/riscv: Support UXL32 for slit/sltiu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-5-zhiwei_liu@c-sky.com>
 <5c33ecc6-3b61-2bb0-f331-548d5e58e129@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <5d4ea1ac-f339-2c1d-03c4-98f518ee2ede@c-sky.com>
Date: Mon, 9 Aug 2021 15:28:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5c33ecc6-3b61-2bb0-f331-548d5e58e129@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.4; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-4.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Aug 2021 07:30:49 -0000


On 2021/8/6 上午3:09, Richard Henderson wrote:
> On 8/4/21 4:53 PM, LIU Zhiwei wrote:
>> +static bool gen_arith_simm_tl(DisasContext *ctx, arg_i *a,
>> +                              void (*func)(TCGv, TCGv, TCGv))
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd);
>> +    TCGv src1 = gpr_src_s(ctx, a->rs1);
>> +    TCGv src2 = tcg_constant_tl(a->imm);
>> +
>> +    (*func)(dest, src1, src2);
>> +    return true;
>> +}
>> +
>> +static bool gen_arith_uimm_tl(DisasContext *ctx, arg_i *a,
>> +                              void (*func)(TCGv, TCGv, TCGv))
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd);
>> +    TCGv src1 = gpr_src_u(ctx, a->rs1);
>> +    TCGv src2 = tcg_constant_tl(ctx->uxl32 ? a->imm & UINT32_MAX : 
>> a->imm);
>> +
>> +    (*func)(dest, src1, src2);
>> +    return true;
>> +}
>
> Again, unsigned comparisions work fine with sign-extended inputs.
>
Thanks. Fix it in next patch set.

Zhiwei

>
> r~

