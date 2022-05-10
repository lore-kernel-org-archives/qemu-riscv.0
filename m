Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noO05-00071u-Lc
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 07:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noO04-00070I-Az; Tue, 10 May 2022 07:25:56 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53432
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noO01-00056u-SM; Tue, 10 May 2022 07:25:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id C7AC1300089;
 Tue, 10 May 2022 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652181946;
 bh=49ikZ+pKWdDxHSukkTciAFoS6CoXgs7ExeewPy35QVs=;
 h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=FCPMFUqqYUy1TMP+X3pkBVhl+k+bPysr8ImSddgLcfm3b3TKTennG4UT1+4ffG2hS
 5DpivvMbFj5jRfr4J68GVUKaL2vmBXgBwsYrfVJtU9LBojon3CPm6aHLGMi0SR8Hr+
 PyLS9NZjXPM8i6rWanAj2WoZ/nRNCiVLWXu4c6JU=
Message-ID: <9dc405da-6158-098c-1c7e-6784859dbcc1@irq.a4lg.com>
Date: Tue, 10 May 2022 20:25:45 +0900
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] target/riscv: Tentatively remove Zhinx* from ISA
 extension string
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, Alistair Francis <alistair23@gmail.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <cover.1650777360.git.research_trasio@irq.a4lg.com>
 <cfda1d8da254f2e723e487f0c738c59d5891e492.1650777360.git.research_trasio@irq.a4lg.com>
 <CAKmqyKOx2Q3vjK5b51y1yrKS=f+08qzQFvCiS0iuDqBQ0wo41g@mail.gmail.com>
 <c2a43c93-70a9-721b-d4ae-779a6b3cfd7a@iscas.ac.cn>
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <c2a43c93-70a9-721b-d4ae-779a6b3cfd7a@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 10 May 2022 11:25:56 -0000



On 2022/04/28 11:39, Weiwei Li wrote:
> 
> 在 2022/4/28 上午7:58, Alistair Francis 写道:
>> On Sun, Apr 24, 2022 at 3:22 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>>> This commit disables ISA string conversion for Zhinx and Zhinxmin
>>> extensions for now.  Because extension category ordering of "H" is not
>>> ratified, their ordering is likely invalid.
>>>
>>> Once "H"-extension ordering is determined, we can add Zhinx* again.
>>>
>>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>> Weiwei Li does this sound alright to you?
>>
>> Alistair
> 
> Even though the rule says: "The first letter following the 'Z' conventionally indicates the most closely
> 
> related alphabetical extension category, IMAFDQLCBKJTPVH", zhinx* is not related to 'H' extension actually.
> 
> I think the most closely related alphabetical extension is 'F' extension.
> 
> Regards,
> 
> Weiwei Li

I don't quite agree that.

Although Zhinx* extensions are **functionally** related to 'F' (rather than
'H'), that's not how canonical ordering of Z* extensions works, at least
this is not how canonical ordering is implemented in GNU/LLVM toolchains.

Both toolchains orders Z* multi-letter extensions by second "character"-
first manner.

My interpretation is, Z* multi-letter extensions should be ordered by
category character (the second one) first.  Yes, it should have reflected
the most closely related single-letter extension, but it didn't happend
on Zhinx* extensions.

Thanks,

Tsukasa

> 
>>> ---
>>>   target/riscv/cpu.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 0c774056c5..c765f7ff00 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -954,8 +954,6 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>>>           ISA_EDATA_ENTRY(zfh, ext_zfh),
>>>           ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>>>           ISA_EDATA_ENTRY(zfinx, ext_zfinx),
>>> -        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
>>> -        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
>>>           ISA_EDATA_ENTRY(zdinx, ext_zdinx),
>>>           ISA_EDATA_ENTRY(zba, ext_zba),
>>>           ISA_EDATA_ENTRY(zbb, ext_zbb),
>>> -- 
>>> 2.32.0
>>>
> 

