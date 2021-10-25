Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mewDZ-0008Gq-QD
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 05:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mewDX-0008EZ-8X; Mon, 25 Oct 2021 05:24:31 -0400
Received: from out28-146.mail.aliyun.com ([115.124.28.146]:59510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mewDR-00027p-EK; Mon, 25 Oct 2021 05:24:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08395304|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.137537-0.00225881-0.860204;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=4; RT=4; SR=0; TI=SMTPD_---.LhUsXA8_1635153851; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LhUsXA8_1635153851)
 by smtp.aliyun-inc.com(10.147.40.44); Mon, 25 Oct 2021 17:24:11 +0800
Subject: Re: [PATCH v6 00/15] target/riscv: Rationalize XLEN and operand length
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20211020031709.359469-1-richard.henderson@linaro.org>
 <17397bbe-7dfe-ac2e-6033-4ab4840a11bd@c-sky.com>
 <663d5df5-c107-c4ce-99e0-2a5d336a69ca@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <606880b5-83fc-6ab6-6d34-fb2b71536f99@c-sky.com>
Date: Mon, 25 Oct 2021 17:24:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <663d5df5-c107-c4ce-99e0-2a5d336a69ca@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.146; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-146.mail.aliyun.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.33,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Mon, 25 Oct 2021 09:24:31 -0000


On 2021/10/22 下午11:50, Richard Henderson wrote:
> On 10/22/21 1:26 AM, LIU Zhiwei wrote:
>> As the specification said, "PC bits above XLEN are ignored, and when
>> the PC is written, it is sign-extended to fill the widest supported 
>> XLEN."
>> We still need special process of PC for exceptions or jump instructions.
>>
>> I have two methods to implement  PC register access,
>> but not sure which is the right way.
>>
>> First, normally process the PC register as the specification points.
>> That means expanding  the PC when setting the global TCGv variable
>> cpu_pc, and truncating the pc_first and  pc_next fields in
>> DisasContextBase before decoding instructions.    I am not sure
>> whether the sign-extended pc is compatible with QEMU common code.
>
> I think extending on write is the correct thing. 

Thanks. I will pick this way.

> Jumps, exception entry and return, gdb write.

If we carefully process jumps and gdb write, I think we can omit 
exception entry and return. Is it right?

>
> Note that the read from PC for translation is in cpu_get_tb_cpu_state, 
> before translation.  You should not need to change anything wrt 
> pc_first/pc_next/etc, because it will already have been done.

Good! Thanks.

Best Regards,
Zhiwei

>
>> Second,  ignore ignore the PC special process for jump instructions.
>> Just expand or truncate the PC register when exception processing,
>> gdb read, or cpu dump registers. It is not a stright way,  but I 
>> think it is still right.
>
> I think you could make it work that way, but I don't know that it's 
> less difficult, or that you'd have fewer changes.
>
>
> r~

