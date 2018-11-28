Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS4vp-0005Wk-F6
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 13:51:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gS4vm-0005Vu-SO
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 13:51:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gS4vj-0003CX-Oi
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 13:51:26 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gS4vj-0003BR-Ek
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 13:51:23 -0500
Received: by mail-pg1-x535.google.com with SMTP id t13so9883360pgr.11
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=wh+mcd6NnyrUDNRa81978j423fGCZXULwv2fMyftGIg=;
	b=lE7S61qDXVdgapoov61EIeehRNQdFVvw/VbrQfH9tkPZGagEGhiIlqfjkyAGy0mUH2
	XBTebn+tdyNbE4XXe8Mdn5tWZZ+ubVjFrO8/4eJhU/53hvZgmMLwChB9174nAJ7CAdYa
	g06bVhj9RSX0bakfmk8NfK4+E+XHEcOPqacBkXIK4Qc0Pil/CYnGJ63jl4W9Q7ZG4G1T
	dTk/Ib7eHSKahiKObn4vxGtGuESYORg+JaGr1IlO6tNyBopLMxU3BU+/5ApJyN4SrYnZ
	ml7T62FO5d5ltusTx2VL0FDV3FzDqgLDX6cfq6kKSkaXuC/IAPzW6SceCMwmAw4YFcOF
	L+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=wh+mcd6NnyrUDNRa81978j423fGCZXULwv2fMyftGIg=;
	b=torTvz+JTdW+ZGYOp1//78b148Fy2t18p59Vl/GIf5Xb5rNTgUEXUMycGAwDj/c7wr
	CzRS9J1xkCu95Rm4QWod6FCzaMt+AMhiV56CXsSQy0ODTOuPdW2HbBhtlXiDhzYGgdha
	2JZO1EizMZOvrPol9HqQ5UUxRd7tmrAaQOdY8cfZmB+CCqhj3vd72uGGZ4mXyW9lSYWv
	+Cx3nP83Fp9OJ9kmJQz7VlRiHShxiej47HAEWAKBjIw8bCM8/K0pr+wyUBBZAvbuH8i+
	xXd0AYOeXNGFslsQGZY0NVfa5k0a/THoKeAi31fGFFZhcd5RwEEM8b15Wa45b+5s7EWh
	8kGw==
X-Gm-Message-State: AA+aEWauuDpqWLqSiA/s0qEw9KtsTB8L/qYdxwokbX+MdSgVlLReDMZk
	ZFd8QdAVZoxdC53Un8wYabTDoQ==
X-Google-Smtp-Source: AFSGD/XjqL85piOScV8Mj3pfuZ9twPSJRPWfJT5JP6qWERgfB+sMV3Mk79ALu/8zLonzcMCYzzwj4w==
X-Received: by 2002:a63:6483:: with SMTP id y125mr33644498pgb.91.1543431081665;
	Wed, 28 Nov 2018 10:51:21 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	e123sm8501807pgc.58.2018.11.28.10.51.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 10:51:20 -0800 (PST)
Date: Wed, 28 Nov 2018 10:51:20 -0800 (PST)
X-Google-Original-Date: Wed, 28 Nov 2018 10:05:27 PST (-0800)
In-Reply-To: <57736c8b-767b-aa02-762c-c2d6aed060df@cmss.chinamobile.com>
CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
	Michael Clark <mjc@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, philmd@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: maozhongyi@cmss.chinamobile.com
Message-ID: <mhng-6b342876-a719-4f12-9928-04ffbc498752@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::535
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv/cpu: use
 device_class_set_parent_realize
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
X-List-Received-Date: Wed, 28 Nov 2018 18:51:28 -0000

On Tue, 27 Nov 2018 17:46:04 PST (-0800), maozhongyi@cmss.chinamobile.com wrote:
> Hi, Palmer
>
> On 11/28/18 8:34 AM, Palmer Dabbelt wrote:
>> On Mon, 26 Nov 2018 01:06:33 PST (-0800), Bastian Koppelmann wrote:
>>> On 11/26/18 4:20 AM, Mao Zhongyi wrote:
>>>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>>>> ---
>>>>   target/riscv/cpu.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>
>>> Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>
>> Shouldn't we also use device_class_set_parent_reset right below this?
>
> device_class_set_parent_reset only used for DeviceClass *dc->reset, here
> is CPUClass *cc->reset.

Ah, OK, I didn't look closely enough.

> Thanks,
> Mao
>
>> Either
>> way, I'll queue this one for 3.2.
>>
>> Thanks!
>>

