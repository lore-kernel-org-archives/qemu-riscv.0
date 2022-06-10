Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzeAX-0001oD-JJ
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 08:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1nzay2-0005i9-Ad; Fri, 10 Jun 2022 05:30:12 -0400
Received: from mail-os0jpn01olkn20829.outbound.protection.outlook.com
 ([2a01:111:f403:700c::829]:19621
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1nzaxz-000322-VJ; Fri, 10 Jun 2022 05:30:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMiB6RW6WQLsyPpR9jLy8Oe8RCWvxVTL8WS1dIAfRNyD/WPszsVgjyjCg5MUIcr38uAYrGeMzWIkFITlGtY4B59ofSLjGlzgGHr01VtJ2cg59DpEOLwnpU71VjVqoIsIr9nDGmo0Mp7mqJ/1EEVfc7Bbg8mrLU51NJ6uWK5aO4LeAximHK9WND6L+biV1BUy0h8/EUy4shONS4fyE+c/bFtZxY6WZt8lMqBN4GeJ49E/E2BVAFqVxFDLeK+S4d0lnbOJ1lK2JWNbTsvQ5z5FXRhcS9ZOlu3jbSS0KX2MnVLWkNn9EzqAL4ynWTKm8Fgq+aT6N+WP0XR4VwjxOs0ebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8l+ACV8FVKsnDQ0ObwJxeJe4Rt4lOF/6WP0vGHGMsNw=;
 b=TK2kUBmirxoAbX+6cHVb9rpEaF9EQbBYZ9YclMYDZOuOhlltRQOIpa7eyeS0vpXwaUpxMB1TwwnWD3Do2IWX5rGqYcvblvbS8FswSLLlmOLcAz5qdeOWT9Y5Pa5ukiAUynKp7eAEIYLyLTdmNDPLsEIGngGkrcoH4CgYHS7P6L+ChJK9+GxJgB0gvNQ36oqmliaKveiDlO7+oZHpdkYYpKnFO4S+AKNRp7XNMq3lUO+b+E1Edi5qmwsiBqOFt4jQe17GLqcHVn0ZKq6evbb06PQ34lQjQ5pwwWrdUEsOvVFulvqhu9qd8Ly4mUW92w8i1ZmmyBwqGMwT3RVPyHtBZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l+ACV8FVKsnDQ0ObwJxeJe4Rt4lOF/6WP0vGHGMsNw=;
 b=rAjF2Y1SjSRVX88X3NjE0OBXuTWfexcA7Wj56+TC5D2Rb4cEfA4m0GJ8EVM4JEzwd6TG7D1tRjaHbxLS7EKnjZh4xDZ42pPF1C4eP6RbQS/uzbhtZv7ayMtUG0V8aXONcYJFEWKrNDF4ZSg1G8UCWZ1/1DnUrScgBpxIivjUzBze24+/aTRrukGz0zBkLDcMmqWvtOsgteNAihPKpvyI7hbPSOANazNH5eOq3RavM7RoesH6mcTaluONa1JBg0XUlCRtV9GxMjv0fgPnTENczbEIy2MplNfTZVo4HYLEgLy2SITTbakjgTimiPN5bXp0qyYdrA/4ig/P681gyzmxkQ==
Received: from OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:11a::8)
 by OS3P286MB1009.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 09:30:00 +0000
Received: from OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM
 ([fe80::387d:5727:359e:9b3]) by OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM
 ([fe80::387d:5727:359e:9b3%8]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 09:30:00 +0000
From: dramforever <dramforever@live.com>
To: apatel@ventanamicro.com
Cc: Alistair.Francis@wdc.com, anup@brainfault.org, atishp@atishpatra.org,
 palmer@dabbelt.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu
Subject: Re: [PATCH v5 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
Date: Fri, 10 Jun 2022 17:29:43 +0800
Message-ID: <OSZP286MB1435EBB271F8E9EEF5E2EF95C6A69@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220609033011.752714-4-apatel@ventanamicro.com>
References: <20220609033011.752714-4-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [T9c6uQxuOlzpEQvXJLCy1BxFcN+VwmwU]
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:11a::8)
X-Microsoft-Original-Message-ID: <20220610092943.1324847-1-dramforever@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ef2a9e3-85f8-4b51-0abe-08da4ac3c9d3
X-MS-TrafficTypeDiagnostic: OS3P286MB1009:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qCTXLdI7a+k+stDuGrqL7B8noIFvR0cnGhuKFgoBnRRHzaDOn1O5KkOyGhJcSrWBoAsT3Aoqq8ri2bK3i/YGQIhaqyTGY2VWV3KuEuPspcgw0Fm4QBMIyCvIzYAGkIG7QVIysZwaOsiZaOgARZprA821oLLkQF2HwXOev/H2JBrwQVfmJ/NGBfBcEhe4hSuJFVQXBhUDwaznBIHxRBMk6Ptnos8dTF1RKoT6X80nSU+KpIBLc6K7Agr9H8Y/iwWiNKsBGgbbY0Na8wG7aGdKjN7ietUbJeelmo5HQBfebIZdd0sPO00pMmyp1Iz5USJ0I13eQ1lNIYZ3+KIkkzl/93rXb9B7o+TlIehPXYKjLs9FtTrfirGTB4H+pr6EpUAsogm8sSu0qIceHbxqI4TfFHnxGJv7eM3kao9GGXCpNkUoTvZtFDVASl/jjPuifTT/GoB4J1VpIE6+3oxYe49x6z8tALmNLQRnVJJxuPeWnqPOXnbjTx2FnHovuLZ+xne1kRu+fw4Vt8LWlzhkxe0SW++UweT+W2suHkBZyGIjcwLAuTLwDwSTNDZ/raJKintTLDdeSXup6IlImTAvDxMwfQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjhHNnJHTUFUVkd5eURqR1ZNdjZCbmhVdDVTYXlIcUtzdXl6Z3BuZCs2Z3Nl?=
 =?utf-8?B?Sk5QejFGS25IZ29XM09WeUJBdFE1SDMyTXBKdndncjIxTTNDbXp4T25mWHFx?=
 =?utf-8?B?YllKQjNGMGhodnVVVWhla3JIV1NBa2ZOZXpxWWRlandiTmRRUWsxWUdURHN0?=
 =?utf-8?B?YmFUQjVvODNkQ3pBREhhNVY0VXowQVFncTVWckZ4QjlpWmVocGdvMDM4VHgx?=
 =?utf-8?B?SXdRN3BxMzRDYWx1SmkxMWlNdjlwSjZXK0t1K1U2SzdLSEN0bG0vMkhMZHl3?=
 =?utf-8?B?S1dMTld6QmlWYUhzc0tXMXdFQzJlelN0V2VHNzBwMzQ3OTZ1UFRyWGtqMU9O?=
 =?utf-8?B?QnhvMXpYTm1yY0RDanZSczBlU0M3L0x4VDVoK1BWWDVTVDBSR2dhRlRDbkY2?=
 =?utf-8?B?SlduTmdiOHdnR29YS2tqOWRuc01jZm03YjJic2lZOUo3bFlOZmtUT2ZOWTgv?=
 =?utf-8?B?NjJIYlpxbVZxcXhpWWpmMGVqN1NKSEVzeUN3d0loS2N3d0ZabzdYaVZ6ZWx6?=
 =?utf-8?B?ZFBwYnk2MWcwQytoVWpPMGFuU0JvSjJvakcrVFVlVEl6cEd3OWV2WWVWVGRl?=
 =?utf-8?B?c2RVYnNxdVFBcVFNM1YrV0NyeEIzSFI3Rlc0bFYyV3VtbWVVVXZSUHpVV2dq?=
 =?utf-8?B?bnNxcDZZdWVYL3pqU081OEZDVmhnN1JCcFVKQVNvcTFlVndWVkkyMkNMVThn?=
 =?utf-8?B?ZjVzM1pSMDZQQmlmdkdJdXpQdzJ6SXk2b1ltMTRHOGVEajB2Nm15TnV3eXpV?=
 =?utf-8?B?dEZzOE5pTVVDMk1UNVQ3dHBNOEdwNFVOVGZjeU9NanVsSWpmbkJZSUxlYUY0?=
 =?utf-8?B?U28wWWdGKzEzVlhPMDVySCs4MUlDdUxranE3TzA0K3dhZTdJZmdoaEd3OXpK?=
 =?utf-8?B?MVBSdEpma0FtdFVCWkQ2OG1tR3haS1Y4eXROeVRIU1lBZ2d4cHNERGZJeSsy?=
 =?utf-8?B?UnYrdFdRK1oxOTV4ZzBIMFV1THNaTE95eldEUnhQRWY1UktBOWs1d0JsWVpJ?=
 =?utf-8?B?b01jdEQ0K1Z3L2hVeDBTVjg2NS9RcjAzR292bzZORVhUMXM2RVRYamc2YVN0?=
 =?utf-8?B?Y2UrYW9kUGYrVGlrTVJDeWpaNnBOTXRYbmJ6T2txcDFqRmlqMzBVd0EwUFJG?=
 =?utf-8?B?WXNGcmJJUC9jY2dEUlZJcUM2clRuQjZJckRoc0RaNmdNTStRaTJZQ1JBOWFG?=
 =?utf-8?B?bm8weExTcHk2TDZoSERPczU4Z3NxZjZlRURnN1BNRWtXVzNNZ2NJR3ExZktk?=
 =?utf-8?B?cGFML3J4bCtMS1p3T0dvc3hBVHJjMmM5K3RYMVVBWUlnZWIyN3h1WnNmclRP?=
 =?utf-8?B?UTh0bmg4UkI4R1BuKyt2NmNXK1BTRjJ6c3FVZ0ljRWRLdTEwOHBEbDVRTnhl?=
 =?utf-8?B?VW5JWFpQSnh5UFAvRnNlNXRIeE9WZll6bkZUV213Wk5XWVRNZlhQa051ZWNw?=
 =?utf-8?B?NmlMSzVkYXZENzY4UlJKQzUwY2xHOXQySm5hcDN0OUY1N25tdFdaRnF4emMv?=
 =?utf-8?B?b1NhL1NGZjdMcXVQN2RaNkQ3MEY0aUI3ZXk3VTRMMmYwR2UwK2cwYmlTZ0No?=
 =?utf-8?B?YjJLbmdyY1RidnpqaDJ2aHR3cG5qYlFTT042TFR5YUtsLzZlb0hzNE5oV2cx?=
 =?utf-8?B?LzNGQUNZRjh1T0pWSUF2NmEzdld2TGJSUnU3QjJSZHlBV1Rza2ZzOWtmNUkr?=
 =?utf-8?B?VmF0WXNBdGlKNW5RNE1IK3FYd1k3YThpZTFrdDVtSXVqVjF3YmlRbVJjTEhM?=
 =?utf-8?B?emR4OXJTWHZwZktsZkZ5T01zNHpoeTI1NmMyNC8rUFNrNmRXdWdlYmRNOXRz?=
 =?utf-8?B?Z251ekZuTEZaS3QvdlVEZERaQ2FIZzlmVDNPZ1Z5TTZ3bUNFT1JUMFRPMEN5?=
 =?utf-8?B?L2RQQjBGT1lxV05UOHM5aGNCOHU2bm5pUDR2TDJ5c24reWorTzVzNmNhVkpJ?=
 =?utf-8?Q?FOXhZIqLwWU=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef2a9e3-85f8-4b51-0abe-08da4ac3c9d3
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:29:59.8363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1009
Received-SPF: pass client-ip=2a01:111:f403:700c::829;
 envelope-from=dramforever@live.com;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:55:16 -0400
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
X-List-Received-Date: Fri, 10 Jun 2022 09:30:15 -0000

Hi Anup Patel,

I think there are some misunderstandings of the privileged spec with regards to
[m|h]tinst handling. Here are some possible issues I've found:

> +            case OPC_RISC_C_FUNC_FLD_LQ:
> +                if (riscv_cpu_xlen(env) != 128) { /* C.FLD (RV32/64) */
> +                    xinsn = OPC_RISC_FLD;
> +                    xinsn = SET_RD(xinsn, GET_C_RS2S(insn));
> +                    xinsn = SET_RS1(xinsn, GET_C_RS1S(insn));
> +                    xinsn = SET_I_IMM(xinsn, GET_C_LD_IMM(insn));
> +                    xinsn_has_addr_offset = true;
> +                }
> +                break;

The privileged spec requires that 'for basic loads and stores, the
transformations replace the instruction’s immediate offset fields with zero',
so this SET_I_IMM() line isn't necessary. Similarly for all the compressed
instruction cases, the SET_I_IMM() and SET_S_IMM() calls are all unnecessary.

> +    } else {
> +        /* No need to transform 32bit (or wider) instructions */
> +        xinsn = insn;

For AMO, lr, sc, and hypervisor load/store instructions, this is fine. But as
above, 32-bit integer load/store instructions and floating point load/store
instructions need have their immediate fields cleared to zero.

In addition, the various V-extension vector load/store instructions do not have
defined transformations, so they should show up in [m|h]tinst as all zeros.

> +    if (xinsn_has_addr_offset) {
> +        /*
> +         * The "Addr. Offset" field in transformed instruction is non-zero
> +         * only for misaligned load/store traps which are very unlikely on
> +         * QEMU so for now always set "Addr. Offset" to zero.
> +         */
> +        xinsn = SET_RS1(xinsn, 0);
> +    }

There seems to be two misconceptions here:

Firstly, QEMU *does* raise address misaligned exceptions for misaligned atomic
accesses.

However, if I understood correctly, the address misaligned exceptions are
irrelevant here because 'Addr. Offset' is only non-zero for a misaligned
accesses that faults but *not* due to an address misaligned exception.

For example, if an ld instruction reads 8 bytes starting from 0xa00ffe, and the
page 0xa00000 to 0xa00fff is mapped, but 0xa01000 to 0xa01fff is not, a load
page fault is raised with [m|s]tval = 0xa01000, while the original virtual
address of the access is 0xa00ffe. The 'Addr. Offset' in this case is 2, i.e.
the difference calculated with (0xa01000 - 0xa00ffe). This means that we *do*
have to set 'Addr. Offset' *because* we handle some misaligned load/store
instructions.
 
> @@ -1355,18 +1558,31 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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
> +            write_gva = env->two_stage_lookup;
> +            tval = env->badaddr;
> +            if (env->two_stage_indirect_lookup) {
> +                /*
> +                 * special pseudoinstruction for G-stage fault taken while
> +                 * doing VS-stage page table walk.
> +                 */
> +                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
> +            } else {
> +                /* transformed instruction for all other load/store faults */
> +                tinst = riscv_transformed_insn(env, env->bins);
> +            }
> +            break;
> +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> +        case RISCV_EXCP_INST_ADDR_MIS:
> +        case RISCV_EXCP_INST_ACCESS_FAULT:
> +        case RISCV_EXCP_INST_PAGE_FAULT:
>              write_gva = env->two_stage_lookup;
>              tval = env->badaddr;
>              break;

Instruction guest-page faults should set [m|h]tinst to one of the
pseudoinstructions if env->two_stage_lookup is true. Otherwise it should set
[m|h]tinst to zero.

In any case, as this seems to be one of the first implementations of
[m|h]tinst, it might be worthwhile to confirm with the spec authors and clarify
any unclear bits before this gets released.

dramforever

