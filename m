Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhrbT-0007po-DM
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 07:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nhrbM-0007kL-6Y; Fri, 22 Apr 2022 07:37:30 -0400
Received: from mta02.hs-regensburg.de ([2001:638:a01:1096::12]:42772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nhrbJ-0002p2-Hl; Fri, 22 Apr 2022 07:37:27 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4KlC7D74Tgzxyt;
 Fri, 22 Apr 2022 13:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta02-20211122; t=1650627433;
 bh=5PSR/UKyAzzjWCG/mukxhIzYBr84DO9hQFdRDp4xK7k=;
 h=Date:Subject:To:CC:References:From:In-Reply-To:From;
 b=uD+py59L3z6EG2KSgwUGL8ikDxr4xmg94JHtvIhwu1FKaLYMDiUNJZOF7nibjehIZ
 Zygk0ePPFIC9XHf/DI8qjGqAdwuQS7h2w+PQuXnzHgIt+aYErbWvmtaMDq5gTv7WSB
 325NYnkpxFUXD34BNGqSZhOMV+XvPt5JFVqSIuUBMX/uIksXqAj4YBmh3SoRVS1CpU
 Q/yUurRA5Z1BMp7f+zKIiatgkoMOdnOXGPBQDf3oMqkkWPfjWFf869BRJPm6qXobmP
 PPlfFpwOct5w+wFT6e6EmKZqN3bqQUKsXFwzC3XVdY7Ivfcg75JgCYipPXSnni0JW4
 KfKkL5gp90yfA==
Received: from [IPV6:2a02:810d:8fc0:44bc::cea3] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 22 Apr 2022 13:37:12 +0200
Message-ID: <38fe04aa-17e8-591c-fa65-ee9d931ed45c@oth-regensburg.de>
Date: Fri, 22 Apr 2022 13:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [EXT] Re: [PATCH v2] target/riscv: Fix incorrect PTE merge in
 walk_pte
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Stefan Huber
 <stefan.huber@oth-regensburg.de>, Richard Henderson
 <richard.henderson@linaro.org>, Bin Meng <bin.meng@windriver.com>, Konrad
 Schwarz <konrad.schwarz@siemens.com>
References: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
 <20220404173417.2946065-1-ralf.ramsauer@oth-regensburg.de>
 <CAEUhbmXZo=RSGSOoJQRTfsRF8z3gEntgKZDNmptLsvja-z6u+w@mail.gmail.com>
 <CAEUhbmUTSX3EYu7=-S-o-iYxZzVbpkZWeLqnDTB-R9mUn20HDA@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAEUhbmUTSX3EYu7=-S-o-iYxZzVbpkZWeLqnDTB-R9mUn20HDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
Received-SPF: pass client-ip=2001:638:a01:1096::12;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta02.hs-regensburg.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 22 Apr 2022 11:37:32 -0000



On 22/04/2022 04:54, Bin Meng wrote:
> On Fri, Apr 22, 2022 at 10:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Tue, Apr 5, 2022 at 1:34 AM Ralf Ramsauer
>> <ralf.ramsauer@oth-regensburg.de> wrote:
>>>
>>> Two non-subsequent PTEs can be mapped to subsequent paddrs. In this
>>> case, walk_pte will erroneously merge them.
>>>
>>> Enforce the split up, by tracking the virtual base address.
>>>
>>> Let's say we have the mapping:
>>> 0x81200000 -> 0x89623000 (4K)
>>> 0x8120f000 -> 0x89624000 (4K)
>>>
>>> Before, walk_pte would have shown:
>>>
>>> vaddr            paddr            size             attr
>>> ---------------- ---------------- ---------------- -------
>>> 0000000081200000 0000000089623000 0000000000002000 rwxu-ad
>>>
>>> as it only checks for subsequent paddrs. With this patch, it becomes:
>>>
>>> vaddr            paddr            size             attr
>>> ---------------- ---------------- ---------------- -------
>>> 0000000081200000 0000000089623000 0000000000001000 rwxu-ad
>>> 000000008120f000 0000000089624000 0000000000001000 rwxu-ad
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>   target/riscv/monitor.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
>>> index 7efb4b62c1..9dc4cb1156 100644
>>> --- a/target/riscv/monitor.c
>>> +++ b/target/riscv/monitor.c
>>> @@ -84,6 +84,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>>>   {
>>>       hwaddr pte_addr;
>>>       hwaddr paddr;
>>> +    target_ulong last_start = -1;
>>>       target_ulong pgsize;
>>>       target_ulong pte;
>>>       int ptshift;
>>> @@ -116,7 +117,8 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>>>                    * contiguous mapped block details.
>>>                    */
>>
>> Please also update the comments above to mention the new case you added here.

Shall I provide a v3? No problem, if that makes your life easier. 
Otherwise, you could also squash attached comment on integration.

Thanks
   Ralf

diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 02512ed48f..1cb0932e03 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -143,9 +143,9 @@ static void walk_pte(Monitor *mon, hwaddr base, 
target_ulong start,
                   * A leaf PTE has been found
                   *
                   * If current PTE's permission bits differ from the 
last one,
-                 * or current PTE's ppn does not make a contiguous physical
-                 * address block together with the last one, print out 
the last
-                 * contiguous mapped block details.
+                * or the current PTE breaks up a contiguous virtual or
+                * physical mapping, address block together with the 
last one,
+                * print out the last contiguous mapped block details.
                   */
                  if ((*last_attr != attr) ||
                      (*last_paddr + *last_size != paddr) ||

