Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muFUB-0002Bo-37
	for mharc-qemu-riscv@gnu.org; Mon, 06 Dec 2021 10:01:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1muFU3-0002AH-4I; Mon, 06 Dec 2021 10:00:54 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:38502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1muFTw-0008QI-Lt; Mon, 06 Dec 2021 10:00:50 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id A89A94024C;
 Mon,  6 Dec 2021 16:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1638802840;
 bh=4LXmHjHgAifzrx9ligx/9UINKyBRFm7X2U8BKsyc8aE=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=LX+wLAsZkAciUXMfWRbjRhun63eOYKGoGNGcyG5YDo3ydEMfdPbGWScnTffsb4wjc
 8A3BcUNexKmTARd9YErV+KUWSmSRNBFvMG1y1WUMYZmUvtWfZxKUgA0MIHrayGYxyj
 Tfufy47fZhSUy/wU+SnG+GGMDh/2Huhfv8Aww28RGalFsQNRRHMDwqNV7ehFhIvWJa
 hRSQqpfmv+gSSlM8bOhJSnMff2xk+itV5dWldLsq9Thp9FEQnz778fRFKjVEbjgAkp
 N0L0A892sBNWMXDVbVV8n0KdjZELFC+2mvUZRb8KWzwby3EVbsIPD5tu/JrmDdjbV4
 /DR8TzwDSx10w==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 948496006D;
 Mon,  6 Dec 2021 16:00:40 +0100 (CET)
Received: from [147.171.132.208] (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id D446840069;
 Mon,  6 Dec 2021 16:00:39 +0100 (CET)
Message-ID: <7a257cb6-ca63-bf7d-a5d4-26d3e70ac992@univ-grenoble-alpes.fr>
Date: Mon, 6 Dec 2021 16:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
 <4fceecbf-7424-3a0d-d350-fb677f6b1104@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v6 00/18] Adding partial support for 128-bit riscv target
In-Reply-To: <4fceecbf-7424-3a0d-d350-fb677f6b1104@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.076,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 06 Dec 2021 15:00:55 -0000

Hi Richard,

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
> 
> watch qemu-iotest 040 fail.

   I'm afraid this test and a few others (5 in total) fail on current master,
   too, with this 'configure' command line.
   I just did a fresh install to make sure I did not kill something in the rv128
   patches.

   Note that if I add x86_64-softmmu to target-list, it runs like a charm, as
   it takes it as default choice.
   I did try to go back in time to find a working 040 with qemu-system-riscv32
   (the default choice of check when qemu-system-x86_64 does not exist) or
   qemu-system-riscv64, but I could not find one I could compile with my current
   system.
   So I suspect this is the syndrome of something that is (1) not of my doing
   (although it could have, for sure), and (2) above my understanding.

   Sorry for not being more helpful,
   Frédéric
> 
> 
> r~

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

