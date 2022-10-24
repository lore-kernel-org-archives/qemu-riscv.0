Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omzmT-0004zG-1q
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 11:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1omzmQ-0004yj-VU; Mon, 24 Oct 2022 11:54:22 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1omzmP-00050i-CQ; Mon, 24 Oct 2022 11:54:22 -0400
Received: from [167.98.27.226] (helo=[10.35.6.130])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1omzDu-002Qlb-KQ; Mon, 24 Oct 2022 16:18:43 +0100
Message-ID: <3c28b299-28ce-04f0-1430-f2b2ca0f2a95@codethink.co.uk>
Date: Mon, 24 Oct 2022 16:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: add qemu_fdt_setprop_strings
Content-Language: en-GB
To: Andrew Jones <ajones@ventanamicro.com>, Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-riscv@nongnu.org
References: <20221021055808.342055-1-qemu@ben.fluff.org>
 <20221021070047.225ngzlqqwsvgbqw@kamzik>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20221021070047.225ngzlqqwsvgbqw@kamzik>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Oct 2022 15:54:23 -0000

On 21/10/2022 08:00, Andrew Jones wrote:
> On Fri, Oct 21, 2022 at 06:58:02AM +0100, Ben Dooks wrote:
>> Add a qemu_fdt_setprop_strings to set a string array into a device-tree.
>>
>> Only minor updates from v4 to fix a couple of minor patch issues.
> 
> Please see the comments I made on patch 1 of the v4 series, they should
> be addressed. Also, I'm pretty sure I gave r-b's on most, or the rest,
> of the series, but I don't see those here in v5. And, please CC previous
> reviewers when sending out new versions. Finally, why not generate this
> cover letter with git-format-patch?

I'll go back and check the reports, I think I missed the "static const"
one.

I did completely forget to update the reviewed comments, so will do that
and post a V6 this week.

> Thanks,
> drew
> 
> 

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


