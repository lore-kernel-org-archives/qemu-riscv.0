Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goutk-0007Ie-E0
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 13:47:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gouth-0007IV-Ga
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 13:47:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1goutc-0003LM-Gy
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 13:47:37 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1goutQ-0003BZ-5h
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 13:47:27 -0500
Received: by mail-pg1-x533.google.com with SMTP id y4so187266pgc.12
	for <qemu-riscv@nongnu.org>; Wed, 30 Jan 2019 10:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=K0T219BCCAaG8e9IpoXwWoXDxmWfkAaSew/mRsll+E0=;
	b=ggPwbUPE12SuCV2AshOPRaff0o9jYqooBH+74xeuVNgJF+/lCTVHD2pu00BRO077QU
	CdaOBXYum0CnT2axWrqD9EnzpRXU6mC6wLD0sY/w3apTHhOE1qJbKfiArbGYgSa5H0Lf
	zQlyqsYfEWc9BhqQUTjQ5h6RpxHTCA6xNXFX08NnF0Z6NXGWEoHcru/UiJmycS/RDGhG
	224PlboGd8Y1GgiAss/VTl2FaoJfOkymwhxzOYeWZPZOamZMAkjUXEl2ogj447WGsJCm
	aVFs7yYINT4I36UqwM5pqQnsIipLy7FLP7dq0yO8XrcErODstHZiAxLzB0hpQdWjPxFy
	FnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=K0T219BCCAaG8e9IpoXwWoXDxmWfkAaSew/mRsll+E0=;
	b=F8YNC6Nh3QkcrRjl9pQUZgNvVdALAxmLpOxpTV3bVk8ohuxzgRe2VuYGuGSHMkclr7
	D6wqflZpQ8lWOmnFQ6vBt4s+70eMP8MHA3MdbLp8BWjQyNbDlvChJm75VQHmHzoSTbBh
	uIh8/1jLhdV5W9viPoqup8I3KmHPXxhm3V/Nz0qlWUJdToMbOvdaNjR8HOiJhoB02wEg
	O1sme4+Je5AE9iDgM0u6btUVGnY1layaouX6UgQNbdcnf5TAuw/VJe53CptD7fxdGKkg
	j/xM7uo6hNJ2E3VdK7y6F/yyy854uUMapjYtHNO+CgFtst1bqvH5tE0i7RwJYrWRns14
	uk3w==
X-Gm-Message-State: AJcUukceTy2Yp1mP9uK8RMjJfRGjJZeZCaAKKWtizJGJjcbaVXeqjGj0
	RfcMRRSFmQkNs3nH2RVr0/h3mw==
X-Google-Smtp-Source: ALg8bN66DGXbBumtUVjZaP3Mo7os2Odc9m7fSppF1EA/R5f2nAj5aQmTNM9s63zlMVtMJXG52njW9Q==
X-Received: by 2002:a65:4646:: with SMTP id k6mr28004924pgr.153.1548874033294; 
	Wed, 30 Jan 2019 10:47:13 -0800 (PST)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id h69sm2853158pge.4.2019.01.30.10.47.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 10:47:12 -0800 (PST)
Date: Wed, 30 Jan 2019 10:47:12 -0800 (PST)
X-Google-Original-Date: Wed, 30 Jan 2019 10:44:06 PST (-0800)
In-Reply-To: <603b6279-8670-d614-e1ac-4c13bf870ec9@mail.uni-paderborn.de>
CC: Alistair Francis <Alistair.Francis@wdc.com>, richard.henderson@linaro.org, 
	peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org, sagark@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-1940b8f6-61f9-4fce-b1fc-b97158239424@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::533
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
X-List-Received-Date: Wed, 30 Jan 2019 18:47:42 -0000

On Wed, 30 Jan 2019 01:08:33 PST (-0800), Bastian Koppelmann wrote:
> Hi Palmer,
>
> On 1/29/19 8:22 PM, Palmer Dabbelt wrote:
>> [..]
>> Well, that pretty much exhausts my testing scheme :).  I think
>> Alistair might have a setup for booting a 32-bit Yocto-based distro in
>> QEMU.  Assuming he has the flow set up and it boots then I don't see
>> any reason not to merge it.
>>
>> Thanks for pulling this all together, it's really great to have a
>> cleaner decoder!
>>
>> Alistair: if that's true, can you give this a shot?
>>
>> Bastian: do you mind collecting the relevant tags (Reviwed-by, etc)
>> and putting them in a v6?
>
>
> I already did (see
> http://lists.gnu.org/archive/html/qemu-riscv/2019-01/msg00147.html) :)

Sorry, my mail latency got a bit high.  So I'm good here, just pending any 
other testing we might have floating around.  I just sent up a PR with a 
handful of little things so we can avoid mixing too much stuff together, but I 
don't see any reason not to include this in the next round.

Thanks!

