Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iQaFm-0006jZ-Ck
	for mharc-qemu-riscv@gnu.org; Fri, 01 Nov 2019 12:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iQaFj-0006hg-Ff
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 12:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iQaFi-0006G0-DL
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 12:58:23 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42870)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iQaFh-00068K-Ul
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 12:58:22 -0400
Received: by mail-pl1-x641.google.com with SMTP id j12so2676433plt.9
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2019 09:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=cgfp8EbdhnJcgO/OyEQ0g/ucBASe54QWB7VlCyACCvA=;
 b=s2sKxliXQzQhZV+a98pY55g3nTGHkiaUM34399+dxoZR7sUEamRTkMHstKQq38qlKi
 JSPbQY5xNdDzUcXtxZQaVw4wchEHnSUsuvfnQU1vxe5/Zm5kMfSvaSlCbQhbOWAVLLMu
 gVJZ3oj8Eiri+DkapftHXO6XxsCtnLJmKVXCxIlc+Y0q5cPcpTBCRlWjyDVS1jIFX+o7
 3Zi1TkJZjY1U9hAXdussWAVernOFYRQVP99NkVLldCrYLuoUCYnQQYSzdVFvd9uFUFSE
 RwvLs1ppUxSduCxJxzIncjknDwuovE5Wy+c0TlPVswOGD35l5Q/LzfirzUfXmaSXRLAq
 Eb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=cgfp8EbdhnJcgO/OyEQ0g/ucBASe54QWB7VlCyACCvA=;
 b=re0HO7ozz2x89ETaQH2TAk1D+1SocaEf5OkERIkjjrQ0EWQ5MxYy9O6X/zz9twcEXl
 kMB1dsH0befUxvVJoAZGYzm4RTccNPBlMutPYUuLfdruBp/SJuCiwuWaYQRii5kgESjU
 aJPxzTowZ6oDjuq5YvHq2MxJp0h2oNYUObVqXBkRRNtV6bF33E5lSK+/VjGTF/n6eshn
 cdIukedTvfGat70i2rMwXYTM+9GClqKKVEQwPhNJo8QPyZhRLrz7C9lfET5xCud2hMAn
 qRuBYV5yt+Q2BJcKz3qKOZr6MW24OEyFeYh2xdOXaz2WztPf1Uam5SkxOetcnqICGWYr
 iYWw==
X-Gm-Message-State: APjAAAUVeli6r9y32iyHVJNom9iy3hGEcyNSdFqDoeHhE5ik7qJKLubF
 9TaMmxpXHKRL+jPXxlMz9wKt5w==
X-Google-Smtp-Source: APXvYqytIMmUCMsduQIJb0QRAIRM99uiG83GFAeY3oWFZ2TiyrgHXkX9D5cjpokmOWnHZegjJJeU8Q==
X-Received: by 2002:a17:902:bb8b:: with SMTP id
 m11mr13718438pls.235.1572627499876; 
 Fri, 01 Nov 2019 09:58:19 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q15sm6844907pff.155.2019.11.01.09.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 09:58:19 -0700 (PDT)
Date: Fri, 01 Nov 2019 09:58:19 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Nov 2019 09:39:00 PDT (-0700)
Subject: Re: [PATCH] remove unnecessary ifdef TARGET_RISCV64
In-Reply-To: <20191030002318.399-1-hiroyuki.obinata@gmail.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 hiroyuki.obinata@gmail.com, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hiroyuki.obinata@gmail.com
Message-ID: <mhng-7b7098a1-1195-4532-80ab-2d7c51ebd2ed@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Fri, 01 Nov 2019 16:58:24 -0000

On Tue, 29 Oct 2019 17:23:18 PDT (-0700), hiroyuki.obinata@gmail.com wrote:
> From: "hiroyuki.obinata" <hiroyuki.obinata@gmail.com>
>
> Signed-off-by: Hiroyuki Obinata <hiroyuki.obinata@gmail.com>
> ---
>  target/riscv/translate.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index adeddb85f6..5c4dd21a98 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -64,12 +64,10 @@ static const int tcg_memop_lookup[8] = {
>      [0] = MO_SB,
>      [1] = MO_TESW,
>      [2] = MO_TESL,
> +    [3] = MO_TEQ,
>      [4] = MO_UB,
>      [5] = MO_TEUW,
> -#ifdef TARGET_RISCV64
> -    [3] = MO_TEQ,
>      [6] = MO_TEUL,
> -#endif
>  };
>  #endif

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>

This is a non-functional change (the code in question was already wrapped in an 
"#ifdef TARGET_RISCV64", so this internal one was redundant), so I'm happy to 
include it during the soft freeze.

I've added this to the queue for my next PR.

