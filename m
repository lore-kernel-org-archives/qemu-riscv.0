Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBqkc-0000BG-9D
	for mharc-qemu-riscv@gnu.org; Wed, 03 Apr 2019 21:01:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hBqkZ-00005I-Ft
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 21:01:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hBqkT-0005cH-92
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 21:00:59 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46031)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hBqkN-0005WX-Gh
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 21:00:53 -0400
Received: by mail-pg1-x544.google.com with SMTP id y3so315593pgk.12
	for <qemu-riscv@nongnu.org>; Wed, 03 Apr 2019 18:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=EFwD950YbDgxTond2eqTyKs9qEW7A6COt2oUNYCbnTY=;
	b=cfySC4UlhYRWMca2saPGMD5Gcf6QiMu8C/4XTg9/8m9INyGs8RuDvTO79ICEYp/MOk
	92Oj1AvERPuGmgm3a0LOZfZXnzd/dbKZ5nAAMIgHuHSkZ1s1yyv3/f00SyJDUjk7zQjg
	JgLees4Fl9qzh2TWn6dw/Bv1cMKwZnb8KrN3E44jixMF4/MnDy8Pq4H+XE6DFMYobZJE
	d8D7Kf8jahAvmYvWGvNc7Sr3BcOzrZHzJumacadbEbH74AO79yNAmDwyOntNfGZNarcA
	nyQ3bepeO+gwIz8sSNkIteBSxDQwv1ZTuMFabFOat4h84xSwm8cOb9nqcKz6K102T+Es
	eF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=EFwD950YbDgxTond2eqTyKs9qEW7A6COt2oUNYCbnTY=;
	b=s3XLYC9TeBJICGqYVMkjCm/vSFdUc+VceFTGycq3Rk09kzHau2OTYjeu2GqxA4y5Ga
	4lIjI1t7N00Wx2l7Oo9hQztI8TRbRvVSzyjF/Owcb2AYL0kwoa1+hzckC/WqIU9mT55Q
	JjhpcseQZhcBsKZeOANiShQcSn9h6yq3+j5qijy2H3EDIi7EyCpTNch6V+oOH/5mrYNt
	PeJRLST4esAjDzc6j64GQIZ5nBm+LibPUM56EicSl8izNrcFkwVSqf+6nmLVeUvkufre
	93SQvVJRTINk5WkH7mq0GoJNCD6kvHQT3yxJClyiIxOfpjulR8v5pfk88VbZo/josCbr
	G2sg==
X-Gm-Message-State: APjAAAXGWOjuq+mH49jtaECM5Afu/g2Pskf9YpBqsKw8FYNFEC1Gsq0h
	Lii77kpDAzdZUA1DB3AcmiaEZg==
X-Google-Smtp-Source: APXvYqwQCBiWlybmtVTZBVRqrMoBOJtMDmiZucQyxuB82za03zMhjU3fBYJKaEHglXXu2AUzNbQDkQ==
X-Received: by 2002:a65:47c6:: with SMTP id f6mr2781651pgs.173.1554339649568; 
	Wed, 03 Apr 2019 18:00:49 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id p2sm2308898pfb.80.2019.04.03.18.00.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 18:00:48 -0700 (PDT)
Date: Wed, 03 Apr 2019 18:00:48 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Apr 2019 17:55:51 PDT (-0700)
In-Reply-To: <CAKmqyKOAMGBcgRscu9QzpQYsA=qTeGgkK+03F=0YRhtzUFaXVw@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-8467ed04-3f36-4b0c-a53c-270a3ef88074@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-riscv] [PATCH for 4.0 v2 0/2] Update the QEMU PLIC
 addresses
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
X-List-Received-Date: Thu, 04 Apr 2019 01:01:05 -0000

On Wed, 03 Apr 2019 16:32:11 PDT (-0700), alistair23@gmail.com wrote:
> On Wed, Mar 27, 2019 at 8:23 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 27 Mar 2019 11:51:15 PDT (-0700), Alistair Francis wrote:
>> > This series updates the PLIC address to match the documentation.
>> >
>> > This fixes: https://github.com/riscv/opensbi/issues/97
>> >
>> > V2:
>> >  - Squash patches to ensure biesctability
>> >
>> > Alistair Francis (2):
>> >   riscv: plic: Fix incorrect irq calculation
>> >   riscv: plic: Log guest errors
>> >
>> >  hw/riscv/sifive_plic.c      | 16 +++++++++++-----
>> >  hw/riscv/sifive_u.c         |  2 +-
>> >  include/hw/riscv/sifive_e.h |  2 +-
>> >  include/hw/riscv/sifive_u.h |  4 ++--
>> >  include/hw/riscv/virt.h     |  2 +-
>> >  5 files changed, 16 insertions(+), 10 deletions(-)
>> >
>> > --
>> > 2.21.0
>>
>> Thanks, I've got these on for-master.  I'll let them sit for a bit to see if
>> there are any other comments, but
>>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> Ping! Just want to make sure these make it into 4.0

Thanks, this got lost in the shuffle.  I just forwarded along the PR.

