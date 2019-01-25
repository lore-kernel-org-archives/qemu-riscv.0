Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gnBJS-0003RG-7H
	for mharc-qemu-riscv@gnu.org; Fri, 25 Jan 2019 18:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gnBJO-0003Op-0E
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 18:55:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gnBJM-0005HH-Mz
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 18:55:01 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gnBJM-0005Ea-5c
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 18:55:00 -0500
Received: by mail-pf1-x442.google.com with SMTP id g62so5427939pfd.12
	for <qemu-riscv@nongnu.org>; Fri, 25 Jan 2019 15:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=C0zeCOrYaFdLPk8Lc/cqTFJigmRBCUq/7TAZ4rYVC9g=;
	b=Mug0QljL3hQy12GXZu7B5Qlq+nu4bUVJPz0tYHZEYZKO3pTzWR9eeyLg8wpzl+UM9X
	6L+4JDKEcM6SBRdKoJEg4qo31qaTmTw63z/ytPcpaYXzTso94HtdV/5hOQMkexo0zHTQ
	iORL2beIz5VEuWNinTIFrcoIkcB1xacjnkOETMWILF2uF6CWCkxXgCSKAp07UGK9d+IC
	/A9+xA/SFtXvOyndn634yJhuIRP6hvhsmBr05q15oYYb8nKrlhnUa8b4Aoh94fa4Bdn/
	JL13GMo3PgB5XB2FWJY1M41KX4Z61euau2HlRjC1BpUiSZjTcnN3CKJalH/ZTKjO67dy
	XPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=C0zeCOrYaFdLPk8Lc/cqTFJigmRBCUq/7TAZ4rYVC9g=;
	b=LUKY9Vssgs1/6znadckxUO4Dkr5W+fXyqiiyyCz6IKnBk/wjvQ5/1Ro+gkPkGsFiH8
	ahID49/QlARnLduRdd6nx2YWzN4Mg1SIpFtUJA4n6+JJQRGW54xKJjmxwwAG7K2ye8jB
	a3XRS2IwZrGe9zK4+VE0JiIR1AyAulb8wVjvgSFJ6ij5//DStKEOOS5vCoJUdwIANIQi
	A5Pn7qO7KTrit2JX3Fy+cn58hTGL8iHQ79EkkdEMQumRxJvoHOVQMbXSjHmC3beJz8GI
	7mTph6LNcta/wjD0N/AKWFNgbM5dSO+kHZTd7d/czDKC8YOPnSeJ+cABr4SLD2HzTOyT
	Fpdg==
X-Gm-Message-State: AJcUukdS0Eyh/qy4PA6Ye8MHnI+F9jDyXQHmgB5B3W2Sk83fqSQfcbPZ
	viF36HjeVIBKp+vmX7TBnaRvcw==
X-Google-Smtp-Source: ALg8bN5BR8d85vkETFVy/TPLNtj6Bddal5E5V78OBPyfUqFwCVZWnLAjilfmKDicsm0gZCx49slOeA==
X-Received: by 2002:a63:cd11:: with SMTP id i17mr11855648pgg.345.1548460498847;
	Fri, 25 Jan 2019 15:54:58 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	m67sm37372854pfm.73.2019.01.25.15.54.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 15:54:58 -0800 (PST)
Date: Fri, 25 Jan 2019 15:54:58 -0800 (PST)
X-Google-Original-Date: Fri, 25 Jan 2019 15:52:24 PST (-0800)
In-Reply-To: <2153eec6-f25f-4e34-6423-01d76a14815c@linaro.org>
CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, 
	peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-a089b75c-29ca-4a50-b64c-e86349ac6190@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-riscv] [PATCH v5 00/35] target/riscv: Convert to
 decodetree
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
X-List-Received-Date: Fri, 25 Jan 2019 23:55:03 -0000

On Tue, 22 Jan 2019 13:38:52 PST (-0800), richard.henderson@linaro.org wrote:
> On 1/22/19 1:28 AM, Bastian Koppelmann wrote:
>> Hi,
>>
>> this patchset converts the RISC-V decoder to decodetree in four major steps:
>>
>> 1) Convert 32-bit instructions to decodetree [Patch 1-16]:
>>     Many of the gen_* functions are called by the decode functions for 16-bit
>>     and 32-bit functions. If we move translation code from the gen_*
>>     functions to the generated trans_* functions of decode-tree, we get a lot of
>>     duplication. Therefore, we mostly generate calls to the old gen_* function
>>     which are properly replaced after step 2).
>>
>>     Each of the trans_ functions are grouped into files corresponding to their
>>     ISA extension, e.g. addi which is in RV32I is translated in the file
>>     'trans_rvi.inc.c'.
>>
>> 2) Convert 16-bit instructions to decodetree [Patch 17-19]:
>>     All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
>>     we convert the arguments in the 16 bit trans_ function to the arguments of
>>     the corresponding 32 bit instruction and call the 32 bit trans_ function.
>>
>> 3) Remove old manual decoding in gen_* function [Patch 20-30]:
>>     this move all manual translation code into the trans_* instructions of
>>     decode tree, such that we can remove the old decode_* functions.
>>
>> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
>>    by Richard. [Patch 31-35]
>>
>> full tree available at
>> https://github.com/bkoppelmann/qemu/tree/riscv-dt-v5
>>
>> Cheers,
>> Bastian
>>
>> v4 -> v5:
>>     - fixed rebase error
>>     - moved TARGET_LONG_BITS check of shift instructions before rd == 0 check
>>     - removed extra sign extension of sraiw
>>     - removed rs2 == 0 special cases in sraw/srlw
>
> All looks good to me now.  Thanks for persevering.

Thanks for reviewing this.

Bastian: what sort of testing have you done here?  This is a pretty big change, 
and while it's been fairly extensively reviewed I'm just generally paranoid.

