Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRovq-0002MH-4e
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 20:46:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gRovn-0002M1-HU
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 20:46:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gRovj-0006IC-Bk
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 20:46:23 -0500
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:60908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gRovi-0006Bv-LW; Tue, 27 Nov 2018 20:46:19 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
	rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id
	2eea5bfdf35f2e8-5a5bd; Wed, 28 Nov 2018 09:46:07 +0800 (CST)
X-RM-TRANSID: 2eea5bfdf35f2e8-5a5bd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.43.82] (unknown[117.136.46.207])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id
	2ee15bfdf35cf28-4a7d1; Wed, 28 Nov 2018 09:46:07 +0800 (CST)
X-RM-TRANSID: 2ee15bfdf35cf28-4a7d1
To: Palmer Dabbelt <palmer@sifive.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
	Michael Clark <mjc@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, philmd@redhat.com
References: <mhng-22cf4e89-cf9f-4a1d-b254-72b66e51dd82@palmer-si-x1c4>
From: maozy <maozhongyi@cmss.chinamobile.com>
Message-ID: <57736c8b-767b-aa02-762c-c2d6aed060df@cmss.chinamobile.com>
Date: Wed, 28 Nov 2018 09:46:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <mhng-22cf4e89-cf9f-4a1d-b254-72b66e51dd82@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv/cpu: use
 device_class_set_parent_realize
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2018 01:46:24 -0000

Hi, Palmer

On 11/28/18 8:34 AM, Palmer Dabbelt wrote:
> On Mon, 26 Nov 2018 01:06:33 PST (-0800), Bastian Koppelmann wrote:
>> On 11/26/18 4:20 AM, Mao Zhongyi wrote:
>>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>>> ---
>>>   target/riscv/cpu.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>
>> Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> 
> Shouldn't we also use device_class_set_parent_reset right below this?  

device_class_set_parent_reset only used for DeviceClass *dc->reset, here
is CPUClass *cc->reset.

Thanks,
Mao

> Either
> way, I'll queue this one for 3.2.
> 
> Thanks!
> 



