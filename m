Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTgn-0005wB-92
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 13:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pkTgl-0005va-TD
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 13:46:24 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pkTgj-00050v-KV
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 13:46:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4294527142;
 Thu,  6 Apr 2023 17:46:11 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Apr
 2023 19:46:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001bbd69b5d-5ba5-40e2-98d5-61c75b75d5d4,
 FAD431FEE685CF753936F989CEAB98D84F5F9206) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5b90b770-b420-1dab-401e-b1ed5b5d7e94@kaod.org>
Date: Thu, 6 Apr 2023 19:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 08/10] target/ppc: Restrict KVM-specific field from ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: <qemu-s390x@nongnu.org>, <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, <qemu-arm@nongnu.org>, 
 <kvm@vger.kernel.org>, <qemu-ppc@nongnu.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-9-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230405160454.97436-9-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4ee85be4-94f7-4812-b6b2-e6f1dcb9ab6d
X-Ovh-Tracer-Id: 388153995401333749
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeliedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhrihhstghvsehnohhnghhnuhdrohhrghdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpd
 gurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.224,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 06 Apr 2023 17:46:24 -0000

Hello Philippe

On 4/5/23 18:04, Philippe Mathieu-Daudé wrote:
> The 'kvm_sw_tlb' field shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/cpu.h        | 2 ++
>   target/ppc/mmu_common.c | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 557d736dab..0ec3957397 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1148,7 +1148,9 @@ struct CPUArchState {
>       int tlb_type;    /* Type of TLB we're dealing with */
>       ppc_tlb_t tlb;   /* TLB is optional. Allocate them only if needed */
>       bool tlb_dirty;  /* Set to non-zero when modifying TLB */

'tlb_dirty' was part of the same commit 93dd5e852c ("kvm: ppc: booke206:
use MMU API"). So we might as well include it in the #ifdef section.

Thanks,

C.

> +#ifdef CONFIG_KVM
>       bool kvm_sw_tlb; /* non-zero if KVM SW TLB API is active */
> +#endif /* CONFIG_KVM */
>       uint32_t tlb_need_flush; /* Delayed flush needed */
>   #define TLB_NEED_LOCAL_FLUSH   0x1
>   #define TLB_NEED_GLOBAL_FLUSH  0x2
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 7235a4befe..21843c69f6 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -917,10 +917,12 @@ static void mmubooke_dump_mmu(CPUPPCState *env)
>       ppcemb_tlb_t *entry;
>       int i;
>   
> +#ifdef CONFIG_KVM
>       if (kvm_enabled() && !env->kvm_sw_tlb) {
>           qemu_printf("Cannot access KVM TLB\n");
>           return;
>       }
> +#endif
>   
>       qemu_printf("\nTLB:\n");
>       qemu_printf("Effective          Physical           Size PID   Prot     "
> @@ -1008,10 +1010,12 @@ static void mmubooke206_dump_mmu(CPUPPCState *env)
>       int offset = 0;
>       int i;
>   
> +#ifdef CONFIG_KVM
>       if (kvm_enabled() && !env->kvm_sw_tlb) {
>           qemu_printf("Cannot access KVM TLB\n");
>           return;
>       }
> +#endif
>   
>       for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>           int size = booke206_tlb_size(env, i);


