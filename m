Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6Wa1-0000fj-MB
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jun 2022 08:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1o6Wa0-0000dy-JH; Wed, 29 Jun 2022 08:14:00 -0400
Received: from mail-os0jpn01olkn2092.outbound.protection.outlook.com
 ([40.92.98.92]:19174 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1o6WZx-0005tZ-BJ; Wed, 29 Jun 2022 08:14:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG+Mo9RMuaiGaswF3amQWA/OtaYGs3dtEyax7LRSZvCSJAJhls/l1ehngu1M6qdfJh8Hr/SoGcLhrscHT/u5xWugRX4+wM+IXPn/T/ZaBMFvfiBmaTjGtkgokt8+P3u6SGfkDnGWE2OfkuUUbHeyaK8dN0hnKMUjtiPUjKAfmqLY04LqYi4bhIux/8xydmof9clCZgHOw+A8HHfWbZIIipC/DFVb6UPEN/1bw0YSRRajPOBIfI9/UMRU5aSlf2+j6wwLVWpqUhblnJpVjj10cM4tsgErZmkdVx9IeQ+Qb2T8KLx4rYiGdtBN243Vs8lwGjE3RWKKGoFhTRbpOEZgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBCWUG0PIUEoAT+edWRbfg/t11zjDEWHjWxH80PWz8g=;
 b=eKbArZpfMbU7Y6Gt7JJ/lXdwO1TNTDOpFELWkYQzJUubPu/STv9DVLl78Ful8cZJlSeDJ+y32JzT6i6a/cXQxJaMj8mmRYiTrUYtLikucq0c1L+K5CKxdSE63ncd1/8efrX+I5mgC/24aaKRJoMJlkTvu6flRBiGyAY5lVP5GYlp7OHYD8BQF8jicYldUeUDSTyg73Kyh7oSywpMWhT/P9sR0zq/3P5R+vKEoo39GXKJrzbn/DQF1Nr6m79Nzxeb9ekxwrinSoNtcmic349sghuzez444z1nZg3kV2wQ6JkNlOnUrRFwVm4MF1YPsxADsAa6q0bquDcXZfcqcG3KyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBCWUG0PIUEoAT+edWRbfg/t11zjDEWHjWxH80PWz8g=;
 b=ufsowDAqUf2s6ZL8RvuaMi4RI5xYcQkwFTNrvjQSKamdmuXrxUS3rHeDoFW6q+03Hg8AdxBUwQ7rmPhCf7hdbyrFCAL5g6cvWo4tI9DMZ7dGmPLESrhPfjCyWtdrN9iCZ0FgIGRn6l1l33HuLhMGjqtCNqmHdrVpcDWP3Lvj/Xbv3vG+6uxfEkFQCG5001uuePsgAdDdd6yxz8d1LTWB+GLe7zkdUdLjTG11sjqHhcdhhbRRbbn0JpOePJyQiVsf2kowBdc7Ci+TeIJIFASEX24kpVXPCG0TOIFeVhiBduSvAc/KtCUWo/WR+1Z/TN44lHeXrsHAyEFuc8FmnuTHtA==
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:df::12)
 by OS0P286MB0611.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 12:13:50 +0000
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36]) by TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36%5]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 12:13:50 +0000
Message-ID: <TYYP286MB14398F250985AA002E85C341C6BB9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Date: Wed, 29 Jun 2022 20:13:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20220628101737.786681-1-apatel@ventanamicro.com>
 <20220628101737.786681-4-apatel@ventanamicro.com>
From: dramforever <dramforever@live.com>
In-Reply-To: <20220628101737.786681-4-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [zvEXL4I+hBVBFNXonGx71gg8w/g3ITkY]
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:df::12)
X-Microsoft-Original-Message-ID: <ada414e8-646c-0097-03cc-ba917d7c80c5@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 962d7ffa-62b7-4cc0-6c0f-08da59c8d300
X-MS-TrafficTypeDiagnostic: OS0P286MB0611:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAZW62YnXb6IzOQLW0qBpaIfWLvJfnH6xEbf4+znprWvlqL4ur18BHGINfn1D2UwoqaQcTw079+zn3mklvewLpVNHEb4l6msf/BeWiQnS+F5B8B5jABt6HWGpHjil3kmEtMy76CPismHkabJgu7Ax3RYpvnWAkdV+Vmt+qNUcBf8NLqscF4rKzBAYrTg9pNRUtuERPCmOSjK0M3Mdf+cytVZDVqUaV8O8+3xZ5v+tnKLmjll2dm9nNnY+LQADN/EbHhRhRJBQvXZRSeNqsR+mFhl/3k/FDVw+lf2TSag7QWLEdHq2FNKixhLcT/u9hHDaeCUvRmDksS8zS5Y09frnO0sOCDMA6Sp2wWkHGplKuXIIX/t0zpPIodfGyDOJ7Ud3I9QFmo/nMvtffVct6OrsqPBJATR1wvWvKFFAIIfhMyJc0ISdzNVYQ/3CHkZO0g2SqW6TWY8FsGZrEIF/9U+Ln/B0iVFoVuh6fzRwAGd/H9SOB58Mp6M65xfZCjayDKOV68Fe6kgCMhWDhtaZve9WUMUI55VGEyylq/ugW16OmeIjfw3ef2Rx/Vk8XD5KDvvM+afYph1jroFGqrz4D3re65koLGm2d+/10f+pVNAtZ7tT2RfJPGhTtAdsBmnKQWv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUd5L09Sd0RLaUVERTIwWlZHeDBNRjhMM1pnQmdZdjNFdGJpSXZQUnR2VVFS?=
 =?utf-8?B?RmJaTndnNlFxRDFKYkR1cVNoMHpFVDZRcGxTYUU2ZnV6aWdxTGY2ZHg4NXdz?=
 =?utf-8?B?YW9DdmhIQ0Vxenlhb3M3Wlg5TVNuemx6WFRCdmlLOUZPRzN0R2JWMGMweUk3?=
 =?utf-8?B?NEFROU56VjJUOWorYW00aVlVTGxFc2o4cTV4Q2x2SHJtemoyRFlsM29pNGhZ?=
 =?utf-8?B?UCtGeGRKRFcvcjJFakUwaUMzZTNKUHNuQTJucXpPK0Jibm1sakpYQjN2Ym01?=
 =?utf-8?B?V2IxNGMzVTVIK01yRUNJZDJROUF2Mm40YmdoSFZ1M0d0eUdaU0lQMTdPS3Vk?=
 =?utf-8?B?MFVCRkUrRndLc05QSjA2T3h6VFZLN1lWdVlVcElNSXI5eEZRRmcyWGcyb05L?=
 =?utf-8?B?Q1lNVWlZSUROcFczb2U0Y05JL2dPUE10T2Uxb3g5c2JsUmExUkx6SmJTTS9m?=
 =?utf-8?B?SXl2UnNabVFLOFJCYkJPd0ZkSnFwWGRqaDk5YVYyWnplcG9kRURIUHVwTlE4?=
 =?utf-8?B?TzhZZ1ZqZ3lteWlpMkc0bWFVaUN4SXZuMUtvM0FoVTFFS3FNVTVHMG56ZkR1?=
 =?utf-8?B?dTEraER2T2x4Sm5OYy9seEJVUkpWSVVZSG9mQVprR09RYWYxdW8xeVVXRzQy?=
 =?utf-8?B?UHZFTWl3em05Y0xKdzZ4TDVYYThRd0owQkhheG9KTVIwWER4cExxRkdQR2g5?=
 =?utf-8?B?SzVLcEZoV0JYbEhDU00zaFUwcU95Y2FTeTEyQlp0clB0ZTNRREdldTVFd0cr?=
 =?utf-8?B?QXJUNVc4SFFmQUZLbGs5SkNXWTZISkhKc0NwNkZtY2o2WHFRdnBpem4yUnJ6?=
 =?utf-8?B?T29rNnBKYVRrVC9Kdk1UTHhWS0pHalJNeWUwOGdzbmE2MmZicjFHbUpOeXFt?=
 =?utf-8?B?cmx3ZVY2V3MzcHZZbTArRVJFS1lPUm1YTkV6STdtUTRZQ1lmbGdpd2JSRlVt?=
 =?utf-8?B?bWh3SVRtcVBES1U5WFFOQXowZGRLczViZ3FqSlpXU1JUdkFQMDQwN1lmS2Nz?=
 =?utf-8?B?Y01yRzg4K3Q0WkowMWtIeWJyQXQzU1JEcUhkUklwdjdyTjNvY2R6dWJaazNK?=
 =?utf-8?B?UlZSZ2YzbVlGdDhnckZ3MTZ1L2Y2ZytweE1UNm5vNjNxQ3NuYnF6SStvYlkx?=
 =?utf-8?B?aktsVi9VNkpLRTlTOVkxSWR0cE10clE2cnAyS09BNnhVSXJmbWdyV0R6VXFM?=
 =?utf-8?B?M2xlSFFudjlINE40b0taVEIrVGplQ1NBKytiQ21Xdk1wOXVaci9tckREOHhT?=
 =?utf-8?B?T3RPeHV1UTRrTlFOS0ZVU1hwZnd4cTRVOXBhd2ptKzA5cTNXckFXMGtTMzdT?=
 =?utf-8?B?NHBpV2FjZFlXakRnL2VqMlZjbEx0cGJLSERWL1hraUpRVmtjdkxhSHVJUktJ?=
 =?utf-8?B?ckFjb2dSY05hdHVxSERieXRad1hualNiUmRTaC9ybHB4S1Zvd1NBbTVSWVlz?=
 =?utf-8?B?Wk9aVm9xdVd5ZGFuY1ZpMzNjWFdSMUNiRFdYOFA0dEpsREJBdytFaVFlZ3dh?=
 =?utf-8?B?ZGZmcnVmQzkwaUZtUUdNVXNOcEhEenBzN3FabHdWZnlOYk1tYkhlMi9xQUJX?=
 =?utf-8?B?ZGwwazlpbTZLZW56T1g1RU5rTnNSQjZQUEZCZk5aR0dUQUlMOHFWUjN6UTBx?=
 =?utf-8?B?a00raUlkR3ZnMVd6SGN4WDJ3Q0srOXY5N09IcG1RRzRWY2JOUVdCcE1OYVNi?=
 =?utf-8?B?OWZHaUhyTStwZ0RBcHhyaE1rMVlQc1NlQXlwb2VrYVR5WDhnTjM3cnF3PT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 962d7ffa-62b7-4cc0-6c0f-08da59c8d300
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 12:13:50.1259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0P286MB0611
Received-SPF: pass client-ip=40.92.98.92; envelope-from=dramforever@live.com;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jun 2022 12:14:00 -0000


On 6/28/22 18:17, Anup Patel wrote:
> We should write transformed instruction encoding of the trapped
> instruction in [m|h]tinst CSR at time of taking trap as defined
> by the RISC-V privileged specification v1.12.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu.h        |   5 +
>  target/riscv/cpu_helper.c | 235 +++++++++++++++++++++++++++++++++++++-
>  target/riscv/instmap.h    |  45 ++++++++
>  3 files changed, 279 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5c7acc055a..ffb1a18873 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -285,6 +285,11 @@ struct CPUArchState {
>      /* Signals whether the current exception occurred with two-stage address
>         translation active. */
>      bool two_stage_lookup;
> +    /*
> +     * Signals whether the current exception occurred while doing two-stage
> +     * address translation for the VS-stage page table walk.
> +     */
> +    bool two_stage_indirect_lookup;
>  
>      target_ulong scounteren;
>      target_ulong mcounteren;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4a6700c890..d11198f4f9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -22,6 +22,7 @@
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
> +#include "instmap.h"
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
>  #include "semihosting/common-semi.h"
> @@ -1057,7 +1058,8 @@ restart:
>  
>  static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>                                  MMUAccessType access_type, bool pmp_violation,
> -                                bool first_stage, bool two_stage)
> +                                bool first_stage, bool two_stage,
> +                                bool two_stage_indirect)
>  {
>      CPUState *cs = env_cpu(env);
>      int page_fault_exceptions, vm;
> @@ -1107,6 +1109,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>      }
>      env->badaddr = address;
>      env->two_stage_lookup = two_stage;
> +    env->two_stage_indirect_lookup = two_stage_indirect;
>  }
>  
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> @@ -1152,6 +1155,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>      env->badaddr = addr;
>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
> +    env->two_stage_indirect_lookup = false;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
>  
> @@ -1177,6 +1181,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>      env->badaddr = addr;
>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
> +    env->two_stage_indirect_lookup = false;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
>  
> @@ -1192,6 +1197,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      bool pmp_violation = false;
>      bool first_stage_error = true;
>      bool two_stage_lookup = false;
> +    bool two_stage_indirect_error = false;
>      int ret = TRANSLATE_FAIL;
>      int mode = mmu_idx;
>      /* default TLB page size */
> @@ -1229,6 +1235,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           */
>          if (ret == TRANSLATE_G_STAGE_FAIL) {
>              first_stage_error = false;
> +            two_stage_indirect_error = true;
>              access_type = MMU_DATA_LOAD;
>          }
>  
> @@ -1312,12 +1319,201 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          raise_mmu_exception(env, address, access_type, pmp_violation,
>                              first_stage_error,
>                              riscv_cpu_virt_enabled(env) ||
> -                                riscv_cpu_two_stage_lookup(mmu_idx));
> +                                riscv_cpu_two_stage_lookup(mmu_idx),
> +                            two_stage_indirect_error);
>          cpu_loop_exit_restore(cs, retaddr);
>      }
>  
>      return true;
>  }
> +
> +static target_ulong riscv_transformed_insn(CPURISCVState *env,
> +                                           target_ulong insn,
> +                                           target_ulong taddr)
> +{
> +    target_ulong xinsn = 0, xinsn_access_rs1 = 0, xinsn_access_size = 0;
> +
> +    /*
> +     * Only Quadrant 0 and Quadrant 2 of RVC instruction space need to
> +     * be uncompressed. The Quadrant 1 of RVC instruction space need
> +     * not be transformed because these instructions won't generate
> +     * any load/store trap.
> +     */
> +
> +    if ((insn & 0x3) != 0x3) {
> +        /* Transform 16bit instruction into 32bit instruction */
> +        switch (GET_C_OP(insn)) {
> +        case OPC_RISC_C_OP_QUAD0: /* Quadrant 0 */
> +            switch (GET_C_FUNC(insn)) {
> +            case OPC_RISC_C_FUNC_FLD_LQ:
> +                if (riscv_cpu_xlen(env) != 128) { /* C.FLD (RV32/64) */
> +                    xinsn = OPC_RISC_FLD;
> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_rs1 = GET_C_RS1S(insn);
> +                    xinsn_access_size = 8;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_LW: /* C.LW */
> +                xinsn = OPC_RISC_LW;
> +                xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> +                xinsn_access_rs1 = GET_C_RS1S(insn);
> +                xinsn_access_size = 4;
> +                break;
> +            case OPC_RISC_C_FUNC_FLW_LD:
> +                if (riscv_cpu_xlen(env) == 32) { /* C.FLW (RV32) */
> +                    xinsn = OPC_RISC_FLW;
> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_rs1 = GET_C_RS1S(insn);
> +                    xinsn_access_size = 4;
> +                } else { /* C.LD (RV64/RV128) */
> +                    xinsn = OPC_RISC_LD;
> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_rs1 = GET_C_RS1S(insn);
> +                    xinsn_access_size = 8;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_FSD_SQ:
> +                if (riscv_cpu_xlen(env) != 128) { /* C.FSD (RV32/64) */
> +                    xinsn = OPC_RISC_FSD;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_rs1 = GET_C_RS1S(insn);
> +                    xinsn_access_size = 8;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_SW: /* C.SW */
> +                xinsn = OPC_RISC_SW;
> +                xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> +                xinsn_access_rs1 = GET_C_RS1S(insn);
> +                xinsn_access_size = 4;
> +                break;
> +            case OPC_RISC_C_FUNC_FSW_SD:
> +                if (riscv_cpu_xlen(env) == 32) { /* C.FSW (RV32) */
> +                    xinsn = OPC_RISC_FSW;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_rs1 = GET_C_RS1S(insn);
> +                    xinsn_access_size = 4;
> +                } else { /* C.SD (RV64/RV128) */
> +                    xinsn = OPC_RISC_SD;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2S(insn));
> +                    xinsn_access_rs1 = GET_C_RS1S(insn);
> +                    xinsn_access_size = 8;
> +                }
> +                break;
> +            default:
> +                break;
> +            }
> +            break;
> +        case OPC_RISC_C_OP_QUAD2: /* Quadrant 2 */
> +            switch (GET_C_FUNC(insn)) {
> +            case OPC_RISC_C_FUNC_FLDSP_LQSP:
> +                if (riscv_cpu_xlen(env) != 128) { /* C.FLDSP (RV32/64) */
> +                    xinsn = OPC_RISC_FLD;
> +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> +                    xinsn_access_rs1 = 2;
> +                    xinsn_access_size = 8;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_LWSP: /* C.LWSP */
> +                xinsn = OPC_RISC_LW;
> +                xinsn = SET_RD(xinsn, GET_C_RD(insn));
> +                xinsn_access_rs1 = 2;
> +                xinsn_access_size = 4;
> +                break;
> +            case OPC_RISC_C_FUNC_FLWSP_LDSP:
> +                if (riscv_cpu_xlen(env) == 32) { /* C.FLWSP (RV32) */
> +                    xinsn = OPC_RISC_FLW;
> +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> +                    xinsn_access_rs1 = 2;
> +                    xinsn_access_size = 4;
> +                } else { /* C.LDSP (RV64/RV128) */
> +                    xinsn = OPC_RISC_LD;
> +                    xinsn = SET_RD(xinsn, GET_C_RD(insn));
> +                    xinsn_access_rs1 = 2;
> +                    xinsn_access_size = 8;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_FSDSP_SQSP:
> +                if (riscv_cpu_xlen(env) != 128) { /* C.FSDSP (RV32/64) */
> +                    xinsn = OPC_RISC_FSD;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> +                    xinsn_access_rs1 = 2;
> +                    xinsn_access_size = 8;
> +                }
> +                break;
> +            case OPC_RISC_C_FUNC_SWSP: /* C.SWSP */
> +                xinsn = OPC_RISC_SW;
> +                xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> +                xinsn_access_rs1 = 2;
> +                xinsn_access_size = 4;
> +                break;
> +            case 7:
> +                if (riscv_cpu_xlen(env) == 32) { /* C.FSWSP (RV32) */
> +                    xinsn = OPC_RISC_FSW;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> +                    xinsn_access_rs1 = 2;
> +                    xinsn_access_size = 4;
> +                } else { /* C.SDSP (RV64/RV128) */
> +                    xinsn = OPC_RISC_SD;
> +                    xinsn = SET_RS2(xinsn, GET_C_RS2(insn));
> +                    xinsn_access_rs1 = 2;
> +                    xinsn_access_size = 8;
> +                }
> +                break;
> +            default:
> +                break;
> +            }
> +            break;
> +        default:
> +            break;
> +        }
> +
> +        /*
> +         * Clear Bit1 of transformed instruction to indicate that
> +         * original insruction was a 16bit instruction
> +         */
> +        xinsn &= ~((target_ulong)0x2);
> +    } else {
> +        /* Transform 32bit (or wider) instructions */
> +        switch (MASK_OP_MAJOR(insn)) {
> +        case OPC_RISC_ATOMIC:
> +            xinsn = insn;
> +            xinsn_access_rs1 = GET_RS1(xinsn);
> +            xinsn_access_size = 1 << GET_FUNCT3(xinsn);
> +            break;
> +        case OPC_RISC_LOAD:
> +        case OPC_RISC_FP_LOAD:
> +            xinsn = insn;
> +            xinsn_access_rs1 = GET_RS1(xinsn);
> +            xinsn_access_size = 1 << GET_FUNCT3(xinsn);
> +            xinsn = SET_I_IMM(xinsn, 0);
> +            break;
> +        case OPC_RISC_STORE:
> +        case OPC_RISC_FP_STORE:
> +            xinsn = insn;
> +            xinsn_access_rs1 = GET_RS1(xinsn);
> +            xinsn_access_size = 1 << GET_FUNCT3(xinsn);
> +            xinsn = SET_S_IMM(xinsn, 0);
> +            break;
> +        case OPC_RISC_SYSTEM:
> +            if (MASK_OP_SYSTEM(insn) == OPC_RISC_HLVHSV) {
> +                xinsn = insn;
> +                xinsn_access_rs1 = GET_RS1(xinsn);
> +                xinsn_access_size = 1 << ((GET_FUNCT7(xinsn) >> 1) & 0x3);
> +                xinsn_access_size = 1 << xinsn_access_size;
> +            }
> +            break;
> +        default:
> +            break;
> +        }
> +    }
> +
> +    if (xinsn_access_size) {
> +        xinsn = SET_RS1(xinsn, (taddr - env->gpr[xinsn_access_rs1]) &
> +                               (xinsn_access_size - 1));

I think this should be (taddr - (rs1 + imm)), where imm is the immediate
field if there is one, and 0 if there isn't.

Otherwise, the encoding part looks fine. I don't know about QEMU
codebase to comment on the other parts.

Regards,
dramforever

> +    }
> +
> +    return xinsn;
> +}
>  #endif /* !CONFIG_USER_ONLY */
>  
>  /*
> @@ -1342,6 +1538,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
>      uint64_t deleg = async ? env->mideleg : env->medeleg;
>      target_ulong tval = 0;
> +    target_ulong tinst = 0;
>      target_ulong htval = 0;
>      target_ulong mtval2 = 0;
>  
> @@ -1357,20 +1554,43 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      if (!async) {
>          /* set tval to badaddr for traps with address information */
>          switch (cause) {
> -        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> -        case RISCV_EXCP_INST_ADDR_MIS:
> -        case RISCV_EXCP_INST_ACCESS_FAULT:
>          case RISCV_EXCP_LOAD_ADDR_MIS:
>          case RISCV_EXCP_STORE_AMO_ADDR_MIS:
>          case RISCV_EXCP_LOAD_ACCESS_FAULT:
>          case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
> -        case RISCV_EXCP_INST_PAGE_FAULT:
>          case RISCV_EXCP_LOAD_PAGE_FAULT:
>          case RISCV_EXCP_STORE_PAGE_FAULT:
>              write_gva = env->two_stage_lookup;
>              tval = env->badaddr;
> +            if (env->two_stage_indirect_lookup) {
> +                /*
> +                 * special pseudoinstruction for G-stage fault taken while
> +                 * doing VS-stage page table walk.
> +                 */
> +                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
> +            } else {
> +                /*
> +                 * The "Addr. Offset" field in transformed instruction is
> +                 * non-zero only for misaligned access.
> +                 */
> +                tinst = riscv_transformed_insn(env, env->bins, tval);
> +            }
> +            break;
> +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> +        case RISCV_EXCP_INST_ADDR_MIS:
> +        case RISCV_EXCP_INST_ACCESS_FAULT:
> +        case RISCV_EXCP_INST_PAGE_FAULT:
> +            write_gva = env->two_stage_lookup;
> +            tval = env->badaddr;
> +            if (env->two_stage_indirect_lookup) {
> +                /*
> +                 * special pseudoinstruction for G-stage fault taken while
> +                 * doing VS-stage page table walk.
> +                 */
> +                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
> +            }
>              break;
>          case RISCV_EXCP_ILLEGAL_INST:
>          case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
> @@ -1450,6 +1670,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          env->sepc = env->pc;
>          env->stval = tval;
>          env->htval = htval;
> +        env->htinst = tinst;
>          env->pc = (env->stvec >> 2 << 2) +
>              ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
>          riscv_cpu_set_mode(env, PRV_S);
> @@ -1480,6 +1701,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          env->mepc = env->pc;
>          env->mtval = tval;
>          env->mtval2 = mtval2;
> +        env->mtinst = tinst;
>          env->pc = (env->mtvec >> 2 << 2) +
>              ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
>          riscv_cpu_set_mode(env, PRV_M);
> @@ -1492,6 +1714,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       */
>  
>      env->two_stage_lookup = false;
> +    env->two_stage_indirect_lookup = false;
>  #endif
>      cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
>  }
> diff --git a/target/riscv/instmap.h b/target/riscv/instmap.h
> index 40b6d2b64d..f877530576 100644
> --- a/target/riscv/instmap.h
> +++ b/target/riscv/instmap.h
> @@ -184,6 +184,8 @@ enum {
>      OPC_RISC_CSRRWI      = OPC_RISC_SYSTEM | (0x5 << 12),
>      OPC_RISC_CSRRSI      = OPC_RISC_SYSTEM | (0x6 << 12),
>      OPC_RISC_CSRRCI      = OPC_RISC_SYSTEM | (0x7 << 12),
> +
> +    OPC_RISC_HLVHSV      = OPC_RISC_SYSTEM | (0x4 << 12),
>  };
>  
>  #define MASK_OP_FP_LOAD(op)   (MASK_OP_MAJOR(op) | (op & (0x7 << 12)))
> @@ -310,12 +312,20 @@ enum {
>                             | (extract32(inst, 12, 8) << 12) \
>                             | (sextract64(inst, 31, 1) << 20))
>  
> +#define GET_FUNCT3(inst) extract32(inst, 12, 3)
> +#define GET_FUNCT7(inst) extract32(inst, 25, 7)
>  #define GET_RM(inst)   extract32(inst, 12, 3)
>  #define GET_RS3(inst)  extract32(inst, 27, 5)
>  #define GET_RS1(inst)  extract32(inst, 15, 5)
>  #define GET_RS2(inst)  extract32(inst, 20, 5)
>  #define GET_RD(inst)   extract32(inst, 7, 5)
>  #define GET_IMM(inst)  sextract64(inst, 20, 12)
> +#define SET_RS1(inst, val)  deposit32(inst, 15, 5, val)
> +#define SET_RS2(inst, val)  deposit32(inst, 20, 5, val)
> +#define SET_RD(inst, val)   deposit32(inst, 7, 5, val)
> +#define SET_I_IMM(inst, val)  deposit32(inst, 20, 12, val)
> +#define SET_S_IMM(inst, val)  \
> +    deposit32(deposit32(inst, 7, 5, val), 25, 7, (val) >> 5)
>  
>  /* RVC decoding macros */
>  #define GET_C_IMM(inst)             (extract32(inst, 2, 5) \
> @@ -346,6 +356,8 @@ enum {
>                                      | (extract32(inst, 5, 1) << 6))
>  #define GET_C_LD_IMM(inst)          ((extract16(inst, 10, 3) << 3) \
>                                      | (extract16(inst, 5, 2) << 6))
> +#define GET_C_SW_IMM(inst)          GET_C_LW_IMM(inst)
> +#define GET_C_SD_IMM(inst)          GET_C_LD_IMM(inst)
>  #define GET_C_J_IMM(inst)           ((extract32(inst, 3, 3) << 1) \
>                                      | (extract32(inst, 11, 1) << 4) \
>                                      | (extract32(inst, 2, 1) << 5) \
> @@ -366,4 +378,37 @@ enum {
>  #define GET_C_RS1S(inst)            (8 + extract16(inst, 7, 3))
>  #define GET_C_RS2S(inst)            (8 + extract16(inst, 2, 3))
>  
> +#define GET_C_FUNC(inst)           extract32(inst, 13, 3)
> +#define GET_C_OP(inst)             extract32(inst, 0, 2)
> +
> +enum {
> +    /* RVC Quadrants */
> +    OPC_RISC_C_OP_QUAD0 = 0x0,
> +    OPC_RISC_C_OP_QUAD1 = 0x1,
> +    OPC_RISC_C_OP_QUAD2 = 0x2
> +};
> +
> +enum {
> +    /* RVC Quadrant 0 */
> +    OPC_RISC_C_FUNC_ADDI4SPN = 0x0,
> +    OPC_RISC_C_FUNC_FLD_LQ = 0x1,
> +    OPC_RISC_C_FUNC_LW = 0x2,
> +    OPC_RISC_C_FUNC_FLW_LD = 0x3,
> +    OPC_RISC_C_FUNC_FSD_SQ = 0x5,
> +    OPC_RISC_C_FUNC_SW = 0x6,
> +    OPC_RISC_C_FUNC_FSW_SD = 0x7
> +};
> +
> +enum {
> +    /* RVC Quadrant 2 */
> +    OPC_RISC_C_FUNC_SLLI_SLLI64 = 0x0,
> +    OPC_RISC_C_FUNC_FLDSP_LQSP = 0x1,
> +    OPC_RISC_C_FUNC_LWSP = 0x2,
> +    OPC_RISC_C_FUNC_FLWSP_LDSP = 0x3,
> +    OPC_RISC_C_FUNC_JR_MV_EBREAK_JALR_ADD = 0x4,
> +    OPC_RISC_C_FUNC_FSDSP_SQSP = 0x5,
> +    OPC_RISC_C_FUNC_SWSP = 0x6,
> +    OPC_RISC_C_FUNC_FSWSP_SDSP = 0x7
> +};
> +
>  #endif

