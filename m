Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7YTe-0007On-Rp
	for mharc-qemu-riscv@gnu.org; Fri, 28 Feb 2020 00:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7YTX-0007OS-JU
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2020 00:46:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7YTW-00022J-H4
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2020 00:46:15 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7YTW-00020b-9O
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2020 00:46:14 -0500
Received: by mail-pf1-x441.google.com with SMTP id 2so1123020pfg.12
 for <qemu-riscv@nongnu.org>; Thu, 27 Feb 2020 21:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X/CDTICnOQDVAz0nY10LYxi3q9hIm0vSU74A26OqRXI=;
 b=RWzlXSmhBiVWDO2Nw+rzWJ92MdlcZtHs6IqWA8pEyDyY8IUYQFwiqlrczkHR4mVpZd
 /dVK7sVgmoO0/luytriYMCskXmCMOulhGahmaZYLv1xHxVcJXRnCsWS6U9O9vA279oPd
 r+IiWvht1/iceHKex1+NbKqONs78R3lAT3IdooOLOFktoFtrZgtDDJZw8ie9aCkJ7MOm
 c/2HEI8G79Viu06G/1w88yyu9V/YrmyhCXHG2zPVanYfiQWFwyJQ5kwIFy6ECeO5h4ri
 XiqjkbkGGzifWuoM0tJ0em+uzExwOimex2DB2EXKzZLav7IfzwiwcejnfwboTV1P35Fd
 +0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X/CDTICnOQDVAz0nY10LYxi3q9hIm0vSU74A26OqRXI=;
 b=m5/uMijt2Do1IWQsjYLjURBFZZOlXd235TjkNRAPvFyOE9oagQLEaXRpgoAy42OOK0
 3D/rDraOjnUtGUJP0uN7VZYlxX0mfaiPCUnn/cU6okO3rRjORdTRiVqIFj+K4nF6Bqvm
 KeO6K7C/L0OWeKtMhzLMyQ3QL2t1FCx687yo403Fff0CMsJ1NrMqkCvCh+T7413Dume/
 EqBJ0MgRONQbjjvLSUmGuJoSzcZ0uSrnqweKEbq6XhQvdgEHgzgeQkWNpcUUQ20NRng6
 3Az8scwSb+x7QngzL/azaja9g5hEjQW8eyzusZKa+fu3Tcs5bAHlVLfKE4wtkvfY/Hf5
 7dgQ==
X-Gm-Message-State: APjAAAXKj7e0AH5Sh7U0FZKo3zE5XLbGiNXzTwTTW5j2RDo/79rAGoty
 c5ayvF8PpAZBEe0SW0yU0koV7jvvlg8=
X-Google-Smtp-Source: APXvYqwnh/rXSpfOMRXBABV8lrH7MQ9VQ401lIwvEdln4lrqsG25873fDezYtYK0rqUkBUESpPs7ng==
X-Received: by 2002:a65:4c82:: with SMTP id m2mr2821414pgt.432.1582868769589; 
 Thu, 27 Feb 2020 21:46:09 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 m12sm556399pjf.25.2020.02.27.21.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 21:46:08 -0800 (PST)
Subject: Re: [PATCH v3 1/1] target/riscv: add vector integer operations
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 linux-csky@vger.kernel.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200226024352.7719-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d47523ad-52e3-b0a8-a47d-c91442fbe48d@linaro.org>
Date: Thu, 27 Feb 2020 21:46:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226024352.7719-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Fri, 28 Feb 2020 05:46:19 -0000

On 2/25/20 6:43 PM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  395 +++++++
>  target/riscv/insn32.decode              |  127 +++
>  target/riscv/insn_trans/trans_rvv.inc.c |  671 +++++++++++-
>  target/riscv/vector_helper.c            | 1308 ++++++++++++++++++++++-
>  4 files changed, 2462 insertions(+), 39 deletions(-)

This patch is too large and needs splitting.

> -static bool vext_check_overlap_mask(DisasContext *s, uint32_t vd, bool vm)
> +static bool vext_check_overlap_mask(DisasContext *s, uint32_t vd, bool vm,
> +    bool widen)
>  {
> -    return !(s->lmul > 1 && vm == 0 && vd == 0);
> +    return (vm != 0 || vd != 0) ? true : (!widen && (s->lmul == 0));
>  }
>  

Best to move the addition of widen back to the patch that introduced this function.

The "? true :" is a funny way to write ||.


r~

