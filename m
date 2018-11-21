Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXli-00045y-US
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:02:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPXlg-00045Q-4S
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:02:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <logang@deltatee.com>) id 1gPXlc-0001g5-QQ
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:02:31 -0500
Received: from ale.deltatee.com ([207.54.116.67]:42498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <logang@deltatee.com>)
	id 1gPXlc-0001fT-Im; Wed, 21 Nov 2018 14:02:28 -0500
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtp (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1gPXlZ-0007GP-HL; Wed, 21 Nov 2018 12:02:26 -0700
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<a2c70c88a145d2e239f113e28979c7a50d71aedf.1542819633.git.alistair.francis@wdc.com>
	<ff4ef556-0989-ec47-0424-3f153f10a8d0@deltatee.com>
	<CAKmqyKOMsBda223ptqt2iVFi6oVifK_0L+=Mne=v9p_umwxVLg@mail.gmail.com>
	<ed679475-5ba2-c2ce-c468-b531188d6b7e@deltatee.com>
	<CAKmqyKOA0xa0RhNatt9JybpGMLGds+E8CytOXr8rQuSYi7VrxA@mail.gmail.com>
	<a751fd52-28c7-043a-234c-7f7b5251b9ad@deltatee.com>
	<CAKmqyKOaAYkPkJ3h2_smaE+wL2cmtBdNaC6sD_Ztwr7=YDYOMg@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <aecba48c-4194-bf54-6e81-62232de64a08@deltatee.com>
Date: Wed, 21 Nov 2018 12:02:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOaAYkPkJ3h2_smaE+wL2cmtBdNaC6sD_Ztwr7=YDYOMg@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Nov 2018 19:02:33 -0000



On 2018-11-21 11:59 a.m., Alistair Francis wrote:
> On Wed, Nov 21, 2018 at 10:56 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>>
>>
>>
>> On 2018-11-21 11:49 a.m., Alistair Francis wrote:
>>> Agreed. It's the same number as the last interrupt in the QEMU SiFive
>>> U machine. So that is where it came from.
>>
>> Ok, can we have a comment for that?
> 
> I don't think we really need a comment. It's just a made up number. It
> just has to be higher then the actual number of used interrupts. It
> can be changed in the future if required.

If it's confusing to me it'll be confusing to others reading it. At
least put something in the commit log describing the choice of number
and why it's not important...

Logan

