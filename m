Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL7EV-0005UL-6F
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 12:39:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL7ET-0005U3-L5; Fri, 18 Feb 2022 12:39:49 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL7ER-0006qk-Fp; Fri, 18 Feb 2022 12:39:49 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9256420787;
 Fri, 18 Feb 2022 17:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645205984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWeoInqSZS5MozSmhAv1VVZ93tdqpgyu7NG9FtytENM=;
 b=pZQoep+wEiUguQW1Nz2yFeXUXN99Sul33G+EwphASvSEpr7JwdkMskscU4Lrn1AznyDdki
 K0GW7oAvJfi4aANRbAFstaB4TVAvq0Xtpm8V+m9VJIDYz15VEa2jJUh8bfSYLf8YjQufKt
 1SPCMv1nHLWKAu2GDUiyvbcAtNdIaEk=
Message-ID: <af1de21c-bccf-58f9-4941-e88eca6c1a5c@greensocs.com>
Date: Fri, 18 Feb 2022 18:39:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/5] hw/riscv/riscv_hart: free the harts array when the
 object is finalized
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org
References: <20220218164646.132112-1-damien.hedde@greensocs.com>
 <20220218164646.132112-2-damien.hedde@greensocs.com>
 <CAFEAcA_xtf-LtvhNqxMEtZs1Z6NePkVKOp6Kh+tN_HZTkFiuTQ@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA_xtf-LtvhNqxMEtZs1Z6NePkVKOp6Kh+tN_HZTkFiuTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 18 Feb 2022 17:39:50 -0000



On 2/18/22 18:23, Peter Maydell wrote:
> On Fri, 18 Feb 2022 at 16:53, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> The array is dynamically allocated by realize() depending on the
>> number of harts.
>>
>> This clean-up removes memory leaks which would happen in the
>> 'init->finalize' life-cycle use-case (happening when user creation
>> is allowed).
> 
> If the allocation happens in realize, then it won't hapen
> in an init->finalize cycle, only in init->realize->unrealize->finalize...
> 
> -- PMM

You're right. I was confused when re-writing the message.
This leaks happen on
init -> realize-failure -> finalize
Because the array is allocated, then every cpu is initialized (and an 
error failure may happen for any of them).

Thanks,
--
Damien


