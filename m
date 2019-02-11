Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtG9M-0003Jf-0h
	for mharc-qemu-riscv@gnu.org; Mon, 11 Feb 2019 13:17:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtG9J-0003JJ-Jg
	for qemu-riscv@nongnu.org; Mon, 11 Feb 2019 13:17:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtG9I-0002Ie-EZ
	for qemu-riscv@nongnu.org; Mon, 11 Feb 2019 13:17:45 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41652)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtG9H-0002FQ-U8
	for qemu-riscv@nongnu.org; Mon, 11 Feb 2019 13:17:44 -0500
Received: by mail-pf1-x444.google.com with SMTP id b7so5627204pfi.8
	for <qemu-riscv@nongnu.org>; Mon, 11 Feb 2019 10:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=GGup1GtH3/PR94/FYNlr9ZXn7Q4Ys63kyvloGeu9fz4=;
	b=FOTtvVcdMaYhk9WqXaX+9xaWVF2enSMlNweBPJLksociakaCF2aKoZoNB+KzZbO6DB
	nqYjjc/RnKEdlvTYN3UAvlRTytSCRlM4HNNmPcAgGPYHOTcNi0fZVy522u/CXJ8hIVr2
	nRexikkODdbcl5zZae4qRjpGcRcyST0IocO9COhjOX8gfJDk9TbfDMXCzjhftKzuBdpR
	3k9Wec/7EJ0cPOeg2jU/RbNGVqarowtpYiv0NsCgRLFoVmMwBgdL2yuKDEToyae8NTnK
	R/dxOl/vRLWSPzr09FeoHtLTjCEWNf9YqfAdL0ih7iRWCXgKQJJ2PgcxBw1WqqY5yRFX
	lKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=GGup1GtH3/PR94/FYNlr9ZXn7Q4Ys63kyvloGeu9fz4=;
	b=M3gxEUr575oZR4cPJx/2JhSSKX7Ekj/17c8Z1sYdfweG3aS+YXHkx9xGzlB/+EmYSZ
	2IEMSq8kr3uxf4KEQovZqZEvJcpWOCfTpCQqG3a0A/fw/gJyBV+k5jsKu46qDhNd41hS
	NCIiV9d53HjX/ss/yfhpsv+LbUplAscr3LZO8jZGsN7ridAcE4uBxwpONHWfyQeIYADt
	pA7WMgnqkZnFeaJH4dTEQUV6JeLW4GeciM7FAQAdk7KuAUZHhw+0lpP35GKiOHJ3GgYD
	sZyZhwHd8DEIpAzM9C0ZgMTJXhTvNqTOAzU9H9SfPqGGWsPBhFyzhVhB+i4AGI5JUVgc
	Z1Rg==
X-Gm-Message-State: AHQUAub+bdRt7YqajjtVxyCX3f9P04kX0+RylAV2sQ8W/bBatQgpL/Dg
	TUPVKuA5Egzeg5iCK5rvHc1M2Q==
X-Google-Smtp-Source: AHgI3IZYgo77w8106uNn4GLp3CmQTe2u1KhQXILfWQtFawTQ5lIx52U2BwX9jWlvBKwLIMAmV2Xx6g==
X-Received: by 2002:a63:2d43:: with SMTP id t64mr13837793pgt.155.1549909061873;
	Mon, 11 Feb 2019 10:17:41 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	l2sm14925657pgn.52.2019.02.11.10.17.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 10:17:41 -0800 (PST)
Date: Mon, 11 Feb 2019 10:17:41 -0800 (PST)
X-Google-Original-Date: Mon, 11 Feb 2019 10:17:21 PST (-0800)
In-Reply-To: <CAKmqyKOr5eX1hQXURdz6Y7qDgygGOwYyFeKKZCH83UuuRkuR9w@mail.gmail.com>
CC: Jim Wilson <jimw@sifive.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-f2a3d61b-68dc-4842-a695-0eff3c6d81e4@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 5/5 v3] RISC-V: Add hooks to
 use the gdb xml files.
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
X-List-Received-Date: Mon, 11 Feb 2019 18:17:46 -0000

On Fri, 08 Feb 2019 11:28:48 PST (-0800), alistair23@gmail.com wrote:
> On Fri, Feb 8, 2019 at 11:09 AM Jim Wilson <jimw@sifive.com> wrote:
>>
>> On Fri, Feb 8, 2019 at 10:17 AM Alistair Francis <alistair23@gmail.com> wrote:
>> > Can we just write a wrapper function then that sets and unsets the variable?
>> > Something like this:
>> >
>> > riscv_csrrw_debug(...) {
>> >     #if !defined(CONFIG_USER_ONLY)
>> >             env->debugger = true;
>> >     #endif
>> >             result = riscv_csrrw(env, ...);
>> >     #if !defined(CONFIG_USER_ONLY)
>> >             env->debugger = false;
>> >     #endif
>> > }
>>
>> Yes, that would work.  Do you want me to resubmit a fixed part 5 patch?
>
> It's probably best to send out a new version of the whole series.
> Include all the Reviewed-by tags and then that should be the last
> version and Palmer can apply that series directly.

Ya, that's the best way to do it.  That way everyone is on the same page about 
exactly what is going in.

