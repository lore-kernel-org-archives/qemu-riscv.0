Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goYyK-0001JK-1W
	for mharc-qemu-riscv@gnu.org; Tue, 29 Jan 2019 14:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1goYyH-0001Gv-8u
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 14:22:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1goYyG-0001IS-6k
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 14:22:57 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1goYyF-0001HW-Tb
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 14:22:56 -0500
Received: by mail-pl1-x643.google.com with SMTP id p8so9786823plo.2
	for <qemu-riscv@nongnu.org>; Tue, 29 Jan 2019 11:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=ZODLOTNa0j1s4LgWZRG+Wh9WBuoV5PI4GCRIcvi2K/Q=;
	b=ZY8BxCWyxHefgpCrYJmMfpO9kMKXyqmmVEm1EAxryD2SkW2kHg8aOjVKbUvVIUGpOL
	SwKCB+ZQUNJy2f94JYxJWJaYVoAA8BS6EdvJwRKuY+CqiSnMOLp2p5GbRAnmLKv+39R2
	cwGiTFeAAgIFM3OEDp7wsCMw/l/P/YkLSJgAWzKOmZhJF0f4gx9HZDeRMYiSX7j1Ct0x
	Rg4ke8fyDJ6iExzuiRCX53ZxlV3L57rnk4nJH3XvQMneaT2t3mVna++kxGjtFRqVj/TR
	QLUlVaOaB3EO2poyvoOoBJMakmVt12OEtqwYln+1qBD4pM4kuMPXSZi5K9LxaV8t6ClR
	UFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=ZODLOTNa0j1s4LgWZRG+Wh9WBuoV5PI4GCRIcvi2K/Q=;
	b=OhDb+nInh0nmr/bvAqfrWmj0hxLgoLsS482CECc65jgLmK1UBNpk7IaLaEfXKl7rvL
	diwBxiLeB+d5CUE5MEGNLZ3Xi+hcMhoPC8PRhG5LZCspYt9F6jeXXX6laj0zMFMVSHhL
	Kn+pOonP9/0SBy7dfnufJbTICHkLfdNvYvfWCl7sV5Ucvfrbr/IMj2lU4ibQLR4Uypko
	2WQbi6L52dD99O+sCDCYI0vg2iVK9CfLSZ1VXuzLHEEztpOIhpXcSLomGKnHjpqgGkVW
	29YA+rwPLQgz5a/WxWahkGxAcmWXGNP6FIlxz5nsnNqNRgOZBzbX3hccjq0Tvz8yWzTz
	B4jg==
X-Gm-Message-State: AJcUukevKjyaGzjy7BW+ah512jx8a3P0GuOxbDAM0Pw1NfmsN+uY4kFv
	C2jQ67z2vntS4FaD6bw7L0VuAI8pJCo=
X-Google-Smtp-Source: ALg8bN51IrYFu7dLOP4r/BWU0bGAtenVL2ccieKE1zIUMNrtFq4X/kjO0c2hPfbxC4VIWmfXhBO6sQ==
X-Received: by 2002:a17:902:b20e:: with SMTP id
	t14mr27389710plr.128.1548789774249; 
	Tue, 29 Jan 2019 11:22:54 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	h74sm54003582pfd.35.2019.01.29.11.22.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 11:22:53 -0800 (PST)
Date: Tue, 29 Jan 2019 11:22:53 -0800 (PST)
X-Google-Original-Date: Tue, 29 Jan 2019 11:17:19 PST (-0800)
In-Reply-To: <69b40819-748e-d555-316a-6ce90e944bde@mail.uni-paderborn.de>
CC: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org, sagark@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-2dd4c232-3efb-4173-aae1-491b9aa2685b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 00/35] target/riscv:
 Convert to decodetree
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
X-List-Received-Date: Tue, 29 Jan 2019 19:22:58 -0000

On Sat, 26 Jan 2019 00:51:23 PST (-0800), Bastian Koppelmann wrote:
> On 1/26/19 12:54 AM, Palmer Dabbelt wrote:
>> On Tue, 22 Jan 2019 13:38:52 PST (-0800), richard.henderson@linaro.org wrote:
>>> On 1/22/19 1:28 AM, Bastian Koppelmann wrote:
>>>> Hi,
>>>>
>>>> this patchset converts the RISC-V decoder to decodetree in four major steps:
>>>>
>>>> 1) Convert 32-bit instructions to decodetree [Patch 1-16]:
>>>>     Many of the gen_* functions are called by the decode functions for 16-bit
>>>>     and 32-bit functions. If we move translation code from the gen_*
>>>>     functions to the generated trans_* functions of decode-tree, we get a lot of
>>>>     duplication. Therefore, we mostly generate calls to the old gen_* function
>>>>     which are properly replaced after step 2).
>>>>
>>>>     Each of the trans_ functions are grouped into files corresponding to their
>>>>     ISA extension, e.g. addi which is in RV32I is translated in the file
>>>>     'trans_rvi.inc.c'.
>>>>
>>>> 2) Convert 16-bit instructions to decodetree [Patch 17-19]:
>>>>     All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
>>>>     we convert the arguments in the 16 bit trans_ function to the arguments of
>>>>     the corresponding 32 bit instruction and call the 32 bit trans_ function.
>>>>
>>>> 3) Remove old manual decoding in gen_* function [Patch 20-30]:
>>>>     this move all manual translation code into the trans_* instructions of
>>>>     decode tree, such that we can remove the old decode_* functions.
>>>>
>>>> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
>>>>    by Richard. [Patch 31-35]
>>>>
>>>> full tree available at
>>>> https://github.com/bkoppelmann/qemu/tree/riscv-dt-v5
>>>>
>>>> Cheers,
>>>> Bastian
>>>>
>>>> v4 -> v5:
>>>>     - fixed rebase error
>>>>     - moved TARGET_LONG_BITS check of shift instructions before rd == 0 check
>>>>     - removed extra sign extension of sraiw
>>>>     - removed rs2 == 0 special cases in sraw/srlw
>>>
>>> All looks good to me now.  Thanks for persevering.
>>
>> Thanks for reviewing this.
>>
>> Bastian: what sort of testing have you done here?  This is a pretty big change,
>> and while it's been fairly extensively reviewed I'm just generally paranoid.
>>
>
> I ran riscv-test as well as booting the newest fedora.

Well, that pretty much exhausts my testing scheme :).  I think Alistair might 
have a setup for booting a 32-bit Yocto-based distro in QEMU.  Assuming he has 
the flow set up and it boots then I don't see any reason not to merge it.

Thanks for pulling this all together, it's really great to have a cleaner 
decoder!

Alistair: if that's true, can you give this a shot?

Bastian: do you mind collecting the relevant tags (Reviwed-by, etc) and putting 
them in a v6?

