Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1ZqR-0005al-JQ
	for mharc-qemu-riscv@gnu.org; Tue, 11 Feb 2020 13:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1ZqM-0005Zc-Rm
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 13:01:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1ZqH-0004GE-K2
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 13:01:06 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1ZqH-0004Dc-BI
 for qemu-riscv@nongnu.org; Tue, 11 Feb 2020 13:01:01 -0500
Received: by mail-pl1-x641.google.com with SMTP id g6so4566244plp.6
 for <qemu-riscv@nongnu.org>; Tue, 11 Feb 2020 10:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1LKrGWzKOLViciAcW3pz8ORuYOa1nshyxrugJUhAKtA=;
 b=rcx2ahayxUQ83wmq9XnjoJQRLMv0/3XBFJOu01Jj+hCbDhTNK9YTVGt87ryZ4ZDPKc
 9QQhy6lk8CjZ7O+IfdTSm9lECg02DIM/HwxTcWNu37gSBQekwVjHcL2Ztt2xVOQCe9pl
 BN2cwK+M94g77dDnXGPufjms6RMxmSniSW6EsBHIz1ELJHM6xzy1w3RR/c+vldF1HUfc
 nQgXtMRxUk5Df4B5ZPwp1KHN7rLM9pMLA4pEG8uUpvEA41uPSXbmHUDSAiFPsFzGPGnY
 oxndkYCvdpPEEKKZu+FKmL4O4AYTobSYrz62biDyE0dQHZXFbc6M3/RjGAyHjDmbhQS4
 U/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1LKrGWzKOLViciAcW3pz8ORuYOa1nshyxrugJUhAKtA=;
 b=TfglNXGgHjNuc6VKR+YcKdZX/eUzXLHc59K6gxe29goh0E3JOsIp+4U+cccnezyCvk
 MwQvslR4pIXoXyKobw++BVmwDp35JnGc9Fi9jN9nfBeJwAGo+mQNXhaXkU2gRosaRTF+
 wvTlY3UReFfM1K5ObS64WVb23GQxMhpWRcIJWQIBs9RdWAs0Ux0nohi9DgGfHkXa3Bku
 GpygUBqR9M/I/L6zgT7mtuVtWT7PE23/aq4Xk73atte+XGJINGsIKpHPUUH9X52yYbMQ
 OnyblreA3bmowLS5maeR/o3Eaz224BivYYNzNYnUHylBhcUXt6o+6C7ER3noF7XUfMml
 uNUg==
X-Gm-Message-State: APjAAAV7QGSmCmU8w6ACuJ8H0qW3CpZzBgt2Jy85Kg/AkAkR4AVsTozn
 /heX3krhR4A00zYrmlSkLQyfdw==
X-Google-Smtp-Source: APXvYqzbFmvxPXrMZChDG7QFbyrZmV0OMSXOaVEtEc5uTCaWOinaujKP//O7WeNZbLSUo0Ngqn5dHQ==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr4125871pln.225.1581444060181; 
 Tue, 11 Feb 2020 10:01:00 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c19sm5032104pgh.8.2020.02.11.10.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:00:59 -0800 (PST)
Subject: Re: [PATCH v1 4/5] target/riscv: progressively load the instruction
 during decode
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 robert.foley@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Palmer Dabbelt <palmer@dabbelt.com>, kuhn.chenqun@huawei.com,
 peter.puhov@linaro.org
References: <20200207150118.23007-1-alex.bennee@linaro.org>
 <20200207150118.23007-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5266abfc-338e-b3c9-fd98-d9de989a7266@linaro.org>
Date: Tue, 11 Feb 2020 10:00:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207150118.23007-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Tue, 11 Feb 2020 18:01:09 -0000

On 2/7/20 7:01 AM, Alex Bennée wrote:
> The plugin system would throw up a harmless warning when it detected
> that a disassembly of an instruction didn't use all it's bytes. Fix
> the riscv decoder to only load the instruction bytes it needs as it
> needs them.
> 
> This drops opcode from the ctx in favour if passing the appropriately
> sized opcode down a few levels of the decode.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/riscv/translate.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


