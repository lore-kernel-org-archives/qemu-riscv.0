Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrgde-0006nG-FK
	for mharc-qemu-riscv@gnu.org; Mon, 29 Nov 2021 08:24:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrgdc-0006gq-Ml; Mon, 29 Nov 2021 08:24:08 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:46354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrgdY-0006bu-HC; Mon, 29 Nov 2021 08:24:08 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id E34374030B;
 Mon, 29 Nov 2021 14:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1638192241;
 bh=5CbGMz4fFg+49ZIpfAUlGkDyhtAIR5acVZaLMNL/DBU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nlyxUeZakfI/33TJDKTzNz2zGq/iS+vxraIpuTs/eZyNF1X0HjhIdVQ9U6yj1Xx4T
 XBnpq1qOCz15YiZKEFVowQk7MydQNDO5qhAsro/ga/mI87YGSiRmAQBBYPX1vVx7uO
 O0j8Dw91F3Nsd+8rwBdBrH/4BB9x1EW6+TFBB4spKqGsnkU4k/FkizZclioeOI/SCB
 9ea3e35jXf4D9p7z4FHgqc12QNfWKzBe225M2iX/vfDm3TYpUZsNnkG0p2sOJ7w8cD
 BLHynhou7002ks1+9ypp+2Ro/WBTBoI/rAcW3SL5sorky6T3JxlctZuzC5FPZxXv77
 pZjhU/1D/9Yug==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id CC45960067;
 Mon, 29 Nov 2021 14:24:01 +0100 (CET)
Received: from [192.168.1.64] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 26F1940069;
 Mon, 29 Nov 2021 14:24:01 +0100 (CET)
Message-ID: <217c6b78-e322-3612-5140-1f65ae67a959@univ-grenoble-alpes.fr>
Date: Mon, 29 Nov 2021 14:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v6 00/18] Adding partial support for 128-bit riscv target
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
 <4fceecbf-7424-3a0d-d350-fb677f6b1104@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <4fceecbf-7424-3a0d-d350-fb677f6b1104@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 13:24:09 -0000

On 29/11/2021 13:13, Richard Henderson wrote:
> On 11/28/21 2:57 PM, Frédéric Pétrot wrote:
>> This series of patches provides partial 128-bit support for the riscv
>> target architecture, namely RVI and RVM, with minimal csr support.
>>
>> Thanks again for the reviews and suggestions.
>>
>> v6:
>> - support for '-cpu rv128' in qemu-system-riscv64 to handle 128-bit
>>    executables (no more qemu-system-riscv128)
>> - remove useless (and buggy) big-endian support in lq/sq
> 
> This also fails make check.  With
> 
>    ../qemu/configure --enable-debug 
> --target-list=riscv64-linux-user,riscv64-softmmu,riscv32-softmmu,riscv32-linux-user

   Ah! Indeed, sorry for the mess, I indeed forgot about linux-user.
   Frédéric

> 
> watch qemu-iotest 040 fail.
> 
> 
> r~

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

