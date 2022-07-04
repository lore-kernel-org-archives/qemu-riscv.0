Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8Bx6-0000Nn-Ac
	for mharc-qemu-riscv@gnu.org; Sun, 03 Jul 2022 22:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1o8Bx4-0000LA-JK; Sun, 03 Jul 2022 22:36:42 -0400
Received: from mail-tycjpn01olkn2035.outbound.protection.outlook.com
 ([40.92.99.35]:9381 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1o8Bx2-0004xQ-Eo; Sun, 03 Jul 2022 22:36:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhblWqd79PQ3GOL8e001FrFGJfHXndHBVSj4iRNQizt8M6NJCTne0/JQVbleJW62hCTscbzgL38DRP31jSIARgRskAMLI5cc6EG6b2mExCLlktf1Tk7T/el+ptLVOayWPmRfKu4nC/jWzDq4IqW77tMf2o+06CVrVYuPHEysuec9xD3qHrTcQldB9Bjq6DBGtSIg0icJlbQYrFINaj3/1VXcM5daXyYkvnoXrlR70jPMWeluoXK0Lm/SAUUpizOVo4wCQsvxl9MBzOuCSNBdgf7Ct4dDwYrmMF7QFhHGB7HkhQFW+TY7ICOncSt2C6Cnd7rWhBRwjvykm9BoyqDtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oR+1c1/lUIecUA0cqWgaJnZT+JnsyC3X5TtNAsfK2k=;
 b=jxaTk2i4hCsEsJELYcpmUHWUr9fqHvaJBqdm9T4Mjp9m9JdA7ZqcPYynWvzeTKTaVhyMb1Nogv0moJS6ZRMtPRtL+ibICewKvT83Sc39X8Hs7zH6PnPzUJV2OrkfRimOOvqUuAUsj68Uw4Pm5DrLgPTorrfj8yMHYOC+YNfyxeai4t35rXtRcSH76ZlsHTmi1Z1CUgm/rAwf3nnRn7hMUQ4iXBmlBht7za9yQ7kUSQ36CItsLwZwfHYHqL8s6DF3Mzg9BU1gKyKEwib17r2dFuFHqTneUQFfAwY6bvD66bT+WddSSGzJvHOQLl9t5o0czbBcN8L3q2rhR0QcAiB7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oR+1c1/lUIecUA0cqWgaJnZT+JnsyC3X5TtNAsfK2k=;
 b=XBBdhTqEy6Pvar+RMYHSkQbz5PXJ/5/Z55WVBVH/GcB5SaJrxOigJXZSK7TzVOd0eP5+go1BkpiWa1gUh4IRe5bEWEglXiDArnOA3DusJNbCkjyvfwlv5KL/nUIKqu/NU/wDVIqFr2QguIAulYmt1MS0uQcX+r57SiR0YPl5oIgeG9d7zeXThUp5jNAXQ72bd95xEE4Z8kLUHMH3u1BkhAbVonCsNc6K4EY0yQw6Ma0Ueh/CRBubkVGja15hlR3NBwzQqF61eHRNvNGyBIxr6TguIpVs0vKv9ZM918hw8RY48BHoB6gVOewzzARxQ3bXN3TkZnhleCXgzSWWc1gd9g==
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:df::12)
 by TYYP286MB1524.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:118::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 02:36:33 +0000
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36]) by TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 02:36:33 +0000
Message-ID: <TYYP286MB1439BD85C43139BFE871918DC6BE9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Date: Mon, 4 Jul 2022 10:36:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 1/2] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>,
 Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20220630061150.905174-1-apatel@ventanamicro.com>
 <20220630061150.905174-2-apatel@ventanamicro.com>
 <CAKmqyKNNg+dMLtzSFrEmtWu_rxZUX_mDb21BVt=pnr+6MMBHyA@mail.gmail.com>
From: dramforever <dramforever@live.com>
In-Reply-To: <CAKmqyKNNg+dMLtzSFrEmtWu_rxZUX_mDb21BVt=pnr+6MMBHyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [nGeIDP4RTwGzRIKpEHyOg8G56QlzeniM]
X-ClientProxiedBy: SG2PR01CA0124.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::28) To TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:df::12)
X-Microsoft-Original-Message-ID: <ed9d57e9-b868-3e6e-07dc-a29aa9be7d36@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bdf4ac1-79c0-4f13-d065-08da5d660204
X-MS-TrafficTypeDiagnostic: TYYP286MB1524:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xOgypqUwk79MSMaf83QmOcJPI6vJpKwqb9NJldP3as2zeZ6IWAP5nxIjy9JmXMjAG6vImnEfzbhKONadMNeI299NcZFr5lS+rDT4TK6/PiZ8SxWqjmGGYzFIj1wdBzid5+16IKQruJQmq57AAj2sxTpBTJ1cyqwNCM6r8KLsfuZ2YdVSnLd4pJS8IeRMf5RiFo2HbJ5tAx49cMWIZSKL/9hAYu+aGNOcKI3yoLzap5SVZb5n9rRvn4Zofuk7mfsx3FlQM6Jtjbo8cHNbFYorzQLlgy1Ffj7fOlrPBQoPg3zXkdPd2E83sC8+ymhsvNEw4G8dXRKfpCu6dBMpZ/52Ph7pC0QAwAuKMRpyW6EtcS3Sx0Pxgu79jXoS9E9MqgsaLUe8aEVuK92UKti8UHU2P8q9WOTp0zJVyNHmNZ+46FweddzitxmuZmvlYrEaB4XxL6nx8wEYbl832YX+E0+1NiN3IZnnWIe1jnsxNseCi298LLYF4v/sp7cCF2JTZLnebNBZgitwDHLWqAtrH8x1Ass01/tWxNAFRawUQm70gbvp8FUF6O8mDG0vfY56nyMEWqk2EvxlRqxWbrqLBWl1N87QpSgJDQkaiqxpzJ5a0WsPkJWratAqT3kTP4kEcVocI49hedzxivIyjMDLby0xYw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHNLTis1UStVenl4M3RvQzB5Q004aUoxSFBIZWtZeFE4ZllwSDEweWpwV3k5?=
 =?utf-8?B?VnMvMUttcFFmVUc3WURVdTJESEo2emJpc3U4V0dSdVZtRFpZZ3ArZzVLVkRm?=
 =?utf-8?B?UUlZZVV1bk1iOFN1amFxei9ybFZHaGdCTjhDTE1leEFQSk43M0dqU05SMVNX?=
 =?utf-8?B?M3oyaSs3TGFKYk44eHFSM3hYL0JvSjJsQk5FT0hYNjVLck05OHlUYzE1ejNm?=
 =?utf-8?B?Q0xlUGRRTHhsQmpsS0tjczl2aUQxWjVaZ0dNc1M0YVR6SHNadHJ4aTVIQ09j?=
 =?utf-8?B?cEV6TWlTV0pQekxoOG80elFlU3ZrK2wrbFZwaXZSVmlDNVNralZ3YWJzc2U0?=
 =?utf-8?B?UnhIRkIyNk16L20vRGMrV2Q4djBTSWVZdDlPdDR2RlZKcEFFT1hKL3U1SmNm?=
 =?utf-8?B?aHFWQXFuUC81T0xJMURYaUd3NGcvRjNheG82TUsxM1lWYkZQb1kybUIrYWp5?=
 =?utf-8?B?TVhlZkdDekd4Mmc1S1QwSVIyblBxMUd5aVVUenVhZy9ZYWlIR29oOXZGazNm?=
 =?utf-8?B?R1FtcjQzb01vdSs1cnhyMktLMzNZTFJ4MUM1WWZmSDcxdmpJbld4UTNCMVk1?=
 =?utf-8?B?SjNNMDlidDQ1K2c2RDI5aFFycnJ2UFpVSjJyK1V4TFF3alhTRFc0bFBDV3ZT?=
 =?utf-8?B?TnVuUmdpVjBlTXNTZ0lwcHFKUmRYanlNdS9ZeTNCMDVmTjJxZTBTL2hTOW81?=
 =?utf-8?B?M1JXQ0l2eERuUmxyanpWVzFBTXZiZlY4ZUl5czV6R1o1czF4ejBpYXBNSy9S?=
 =?utf-8?B?dklYeUN6WUpjZlNjSzE3eWJvR0x2WHRtcmdsTG9sY05oRHZiU0dKbU9VY1JT?=
 =?utf-8?B?ZXdZeUNWMmlrRVJyMTBwclB1KzgrckRPeVlhcUxCVmxVRUFWQjduLzRCSE5U?=
 =?utf-8?B?cXF3eGpRdUdhMnVQOEJ4SWxyeS9rb3lyWmZwZ3ZUdFA0SE05a2R0dWV4YjBj?=
 =?utf-8?B?R3VGV1Q4WjJBMHlSMVlaWTJ6UHBvWG9FbDBoOEY3RmZJU1VSV2J2em5TVm9W?=
 =?utf-8?B?Z0p1U0NqWUVwRWVGUkFodHZadGdFekNCWkxnMktUMW9PdVRaVDFtZmRkVUJw?=
 =?utf-8?B?UWtMQkxtZHhpSVFTTWVYczlWbHRBT3ltU09EejBTZW1kT2ROa3RLam11Q3pD?=
 =?utf-8?B?VCt0Q0RnbzNIZERkR3JBVFRMeVFXd05PeVVDVHFKYWxJaDJkUWpQNFAyTzRu?=
 =?utf-8?B?aEptaFRaQTVuRTA4VGFFRll0N1Y1NHhKTHFKekZHd1RaSkJnQVIrckhFby9G?=
 =?utf-8?B?Q1d6VEdRUnk5cmdHUGJVRXRuK3JJZVhMUVpDQXltMnlqQXI1OFRTeE9JY2Jh?=
 =?utf-8?B?eWVQVWpHUzNSZVNLcStJdjNyVkt1RzUvNnRVQnk5Mmx4cFVmbyszaDZNcnA4?=
 =?utf-8?B?eUZXOGd3RlI5NEp3S2pGcTJJQTlPWDNXKzIyOFFSRmQ0eDgxYUxqT1ZQMmVk?=
 =?utf-8?B?YmJvNkZCU0FEcFZrelYwR3ZXNkRGbktoZWx6emdNSjZMcHR1NzNUeG84WHVL?=
 =?utf-8?B?UDR2N3ZhODczVmc1QitUc09Jd2pROGJEQkZsbnhaOVNmYzk5aHp5TDJLMXcy?=
 =?utf-8?B?Y0MwTEhOOEo2ODFXQlFVdlV5c1pVeG9zQzZpZ0hUMjYrbWNLbzFZUUdnNEZY?=
 =?utf-8?B?NHRRRGc5MEFyWE1QT2ZRTnVscnZ1eG03cXJHMHoxT09LdFAweFEvMS9zeTc0?=
 =?utf-8?B?czErdi96bHBUZ1NueThpRko5V3JGSEw5RW9RcTNsRnlvNmtYUkt5Tm9BPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdf4ac1-79c0-4f13-d065-08da5d660204
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 02:36:33.2013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1524
Received-SPF: pass client-ip=40.92.99.35; envelope-from=dramforever@live.com;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
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
X-List-Received-Date: Mon, 04 Jul 2022 02:36:42 -0000

On 7/4/22 10:17, Alistair Francis wrote:
> On Thu, Jun 30, 2022 at 4:13 PM Anup Patel <apatel@ventanamicro.com> wrote:
>> We should write transformed instruction encoding of the trapped
>> instruction in [m|h]tinst CSR at time of taking trap as defined
>> by the RISC-V privileged specification v1.12.
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> @dramforever do you want to give an Ack or Reviewed-by?
>
> Alistair

Acked-By: dramforever <dramforever@live.com>

dramforever



