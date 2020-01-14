Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irOPQ-0000P5-P5
	for mharc-qemu-riscv@gnu.org; Tue, 14 Jan 2020 10:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45471)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irOPO-0000Oe-2q
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 10:47:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irOPM-0003CK-Uj
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 10:47:09 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36104)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irOPM-0003Az-ND
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 10:47:08 -0500
Received: by mail-pl1-x635.google.com with SMTP id a6so5398546plm.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2020 07:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iwT76sYjLCcOjBO6rGSyKQ3MWwOzv7H/0Gx+1uV1aGg=;
 b=GvpWRHPOvtwb99X9Y7j2LkCSjLHSauNztFNVXMigoV8KUKDGBusJss3SFOfSFloq72
 5IsGpUt5C/8Z2GZkKImqX8nK0Ob8DS3kCDwSsJO8yD3m2DzAQgtXuxUDx+Cg0OJGEZ5z
 cCln1kI9ZSU8AzGVmrDB7pNG8qRbhNHV7RZ3LNZkWDVl4aH9Azehy5sTMxMEQ36uDrnk
 NZk97tDeMUBjIM6rBXPyIL5i5B3opme7P3h2qXGeXrvi1LX7yX+x9DSFJlr8fJwVl00l
 Z4Q5EhdcoKy64IW1Lo4GlgisF/WIo3sfyV7gsJluuzWNamp9itIM2J9jSn1e0xRn2U5r
 nqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iwT76sYjLCcOjBO6rGSyKQ3MWwOzv7H/0Gx+1uV1aGg=;
 b=lb4LSpdOrHiMwmZTx1o7pKFT9e8Q8vogttUPXoLRcYwccWBSqCfXgUuik6Y+KaUwIE
 YVx7/E422/eWov5a33jxbOc4JTIbn2K/F8MQfJ2hkqaZD8THP/6TFkepWc1xOMZDafZS
 5lxc6VQmgLQB1Lhe6Oqwv/+uSFhfAtnXGjnUUWBVaKvME+yk3C/Nl1jfCdlF4XHa3Zho
 T9yq1qEhD8BBx3TfDIuhfKXwHzSKLXUo8CkuRQ6EXppYVdQvLk7WvVjrnAhNJKrqnp9+
 dpPvEQ4mN/ukjTjT15hoZCEuOr+yPvW8vN3J/f+hhyp3w704E+J9pw0c5UuOzaCDNJa5
 edPQ==
X-Gm-Message-State: APjAAAUSi7oMB6lCKD5/+HiprYb4ebnThS0gCydtaBjpYNh6mADYWzNY
 E4r9xcNPeWxf4Z3nc+vD4bnCi7gBm38=
X-Google-Smtp-Source: APXvYqwAoq2ls0PH66zSG3mflifFup8nQkU/Nx+/yVHGrjqmkVuJifk/JBDH5Trgiwcfm/rt9cwRJQ==
X-Received: by 2002:a17:90a:c983:: with SMTP id
 w3mr29558888pjt.121.1579016827619; 
 Tue, 14 Jan 2020 07:47:07 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id j38sm17686580pgj.27.2020.01.14.07.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 07:47:06 -0800 (PST)
Subject: Re: [PATCH v2 3/3] target/riscv: update mstatus.SD when FS is set
 dirty
To: shihpo.hung@sifive.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <1578996840-14863-1-git-send-email-shihpo.hung@sifive.com>
 <1578996840-14863-3-git-send-email-shihpo.hung@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aefbc769-e964-f43c-d93e-0ada3c009243@linaro.org>
Date: Tue, 14 Jan 2020 05:47:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578996840-14863-3-git-send-email-shihpo.hung@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::635
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
X-List-Received-Date: Tue, 14 Jan 2020 15:47:11 -0000

On 1/14/20 12:14 AM, shihpo.hung@sifive.com wrote:
>      tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> +    tcg_gen_ori_tl(tmp, tmp, MSTATUS_SD);

Merge these:

  tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);

The TCG optimizer doesn't try to handle this sort of thing.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

