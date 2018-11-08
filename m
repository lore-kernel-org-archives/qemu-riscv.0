Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKo7r-00034x-Qi
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 12:29:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gKo7m-00032N-Pd
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 12:29:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gKo7l-0001Hp-P7
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 12:29:46 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:41662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gKo7V-00019y-OL; Thu, 08 Nov 2018 12:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mJa4vKP0FGC8Q65G3sllILUXcQh/3SkXPdf79VftK78=;
	b=WXhVCnO05QzDokZy/1ycpAWr66
	JbBPFKGHsdNlSoQIZPPOL4nyNw/2FAKf4BYuyOK1ib/7ZwLNbu5hB4tfdcCodCJqtnFnK7tJF+L53
	nzhJKdjAa9YE2dNBi+5ny/NJDey/+x95rCGQjN8kNHcOoyFBx/ONOLNeamcjWUQjG5Fw=; 
To: Richard Henderson <richard.henderson@linaro.org>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
	<97b143d6-5503-21ee-a836-cfa2597a5856@linaro.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <d6ec0bb8-1ea6-c032-5643-2248ce7647a6@mail.uni-paderborn.de>
Date: Thu, 8 Nov 2018 18:29:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <97b143d6-5503-21ee-a836-cfa2597a5856@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.5.2775670, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.11.8.172117, AntiVirus-Engine: 5.53.0,
	AntiVirus-Data: 2018.10.10.5530001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 0/2] target/riscv: Bugfixes
 found in decodetree conversion
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
X-List-Received-Date: Thu, 08 Nov 2018 17:29:51 -0000


On 11/8/18 4:53 PM, Richard Henderson wrote:
> On 11/8/18 1:06 PM, Bastian Koppelmann wrote:
>> while going through the reviews of the riscv-decodetree patches, two bugs came
>> up that I fix here. There is one more problem [1] mentioned by Richard but
>> I don't have the time to investigate it further.
>>
>> [1] https://patchwork.kernel.org/patch/10650293/
> That one's not a bug, but an optimization.
>
> The other bug mentioned is shrw and shaw not sign-extending the result.


That was a bug I introduced during the conversion to decodetree.


Cheers,

Bastian


