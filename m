Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzdAH-00089R-0K
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 07:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1nzdAA-00083u-Lc; Fri, 10 Jun 2022 07:50:54 -0400
Received: from mail-os0jpn01olkn20825.outbound.protection.outlook.com
 ([2a01:111:f403:700c::825]:22185
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1nzdA8-0007NM-2b; Fri, 10 Jun 2022 07:50:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5ioR6p3602bj4IlmS5TLt15RBWZ8oI/E71iATlb7mYEWgckGvZKdSjX0TxydI37qO7stEeSapLM9xCuB/vVBsMtpFnbwUkhYUf6G9orJc3RWp2jBOkCVtrFjKT+VjqP6e+AiWladhotoHwUQiSx+knBeljyKRBd7J6sr4azU9xH1yuYI5mX0m/gu4iZw2EPvi0LLoExYyUTcDDe1pefRDyCfe9Y4yjMa9CS6slkUAcu0w0qapkAYl4Q7kZZd68jkBm1kAQub8WODFQGhxglBwDUCyEXVA9WJCi77iGuthUSOdz9u1tbzS4CXRs+FesLuU0xGymhpU7O8vDGEwVldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDxou4FlJZjynr+ViMVN+48mA92/Rms7bJMmVYpXaxY=;
 b=Ab9ftvca41WrF5HqELDjJwUv8o+H1taTD84XEBJLM+NYXSlQfv8yoH5alnSN6jJ4HQ9um/1w3F4vAewmQqd5PpkZ9YDRWlJUaRFhYc4PvjzvcMHqUUY4ke9YwbnUiMs5Exvj44FdDgjA89mCHmX/TbEL5Guf3p18hpCCk0piEjajfCgKaVSSE92hwiCUcgywCgQcsrgwqc6AyTszmA9QIKz7Aa8GdP9wOhxiZY//4zmNVNMn7P/vgZ2oax7J+J5aJQ+M+2PF+fZuLXnc2qDHf2lOMoFE9cuRATIAVwNs8hrCwHhZzOM0uFa3F7K8pYH5+UFEVRibtO3ZlQs7E7DyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDxou4FlJZjynr+ViMVN+48mA92/Rms7bJMmVYpXaxY=;
 b=IcmpB97slD/FJocObIODtEu4qPLc0i9e8vK4sOHyxhMaaMgwwaTGMBUuhyG9Mk0EE73H0QnnWOQWSLjW8XUOar22/GmSVD7gH0nW2CsRJ0jeC1JgBY025Wwk6w+TEFzlOa5DZtsL4mH9hhgy54lvDjOQynhRJtqrSZSjHxB/xyMr6KvgVeG1ZGGWwBI9WWhDK8o37Z2N+RmqZS26MPgL96dFJy+yG4KqYYF4nkP/da168xmEEbSPqVAMPHhe5uilndNv5DxdOYIjT69gO8tojpoIruFv43OIcg+mnHF+kmMUxUkCphHSU9/CqUwW6V73Ep7IuX/h5O2P1Uxyid5QyQ==
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:df::12)
 by TY3P286MB2802.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:250::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 11:50:39 +0000
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d46a:33ed:9885:418d]) by TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d46a:33ed:9885:418d%5]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 11:50:39 +0000
Message-ID: <TYYP286MB1439D28F79FE7CE82885DB9DC6A69@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Date: Fri, 10 Jun 2022 19:50:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
References: <20220609033011.752714-4-apatel@ventanamicro.com>
 <OSZP286MB1435EBB271F8E9EEF5E2EF95C6A69@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
 <CAAhSdy1zyiV9PgDCY+4ijrzfeAdJ44wfT0b5dY+NqXzieZo_KQ@mail.gmail.com>
From: dramforever <dramforever@live.com>
In-Reply-To: <CAAhSdy1zyiV9PgDCY+4ijrzfeAdJ44wfT0b5dY+NqXzieZo_KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [C5+T6d8CZT+g9GlnNH/V2qAmXQorWV6r]
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:df::12)
X-Microsoft-Original-Message-ID: <2b798a0a-1e02-a62a-80d7-e3accdb24d86@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a66e6c6d-a35b-4534-5073-08da4ad77057
X-MS-TrafficTypeDiagnostic: TY3P286MB2802:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fmk44msgkJx+3WWTf01mxkModO5uuIqdZes34WvuTCbseL/I5OtGiObc0G18MQGl/gZcym53nPz8QqLoPbcC/we/zPxI28GqVyfhx89bOwgsv1Qyq6ApBDqaXufKV4PTiFQUIuPLCa9HcRiRon9eD6h7W443RJsw8C98Jz0qn+J5y65Wbxm1U3p688TNabSk8HqWL3jNk8VJKyJGYbjcLh/kMt0q4bRUHVPfaqNPMtE9PobclsU1EgrDx01Dz81kQBbmJSrytse2yfSqs2xsz0bbcVtgfIpQQyShLrr5Bsrs92X6faYz1AoJlcmtGNtdZ3cpo6Shx29ULlr4XPx5SXM13W6z23ScUeeN57C0SDz/zdkLuYyvL8SonSAldjVxz8ozOzB1V8udzGzk4BFUv4GS5WCO4ddSVNCXpqznwsT38FV5rKWAK2Mu+OxQrbGBuNfwUJRa/tehXUibj9QnSAp4lAJVQw0ozKaZwCB1Jw8HiPJIPlw6/Q/yrdikVAq3DB3HgqDtQRzOb+DFggWS5FFMV8oBhNbWM26oJu/tMky4fS5S1jNbjDrDPfNBogeb1ksDuF0WTmyvuHSa4+Gr4A==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUZqaXUzbGtEOXE1YWtTVXg4V2pzcVlxemFSaEc4WVFqdlRqS3hYR2hjMHZa?=
 =?utf-8?B?Ly9YNkc4aWhJRUNLbXNkQ0F6ZUVGUjIzUVBqSkllbDBNVEFEbmZZWm5ySXI4?=
 =?utf-8?B?QTQxRnh2Umo4K2JwZEtGb1BKclpFNDA4VldPcE5NVTFRYlR6V0dHd3hubTVO?=
 =?utf-8?B?a3daMjdVbWVzWEE0b3NqY0RiYnI4MG0wS2RZMVl4MjlPdHlZem90VkFkenpP?=
 =?utf-8?B?a0lxTVpGeURSRzc1Ym5kNENaWVJhTEdTV3hLSHlLSlIvdGNSVzF0cDlvSThT?=
 =?utf-8?B?ODZmaE1UYlhMcE1QdzNPZHRZWFNKRVkrZ2NiSDJscDBWRnRpaWpaaERtcDZT?=
 =?utf-8?B?Rk5EOTUvcGpMSVQwcFFLZVFrU1N2S09RbmJFRFJpQmE2VUdmTTZTQ3pFVy9r?=
 =?utf-8?B?YVRuTElsaWg2YXRBdittK0ZjT0VOU2dxT0I2RUM2SEtiTUxZTnZ3QmJpZmh3?=
 =?utf-8?B?OVdPUEsxam5VaGFEekNwbmhwU0RSQitMTm5qMTR2Uk1HVC9RZ1lhNXUyTzQv?=
 =?utf-8?B?aHdXRDdwZHVsTDNXT3BpNGtLVDFqdS9qVW5KbXZTUEJvQ2ZLTW1aVjhGdFFS?=
 =?utf-8?B?WnpOY2N3TWlqQkNTc3VuaDh0bnpqMFM2bEMxaUhTYVlCU1VOajVSWEtsTE5W?=
 =?utf-8?B?N0UwVXFqZnhQYi9weTYxR2FHVThQVHNIMDgvanNEL1BZaWRRaGJZTFd5QXFB?=
 =?utf-8?B?YW5aYWpQZm04TU5XakNxUmdYZXpWS1JtaGhPSDUyZkFDWmZ4bVhSU241VXJN?=
 =?utf-8?B?dVZ0UnhUZ0VVOTU1dTJLNnBKL0d5dEg2TVVmZzNObjdUa3MxSXNTa3VLNjVW?=
 =?utf-8?B?UGJJVFpsY05ybVBVbDNiNlpmREtjcEZjZ0FLSlhRM3lhaVQ1YU9URG9EZGUw?=
 =?utf-8?B?ckEvZ3VNdVFvY0thekc1RmtDVy9MZzhVa29ZbUNxMUZOUDl3OWVNMFB4L3FT?=
 =?utf-8?B?bkwyUFdiZU1hRHJDb2lXenpxQ2ZtTS82UmgvdHZLU01renNUcGdpdGR0aFRB?=
 =?utf-8?B?UVVpRFg5cW9UZ24xRm5XWDVhNzI5eDkrQnVraFA3YXlLcU9VUFd0YmNpbDdX?=
 =?utf-8?B?UEpWdTBRazdCSDFQQU5CSkswc3FiZ1h0QlRNbW5lMGpXeElIVWRxZUJmREh0?=
 =?utf-8?B?amtFZ0dIQXJVTmVVV29PcDlpV2ppRWxNTVR1NnJ2RVZ4SS8rRXBnRCszK09B?=
 =?utf-8?B?T0Fnd2FCbkg3cmg2OFA4a0QrWkd4QldXOGJ2YldSblBEUktTR3JPSzdnMWt5?=
 =?utf-8?B?TzJDMDBqSFozRVFJTWhZSDQvdFpUb2h3MTk0d3ZpVXpSNW5NNGVzWWk5dkN4?=
 =?utf-8?B?c1ZUZHo5dGFhTTZpMkFGbFFmNFdJRHVqeWNJSlNNUzRJRlJRQmljeHpUM201?=
 =?utf-8?B?cUZ1a2hteWgvSUZMS0s0anE2NmppdlZyUFdkL0srZXl6REx2a3JhdGtFSEhn?=
 =?utf-8?B?UThnTUg1ajQ4SGRpc2VVQzFWRW5iQ3gwZnVGWU9kYlFhZ3RCSEs4YkJmcENH?=
 =?utf-8?B?S2lrYVdqaUNneXhlQzdDUEVDaVlhMnJOUGdvMUN2U25JWjFPT0k5V0kyRU04?=
 =?utf-8?B?RE9LVWdVSFhnSi90K1A4bll4Y2RmZ3RIbnJEcllXYmJxT3JhNXhHQUVCdlRE?=
 =?utf-8?B?cng5Y21mRFVtcXVBdlNveXZFTXJ1L1lkZmx5SGNVTzhBYnh4YVBOL244SlFq?=
 =?utf-8?B?VkY2aTRpSTZobGp0SisxQVMvc3FjWUEyY0owUUZCd05CVkRXY3o5NGFXM05D?=
 =?utf-8?B?bkdSYXVhMEp0TkFnMGVsODFnOVEwR1FmbmFrN3MraDVwSU85dWN4K0JTVjhJ?=
 =?utf-8?B?V1phTm5BeExEdVRQRjdKblozYkp6QzFBUTVnNklPMktTc09yV2tRMjVBTG1S?=
 =?utf-8?B?NDF2N093T1ZDQmtObUN4YWtaYUY5bDNHZk1BZFREL21LZUthTFJOYmM3SDBW?=
 =?utf-8?Q?yYV6O5j60IA=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a66e6c6d-a35b-4534-5073-08da4ad77057
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 11:50:39.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2802
Received-SPF: pass client-ip=2a01:111:f403:700c::825;
 envelope-from=dramforever@live.com;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jun 2022 11:50:55 -0000

>
>> In addition, the various V-extension vector load/store instructions do not have
>> defined transformations, so they should show up in [m|h]tinst as all zeros.
> Okay, I will update.
Just a clarification/suggestion: It might be easier to only write non-zero for
instructions with currently defined transformation. Writing zero is always
legal, but writing an undefined transformed instruction is not.
>>> @@ -1355,18 +1558,31 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>>>      if (!async) {
>>>          /* set tval to badaddr for traps with address information */
>>>          switch (cause) {
>>> -        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
>>>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
>>>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
>>> -        case RISCV_EXCP_INST_ADDR_MIS:
>>> -        case RISCV_EXCP_INST_ACCESS_FAULT:
>>>          case RISCV_EXCP_LOAD_ADDR_MIS:
>>>          case RISCV_EXCP_STORE_AMO_ADDR_MIS:
>>>          case RISCV_EXCP_LOAD_ACCESS_FAULT:
>>>          case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
>>> -        case RISCV_EXCP_INST_PAGE_FAULT:
>>>          case RISCV_EXCP_LOAD_PAGE_FAULT:
>>>          case RISCV_EXCP_STORE_PAGE_FAULT:
>>> +            write_gva = env->two_stage_lookup;
>>> +            tval = env->badaddr;
>>> +            if (env->two_stage_indirect_lookup) {
>>> +                /*
>>> +                 * special pseudoinstruction for G-stage fault taken while
>>> +                 * doing VS-stage page table walk.
>>> +                 */
>>> +                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
>>> +            } else {
>>> +                /* transformed instruction for all other load/store faults */
>>> +                tinst = riscv_transformed_insn(env, env->bins);
>>> +            }
>>> +            break;
>>> +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
>>> +        case RISCV_EXCP_INST_ADDR_MIS:
>>> +        case RISCV_EXCP_INST_ACCESS_FAULT:
>>> +        case RISCV_EXCP_INST_PAGE_FAULT:
>>>              write_gva = env->two_stage_lookup;
>>>              tval = env->badaddr;
>>>              break;
>> Instruction guest-page faults should set [m|h]tinst to one of the
>> pseudoinstructions if env->two_stage_lookup is true. Otherwise it should set
>> [m|h]tinst to zero.
>>
>> In any case, as this seems to be one of the first implementations of
>> [m|h]tinst, it might be worthwhile to confirm with the spec authors and clarify
>> any unclear bits before this gets released.
> This is already handled because tinst is initialized to zero.

If an instruction guest-page fault occurs due to a G-stage fault while doing
VS-stage page table walk, i.e. env->two_stage_indirect_lookup is true (I had
mistakenly wrote env->two_stage_lookup earlier), and the faulting guest
physical address (env->guest_phys_fault_addr) is written to mtval2/htval,
[m|h]tinst must be a pseudoinstruction and not zero. This case is not handled
in the v5 patch.

dramforever

