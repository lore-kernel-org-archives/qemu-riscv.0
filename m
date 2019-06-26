Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg163-00008i-U4
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 02:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41793)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg162-00006B-7P
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:07:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg161-0002l3-72
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:07:54 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33764)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg161-0002kI-07
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:07:53 -0400
Received: by mail-pg1-f193.google.com with SMTP id m4so684488pgk.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 23:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=n6HUBcG1LsiatuoEvj91e7+QlXshNMsVznzz62ounWw=;
 b=AMO98+2CqqTHmsXD23ntmviP32yJ3NncQ5P5Y+hXLN6qW5dtt3iUNe1MGTSkdf0/1/
 RapofCLolG7RMEJONPZshb/rkkemOkj0s7ybybKyFiM1lV+drBBB5/AMLOyBS0Z9wZ2q
 LMN96o15c3tcuP7M2PE+kur0oBpxZA5S+QC02s8lMcLB6/WqATutsJBbERJb14nUFYai
 ouX9T4k/mimYEC/deB2uEbm/bGSWf4R5mSTAhty9P0RuBNAC8h42i0AmwNM9rjuP8HvX
 QJBW1SQgbSJW8rZo53kXYYsZa1HJvQwOfgAnhXD4B7MB/U9JxEenkj2EhbZNce87WkrB
 NIOQ==
X-Gm-Message-State: APjAAAWV8G8MEoLXkuw5k1RgjhDf1bccH5ZeXZwV9w+isZZqOrK20Dbc
 BEe/mfnylKek+b6WoKoDVYu9Cg==
X-Google-Smtp-Source: APXvYqyqNZf6mSoFYSsvDFaFcd2f2q/Cie5stp3wYTJlviVDnOBsRzc7GtLvbv7v+oX/3ZkPLkWArg==
X-Received: by 2002:a63:1459:: with SMTP id 25mr1175001pgu.201.1561529271698; 
 Tue, 25 Jun 2019 23:07:51 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id q1sm13278390pfg.84.2019.06.25.23.07.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 23:07:51 -0700 (PDT)
Date: Tue, 25 Jun 2019 23:07:51 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Jun 2019 22:36:07 PDT (-0700)
In-Reply-To: <2dec03cb-22af-4d0d-f182-3bee9db83d6f@linaro.org>
CC: joel@sing.id.au, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 me@carlosedp.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, marco@decred.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-3b5978c4-bfb8-4757-ae5b-0731f2851d30@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] atomic failures on
 qemu-system-riscv64
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 06:07:55 -0000

On Tue, 25 Jun 2019 08:36:28 PDT (-0700), richard.henderson@linaro.org wrote:
> On 6/24/19 8:08 PM, Joel Sing wrote:
>> Regarding the alignment for reservations, the
>> specification does require this, although I do not recall seeing any enforcement
>> of this by qemu itself.
>
> Ah, I see it now.  Enforcement begins here:
>
> static bool trans_lr_w(DisasContext *ctx, arg_lr_w *a)
> {
>     REQUIRE_EXT(ctx, RVA);
>     return gen_lr(ctx, a, (MO_ALIGN | MO_TESL));
>                            ^^^^^^^^
>
> This will force softmmu (but notably not linux-user; a design limitation) to
> generate an alignment fault for an unaligned address.

That was probably correct at the time the code went in, as the ISA used to
allow these to succeed but not be atomic.  No implementations did this, so as
part of the ratification process we just mandated that unaligned atomics always
trap.

Is there a better way to fix this than just doing the alignment check
explicitly?

