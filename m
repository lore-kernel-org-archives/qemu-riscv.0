Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWOyv-00072B-Lm
	for mharc-qemu-riscv@gnu.org; Mon, 10 Dec 2018 12:04:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWOyt-00070W-I5
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:04:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWOyo-0003kN-K2
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:04:31 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42201)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gWOyn-0003jz-QH
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:04:26 -0500
Received: by mail-oi1-x242.google.com with SMTP id w13so9539385oiw.9
	for <qemu-riscv@nongnu.org>; Mon, 10 Dec 2018 09:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZLhm05CKuGSRWV3SLl4l/Tv74aQjfZOTmdA+3GoBLBE=;
	b=JZDS7hzvgQaCpRReCUROw+nDNRg9Gu1raEbW9kLf/cAjSOKaj4pZerXHT9L4GnfxdF
	r2PRMCrYIXjkvKSrV53MpCM3qajL3txmIJ3dFIhG3FSCqxI3E3Hc1LK9wZNEMvzHBDEQ
	CUA7J0pOhfEwfnOZ3I7VreqHRoOcp3NvbVer8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZLhm05CKuGSRWV3SLl4l/Tv74aQjfZOTmdA+3GoBLBE=;
	b=phy4o/BBMjbJdC7TbNy7GhdqY70M50q0s1HLADExGM/MP4OtfCtAbbWDe+TQlktPdu
	4rjDRMqNk0PV8OCvjFNq+i5uPA2uWb8WHA6zx1T4kD6AXibUTYFRdtR3Zqmv/B59YaXp
	rERCMfjv9WP8P+KG7JUmrCpL6StH1VADDw18zAli0jYHNIQushE4eZZTT4sdbW/kNByE
	X5SXkCzWW7IDwjsb+dhnJ016Eb4U+6xqK9AG73/ylBZkFDC5d4Q3RYeD/zKaX/viNIUp
	m2nCkkjldU9AqHucucKE3UoizA+VjbfHDu1Ph1ZyGyiA2QArHPm+KItTv/MmHWc41BpU
	Y0jQ==
X-Gm-Message-State: AA+aEWZGqCj65QyMYCY+2WSQeRX5VHwZpAgcZu3eNOZBR8PYQBUAPboy
	sWe9ElkMJrdBvXXlZ7nHd9viiA==
X-Google-Smtp-Source: AFSGD/VUDtfWCN3qLDyBMDJ5hgnveFg2f7f37Ol+DyQFCBzVsbd80/KOFFbwA+IfEkR/dE/duzIm8Q==
X-Received: by 2002:aca:5bc3:: with SMTP id p186mr7588257oib.130.1544461464333;
	Mon, 10 Dec 2018 09:04:24 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	m129sm5631505oif.50.2018.12.10.09.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 09:04:23 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<d6c491ecb5c0224c113ddfb2c06552ec89b68227.1544229872.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b4a5e3e9-5e62-c0a3-67e3-891725db89d5@linaro.org>
Date: Mon, 10 Dec 2018 11:04:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <d6c491ecb5c0224c113ddfb2c06552ec89b68227.1544229872.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-riscv] [RFC v3 04/24] linux-user: riscv: Fix compile
 failure on riscv32 hosts
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
X-List-Received-Date: Mon, 10 Dec 2018 17:04:32 -0000

On 12/7/18 6:46 PM, Alistair Francis wrote:
> When cross compilling for riscv32 hosts using GCC 8.2 this error is seen:
>     error: '__NR__llseek' undeclared (first use in this function); did you mean '_llseek'?
> 
> To avoid the error let's ensure that __NR__llseek is defined.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  linux-user/riscv/target_syscall.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
> index ee81d8bc88..af73f71839 100644
> --- a/linux-user/riscv/target_syscall.h
> +++ b/linux-user/riscv/target_syscall.h
> @@ -47,6 +47,11 @@ struct target_pt_regs {
>  #endif
>  #define UNAME_MINIMUM_RELEASE "4.15.0"
>  
> +/* This is sometimes needed to compile riscv32 Linux user mode */
> +#if !defined(__NR__llseek) && !defined(__NR_lseek)
> +#define __NR__llseek __NR3264_lseek
> +#endif

I'm not quite sure how this could be.  Upstream I see

#if __BITS_PER_LONG == 64 && !defined(__SYSCALL_COMPAT)
...
#define __NR_lseek __NR3264_lseek
...
#else
...
#define __NR_llseek __NR3264_lseek

so this define should already exist.

Do you have the wrong headers installed for the cross-build?


r~

