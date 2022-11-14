Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouin9-00079A-OX
	for mharc-qemu-riscv@gnu.org; Mon, 14 Nov 2022 18:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1ouigG-0001X6-1E; Mon, 14 Nov 2022 18:16:05 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1ouWnT-0004Qu-Uy; Mon, 14 Nov 2022 05:34:38 -0500
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id CC30D403F0;
 Mon, 14 Nov 2022 11:34:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1668422068;
 bh=WSOzBUSV/CWjDcrXGLGVVdfyVgrNlEgzhxamtMiFqr0=;
 h=Date:To:References:From:Subject:In-Reply-To:From;
 b=3oUXqqrFsT4ma2t0S+xOJVDQXnn0YzdmX0JFWMvb+dNXpN5J2IKr8qx1aKWmAVnhp
 mfzWDPIR212Q3kcyMzhaLDR+9/R2+i8sakSTTMp3oH1UxRi6loU0E+nqDf3i2TltYY
 Z93Z9p0h1C1BxyP2ccblOto8T4IbPvcC7MutoRF6gMf5T7oGCPPaKtIgI+qyIBJXoY
 ++EMsQeIQXbtKoD9Mm2eK9PrXGbP6AJPjK3rhI4qCfD+81NhVcOrQg87uh72sA8pUM
 14uo+EZ1Zr03umEaZQIOkXZ/fnDy8UwlOkSkKmhGnhclngA8nEvGT8kUwopuxiivR0
 LKUSEx/STko9A==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhub.u-ga.fr (Postfix) with ESMTP id C980F10005A;
 Mon, 14 Nov 2022 11:34:28 +0100 (CET)
Received: from [147.171.132.208] (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 2292C40050;
 Mon, 14 Nov 2022 11:34:28 +0100 (CET)
Message-ID: <d87890a7-023f-ba7c-4a61-aa085d0134de@univ-grenoble-alpes.fr>
Date: Mon, 14 Nov 2022 11:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
 <48729f3f-80eb-8c7b-7bbb-7cd6bfa65a3e@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH] hw/intc: sifive_plic: Renumber the S irqs for numa support
In-Reply-To: <48729f3f-80eb-8c7b-7bbb-7cd6bfa65a3e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 14 Nov 2022 23:16:35 -0000

Le 14/11/2022 à 09:40, Philippe Mathieu-Daudé a écrit :
> On 11/11/22 13:19, Frédéric Pétrot wrote:
>> Commit 40244040 changed the way the S irqs are numbered. This breaks when
> 
> 40244040a7 in case?

   Seems reasonnable, indeed, I'll even align with what git blame shows
   (11 chars, so 40244040a7a).

>> using numa configuration, e.g.:
>> ./qemu-system-riscv64 -nographic -machine virt,dumpdtb=numa-tree.dtb \
>>                        -m 2G -smp cpus=16 \
>>               -object memory-backend-ram,id=mem0,size=512M \
>>               -object memory-backend-ram,id=mem1,size=512M \
>>               -object memory-backend-ram,id=mem2,size=512M \
>>               -object memory-backend-ram,id=mem3,size=512M \
>>               -numa node,cpus=0-3,memdev=mem0,nodeid=0 \
>>               -numa node,cpus=4-7,memdev=mem1,nodeid=1 \
>>               -numa node,cpus=8-11,memdev=mem2,nodeid=2 \
>>               -numa node,cpus=12-15,memdev=mem3,nodeid=3
>> leads to:
>> Unexpected error in object_property_find_err() at ../qom/object.c:1304:
>> qemu-system-riscv64: Property 'riscv.sifive.plic.unnamed-gpio-out[8]' not
>> found
>>
>> This patch makes the nubering of the S irqs identical to what it was before.
>>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> ---
>>   hw/intc/sifive_plic.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
>> index c2dfacf028..89d2122742 100644
>> --- a/hw/intc/sifive_plic.c
>> +++ b/hw/intc/sifive_plic.c
>> @@ -480,7 +480,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char 
>> *hart_config,
>>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
>>           }
>>           if (plic->addr_config[i].mode == PLICMode_S) {
>> -            qdev_connect_gpio_out(dev, cpu_num,
>> +            qdev_connect_gpio_out(dev, cpu_num - plic->hartid_base,
>>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
>>           }
>>       }
> 
> Oops. >
> Eventually we could unify the style:
> 
> -- >8 --
> @@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr, char 
> *hart_config,
>           CPUState *cpu = qemu_get_cpu(cpu_num);
> 
>           if (plic->addr_config[i].mode == PLICMode_M) {
> -            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + cpu_num,
> +            qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts,
>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
>           }
>           if (plic->addr_config[i].mode == PLICMode_S) {
> -            qdev_connect_gpio_out(dev, cpu_num,
> +            qdev_connect_gpio_out(dev, cpu_num - hartid_base,hartid_base
>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
>           }
>       }
> ---

   IIUC hartid_base is used to set plic->hartid_base, so agreed, along with the
   style unification.
   I'll send a v2, then.
   Since Alistair already queued the patch, how shall I proceed?
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot,                            Pr. Grenoble INP-Ensimag/TIMA |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

