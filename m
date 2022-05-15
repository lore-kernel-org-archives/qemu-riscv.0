Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqFV6-000809-J3
	for mharc-qemu-riscv@gnu.org; Sun, 15 May 2022 10:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nqFV1-0007zb-8b; Sun, 15 May 2022 10:45:36 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nqFUw-0000Wb-Ff; Sun, 15 May 2022 10:45:34 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 4F773300089;
 Sun, 15 May 2022 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652625920;
 bh=MScmeQ+XDoeosLgefl1nfQ0+2TMf3yH5haXzW8IDIgA=;
 h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=hmRzKsCx2pUqfMq7u1NmOg3StOwHm1Cn4GQdYV6s9mR/ugxR7hDGGPEOaK+39XlCc
 8w+ZmZAdAikXIRFuMoo1E+YZQep/zJzimkVE3aAWHD3xgQCfyCQsO+Wz+xmTUVdN+W
 6iHGp4U7fm+nOnAP+QkLTo0zON08MxTOW8mLqcXk=
Message-ID: <cf6c14de-d373-a623-8e76-7dc18f621281@irq.a4lg.com>
Date: Sun, 15 May 2022 23:45:18 +0900
Mime-Version: 1.0
Subject: Re: [PATCH v2 4/5] target/riscv: FP extension requirements
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, Alistair Francis
 <alistair23@gmail.com>, Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <00e7b1c6060dab32ac7d49813b1ca84d3eb63298.1652583332.git.research_trasio@irq.a4lg.com>
 <be76b33b-4999-6760-cc78-2fb5109b50aa@iscas.ac.cn>
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <be76b33b-4999-6760-cc78-2fb5109b50aa@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sun, 15 May 2022 14:45:39 -0000

On 2022/05/15 23:37, Weiwei Li wrote:
> 
> 在 2022/5/15 上午10:56, Tsukasa OI 写道:
>> QEMU allowed inconsistent configurations that made floating point
>> arithmetic effectively unusable.
>>
>> This commit adds certain checks for consistent FP arithmetic:
>>
>> -   F requires Zicsr
>> -   Zfinx requires Zicsr
>> -   Zfh/Zfhmin require F
>> -   D requires F
>> -   V requires D
> 
> Why 'V requires D'? I know partial vector instructions require D, However,  I think they  just like c.fsd
> 
> instruction requires D, not 'C requires D' or 'D requires C'. Is there any rvv spec change I don't know?

I thought it was crystal-clear.

RISC-V "V" Vector Extension Version 1.0 (riscv-v-spec-1.0.pdf)
18.3. V: Vector Extension for Application Processors
Page 94:

> The V extension requires the scalar processor implements the F and D
> extensions, and implements all vector floating-point instructions
> (Section Vector Floating-Point Instructions) for floating-point operands
> with EEW=32 or EEW=64 (including widening instructions and conversions
> between FP32 and FP64).

c.f. <https://github.com/riscv/riscv-v-spec/releases/tag/v1.0>

Thanks,

Tsukasa

> 
> Regards.
> 
> Weiwei Li
> 
>>
>> Because F/D/Zicsr are enabled by default (and an error will not occur unless
>> we manually disable one or more of prerequisites), this commit just enforces
>> the user to give consistent combinations.
>>
>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>> ---
>>   target/riscv/cpu.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 0854ca9103..f910a41407 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -610,11 +610,36 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>               cpu->cfg.ext_ifencei = true;
>>           }
>>   +        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
>> +            error_setg(errp, "F extension requires Zicsr");
>> +            return;
>> +        }
>> +
>> +        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
>> +            error_setg(errp, "Zfh/Zfhmin extensions require F extension");
>> +            return;
>> +        }
>> +
>> +        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
>> +            error_setg(errp, "D extension requires F extension");
>> +            return;
>> +        }
>> +
>> +        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
>> +            error_setg(errp, "V extension requires D extension");
>> +            return;
>> +        }
>> +
>>           if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>>               cpu->cfg.ext_zhinxmin) {
>>               cpu->cfg.ext_zfinx = true;
>>           }
>>   +        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
>> +            error_setg(errp, "Zfinx extension requires Zicsr");
>> +            return;
>> +        }
>> +
>>           if (cpu->cfg.ext_zk) {
>>               cpu->cfg.ext_zkn = true;
>>               cpu->cfg.ext_zkr = true;
> 

