Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6DC2-0002Oh-Fq
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 07:46:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6DC0-0002N3-2G
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 07:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6DBz-0003u6-4W
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 07:46:04 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6DBy-0003q5-In
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 07:46:03 -0400
Received: by mail-pf1-x42c.google.com with SMTP id a3so13483437pff.11
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 04:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=NUgBAPxHeSs2SGq2EMSwMHBTenkKwPd1/9mBEz/duHA=;
	b=KU8oIkTVUL6XPyGK8QAYQynghbqWEmYoRaVDkZABWktZ/4KVUKWL6FiN6RwRfQpsZK
	QuJX9L/OyMYJEu+R8bYXvk8uMZzHHVd9n44PxXqmzux2P8mECigtGCHIlBLH6FZR1yGC
	Aaj4MNZLl+mzCE8Zdla6/OKN6MsLJ0315Bev5plgmVOLE3NAXkMrbAtd+iSMiowS1faC
	pTciFj/VaWxSbHrAf8CsxZptA/VrB+mjauWcwksElvVfScYURToKyGbBEAcoaVFk/MY5
	GnMeZ0jdvpBauBAockwc00D6zGGx2/KCD5ipOZzOXu2k2te9RB0i2NlglMrK/HMTzGU9
	UVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=NUgBAPxHeSs2SGq2EMSwMHBTenkKwPd1/9mBEz/duHA=;
	b=V71U88MYcyMhh9lUWSTR/t1Oy64pidp0v2iFaghOj7qYP2e9c3Xw6fpPVu9JD0ys97
	TSkCOpb2BmPqauOPeR7ENn/4KY6mQ9Bo1jwJ81pN4J5Jpi+S20ggsrxoywPmIg2cVnzd
	B2mj5Y+/3Nhia6802p+b7eO/Kg+rZRkL/+ydsRSYTyI92xAeMz6eSPeVLBcxAh+QwYqd
	fgT/jXVZY2uUhgO2dy8Mzljqv+vQ6+dV3UhkklOeed58iefGsnq532ZlvIZ/0gl1V+Sr
	sPxcw/BAaS0CNSl1PV5MHPmtw4ZV+emfRTlAGD/eeLexLuZmW4sRW75uKI9EXG3aldw2
	WkxA==
X-Gm-Message-State: APjAAAVxBPwM9I2mzXk6XNnUsTKuRDHcyha/ztTIwKCPlKeMyhgvQ1M6
	rcsWbdpDzN/M46t9HEWEGOrEyA==
X-Google-Smtp-Source: APXvYqz2z3LjBL66za8N1QG0dkG71Zv0QUA8nJNFWP3Lrdc0uR1RpAqhI70vzqwfvfEaXhxozF2JEA==
X-Received: by 2002:a62:3001:: with SMTP id w1mr1506665pfw.59.1552995958506;
	Tue, 19 Mar 2019 04:45:58 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	73sm22490895pga.19.2019.03.19.04.45.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 04:45:57 -0700 (PDT)
Date: Tue, 19 Mar 2019 04:45:57 -0700 (PDT)
X-Google-Original-Date: Tue, 19 Mar 2019 04:45:49 PDT (-0700)
In-Reply-To: <CAKmqyKNK0ovGpGSqvthp5B-=1k8VrxNAokZj4+PFx==Lr=ETbA@mail.gmail.com>
CC: Chih-Min Chao <chihmin.chao@sifive.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Chih-Min Chao <chihmin.chao@sifive.com>, alistair23@gmail.com
Message-ID: <mhng-7e5bff91-c165-4823-b292-ae81d49e3b4d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 0/5] RISC-V: Add gdb xml
 files and gdbstub support
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
X-List-Received-Date: Tue, 19 Mar 2019 11:46:05 -0000

On Fri, 15 Mar 2019 11:33:09 PDT (-0700), alistair23@gmail.com wrote:
> On Fri, Mar 15, 2019 at 6:45 AM Chih-Min Chao <chihmin.chao@sifive.com> wrote:
>>
>> This is the 5th version of the patch set, based on the Jim's previous work,
>>      http://lists.nongnu.org/archive/html/qemu-riscv/2019-02/msg00059.html
>>
>>     v4 -> v5:
>>        - rebase 7074ab1
>>        - update the register xml files to gdb 8.3
>>        - refine the fpu control registers, fflags/frm/fcsr index calculation
>>        - fix the csr offset calculcation because of tne regnum field in fpu
>>          xml file introducing one useless number
>
> Hey Chih-Min,
>
> I thought this was merged into master, but apparently that never
> happened. Thanks for bringing this up again.
>
> Thanks for the corrections on top of the v4. For future reference if
> the changes are very minor you can probably keep the reviewed tags.
>
> I have reviewed the changes and this should be ready to go. I have
> added Palmer so hopefully he can add this to a PR to get it in for
> 4.0.

Thanks.

This is another one that got queued up behind the decode tree stuff.  I'd call 
this a new feature, but give that it's been on the list and reviewed I'm not 
sure if it's OK for master right now.

Peter: is this too much of a change for post-rc0?  If possible I'd like it in, 
as it's pretty self-contained and enables a meaningful use case.

>
> Alistair
>
>>
>> Jim Wilson (5):
>>   RISC-V: Add 32-bit gdb xml files.
>>   RISC-V: Add 64-bit gdb xml files.
>>   RISC-V: Fixes to CSR_* register macros.
>>   RISC-V: Add debug support for accessing CSRs.
>>   RISC-V: Add hooks to use the gdb xml files.
>>
>>  configure                   |   2 +
>>  gdb-xml/riscv-32bit-cpu.xml |  47 ++++++
>>  gdb-xml/riscv-32bit-csr.xml | 250 +++++++++++++++++++++++++++++++
>>  gdb-xml/riscv-32bit-fpu.xml |  50 +++++++
>>  gdb-xml/riscv-64bit-cpu.xml |  47 ++++++
>>  gdb-xml/riscv-64bit-csr.xml | 250 +++++++++++++++++++++++++++++++
>>  gdb-xml/riscv-64bit-fpu.xml |  56 +++++++
>>  target/riscv/cpu.c          |   9 +-
>>  target/riscv/cpu.h          |   7 +
>>  target/riscv/cpu_bits.h     |  35 ++++-
>>  target/riscv/csr.c          |  32 +++-
>>  target/riscv/gdbstub.c      | 350 ++++++++++++++++++++++++++++++++++++++++++--
>>  12 files changed, 1114 insertions(+), 21 deletions(-)
>>  create mode 100644 gdb-xml/riscv-32bit-cpu.xml
>>  create mode 100644 gdb-xml/riscv-32bit-csr.xml
>>  create mode 100644 gdb-xml/riscv-32bit-fpu.xml
>>  create mode 100644 gdb-xml/riscv-64bit-cpu.xml
>>  create mode 100644 gdb-xml/riscv-64bit-csr.xml
>>  create mode 100644 gdb-xml/riscv-64bit-fpu.xml
>>
>> --
>> 2.7.4
>>
>>

