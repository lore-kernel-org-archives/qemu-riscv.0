Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4mWf-0005hn-VG
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 09:05:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4mWc-0005eW-77
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:05:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4mWa-0002S9-Nv
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:05:26 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h4mWa-0002Rt-GJ
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:05:24 -0400
Received: by mail-pf1-x431.google.com with SMTP id 8so2910272pfr.4
	for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2019 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=2kwjzunZ/pFbDBy/VugbrkqZ1PV3LmKV/HsNUOsRsgI=;
	b=UekvKpoKAepH3tSyu8HXyH0JjGInQmeTVnOYQ5IRTzWS3DDKPEeMD2dK0spd59t9dd
	xQZ158yIX7Mkueb5UCdkpUf1+d14UfFKrL660fIyOZbFQaHSDJk7dYSndhp8lo1FOZA6
	jclR1SfIT6NsXRiyxRtka//zjmnzsxnIlvCuqHRPwi+/LWH7t60aTJo4hDtIgPySZ8j+
	WTh4xP3L8EAWcd0Xk5FXYt2dC+E82R6khEsDaufecU72QyainLQwdZkLn3t2IlHOlxmh
	xt0NtL+1iAgm2HqCde1FXyev9vVb5wlMqeanesZhsRFl+bZ1ZeQWoEgKmDRMEoEwic8U
	NE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=2kwjzunZ/pFbDBy/VugbrkqZ1PV3LmKV/HsNUOsRsgI=;
	b=hTXoThns2LoxWcc27Wf/bnAFzp5xyCkVxlrqo7/i4GBOSk7EHPsbgAph0YsyALRxj7
	RVmjDy5y2gyZO+XMyqCmS6M3ZSBLSaGchR3HMp1RnR8R8WuIG3udL5goVRMXyQeGuDSU
	NuzqVhQuBX0BSAdGl0+ks0LPRUq2oT7p8/p/4v/QC+ra+4Ej3iShw+4kTaOGePhiJeIC
	sKcMKIWw9OisEN2TGzs6u3ojoUaQ6wb4Q2OQRULBJ4FBWBlKMXtyLd6SMQ+V8SPgN9xS
	obLNmz0a+B51aWSym7awVZ75BD2MGJADtJ+0GezzWwALZHyFXPk1gveeh9TCJeuTWI85
	ZjgQ==
X-Gm-Message-State: APjAAAV/emxAY3+l1ERb/ZSlzPULLtDmoAD4g+dx6A9E+HcrgOG7Spjg
	XYFU1MaA0E90g4fSb7qH/cSshg==
X-Google-Smtp-Source: APXvYqwDGU10AckDlPtnr69wWQez4P8bjr3Sp04ycfXIFLin20mhj6V3fOKWxiCjseTqQxrUUJkqOg==
X-Received: by 2002:a17:902:8497:: with SMTP id
	c23mr3593359plo.99.1552648788023; 
	Fri, 15 Mar 2019 04:19:48 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1b83-111e-e05a-fecf-ca59.dynamic-ip6.hinet.net.
	[2001:b011:7001:1b83:111e:e05a:fecf:ca59])
	by smtp.gmail.com with ESMTPSA id
	k27sm6999376pgb.70.2019.03.15.04.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 04:19:46 -0700 (PDT)
Date: Fri, 15 Mar 2019 04:19:46 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Mar 2019 04:19:41 PDT (-0700)
In-Reply-To: <2d60f4a8-66ae-12e0-6de4-2440eab2459a@mail.uni-paderborn.de>
CC: alistair23@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
	peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-c6f37e6f-035e-4bdd-9853-de6c69edef3a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::431
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 17/29] target/riscv: Convert
 quadrant 1 of RVXC insns to decodetree
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
X-List-Received-Date: Fri, 15 Mar 2019 13:05:28 -0000

On Fri, 15 Mar 2019 02:06:07 PDT (-0700), Bastian Koppelmann wrote:
> Hi Alistair
>
> On 3/14/19 9:28 PM, Alistair Francis wrote:
>> On Wed, Mar 13, 2019 at 7:53 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
>> This commit is the first bad commit in breaking 32-bit boot.
>>
>> It looks like the jal doesn't jump to the correct address:
>>
>> ----------------
>> IN:
>> 0x80000022:  00050433          add             s0,a0,zero
>> 0x80000026:  000584b3          add             s1,a1,zero
>> 0x8000002a:  2c79              jal             ra,670          # 0x800002c8
>>
>> ----------------
>> IN:
>> 0x800002c8:  00000533          add             a0,zero,zero
>> 0x800002cc:  8082              ret
>
>
> Oops! Can you point me to the binary to reproduce this?

I think I've traced it down to something simple: in my hello world binary I see

    20401a8c:       2a45                    jal     20401c3c <atexit>

in the objdump, and I see

    IN: _start
    0x20401a8c:  2a45              jal             ra,432          # 0x20401c3c

but then QEMU jumps to 0x20401a9d.  I have a feeling it's something wrong with 
gen_jal() that disappeared during the cleanups that we dropped in order to fix 
the build issues.

I'm running

    ./riscv32-softmmu/qemu-system-riscv32 -machine sifive_e -kernel ~/work/sifive/freedom-e-sdk/software/hello/hello -nographic -d in_asm,out_asm,exec,cpu -singlestep |& tee out.log

on the "hifive1" branch of github.com/palmer-dabbelt/qemu, which just has a 
PRCI fixup that I forgot about and haven't sent upstream yet (I'll do that 
after this issue).  The binary should be at

    http://www.dabbelt.com/~palmer/hello.elf

and the debug log at 

    http://www.dabbelt.com/~palmer/out.log

You can build the binary from github.com/sifive/freedom-e-sdk via

   make software PROGRAM=hello TARGET=sifive-hifive1

using the riscv64-unknown-elf-gcc-20181127-x86_64-linux-ubuntu14 toolchain 
binaries from our website (newer ones should work, but probably won't produce 
exactly the same output).

I'll poke around after grabbing some dinner...

