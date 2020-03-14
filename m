Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2Ot-0005r7-1c
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2Oq-0005pc-Mc
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:44:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2Op-000447-Nm
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:44:04 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46832)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2Op-000401-IY
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:44:03 -0400
Received: by mail-pf1-x441.google.com with SMTP id c19so6736238pfo.13
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w7+iLPw7Dg4Nw7LXN5Qa3rWY9fzDj6UFmgdia/iOeuE=;
 b=SCqYOoU1XruvlC6KudCKwdaS0fKhiu1dq5SjX7JlEe7jHjophevNa9Jkmn1j62Ty65
 ymgTNV3CERWLVZQaUonmINaQqDQIQSC2T4Zew0NVsNFyTc42FBQStE0tCLly34R8LcJT
 0PSl9v8CIDCcVqA1hYdtopTew1EEflrmnwCH8cVeh0TF4lIhayLJOVqVvi3tvjh7nfkQ
 qlyKHrLIlv/XV1ST1jNQYb6N8Da8/164Wz1K1Uw9AMqkizhGZdvwuW8P0N0dqapt9XyD
 h7UwXkII8QGpMjQjCMpO6y3pW90BqWx0uLmpVMp8E169tSE8YVfZLPAkqv69UGOf2o/O
 JixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w7+iLPw7Dg4Nw7LXN5Qa3rWY9fzDj6UFmgdia/iOeuE=;
 b=M/f8ipOTqScXi2D7IOth7EjQ062dseD0rg4z2OaW+O0ODkTUxAkwhtmLJL/v/ctkhL
 SztaIJQXYF82NTx64zdAIn+DiZpRGedR/sVZWUp/LThQJfFm1zHyL/kt0e7QQafDVuKc
 Z/OKo90CzvLJlL+6dKmGRtQXVu8YuNAGDi5zphdbcB+UVSURF3soHgjILRxcBsiJfBs/
 /yG8K47GkaOpVUeDroPyTCzKuCeu9gOutndBRc0Ag5vlqY6PvD+0enfzxTgCWH7V7UZC
 kgudAxW08WKi0Q9CULpGiHHhVgYvHN5dZuqLAM29dbq2NIo+OcJsUqJ318ISv57i3oDq
 uleg==
X-Gm-Message-State: ANhLgQ2KPABooL5Y9smofFjBmzP6fsYtIKnbIOwg6fnMgrzM3AP3wukE
 rT4dWT3DS222NmR0vOvTIdA+SGbASCs=
X-Google-Smtp-Source: ADFU+vtNhaY3ysWD3Ty1zzrRQkLYH3DNL/62vKaDWarbfZYJbD0WxWOnFsUKliE+NnTDDLzkdX8e8Q==
X-Received: by 2002:aa7:951d:: with SMTP id b29mr18394603pfp.30.1584175442216; 
 Sat, 14 Mar 2020 01:44:02 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 e10sm18244257pfm.121.2020.03.14.01.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:44:01 -0700 (PDT)
Subject: Re: [PATCH v5 31/60] target/riscv: vector single-width floating-point
 multiply/divide instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-32-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ebb2c3f1-2978-de02-82e7-4fad1676d2ff@linaro.org>
Date: Sat, 14 Mar 2020 01:43:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-32-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 14 Mar 2020 08:44:05 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 16 +++++++++
>  target/riscv/insn32.decode              |  5 +++
>  target/riscv/insn_trans/trans_rvv.inc.c |  7 ++++
>  target/riscv/vector_helper.c            | 48 +++++++++++++++++++++++++
>  4 files changed, 76 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

