Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyDws-0007sN-HO
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 10:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oyDwm-0007pc-Ru; Thu, 24 Nov 2022 10:15:30 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oyDwa-0004a4-GJ; Thu, 24 Nov 2022 10:15:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 872011436B7E4;
 Thu, 24 Nov 2022 16:15:07 +0100 (CET)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 24 Nov
 2022 16:15:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003344ee689-9463-49f3-a0b6-4e481a5d1be5,
 6D26B16FDA19C88FA8EEDD5DCE2FF0553E2274F5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c602a270-2f8c-3e56-4f3e-d798b151776f@kaod.org>
Date: Thu, 24 Nov 2022 16:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 13/19] target/ppc: Convert to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>
CC: Michael Rolnik <mrolnik@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>, Song Gao
 <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent
 Vivier <laurent@vivier.eu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, David
 Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>,
 <qemu-riscv@nongnu.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-14-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221124115023.2437291-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 480dbad2-b553-4117-9bae-097f0779e2d4
X-Ovh-Tracer-Id: 9978569400451435499
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieefgdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpjhgtmhhvsghksggtsehgmhgrihhlrdgtohhmpdhksggrshhtihgrnhesmhgrihhlrdhunhhiqdhprgguvghrsghorhhnrdguvgdprghtrghrgehqvghmuhesghhmrghilhdrtghomhdpmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdphihsrghtohesuhhsvghrshdrshhouhhrtggvfhhorhhgvgdrjhhppdgsihhnrdhmvghnghesfi
 hinhgurhhivhgvrhdrtghomhdprghlihhsthgrihhrrdhfrhgrnhgtihhsseifuggtrdgtohhmpdhprghlmhgvrhesuggrsggsvghlthdrtghomhdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpshhhohhrnhgvsehgmhgrihhlrdgtohhmpdgtrhifuhhlfhhfsehgmhgrihhlrdgtohhmpdgrlhgvkhhsrghnuggrrhdrrhhikhgrlhhosehshihrmhhirgdrtghomhdpjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprghurhgvlhhivghnsegruhhrvghlfedvrdhnvghtpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhlrghurhgvnhhtsehvihhvihgvrhdrvghupdihrghnghigihgrohhjuhgrnheslhhoohhnghhsohhnrdgtnhdpghgrohhsohhngheslhhoohhnghhsohhnrdgtnhdpthhsihhmphhsohhnsehquhhitghinhgtrdgtohhmpdgvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdpmhhrohhlnhhikhesghhmrghilhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpmhgrrhgvgiesuggvnhigrdguvgdpqhgvmhhuqdhrihhstghvsehnohhnghhnuhdrohhrghdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 24 Nov 2022 15:15:33 -0000

On 11/24/22 12:50, Peter Maydell wrote:
> Convert the ppc CPU class to use 3-phase reset, so it doesn't
> need to use device_class_set_parent_reset() any more.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/cpu-qom.h  |  4 ++--
>   target/ppc/cpu_init.c | 12 ++++++++----
>   2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 89ff88f28c9..0fbd8b72468 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -143,7 +143,7 @@ typedef struct PPCHash64Options PPCHash64Options;
>   /**
>    * PowerPCCPUClass:
>    * @parent_realize: The parent class' realize handler.
> - * @parent_reset: The parent class' reset handler.
> + * @parent_phases: The parent class' reset phase handlers.
>    *
>    * A PowerPC CPU model.
>    */
> @@ -154,7 +154,7 @@ struct PowerPCCPUClass {
>   
>       DeviceRealize parent_realize;
>       DeviceUnrealize parent_unrealize;
> -    DeviceReset parent_reset;
> +    ResettablePhases parent_phases;
>       void (*parent_parse_features)(const char *type, char *str, Error **errp);
>   
>       uint32_t pvr;
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index cbf00813743..95d25856a0e 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7031,16 +7031,18 @@ static bool ppc_cpu_has_work(CPUState *cs)
>       return cs->interrupt_request & CPU_INTERRUPT_HARD;
>   }
>   
> -static void ppc_cpu_reset(DeviceState *dev)
> +static void ppc_cpu_reset_hold(Object *obj)
>   {
> -    CPUState *s = CPU(dev);
> +    CPUState *s = CPU(obj);
>       PowerPCCPU *cpu = POWERPC_CPU(s);
>       PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>       CPUPPCState *env = &cpu->env;
>       target_ulong msr;
>       int i;
>   
> -    pcc->parent_reset(dev);
> +    if (pcc->parent_phases.hold) {
> +        pcc->parent_phases.hold(obj);
> +    }
>   
>       msr = (target_ulong)0;
>       msr |= (target_ulong)MSR_HVB;
> @@ -7267,6 +7269,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>       PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
>       CPUClass *cc = CPU_CLASS(oc);
>       DeviceClass *dc = DEVICE_CLASS(oc);
> +    ResettableClass *rc = RESETTABLE_CLASS(oc);
>   
>       device_class_set_parent_realize(dc, ppc_cpu_realize,
>                                       &pcc->parent_realize);
> @@ -7275,7 +7278,8 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>       pcc->pvr_match = ppc_pvr_match_default;
>       device_class_set_props(dc, ppc_cpu_properties);
>   
> -    device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
> +    resettable_class_set_parent_phases(rc, NULL, ppc_cpu_reset_hold, NULL,
> +                                       &pcc->parent_phases);
>   
>       cc->class_by_name = ppc_cpu_class_by_name;
>       cc->has_work = ppc_cpu_has_work;


