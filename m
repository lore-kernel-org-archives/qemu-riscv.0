Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGiw3-0007jJ-4U
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 11:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1oGiw2-0007hc-03; Wed, 27 Jul 2022 11:26:54 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1oGivz-0005LE-0q; Wed, 27 Jul 2022 11:26:52 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.17])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oGiH8-006AyE-TX; Wed, 27 Jul 2022 15:44:39 +0100
Message-ID: <831aebc7-ab6c-7cb8-b890-26270657bd69@codethink.co.uk>
Date: Wed, 27 Jul 2022 15:44:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: fu740 target
Content-Language: en-GB
To: Bin Meng <bmeng.cn@gmail.com>, Ben Dooks <qemu@ben.fluff.org>,
 Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20220727142037.rzm4o4huq22vagcp@hetzy.fluff.org>
 <CAEUhbmU_3+-A8vAnnCmZ_qYaWv=0QFjkMeBwH+sZ60t+ivHGFw@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CAEUhbmU_3+-A8vAnnCmZ_qYaWv=0QFjkMeBwH+sZ60t+ivHGFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 27 Jul 2022 15:26:54 -0000

On 27/07/2022 15:38, Bin Meng wrote:
> On Wed, Jul 27, 2022 at 10:24 PM Ben Dooks <qemu@ben.fluff.org> wrote:
>>
>> Is anyone working on adding a sifive-u74 core to the list of supported
>> CPU types? I was looking at full emulation of the Unmatched but at the
>> moment the best we have is sifive-u54 and I think that misses at least
>> two CSRs the sifive-u74 has.
>>
>> Does anyone have plans to add the sifive-u74, and if not, would a plan
>> to add gradual support for it like adding CSRs 0x7c1 and 0x7c2 so we
>> can run an Unmatched U-boot SPL against it.
> 
> Adding 0x7c1/7c2 would be a vendor-specific CSR approach?

Part of the FU740 feature disable controls

>>
>> If not, is there a definitive U54->U74 set of public differnces around
>> we could use to start from? I'd like to be able to run a full Unmatched
>> image using qemu at some point to add to the current real-board testing
>> we're doing.
>>
>> (I have a basic addition of the type and the two CSRs as a couple of
>> patches if that would help as a start)
>>
> 
> I am not aware of anyone doing U74 modeling in QEMU, but SiFive folks
> (+Frank) may have one downstream as I see they posted several bug
> fixes in the existing U54 model.
> 
> Regards,
> Bin

Thanks

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

