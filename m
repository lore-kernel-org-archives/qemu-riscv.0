Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8OAr-0006zT-I4
	for mharc-qemu-riscv@gnu.org; Mon, 25 Mar 2019 07:53:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1h8OAp-0006yS-O0
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 07:53:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1h8OAo-0004cJ-Mp
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 07:53:51 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:34932
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chouteau@adacore.com>)
	id 1h8O5w-0001pt-IE; Mon, 25 Mar 2019 07:48:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id BF5DE8139F;
	Mon, 25 Mar 2019 12:48:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzKoiwlBvrFF; Mon, 25 Mar 2019 12:48:47 +0100 (CET)
Received: from [192.168.42.81] (unknown [37.168.121.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 3854B81399;
	Mon, 25 Mar 2019 12:48:47 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>
References: <20190322112226.26890-1-chouteau@adacore.com>
	<43360785-4c71-bda6-c2f0-a5b02838865c@linaro.org>
From: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <eceb7ec3-73cd-a058-1410-e9217ec27ff4@adacore.com>
Date: Mon, 25 Mar 2019 12:48:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <43360785-4c71-bda6-c2f0-a5b02838865c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISC-V: fix single stepping
 over ret and other branching instructions
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
X-List-Received-Date: Mon, 25 Mar 2019 11:53:52 -0000

Thanks Richard,

I sent a version 2.

On 22/03/2019 16:24, Richard Henderson wrote:
> On 3/22/19 4:22 AM, Fabien Chouteau wrote:
>> +/* Wrapper around tcg_gen_exit_tb that handles single stepping */
>> +static void exit_tb(DisasContext *ctx, TranslationBlock *tb, unsigned idx)
>> +{
>> +    if (ctx->base.singlestep_enabled) {
>> +        gen_exception_debug();
>> +    } else {
>> +        tcg_gen_exit_tb(tb, idx);
>> +    }
>> +}
> 
> You should remove the TB and idx parameters here and pass NULL, 0 to
> tcg_gen_exit_tb.
> 
>> @@ -138,14 +158,10 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>>          /* chaining is only allowed when the jump is to the same page */
>>          tcg_gen_goto_tb(n);
>>          tcg_gen_movi_tl(cpu_pc, dest);
>> -        tcg_gen_exit_tb(ctx->base.tb, n);
>> +        exit_tb(ctx, ctx->base.tb, n);
> 
> Because this is the only non-zero use, and it is already protected by
> use_goto_tb, which includes the single-step check.
> 
> Because goto_tb(n) must be paired with exit_tb(tb, n), and vice-versa.
> 
> 
> r~
> 


