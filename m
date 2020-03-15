Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDa3T-0004ce-0g
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa3P-0004a7-VO
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:40:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa3O-0004PH-Ja
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:40:11 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53272)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDa3K-0004F8-Fv
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:40:07 -0400
Received: by mail-pj1-x1043.google.com with SMTP id l36so7035052pjb.3
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9gLA/pZNjQ+TUALc0hVvV5WrZ8BDZlIZEDjxYRqsuHI=;
 b=nRuztsa80DwR5gQPGt2mUZhxzXN+SRoIJNBobx4nRHzIa0fZHOvflO9YKV8ldDUc4Y
 fJczNcGeOBpoknDknsZ5V32QwMtxwH6uha0/tUGQitnsMf/lTu80Q50O4E2bkZX3mnvz
 EvcLXaHzJwhOClgx6EUgMARUuY9I8ZaLMB9l0F9CuGdlvihn7CigC8uYji1iHFdNnN+6
 PqEraSJVh57Ux1ir9sDq/zUp7ua7wJDKyfdZXu8QuMWPN7PJ3LwTRNN/3jmn4ELcq8rz
 NOOY/pFp9Uk3Dv+BMNtu/RwFBXnhMU6sopr9Jc1dikOYfr8mTnLddI9srsRl8E/F3+EL
 BKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9gLA/pZNjQ+TUALc0hVvV5WrZ8BDZlIZEDjxYRqsuHI=;
 b=JeTOCjdnwydd+EEc0k4dBVySMCALdwIZa9Iwl5woKeB67zHq8msvtDP4LnDqrnAo7U
 EppYfqn/h+VESt11MU3nEYvKNootXUdpTBbDpc1+59D9SsUibWvyf1HvhZdfeKjVvPRA
 ImGFgeCb9xOuzAldjEyGAwZweghx09Vtp7w8vBlZz7UeaLLWfMOo0cDYP/3Ez0XvS4DN
 uYLr13hU6rqRtJyLuOxr15MLEmcylRixrKcZbt1j5knRqgVXCtjfMLv/78mhIEeobEjg
 7PhiQ3L/Pd3AqEAWJGPLBUTEWfiDcuWhqw9L8EGjfHIZUsiKNjcU6WwKETTDG7Z1n1dy
 3xMg==
X-Gm-Message-State: ANhLgQ141C9IdkE5Etq55BqBsZoKyC8OXRXZOVKZ3JsmXY+1aQUQZ+zg
 Mj2CEwJ4LvABHkaqxWlQQjIe/A==
X-Google-Smtp-Source: ADFU+vttMD152WsTeFSMYGGYcAbMGnI0q4g5skx6XoWm5Wvhv6BH0KfgNicSkTJvvY9rMR+iX07B/g==
X-Received: by 2002:a17:902:ab98:: with SMTP id
 f24mr3028309plr.87.1584304801189; 
 Sun, 15 Mar 2020 13:40:01 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 q91sm11269628pjb.11.2020.03.15.13.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:40:00 -0700 (PDT)
Subject: Re: [PATCH 09/14] exec: Drop redundant #ifdeffery
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdbcdfba-9467-2270-7309-abe8e509edc2@linaro.org>
Date: Sun, 15 Mar 2020 13:39:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Sun, 15 Mar 2020 20:40:13 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  exec.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 7bc9828c5b..f258502966 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -185,10 +185,6 @@ struct DirtyBitmapSnapshot {
>      unsigned long dirty[];
>  };
>  
> -#endif
> -
> -#if !defined(CONFIG_USER_ONLY)
> -
>  static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
>  {
>      static unsigned alloc_hint = 16;
> 

There's even more than that.  Looking further down,

>     745 #endif
>     746 
>     747 #if !defined(CONFIG_USER_ONLY)

This is the #endif that paired with the one at 190.

Later,

>     988 #if defined(CONFIG_USER_ONLY)
...
>    1000 #else
...
>    1031 #endif
>    1032 
>    1033 #ifndef CONFIG_USER_ONLY

So those three lines are redundant.

Later,

>    1252 #if !defined(CONFIG_USER_ONLY)
...
>    1438 #endif /* defined(CONFIG_USER_ONLY) */
>    1439 
>    1440 #if !defined(CONFIG_USER_ONLY)

Clearly these ifdefs are very hard to follow.  I would thus welcome a split of
this file.

Possibly into exec-common.c (with functions present in both softmmu and
user-only, with ifdefs *inside* functions only), and exec-system.c (with no
/#if.*CONFIG_USER_ONLY/).

But exec.c is over 4000 lines, so if there's another logical split into even
more files, that would be even better.


r~

