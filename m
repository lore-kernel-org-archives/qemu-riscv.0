Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjX85-0005Wt-8X
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jan 2019 17:24:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gjX81-0005Tz-OG
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:24:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gjX80-0001A5-ON
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:24:13 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gjX7y-00015C-Eg
	for qemu-riscv@nongnu.org; Tue, 15 Jan 2019 17:24:12 -0500
Received: by mail-pf1-x42b.google.com with SMTP id z9so1996643pfi.2
	for <qemu-riscv@nongnu.org>; Tue, 15 Jan 2019 14:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=p6BmtyYMUbS6A1YThl+XIl9xv8jpWZS7WDUi9fkvmz4=;
	b=NGRPBjMiddFeyzCiZCC5/cPXBwUTLAM59g6LOybSfAZM0JSMz+p98+fvrHbyP+7LrE
	+BRfUjpe0Ke3V+AgzkQyirA71gPlpP0UU4896AxU9KSB8BSUU6i+kiZYVPplpB3bgFn0
	WLGMAT8Dc8DjU7sJAps0Z6dHc+G3o2wtCQelI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=p6BmtyYMUbS6A1YThl+XIl9xv8jpWZS7WDUi9fkvmz4=;
	b=Vxz3zK3UHAA1KnyWXgQhma3u+C14MkQZ+Kj6be1dWO0oU0c2Clw47qK6UqxRegchVp
	DOtzNOfi89EDAovfRT8vziw4AzUdj9mKbYxL2DxNp62RMnlQTJ0YJFcKkoz6daTUxPGn
	eWm2WYPYVYxeDQVbUPMfq3U7XAkw9OZADlEfrlGr4nSwOm5W500ftV9G+8386KcUKaSw
	Xftuh9rHI031BXNYHy8QI/9v03FsjSADi9CO6Cg/hMXN1dMHwhMgFisndktR0ONoU8hH
	crSTV9q6kFcrgFzQVPgr9sfJzbP4Pv2sSa+V2TA0po53i0FTzdTylEiC5WLIEmQqUpxT
	fzuQ==
X-Gm-Message-State: AJcUukc7e+cf4Kw/FPXpDlw5qkF1RVkZlWtbCs06pio7GcS+pLdtddhT
	V06dEzrjXy97suUDMj0hBiy+dw==
X-Google-Smtp-Source: ALg8bN5XG5qrz7emYCNEYok2Y9/i0qn7AjuP+dyJGoHAyDMsC5D1LW59ld/E6UReO0/Vq5Rr6KFvEg==
X-Received: by 2002:a63:ca02:: with SMTP id n2mr5866731pgi.187.1547591044753; 
	Tue, 15 Jan 2019 14:24:04 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8003:2e1e:900:a89d:d9ff:18e1:b2fd])
	by smtp.gmail.com with ESMTPSA id
	j6sm6840871pfg.126.2019.01.15.14.24.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 14:24:03 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
	<b17f45cb9053318f20ca2a5b2167afa96c1f933a.1547510220.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <62009a7b-877b-9c7d-7844-4eaa1930e9ff@linaro.org>
Date: Wed, 16 Jan 2019 09:23:59 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <b17f45cb9053318f20ca2a5b2167afa96c1f933a.1547510220.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42b
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 5/8] RISC-V: Add priv_ver
 to DisasContext
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
X-List-Received-Date: Tue, 15 Jan 2019 22:24:15 -0000

On 1/15/19 10:58 AM, Alistair Francis wrote:
> -static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> +static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)

Why change this?  I know there is variation in the naming, but my
preferred default mapping is CPUState *cs, RISCVCPU *cpu.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

