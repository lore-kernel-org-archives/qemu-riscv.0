Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kdw0k-0007P9-96
	for mharc-qemu-riscv@gnu.org; Sat, 14 Nov 2020 08:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kdsAP-00065r-AM
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2020 04:48:21 -0500
Received: from relay3.mymailcheap.com ([217.182.119.157]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kdsAL-0000Bw-Cl
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2020 04:48:20 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 358F33F1CC;
 Sat, 14 Nov 2020 10:48:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 624142A368;
 Sat, 14 Nov 2020 04:48:08 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1605347288;
 bh=m+Cd3877nWJuo3cslYNBvEBqvQPLLCOfcIfBu6UCtgM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BnyyRdJflhkF+KD5HMB82me1fNE7HBuA108Uda2TvCPEkIVTOc7iJD3OYJ00eQ/04
 HUdQW6bhf5qgvSuiiITfbbFQtKT4rLhSOtmncI1+VGgpjiSPYhhENgSR0E3BC6VmiE
 b02KUZo/d4psqFgr//xX8h+JVubj5OI7dFgNIPrI=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6czASbZmScq; Sat, 14 Nov 2020 04:48:06 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 14 Nov 2020 04:48:06 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 181C141FDF;
 Sat, 14 Nov 2020 09:48:03 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="aM3ri26C"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 99DDD41FDF;
 Sat, 14 Nov 2020 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1605347276;
 bh=m+Cd3877nWJuo3cslYNBvEBqvQPLLCOfcIfBu6UCtgM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aM3ri26CL/+0uCHUb1bdT898SzSNAqTESYXe7w8QfnsYLTU1j69ultajyt2KfpfM9
 5E7S+S+WhskQfXjMSdxoUj+bKR8TKtQ1/7KvJyG1EhpEGlO2P/Dk43HhQhTZx5Y325
 A+EcReycdZysN9deqxs57ne8PPBAY+ioZ3DiN6JE=
Subject: Re: Re: [PATCH] drivers: rtc: retire RTC_DRV_GOLDFISH
To: Greg KH <gregkh@linuxfoundation.org>, =?UTF-8?B?6ZmI5Y2O5omN?=
 <chenhc@lemote.com>
Cc: Roman Kiryanov <rkir@google.com>, Huacai Chen <chenhuacai@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, LKML
 <linux-kernel@vger.kernel.org>, Lingfeng Yang <lfy@google.com>,
 Rob Herring <robh@kernel.org>, anup.patel@wdc.com, Alistair.Francis@wdc.com,
 qemu-riscv@nongnu.org
References: <20201113205233.827493-1-rkir@google.com>
 <20201113210730.GA1992396@bogus>
 <CAOGAQeq29S06+6M58qF0e4ivjzkZDg4+M7ffSK+FapbgmCBrLQ@mail.gmail.com>
 <CAL_Jsq+QjQxDh3_KDhgE_2A6DjA+gSyvknjrVfRFLMLz-p_M9A@mail.gmail.com>
 <CAOGAQepCsj63yZzJJHKCdHTenkWNLc_v=Ab6PgvS3hzqZMwH8A@mail.gmail.com>
 <CAOGAQepW3pbbjK9KpPZR1BwGY-CGF7V_pTY_9dw98XPgUKYFHg@mail.gmail.com>
 <X68aZ/Dgm7CObQmH@kroah.com> <tencent_3801BEAE39670E174105E007@qq.com>
 <X6+SKQS6QJr25kF0@kroah.com>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d1d47715-482c-f598-a958-499d9fde21e0@flygoat.com>
Date: Sat, 14 Nov 2020 17:47:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <X6+SKQS6QJr25kF0@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 181C141FDF
X-Spamd-Result: default: False [-0.10 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_SPF_SOFTFAIL(0.00)[~all]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 RCPT_COUNT_SEVEN(0.00)[11];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 FREEMAIL_CC(0.00)[google.com,gmail.com,sifive.com,vger.kernel.org,kernel.org,wdc.com,nongnu.org];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Received-SPF: pass client-ip=217.182.119.157;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay3.mymailcheap.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 04:48:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 14 Nov 2020 08:54:36 -0500
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Nov 2020 09:48:21 -0000



在 2020/11/14 下午4:15, Greg KH 写道:

+ qemu-riscv list and QEMU device maintainers of goldfish_rtc

> On Sat, Nov 14, 2020 at 04:06:24PM +0800, 陈华才 wrote:
>> Hi, All,
>>
>> Goldfish RTC works well on MIPS, and QEMU RISC-V emulator use Goldfish
>> as well, so I think  we should keep it in kernel.
> But does anyone actually use it for anything?  Having something in qemu
> is nice, but not required if it doesn't provide something that is
> already there for other virtual devices, right?

Hi all,

Both QEMU MIPS loongson3-virt and riscv virt machine are using 
goldfish_rtc as sole RTC
device, it have been hardcoded in QEMU for a long while and sudden drop 
in kernel would
break these machines.
RTC is essential for virt machines to keep time synchronized with host.

Given that it is the simplest RTC implementation for now, it won't give 
us much maintenance
overhead.

Thus I do think it shouldn't be retired as for now. If nobody comes in 
I'd also willing to maintain
it.

Thanks

- Jiaxun

>
> thanks,
>
> greg k-h
>

