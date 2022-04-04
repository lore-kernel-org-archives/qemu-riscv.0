Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nbQPk-0004Wj-Kg
	for mharc-qemu-riscv@gnu.org; Mon, 04 Apr 2022 13:22:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nbQPj-0004WV-Cq; Mon, 04 Apr 2022 13:22:51 -0400
Received: from mta01.hs-regensburg.de ([194.95.104.11]:45246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nbQPg-00072v-SP; Mon, 04 Apr 2022 13:22:50 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4KXHf61St4zxvY;
 Mon,  4 Apr 2022 19:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta01-20211122; t=1649092958;
 bh=64tCKFtiQ57qlhHBLiaXF9nbBDtwnoKRRAhsxcZi+E0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To:From;
 b=MMvlKREapOE5KuoNcs4Ta9SsQTrTFoIEoEysuLfmUTVK8wfTjV/gVzm0jPKuFHI16
 VMMBL1wip8W64pMRCk8BHQQ8slki4P9xGx83blSO8FIf4a8gFBrG96OLy4dPiqhdna
 5FZ8PMThHh4j533ESxWwmS2eQClYrvvCz71WKpEQMy1Ph8YQfLMXxo2xbcB5A7BaOY
 24R60qDV0lWrutk2Dq6amG75ezM28ixAVaI3lV1P6m0e9Tyg1oKIhQ9Pm1F9cLuTXE
 i6w6U7rc8Ru8dWH9KwIZfos5Awz5VxxxUa1P5aKTdZCRb0Vj7XuYNgU/gd7W6AAQS4
 chKRPY9pc993w==
Received: from [IPV6:2a02:810d:8fc0:44bc::cdc6] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Apr 2022 19:22:37 +0200
Message-ID: <8ec43086-62e6-bc4e-2a65-5a2943a679b4@oth-regensburg.de>
Date: Mon, 4 Apr 2022 19:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/riscv: Fix incorrect PTE merge in walk_pte
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, 
 Stefan Huber <stefan.huber@oth-regensburg.de>
CC: Bin Meng <bin.meng@windriver.com>, Konrad Schwarz
 <konrad.schwarz@siemens.com>
References: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
Received-SPF: pass client-ip=194.95.104.11;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta01.hs-regensburg.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 04 Apr 2022 17:22:52 -0000



On 01/04/2022 14:22, Ralf Ramsauer wrote:
> Two non-subsequent PTEs can be mapped to subsequent paddrs. In this
> case, walk_pte will erroneously merge them.
> 
> Enforce the split up, by tracking the virtual base address.
> 
> Let's say we have the mapping:
> 0x81200000 -> 0x89623000 (4K)
> 0x8120f000 -> 0x89624000 (4K)
> 
> Before, walk_pte would have shown:
> 
> vaddr            paddr            size             attr
> ---------------- ---------------- ---------------- -------
> 0000000081200000 0000000089623000 0000000000002000 rwxu-ad
> 
> as it only checks for subsequent paddrs. With this patch, it becomes:
> 
> vaddr            paddr            size             attr
> ---------------- ---------------- ---------------- -------
> 0000000081200000 0000000089623000 0000000000001000 rwxu-ad
> 000000008120f000 0000000089624000 0000000000001000 rwxu-ad
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   target/riscv/monitor.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index 7efb4b62c1..60e3edd0ad 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -84,6 +84,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>   {
>       hwaddr pte_addr;
>       hwaddr paddr;
> +    target_ulong last_start = -1;
>       target_ulong pgsize;
>       target_ulong pte;
>       int ptshift;
> @@ -116,13 +117,15 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>                    * contiguous mapped block details.
>                    */
>                   if ((*last_attr != attr) ||
> -                    (*last_paddr + *last_size != paddr)) {
> +                    (*last_paddr + *last_size != paddr) ||
> +                    (last_start + *last_size != start)) {
>                       print_pte(mon, va_bits, *vbase, *pbase,
>                                 *last_paddr + *last_size - *pbase, *last_attr);
>   
>                       *vbase = start;
>                       *pbase = paddr;
>                       *last_attr = attr;
> +                    last_start = start;
>                   }

Yikes, there's a small bug in my patch that I failed to see:
last_addr = start should be outside the curly brackets, otherwise it 
will rip up too much regions.

I'll return with a V2.

Thanks
   Ralf

>   
>                   *last_paddr = paddr;

