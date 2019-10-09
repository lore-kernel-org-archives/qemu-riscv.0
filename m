Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iI0un-0002wH-V2
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 21:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI0ul-0002s4-Ja
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 21:37:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI0uk-0005Im-7Q
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 21:37:19 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:36735)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI0uk-0005Ic-24
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 21:37:18 -0400
Received: by mail-yb1-xb42.google.com with SMTP id r2so207509ybg.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2019 18:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2M0QElxVB/CyxdHrHz7p+BbYVSSnjE2w4SAIhBUcbv8=;
 b=XdZbuszpfeGTL8m/FRsqcqg1/ojxuja8/TdUl8oUztciGqycjlzMmCE0brSa5+eUJU
 XRpQ/KarU+I3LnASVWGLLVB90Dx4Qhn0j54ld08LN87ncCtTGv+bTH+c/yirMlGyYcd6
 7uqEtU3YejDOMy0MYfquYh3SVWrIG/Whc+TPJZGYUd673om5HzEAAX+Sh8FyhndQZj1+
 +k3ZdLztGX23vCT69JTduhxxO4KgoUzKKF1hN+aybD7YyZVzq/rYt8FEMad3pP4LErv+
 IzoPbj/U/SO++6ExFqjJ+oGhXeStDlMTCINgCh+xfNYdQ9SmZJxhHf+fQ5ZVIjaX2JQ+
 3zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2M0QElxVB/CyxdHrHz7p+BbYVSSnjE2w4SAIhBUcbv8=;
 b=flw4p3bMcp984bBB4gT3CdGK5d5BBdCB5M4K0AaWohfD3qxM+TEXFG4xkk41bWWOtG
 g9ssFtWR0fsH/VoIJ9UYIqCzVX4uHULU2laSdu86/spgg5OodTXD09AeuB5//gU+6GtN
 QHIuKpd6U7Q+o/2MjMnTwiBKtLiuA5sx6u28LQAHlX2FwQUPatIdhrD5PJinJ7dza2sZ
 VxVyTASGPU2k9aIXPW7e+ychWcFeIFfpBrvkNce4Te/qD097RQcEu9IlnA/fKp7+JsHw
 nE2WvrTetx9q80K/2aT/bpF66Ugkr4cizcdoiA0RoN07DWY9oI6mGpCfPjYYV53CeGsj
 ss+A==
X-Gm-Message-State: APjAAAWvCXFpkKvZuq2BoAm8oSPqfednOqcgI/1IZLtN810+Oyv0kRVs
 MKhevqWt+YRsi5qxC1oiyJ0KzQ==
X-Google-Smtp-Source: APXvYqy78dDh8EifhxNIrXkqOIu2sFt9YcO71AwoqqWF0wd9nePaFu9g61vYxTTK7VKuYmIBw1LTng==
X-Received: by 2002:a25:824c:: with SMTP id d12mr473415ybn.217.1570585036957; 
 Tue, 08 Oct 2019 18:37:16 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id h65sm220235ywa.62.2019.10.08.18.37.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:37:16 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] target/riscv: Remove atomic accesses to MIP CSR
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair23@gmail.com, palmer@sifive.com
References: <34350af3b53fadc50bfe4f1fbc452c7d3a8fe8f7.1570572202.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8b816d13-0243-562c-7fa9-96f350935895@linaro.org>
Date: Tue, 8 Oct 2019 21:37:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <34350af3b53fadc50bfe4f1fbc452c7d3a8fe8f7.1570572202.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
X-List-Received-Date: Wed, 09 Oct 2019 01:37:20 -0000

On 10/8/19 6:04 PM, Alistair Francis wrote:
> Instead of relying on atomics to access the MIP register let's update
> our helper function to instead just lock the IO mutex thread before
> writing. This follows the same concept as used in PPC for handling
> interrupts
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        |  5 ++--
>  target/riscv/cpu.h        |  9 --------
>  target/riscv/cpu_helper.c | 48 +++++++++++++++------------------------
>  target/riscv/csr.c        |  2 +-
>  4 files changed, 21 insertions(+), 43 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

