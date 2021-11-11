Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml2GD-0006g0-Cj
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 00:04:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml2G7-0006fZ-Dw; Thu, 11 Nov 2021 00:04:23 -0500
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:56849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml2G4-0005Ht-PY; Thu, 11 Nov 2021 00:04:23 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07488026|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0747163-0.000108977-0.925175;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lr.NZVx_1636607049; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr.NZVx_1636607049)
 by smtp.aliyun-inc.com(10.147.41.199);
 Thu, 11 Nov 2021 13:04:09 +0800
Subject: Re: [PATCH v2 05/14] target/riscv: Calculate address according to XLEN
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-6-zhiwei_liu@c-sky.com>
 <7dace3b5-1320-20b3-703c-bbdf7e745fb9@linaro.org>
 <df0a3a5a-7ca5-b2dc-36c0-d802df99b5b0@c-sky.com>
 <bbafca7f-1984-f030-cabc-b5f62ef5afd5@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <d1a38044-4ec2-0b5d-fb24-d7b88928ac7a@c-sky.com>
Date: Thu, 11 Nov 2021 13:04:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bbafca7f-1984-f030-cabc-b5f62ef5afd5@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.173; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-173.mail.aliyun.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 05:04:23 -0000

On 2021/11/10 下午10:40, Richard Henderson wrote:
> On 11/10/21 2:44 PM, LIU Zhiwei wrote:
>>> I suspect the extend should come before the pointer mask and not 
>>> after, but this is is a weakness in the current RVJ spec that it 
>>> does not specify how the extension interacts with UXL.  (The reverse 
>>> ordering would allow a 64-bit os to place a 32-bit application at a 
>>> base address above 4gb, which could allow address separation without 
>>> paging enabled.)
>>
>> Agree. Should we adjust currently, or just add a TODO comment here?
>
> Let's add a todo comment for sure.
>
>>> I do think we should merge gen_pm_adjust_address into this function 
>>> so that we only create one new temporary.
>>
>> I think custom instructions will be added in the future. And possibly 
>> there will be  some custom load/store instructions.
>> If we merge gen_pm_adjust_address,  we may have to split it once 
>> again at that time.
>
> I don't think so.  We're simply having one function to compute a 
> canonical address from a register plus offset plus mods.
>
> Also, patch 10 combines pm-mask with zero-extension, so we shouldn't 
> need to do both here.  The checks should be combined like
>
>     tcg_gen_addi_tl(addr, src1, imm);
>     if (ctx->pm_enabled) {
>         tcg_gen_and_tl(addr, addr, pm_mask);
>         tcg_gen_or_tl(addr, addr, pm_base);
>     } else if (get_xl(ctx) == MXL_RV32) {
>         tcg_gen_ext32u_tl(addr, addr);
>     }
>
> and could possibly be extended to
>
>     if (ctx->pm_mask_enabled) {
>         tcg_gen_and_tl(addr, addr, pm_mask);
>     } else if (get_xl(ctx) == MXL_RV32) {
>         tcg_gen_ext32u_tl(addr, addr);
>     }
>     if (ctx->pm_base_enabled) {
>         tcg_gen_or_tl(addr, addr, pm_base);
>     }
>
Can we just use

  tcg_gen_and_tl(addr, addr, pm_mask);
  tcg_gen_or_tl(addr, addr, pm_base);

Therefore we can remove all PM flags in TB_FLAGS.

Thanks,
Zhiwei

> with one more bit in TB_FLAGS, e.g.
>
>     if (env->cur_pm_mask < (xl == MVL_RV32 ? UINT32_MAX : UINT64_MAX)) {
>         flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
>     }
>     if (env->cur_pm_base != 0) {
>         flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
>     }
>
>
> r~

