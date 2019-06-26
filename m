Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg3FX-0001sL-P6
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 04:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45615)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg3FR-0001my-Ma
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:25:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg3FP-00035D-OI
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:25:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38246)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg3FO-000345-8h
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:25:43 -0400
Received: by mail-pf1-f193.google.com with SMTP id y15so956660pfn.5
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2019 01:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LFOzV1HAB5YbrrLVn2QUxks4Drn2dBZT/z9iHtEY4oI=;
 b=n2oAfUwQkCw8J4iz7Lb/5gJ3BcEiwzRjQpvpdOYMLWTJ/r3Nl14+krvMFCPuDP0BEW
 xX0SpdJHUm4XD4VF9GeDjZYNiGOdBQdgSRG/F3pKz6QZI+H68nnyS9dmKnhf0oPt++M7
 HQ83qCVtnbm+TiF9KYot9rBihuARGWUPCq0GDVqeqY74SFIgi4eq2m7+0tUeSPtyuytc
 NvhEaIBl/gaMcu5LFBgX1j4iSd2aZqEpZsJ2btoP7YbTpMFmnBb26YlJy4fByfyVB2GQ
 xsktqND+jlRxkVaxoPUC46nFcGeFpsmnVZlW39uhwgYXcaOeBHfg7EWhxA/3Gn8lioq2
 tDyg==
X-Gm-Message-State: APjAAAWEqLutOfnzORAN1neWPfFfozTpMP2doRmpg60BndGNoTpGkfH8
 YL9jRnhy/Ez03Xuylw8acjXIJQ==
X-Google-Smtp-Source: APXvYqxKpVZG8tQf1EG/3D2pbXuyChU/70OPQomkiN+YjtggcGg9JX+he3hoR6QxQgXKohCKi/giTQ==
X-Received: by 2002:a63:d756:: with SMTP id w22mr1736304pgi.156.1561537541046; 
 Wed, 26 Jun 2019 01:25:41 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id t13sm2154363pjo.13.2019.06.26.01.25.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 01:25:40 -0700 (PDT)
Date: Wed, 26 Jun 2019 01:25:40 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2019 01:24:35 PDT (-0700)
In-Reply-To: <5711ab6f-610c-b05a-c728-4a35a0963a2b@linaro.org>
CC: joel@sing.id.au, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 me@carlosedp.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, marco@decred.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-c3bf2d26-25cd-4f80-bfe9-741f9a969b3f@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
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
X-List-Received-Date: Wed, 26 Jun 2019 08:25:47 -0000

On Wed, 26 Jun 2019 00:48:51 PDT (-0700), richard.henderson@linaro.org wrote:
> On 6/26/19 8:07 AM, Palmer Dabbelt wrote:
>> On Tue, 25 Jun 2019 08:36:28 PDT (-0700), richard.henderson@linaro.org wrote:
>>> On 6/24/19 8:08 PM, Joel Sing wrote:
>>>> Regarding the alignment for reservations, the
>>>> specification does require this, although I do not recall seeing any
>>>> enforcement
>>>> of this by qemu itself.
>>>
>>> Ah, I see it now.  Enforcement begins here:
>>>
>>> static bool trans_lr_w(DisasContext *ctx, arg_lr_w *a)
>>> {
>>>     REQUIRE_EXT(ctx, RVA);
>>>     return gen_lr(ctx, a, (MO_ALIGN | MO_TESL));
>>>                            ^^^^^^^^
>>>
>>> This will force softmmu (but notably not linux-user; a design limitation) to
>>> generate an alignment fault for an unaligned address.
>>
>> That was probably correct at the time the code went in, as the ISA used to
>> allow these to succeed but not be atomic.  No implementations did this, so as
>> part of the ratification process we just mandated that unaligned atomics always
>> trap.
>>
>> Is there a better way to fix this than just doing the alignment check
>> explicitly?
>
> You misunderstand.  The code is exactly correct as-is.  The alignment check
> happens implicitly as a part of the softmmu tlb resolution.

Sorry, I thought you said it wasn't happening for linux-user?  If it happens
for both then we're good.

