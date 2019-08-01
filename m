Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1htBsr-0006Mw-Kb
	for mharc-qemu-riscv@gnu.org; Thu, 01 Aug 2019 10:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1htBsp-0006Jy-Mj
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2019 10:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1htBso-0005bt-MO
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2019 10:16:43 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33631)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1htBso-0005bX-Dz
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2019 10:16:42 -0400
Received: by mail-pg1-x541.google.com with SMTP id n190so2854700pgn.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Aug 2019 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nvgx3691qemUajFHkiros1xQZE99DVaku3/9F7Mq1Eg=;
 b=hcDtWsy+JB25ZfK6dakt2CQy2GNILkBDz4fmKP4LltxsEyW9pQ5a9hNrQ5PtBcGDIO
 2wUROVHkmcmtbhYedipZmcm/gbWeBLUKNQ28L5sfvT85IG6Sv65gdsQedVYYmQrbSGO3
 YyN8QSExx8a92X1XjYklzmOPaMLobwh53l+BzD+nRDZFQ9zB3UaYMic2xAe8szkBy0r+
 ROsYu2ubXm/7ASwVVCg4qAjsVTMiE7DZL91QQpLfamkjMMSV/dJUP2a0jAbpvkbE/qMV
 99Qr2iVOM48ajS9Cg+omlXcRAlBNp9F55SyIHEsdj8S2xx++sVDOQxqmLtPkfxuwXIPj
 EXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nvgx3691qemUajFHkiros1xQZE99DVaku3/9F7Mq1Eg=;
 b=KBDNlHMacN9yPOaTrBS4+u1mGE8d6aXjPe7Jh9za04clb4oSqpBZYgNp80XGMtbtcf
 Zf1s15JIOJNKKt2OnQrBNOOH5fOKM4Qp3tYdbNQLcrKUAXSpkXO7oTknE1kTz8WKJhX4
 WWuKmSqr1NoWZBkvD5lPjKvPoZTlopwywmgKeJieyZmuR1ef2BbdD2XvVVxxRck7/qwP
 Sg7uZOBTC8Zd1O6129LvdLbBv1IooNWrAcOiOr8ItJ8gwUEaJguyGgtDQ+5EqFqA2Mmq
 1rrYfJquz8gPMWVPGnKZSwAbwsIB1ZAt0GClsAdNDqFYmKse2CeJCMxU6yRcfIJlpTCa
 9YOQ==
X-Gm-Message-State: APjAAAWsDNXzl+5cjaRUTfAyk1LH+ulSv43nvSQMxSwIGzflWuyLJdaV
 s9UQGV4/tQ4k/+bkf0uK140DZNDWgZw=
X-Google-Smtp-Source: APXvYqxhZ2RDS8KaLywMCOz70goBxxWXc7usIn9leMztRuMga/Pw/j96VKF3/lXK/FqVM4plJ3YyRw==
X-Received: by 2002:a63:4c46:: with SMTP id m6mr122823401pgl.59.1564669000973; 
 Thu, 01 Aug 2019 07:16:40 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id u128sm81246813pfu.48.2019.08.01.07.16.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 07:16:40 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU devel <qemu-devel@nongnu.org>, QEMU riscv <qemu-riscv@nongnu.org>
References: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
 <581a0284-c658-265f-1b0f-6f4be5406cee@linaro.org>
 <CAEUhbmVXC6GeHYFST514cLRJHQOo5ki=ZPG=OsLzV2YA0ChQgA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ac4453de-81cd-c32a-17f8-283fa3569ed0@linaro.org>
Date: Thu, 1 Aug 2019 07:16:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVXC6GeHYFST514cLRJHQOo5ki=ZPG=OsLzV2YA0ChQgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: rv32: Root page table
 address can be larger than 32-bit
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
X-List-Received-Date: Thu, 01 Aug 2019 14:16:44 -0000

On 7/31/19 6:53 PM, Bin Meng wrote:
> I am not sure how (idx * ptesize) could overflow. It represents the
> offset by a page table which is [0, 4096).

You're right, I mis-read what was going on there.

However, lower down, "target_ulong ppn" needs to be promoted to hwaddr, so that

    ppn = pte >> PTE_PPN_SHIFT;
    ...
    base = ppn << PGSHIFT;

does not overflow.  (Which is the part of the page table walk that I thought I
had gleaned from the patch without actually reading the entire function.)


r~

