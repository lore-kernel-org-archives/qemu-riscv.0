Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwYM-00055H-10
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:34:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwYK-000548-7j
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:34:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwYJ-00068G-D5
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:34:24 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39226)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwYJ-00067O-4o
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:34:23 -0500
Received: by mail-pg1-x542.google.com with SMTP id r11so1285137pgp.6
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=7ql0rpGUD0Lze6haTBrD3h+CrrIqkElOnfuksjbaAA8=;
	b=NH4pEIfqyWlBKC/60QxiWMUYnv1B/WRcCspKWyMqhop1116QJ/elsQDC2vjzMReXvU
	w+Wcy/TUhQ2owriAKVAkoR+A58RfUyjeEY2MJULWFe1Mf7X374YsszUwK8btUzUNhAab
	PyldBt3pUMwqg1eWBl5Mb9TdbesX7Xq28F2DU/W4lpGYcEypHuLeKk6PKoTpMqSP1RRl
	JNcZqgo/dUK63GJbolm5wHn/s+Rv6BaPEI21AQ/DSndFFUKEi1Yii2tt+sbYsgClxr2k
	NiNq8PYJZzjpwr6ZJ99CPoQcnWGGUvJ4ZKfKN+v9nsWNUlxPANKSCtD6VAhuCzoh22B8
	pKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=7ql0rpGUD0Lze6haTBrD3h+CrrIqkElOnfuksjbaAA8=;
	b=V6UvvU7ON/F7epLOy8PUDIwT1gC5rzA+CcPBH7/HVEbNOQOm90FBMVnSkoPhwkA5cj
	dzYpddIopbZ9DKX/bKEfrFkXWHkiYfNGSzqPOZOoLdEY78o8D3+13Kknx34VAceJEn50
	w1Aofro7RXDFokWYRnENIy4mtwTPxiZZ2qucZZVQnqzhcC1H4NS9phOqjkwIAz9z8YI6
	g1kY+XYTzTGC7eTd8etc2bGjDf/4FJIUw1JtN5CbTcSOK7NPlJW0yl2SerV2Cuc5I78m
	PxYjY5WZDYpcGsxiU7AKKE0fz8PyvRTRIhhLhH5HQx+R5EWoIVVQT7P3sHhNpuXt2dth
	yn/g==
X-Gm-Message-State: AHQUAuaKzoXCo0HLwJB5bVkDx5WP+56TgP9SKjsHlb7FhORIL85MTTiQ
	KCXYPZOZkfRV1T9wfI64LQl6rQ==
X-Google-Smtp-Source: AHgI3IZT6/IpUwyNeHGtF/6Nnw5SbTJjVBZIyaMGMNHxhAMZpCuMYb4dbkPwOarv5E0rX83gMXp3zw==
X-Received: by 2002:a62:4b4d:: with SMTP id y74mr1059592pfa.186.1550072060869; 
	Wed, 13 Feb 2019 07:34:20 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w65sm19042889pfb.23.2019.02.13.07.34.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:34:19 -0800 (PST)
Date: Wed, 13 Feb 2019 07:34:19 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 07:34:17 PST (-0800)
In-Reply-To: <7a7b5675-3d66-6c87-8830-74c60f8a7471@mail.uni-paderborn.de>
CC: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org, sagark@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-64897fe3-6dad-4973-9246-07c07ecba2af@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 00/35] target/riscv:
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
X-List-Received-Date: Wed, 13 Feb 2019 15:34:25 -0000

On Wed, 13 Feb 2019 01:06:41 PST (-0800), Bastian Koppelmann wrote:
>
> On 2/13/19 3:15 AM, Palmer Dabbelt wrote:
>> On Tue, Feb 12, 2019 at 3:21 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> [snip]
>>>
>>> Do you, by any chance, have a v7?  It looks like there's quite a few merge
>>> conflicts here, and while I'm OK fixing them I don't want to do it if you
>>> already have.
>>>
>> I made it through my rebase, so unless you want to send out a v7 I will.
>> There were some meaningful changes so I'd like to get a round of review
>> just so everyone is on the same page.
>
>
> Thanks for doing this work. I don't have a v7 yet, since I was waiting
> on your current pull-request to get merged. So please do send a v7, I'm
> happy to review/test it.

Sounds good.  It definitely deserves a review, as I was sort of just fumbling 
around in the dark here :)

