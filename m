Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDuR3-0008Qw-Fl
	for mharc-qemu-riscv@gnu.org; Fri, 27 Sep 2019 13:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33043)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDuR0-0008Li-JI
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 13:53:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDuQy-000799-To
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 13:53:37 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44601)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDuQy-00077b-FZ
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 13:53:36 -0400
Received: by mail-pf1-x443.google.com with SMTP id q21so1989360pfn.11
 for <qemu-riscv@nongnu.org>; Fri, 27 Sep 2019 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mtqj6XjR77FGB/2lmnWGkD6fBdEnoZDtg9W++umi9WM=;
 b=PP3nc+RWhFnhezJV3IGo2lKvdbWw0SIdPhto3AC1hnW6wGUq9gP/nUnAHM51BF8Pxv
 Iye4Xt+dfDOzyvnOx+IS9fF35Kcvk9pXQUXeCmRmergG9mh6xO1wZv9nhybMmx4xcICU
 4x1nf0Ih8WQbFhdm2RLsD2v9ckdm3BkD40e6oN6yuqMwOGoJB9xa4yTXRE3G4ptfCd44
 I/g+68H5vq6/VG0cJAE8j6RAN5RftMLvjbDavF8u8OPnRACajky0iWMrgHOVaERzHjB1
 FR+9F5azMa0wVVdbqbmnwIs8xT/fw22vKoCqv3CFvm3r1S/lGYZwYggiTklg9WBQU+V9
 Uh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mtqj6XjR77FGB/2lmnWGkD6fBdEnoZDtg9W++umi9WM=;
 b=bxA/CTsUhHiBR0XHqj4v4ks4vdMfTDQXJwO0gnGvscoYdaw9CQCaHgx91dJVTnj/IR
 3Iik+6bo4F1FTlJFSn+mVUi8U9m7a5Ud1Be8n/gGH9r2AbdKB8ETrjpG0ZjLDsEhVKCt
 8JDlduB674r2v1nhAR/dxSS3iN9Soi/nDABLNpCjT0UcO6YYeh/muOHSp0Wdu13UJ+zc
 /bS8a2gmXRGXiCjSXafc/inBxiCHKFBmtkE8nfhOwth6WOXHwHckhsN1PTy3CikrtXWq
 PXcAEhl+w1VwVFsF/rPq5vbaIGmIp+U5W5aiz5svs61kq/Bi79cJCXqwYdr106i4w3NL
 3Tlw==
X-Gm-Message-State: APjAAAXqnYvv0TjFNMxKw7fk80B9HriftokS1ToWycsasmzm3XoInTf/
 K1uJjbtx2umrUeUnlkjo+1TGoA==
X-Google-Smtp-Source: APXvYqyp5pWxRwDIHkdiZwskJdsI3b7BpiqwKwZ9Tfl6WTsT49pDaTKkRNzC79fNOqheVQNM/2y5LQ==
X-Received: by 2002:a17:90a:6c90:: with SMTP id
 y16mr11884264pjj.58.1569606814892; 
 Fri, 27 Sep 2019 10:53:34 -0700 (PDT)
Received: from [172.20.32.216] ([12.157.10.118])
 by smtp.gmail.com with ESMTPSA id b69sm3357794pfb.132.2019.09.27.10.53.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 10:53:34 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] target/riscv: Print CPU and privledge in disas
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>
References: <ab8f108eceb973aaee565bb1fe347fcf8c788f5b.1569545120.git.alistair.francis@wdc.com>
 <960d9622-8241-efe7-cee6-1d4a1307fbc0@linaro.org>
 <CAKmqyKP90UDcS4moAYvLVN2q+aZ_cqGwY2fEgfX8dCjsHW1Tfg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8248daee-d5d0-0576-ee89-bd1400ddf947@linaro.org>
Date: Fri, 27 Sep 2019 10:53:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP90UDcS4moAYvLVN2q+aZ_cqGwY2fEgfX8dCjsHW1Tfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Fri, 27 Sep 2019 17:53:40 -0000

On 9/27/19 10:23 AM, Alistair Francis wrote:
>> I'm curious about the motivation here.
>>
>> In particular, what difference does it make what cpu the TB is generated for?
>> It would seem like the more relevant place to look for this is with -d cpu or
>> -d exec where the TB is actually executed, which could well be multiple cpus.
> 
> The main reason is that the sifive_u machine now has two RISC-V
> clusters so it's useful to see what is happening on each CPU. -d cpu
> and -d exec are much more difficult to comprehend so aren't always as
> useful.

Hmm.  I wonder if it might be time to find a way to be able to optionally split
the qemu_log output on a per-cpu basis.  It wouldn't necessarily always be
helpful, because we'd still have the case of a given TB being translated by one
cpu and executed on another, but it could make some things easier to follow.


r~

