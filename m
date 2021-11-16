Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn10w-0001uo-6r
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 11:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mn10r-0001qK-DI; Tue, 16 Nov 2021 11:08:49 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:40760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mn10p-0001r9-9N; Tue, 16 Nov 2021 11:08:49 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id E078441BE8;
 Tue, 16 Nov 2021 17:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1637078922;
 bh=DL4zxXrRJux0eW+Y/dDFR7LVrm6ayBtVjJHL6TsV/I8=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=fCo0LAGATe8+KDTW1wpdf/Hi223m3H6tcYsl1EaztWkUrVHqZRLtRSV4QQnJB6xqk
 F8DE+aKl5YveMBjQOhaISIU1tTuR0/zOJ3Eq99B8xw+f0MkSvEnJd16NVxMUNZbesH
 nUK7lawY3enpXzxagOdYHmyTGedarr51ahn8Q2yQWYTP+5iGy42RU2vFNZu6rwYmZ8
 rPdlRKxM7NGm9i3xLtPqxfERn6jg33qmXKE+1WxqyIdzHEifAPmgVqh1aEKl3jmrDZ
 w/unBgYPZkNR9EEzsockTpSBpAvDHi0pFLC8/5ZA0zSkkOwAQ3pFT6eHXY5ik5Jm48
 tzjH6GAr1z1gQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id CFED46006B;
 Tue, 16 Nov 2021 17:08:42 +0100 (CET)
Received: from [147.171.185.230] (pers-185-230.vpn-inp.grenoble-inp.fr
 [147.171.185.230])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 048B714005C;
 Tue, 16 Nov 2021 17:08:41 +0100 (CET)
Message-ID: <fd6f35d6-6e13-a8b3-d47e-94fb8100ab32@univ-grenoble-alpes.fr>
Date: Tue, 16 Nov 2021 17:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-10-frederic.petrot@univ-grenoble-alpes.fr>
 <e3ab42c2-3c29-76bd-65e6-5c5b748b743b@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v5 09/18] target/riscv: accessors to registers upper part
 and 128-bit load/store
In-Reply-To: <e3ab42c2-3c29-76bd-65e6-5c5b748b743b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
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
X-List-Received-Date: Tue, 16 Nov 2021 16:08:50 -0000

On 15/11/2021 09:29, Richard Henderson wrote:
> On 11/12/21 3:58 PM, Frédéric Pétrot wrote:
>> +        tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? desth : destl, addrl,
>> +                           ctx->mem_idx, MO_TEUQ);
> 
> This isn't correct.  MO_BSWAP is related to the host, not the guest.

   Argh! Thx for pointing out my misunderstanding.
> You want
> 
>      (memop & MO_BSWAP) == MO_LE ? destl : desth
> 
> Are there any big-endian RISC-V though?

   Not that I know of, but the spec defines it since V2.0 (bitfields MBE/SBE/UBE
   in mstatus), gcc supports it, and there is a check for it in get_dump_info
   for the riscv, so I opted for adding that (wrong) line.
   Since we can expect in the future endianness to be dynamic, you are probably
   right that we should assume litte-endian accesses for now, as handling both
   will anyway require many other changes.

   Frédéric
-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

