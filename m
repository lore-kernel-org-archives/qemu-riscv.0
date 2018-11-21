Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXVl-0003SZ-2L
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:46:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPXVh-0003SN-Mb
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:46:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPXVd-0000gE-Lp
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:46:01 -0500
Received: from ale.deltatee.com ([207.54.116.67]:42334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPXVd-0000aa-Cw; Wed, 21 Nov 2018 13:45:57 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPXVY-0006x1-Km; Wed, 21 Nov 2018 11:45:53 -0700
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<a2c70c88a145d2e239f113e28979c7a50d71aedf.1542819633.git.alistair.francis@wdc.com>
	<ff4ef556-0989-ec47-0424-3f153f10a8d0@deltatee.com>
	<CAKmqyKOMsBda223ptqt2iVFi6oVifK_0L+=Mne=v9p_umwxVLg@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <ed679475-5ba2-c2ce-c468-b531188d6b7e@deltatee.com>
Date: Wed, 21 Nov 2018 11:45:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOMsBda223ptqt2iVFi6oVifK_0L+=Mne=v9p_umwxVLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: abologna@redhat.com, linux@roeck-us.net,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Alistair.Francis@wdc.com, alistair23@gmail.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 207.54.116.67
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 1/6] hw/riscv/virt: Increase the
 number of interrupts
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
X-List-Received-Date: Wed, 21 Nov 2018 18:46:02 -0000



On 2018-11-21 11:17 a.m., Alistair Francis wrote:
> On Wed, Nov 21, 2018 at 9:58 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>>
>>
>>
>> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
>>> Increase the number of interrupts to match the HiFive Unleashed board.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>  include/hw/riscv/virt.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
>>> index 91163d6cbf..7cb2742070 100644
>>> --- a/include/hw/riscv/virt.h
>>> +++ b/include/hw/riscv/virt.h
>>> @@ -45,7 +45,7 @@ enum {
>>>      UART0_IRQ = 10,
>>>      VIRTIO_IRQ = 1, /* 1 to 8 */
>>>      VIRTIO_COUNT = 8,
>>> -    VIRTIO_NDEV = 10
>>> +    VIRTIO_NDEV = 0x35
>>
>> Why 0x35? Based on the PCI patch we are using only 36 interrupts, not 53...
> 
> This is just for future proofing. There is no reason to set the number
> lower then the number of interrupts we have, now hopefully this won't
> keep churning every time we add a device.

Makes sense. Still 53 is an odd number.

Logan

