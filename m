Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4f1A-0000x1-0T
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 04:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p4f0h-0000oD-9S; Mon, 12 Dec 2022 04:22:13 -0500
Received: from out30-6.freemail.mail.aliyun.com ([115.124.30.6])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p4f0e-00077F-7Y; Mon, 12 Dec 2022 04:22:06 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=0; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VX5st73_1670836916; 
Received: from 30.221.97.73(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VX5st73_1670836916) by smtp.aliyun-inc.com;
 Mon, 12 Dec 2022 17:21:57 +0800
Message-ID: <34201e65-efc5-d08d-4e3c-52c91cedcdde@linux.alibaba.com>
Date: Mon, 12 Dec 2022 17:21:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 03/11] RISC-V: Adding T-Head SYNC instructions
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
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-4-christoph.muellner@vrull.eu>
 <f6c98fb6-38f7-5747-0db6-aec2c77edd9a@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <f6c98fb6-38f7-5747-0db6-aec2c77edd9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.6;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-6.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 12 Dec 2022 09:22:14 -0000


On 2022/9/8 15:29, Richard Henderson wrote:
> On 9/6/22 13:22, Christoph Muellner wrote:
>> +NOP_PRIVCHECK(th_sfence_vmas, REQUIRE_PRIV_MHS)
>> +NOP_PRIVCHECK(th_sync, REQUIRE_PRIV_MHSU)
>> +NOP_PRIVCHECK(th_sync_i, REQUIRE_PRIV_MHSU)
>> +NOP_PRIVCHECK(th_sync_is, REQUIRE_PRIV_MHSU)
>> +NOP_PRIVCHECK(th_sync_s, REQUIRE_PRIV_MHSU)
>
> These should not be nops: th_sfence_vmas requires a tlb flush; 
> th.sync{,.i} needs to end the current translation block; 
> th.sync.{s,is} needs multiprocessor sync, which involves a call to 
> async_safe_run_on_cpu.
Hi Richard,

I have fixed the description of T-Head custom synchronization 
instructions according to the implementation of hardware. Sorry for the 
misleading.

https://github.com/T-head-Semi/thead-extension-spec/tree/master/xtheadsync


The fix is as below:

1）th.sync.s has the same function with th.sync.

2) th.sync.is has the same function with th.sync.i

3) th.sync has the function of memory barrier, but it is stricter than 
RISC-V fence instruction as it order all the instructions instead of 
load/store instructions.

4) th.sync.i has the function to flush the pipeline besides the function 
of th.sync.


On QEMU,  I think they should be emulated them as below:

1) th.sync should be emulated as " 'tcg_gen_mb()'  and  'end the current 
translation block'" on QEMU.

2) th.sync.i should be emulated as " 'tcg_gen_mb()'  and  'end the 
current translation block'" on QEMU because we don't have the cache 
model for guest on QEMU. Thus we don't have to synchronize between the 
icache and dcache for guest.


'tcg_gen_mb' is for the function of memory barrier. And  'end the 
current translation block' is to reflect the influence of other 
instructions, such as taking interrupts which happens only at the end of 
a translation block.
Maybe we can also just implement these instructions as 'tcg_gen_mb' 
because currently all CSR instructions which may influence the 
interrupts taking have ended the TB on QEMU.


Is it right?

Thanks,
Zhiwei
>
>
> r~

