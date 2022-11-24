Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyDxS-0007yf-9b
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 10:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oyDxJ-0007w8-HG; Thu, 24 Nov 2022 10:16:04 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oyDxG-0004jA-Nd; Thu, 24 Nov 2022 10:16:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 177832A140;
 Thu, 24 Nov 2022 15:15:52 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 24 Nov
 2022 16:15:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S0022733a593-7494-45df-a352-358eb3ec98b4,
 6D26B16FDA19C88FA8EEDD5DCE2FF0553E2274F5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a56c6891-a272-ebbe-9db3-13a90f50f12d@kaod.org>
Date: Thu, 24 Nov 2022 16:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 02/19] target/arm: Convert to 3-phase reset
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
 <20221124115023.2437291-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221124115023.2437291-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: dddd3cdf-0a87-4d32-a09d-db120038b887
X-Ovh-Tracer-Id: 9991235774085237739
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieefgdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpjhgtmhhvsghksggtsehgmhgrihhlrdgtohhmpdhksggrshhtihgrnhesmhgrihhlrdhunhhiqdhprgguvghrsghorhhnrdguvgdprghtrghrgehqvghmuhesghhmrghilhdrtghomhdpmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdphihsrghtohesuhhsvghrshdrshhouhhrtggvfhhorhhgvgdrjhhppdgsihhnrdhmvghnghesfi
 hinhgurhhivhgvrhdrtghomhdprghlihhsthgrihhrrdhfrhgrnhgtihhsseifuggtrdgtohhmpdhprghlmhgvrhesuggrsggsvghlthdrtghomhdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpshhhohhrnhgvsehgmhgrihhlrdgtohhmpdgtrhifuhhlfhhfsehgmhgrihhlrdgtohhmpdgrlhgvkhhsrghnuggrrhdrrhhikhgrlhhosehshihrmhhirgdrtghomhdpjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprghurhgvlhhivghnsegruhhrvghlfedvrdhnvghtpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhlrghurhgvnhhtsehvihhvihgvrhdrvghupdihrghnghigihgrohhjuhgrnheslhhoohhnghhsohhnrdgtnhdpghgrohhsohhngheslhhoohhnghhsohhnrdgtnhdpthhsihhmphhsohhnsehquhhitghinhgtrdgtohhmpdgvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdpmhhrohhlnhhikhesghhmrghilhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpmhgrrhgvgiesuggvnhigrdguvgdpqhgvmhhuqdhrihhstghvsehnohhnghhnuhdrohhrghdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 24 Nov 2022 15:16:08 -0000

On 11/24/22 12:50, Peter Maydell wrote:
> Convert the Arm CPU class to use 3-phase reset, so it doesn't
> need to use device_class_set_parent_reset() any more.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/arm/cpu-qom.h |  4 ++--
>   target/arm/cpu.c     | 13 +++++++++----
>   2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 64c44cef2dd..514c22ced9b 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -43,7 +43,7 @@ void aarch64_cpu_register(const ARMCPUInfo *info);
>   /**
>    * ARMCPUClass:
>    * @parent_realize: The parent class' realize handler.
> - * @parent_reset: The parent class' reset handler.
> + * @parent_phases: The parent class' reset phase handlers.
>    *
>    * An ARM CPU model.
>    */
> @@ -54,7 +54,7 @@ struct ARMCPUClass {
>   
>       const ARMCPUInfo *info;
>       DeviceRealize parent_realize;
> -    DeviceReset parent_reset;
> +    ResettablePhases parent_phases;
>   };
>   
>   
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a021df9e9e8..5bad065579f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -202,14 +202,16 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
>       assert(oldvalue == newvalue);
>   }
>   
> -static void arm_cpu_reset(DeviceState *dev)
> +static void arm_cpu_reset_hold(Object *obj)
>   {
> -    CPUState *s = CPU(dev);
> +    CPUState *s = CPU(obj);
>       ARMCPU *cpu = ARM_CPU(s);
>       ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
>       CPUARMState *env = &cpu->env;
>   
> -    acc->parent_reset(dev);
> +    if (acc->parent_phases.hold) {
> +        acc->parent_phases.hold(obj);
> +    }
>   
>       memset(env, 0, offsetof(CPUARMState, end_reset_fields));
>   
> @@ -2210,12 +2212,15 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>       ARMCPUClass *acc = ARM_CPU_CLASS(oc);
>       CPUClass *cc = CPU_CLASS(acc);
>       DeviceClass *dc = DEVICE_CLASS(oc);
> +    ResettableClass *rc = RESETTABLE_CLASS(oc);
>   
>       device_class_set_parent_realize(dc, arm_cpu_realizefn,
>                                       &acc->parent_realize);
>   
>       device_class_set_props(dc, arm_cpu_properties);
> -    device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
> +
> +    resettable_class_set_parent_phases(rc, NULL, arm_cpu_reset_hold, NULL,
> +                                       &acc->parent_phases);
>   
>       cc->class_by_name = arm_cpu_class_by_name;
>       cc->has_work = arm_cpu_has_work;


