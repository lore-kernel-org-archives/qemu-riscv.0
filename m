Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9Xui-0005q6-Ta
	for mharc-qemu-riscv@gnu.org; Wed, 04 Mar 2020 12:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j9Xug-0005pT-Bh
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 12:34:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j9Xuf-0004XZ-6m
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 12:34:30 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34732)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j9Xue-0004WQ-Vh
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 12:34:29 -0500
Received: by mail-pf1-x442.google.com with SMTP id y21so1310888pfp.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Mar 2020 09:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=za/Wo9N/jLaPQ/i3K7miQ5U2TNh+nuxKLY4yG49MZ0E=;
 b=FXcoas8acAdwejFixBWSQ4QuSL+za/yxYBmlx07SYUxQkqJhMFgWrEkmoIF9GoWDm8
 +AMVqhMIcUUPSWPJlIcv+RVfU3pW7T6+teoQEq9YXiQgyvcOJWuh7fAdakONGqKnKugK
 6c5+oKqvdVjd481u4weqFHjy/MXP5DxkOnx6QrUsdzFSeM8fD7/vyu+YJrzX0md9RXCS
 fmGngC6TaHQ6GCCVKVuDBFy1q16SUzpOujd014obGwAPRQ9y/mWWJZIY5detjUEt1LiY
 zClBEneMjFIpjkLwXQXxmwTbgczcVe1EOpy3iam+osKWnb5QovcBHE/DBmDLohLgX4Nj
 6TYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=za/Wo9N/jLaPQ/i3K7miQ5U2TNh+nuxKLY4yG49MZ0E=;
 b=sEQ8J2h7PeMW/4O8BYjrUgNenejl19LcCsFOz0KaE2ILTIinFlh+L1HoooX9CP9BYx
 qPfYWpwo+uKHXgGgUCUtlouyJrgku8rt7szBiAVfWt4WgMl0FOwFN5Lvh/rwR/XoxmVN
 dKgLphujQ2USpndWJOX8EbkgxW9KFxWOUPismSb+BgLmSDuZR+xvaGPfmK6IoqnZCKbn
 dKG80q7nrM0ucZDEBrtAc5ycPaY8dFh35nLsN4MULElKzaVVY01uypis6uW8tGHRHzBO
 HdwbzVbFxu1GvEr/1ikwakR1oXIIjhaJbbe0syrRDg3hCRe+7xm5gOsy+3n21UVRQUod
 BTWA==
X-Gm-Message-State: ANhLgQ39Xfvvb2Fe0eKiPWHdF2Io7pptnrGlTJwKrcJodsA7gNAzYTrd
 YsRXuKFFyZDLwLK3xTnfelcDoA==
X-Google-Smtp-Source: ADFU+vsbhSvt6IAi4dJv+ukreb87qZOfKYywvpzROKQeKONLkdI9z932NABuHUm8wNZKYMTZnsfj+w==
X-Received: by 2002:aa7:99c5:: with SMTP id v5mr4117236pfi.198.1583343267581; 
 Wed, 04 Mar 2020 09:34:27 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 19sm7101805pfn.30.2020.03.04.09.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 09:34:26 -0800 (PST)
Subject: Re: [PATCH v1 1/1] target/riscv: Don't set write permissions on dirty
 PTEs
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair23@gmail.com
References: <c827880a47774cd3a6bcd59b79657f380da11d5d.1583284602.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8498727-03f8-7e04-efd3-c04763dcbfac@linaro.org>
Date: Wed, 4 Mar 2020 09:34:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c827880a47774cd3a6bcd59b79657f380da11d5d.1583284602.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Wed, 04 Mar 2020 17:34:31 -0000

On 3/3/20 5:16 PM, Alistair Francis wrote:
> The RISC-V spec specifies that when a write happens and the D bit is
> clear the implementation will set the bit in the PTE. It does not
> describe that the PTE being dirty means that we should provide write
> access. This patch removes the write access granted to pages when the
> dirty bit is set.

The W bit by itself says we should provide write access.

It is an implementation detail that we *withhold* write access when D is clear
(etc) so that we can trap, so that we can properly set D in the future.

The page table walk associated with a read is allowed to cache all of the
information it finds in the PTE during that walk.  Which includes the D bit.
If D is set, then we do not need to set it in future, so we do not need to
trap, so we can immediately honor the W bit.

If the guest changes R/W/X within a PTE (e.g. for mprotect), it is obvious that
a TLB flush for that page must be done.  It is no different if the guest
changes A/D (e.g. for swapping).

> Setting write permission on dirty PTEs results in userspace inside a
> Hypervisor guest (VU) becoming corrupted. This appears to be because it
> ends up with write permission in the second stage translation in cases
> where we aren't doing a store.

You've not really given any more information than last time this patch came around.

I still think this must be a guest (or nested guest) bug related to clearing
PTE bits and failing to flush the TLB properly.

I don't see how it could be a qemu tlb flushing bug.  The only primitive,
sfence.vma, is quite heavy-handed and explicitly local to the thread.

It may be a bug in qemu's implementation of second stage paging.  Which is not
yet upstream, and I haven't gone digging in the archives to find the patch.


r~

