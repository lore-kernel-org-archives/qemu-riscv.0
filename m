Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYp88-0000cB-Do
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 09:09:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nYp81-0000VB-1l; Mon, 28 Mar 2022 09:09:54 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:63827
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nYp7x-00044Q-Lu; Mon, 28 Mar 2022 09:09:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 8FF6E300089;
 Mon, 28 Mar 2022 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1648472976;
 bh=Q6FooZwCjk25cD2B9bWYtBjsZtJzTVd9U7hvNuds7s4=;
 h=Message-ID:Date:Mime-Version:From:Subject:To:Cc:References:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=HH6aJjGm3l+BzlBmq1FFPNvvQFYPtwyOj+2U09l4P75n9k1KAT6T2qHIazLs0j/tU
 xWrXoBtGxnxJX5swy3sFAzWFD0ZU7xCOOwe3l2Asf4oz6xdTFOuhTKYCTcuj9C49e8
 ma9F1OBq1BJ2XKpNrV54NOzx9H5duphR10KEo/Pg=
Message-ID: <bc1e9ff4-29bc-2289-8f0c-32e0a1b56c31@irq.a4lg.com>
Date: Mon, 28 Mar 2022 22:09:33 +0900
Mime-Version: 1.0
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH (PING) 0/1] target/riscv: misa to ISA string conversion fix
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <cover.1648270894.git.research_trasio@irq.a4lg.com>
 <CAKmqyKNhXjGX4PyTXTmyPArEfZeb4FgKX-6pjdwVk8avnN6cTw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKmqyKNhXjGX4PyTXTmyPArEfZeb4FgKX-6pjdwVk8avnN6cTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 28 Mar 2022 13:09:54 -0000

On 2022/03/28 8:29, Alistair Francis wrote:
> On Sat, Mar 26, 2022 at 3:46 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>>
>> [This is the same patch as previous ones]
> 
> Hello,
> 
> Thanks for the patch!
> 
>> <https://lists.nongnu.org/archive/html/qemu-riscv/2022-02/msg00098.html>
>>  (qemu-riscv only)
> 
> This never made it to the QEMU mailing list
> 
>> <https://lists.nongnu.org/archive/html/qemu-riscv/2022-02/msg00097.html>
>>  (resent due to configuration error of my mail server; qemu-riscv only)
> 
> and neither did this

Ah, that was the reason!  I'm happy to know that.

> 
>>
>> I hope this is applied before the QEMU 7.0 release.
> 
> Unfortunately you have missed the window for 7.0. This patch will need
> to be reviewed then applied for the next QEMU release.

Understood.

> 
>>
>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>>
>> S and U are misa bits but not extensions (instead, they are supported
>> privilege modes).  Thus, they should not be copied to the ISA string.
>>
>> I am truly surprised that this patchset is the THIRD attempt to fix this
>> longstanding problem.
> 
> I'm sorry you feel this way, but this is the first time this patch has
> been sent to the list since 2019.
> 
> I'm not sure why (1) wasn't applied, but (2) and (3) don't appear to
> have been sent to the QEMU mailing list.
> 
> The separate RISC-V mailing list is confusing, but patches should be
> sent to qemu-devel, as described at:
> https://wiki.qemu.org/Contribute/MailingLists
> 
> Alistair

Thanks for letting me know.  From the next time, I will follow this.


> 
>>
>> (1) August 2019: by Palmer Dabbelt
>> <https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00165.html>
>> <https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00141.html>
>> <https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00259.html>
>>
>> (2) April 2021: by Emmanuel Blot
>> <https://lists.nongnu.org/archive/html/qemu-riscv/2021-04/msg00248.html>
>>
>> (3) February 2022: by me (this patchset)
>>
>> I feel this is urgent to eliminate this bug now considering it required
>> a workaround to RISC-V Linux kernel as I pointed out:
>> <http://lists.infradead.org/pipermail/linux-riscv/2022-February/012252.html>
>>
>>
>> Though my patchset is first developed independently, this submitted
>> version is influenced by (2) Emmanuel Blot's patchset.  Thanks to this,
>> constant "[n]" can now be variable "[]".
>>
>> It also fixes an ordering issue where 'C' should be preceded by 'L'
>> (order: 'L' -> 'C') as per the RISC-V ISA Manual (version 20191213),
>> Table 27.1.
>>
>> It clarifies the role of `riscv_exts'.  It's a single-letter extrension
>> ordering list.
>>
>>
>>
>>
>> Tsukasa OI (1):
>>   target/riscv: misa to ISA string conversion fix
>>
>>  target/riscv/cpu.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>>
>> base-commit: f345abe36527a8b575482bb5a0616f43952bf1f4
>> --
>> 2.32.0
>>
>>
> 

