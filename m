Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpTVw-0002Ex-OO
	for mharc-qemu-riscv@gnu.org; Tue, 23 Nov 2021 05:59:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mpTVt-0002EF-Re; Tue, 23 Nov 2021 05:59:02 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mpTVr-0003iC-Gt; Tue, 23 Nov 2021 05:59:01 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 15A6040252;
 Tue, 23 Nov 2021 11:58:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1637665130;
 bh=tYMic9OaQkDWXz/NzU9niDqABfXLgafPMCazwh8TLyY=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=Bcelb7E8GWzJEdgHWFkcTfWKCtMYtTu7OjI4OXlZM3w+qZpHnO1Nd7G9uPpGjFoq0
 bViCzO8CZ+OoXlbNJXEkxreix34grKuOimAJfb7vU35m0RAeBdj/u3uJGAy0NRj9o4
 2MTtSn3f/Z7HZ6ECQXQSvws/cN/Iw+boTwdIh6BvJmlEVh/4HxyWQCu54UneFwi0/E
 YrNFUP2/MfuKKw+bshPt02nJ6KDYC2OdYRRbzKNV7F/P6HnoOp2A5g8PFLbBllYOXV
 v2+zpg+EcfQ/1K2W3hPTjCkiMWNtxzNSKjJAnrqVdBP0k9NliuYpr1e9CT6clIQE7P
 6PBvQKT+Zs5lA==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id F2FA260070;
 Tue, 23 Nov 2021 11:58:49 +0100 (CET)
Received: from [147.171.46.30] (eduroam5-030.minatec.grenoble-inp.fr
 [147.171.46.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 19EC414005C;
 Tue, 23 Nov 2021 11:58:49 +0100 (CET)
Message-ID: <8be6502a-6118-9383-683b-fdbc443a5feb@univ-grenoble-alpes.fr>
Date: Tue, 23 Nov 2021 11:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-7-frederic.petrot@univ-grenoble-alpes.fr>
 <CAKmqyKOFqe+0n--MkUyw1V_ncsktX_qSHQU6p6r+OqWf-t6g=w@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v5 06/18] target/riscv: array for the 64 upper bits of
 128-bit registers
In-Reply-To: <CAKmqyKOFqe+0n--MkUyw1V_ncsktX_qSHQU6p6r+OqWf-t6g=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
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
X-List-Received-Date: Tue, 23 Nov 2021 10:59:02 -0000

On 23/11/2021 07:09, Alistair Francis wrote:
> On Sat, Nov 13, 2021 at 1:07 AM Frédéric Pétrot
> <frederic.petrot@univ-grenoble-alpes.fr> wrote:
>> +static bool rv128_needed(void *opaque)
>> +{
>> +    RISCVCPU *cpu = opaque;
>> +    CPURISCVState *env = &cpu->env;
>> +
>> +    return env->misa_mxl_max == MXL_RV128;
>> +}
> 
> I think it would just be better to use riscv_cpu_mxl() directly
> instead of adding a new function here.

   Ok, thanks.
   I was doing that because as Zhiwei is progressing on the dynamic handling
   of xlen, in the end the "current" mxl could be different from mxl_max, and
   some state to be saved might live in the registers upper 64-bit.
   But you are quite right that we are not there yet, so I'll do that.

   Frédéric
-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

